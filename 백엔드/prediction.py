from transformers import AutoImageProcessor, AutoModelForImageClassification
from datasets import load_dataset
import torch
import numpy as np
from transformers import pipeline
import torchvision.transforms.functional as TF
import json
device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

model_name_or_path = './final'
feature_extractor = AutoImageProcessor.from_pretrained(model_name_or_path)
model = AutoModelForImageClassification.from_pretrained(
    model_name_or_path,
    ignore_mismatched_sizes = True)
    
def preprocess_images(examples):
    images = [feature_extractor(image.convert("RGB")) for image in examples["image"]]
    examples['pixel_values'] = [image['pixel_values'][0] for image in images]
    return examples

def predict():
    dataset = load_dataset("./images")
    dataset = dataset.map(preprocess_images, batched=True)
    dataset.set_format(type='torch', columns=['image', 'pixel_values'])
    model.to(device) 
    image_classifier = pipeline('image-classification',
                                model='./final',
                                #device = 0,
                                feature_extractor='./final'
                                )
    item = dataset['test'][0]
    t_img = item['pixel_values'].permute(0, 1, 2)
    image = TF.to_pil_image(t_img)
    np_image = np.array(image)
    pred = image_classifier(image)
    labels = []
    scores = []
    for x in pred:
        labels.append(x['label'])
        scores.append(x['score'])
    result = {'labels': labels, 'scores': scores}
    json_result = json.dumps(result)
    return json_result