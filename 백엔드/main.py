from fastapi import FastAPI, Request, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi import UploadFile, File
from typing import List
from starlette.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles 
from PIL import Image
import requests
import base64
import io
import os, datetime, secrets, shutil, time
import json
from fastapi import APIRouter
from fastapi.responses import JSONResponse , FileResponse
import uvicorn
import asyncio
from prediction import predict
BASE_DIR = os.getcwd()
IMG_DIR = os.path.join(BASE_DIR,'images/test/')
SERVER_IMG_DIR = os.path.join('https://apple.fre.today','images/','test/')

app = FastAPI() 
templates = Jinja2Templates(directory="templates")
app.mount("/home/ubuntu/apple/static", StaticFiles(directory="static"), name="static")

router = APIRouter()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return "hello"

@app.get("/main", response_class=HTMLResponse)
async def main(request:Request):
    context = {"request": request}
    return templates.TemplateResponse("user_list.html", context)

@app.post('/upload')
async def upload_board(in_files: List[UploadFile] = File(...)):
    file_urls = []
    for file in in_files:
        currentTime = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
        save_file = ''.join([currentTime, secrets.token_hex(16)])
        saved_file_name = save_file + '.jpg'
        file_location = os.path.join(IMG_DIR, saved_file_name)
        with open(file_location, "wb+") as file_object:
            file_object.write(file.file.read())
        file_urls.append(SERVER_IMG_DIR + saved_file_name)
    result = {'fileName': saved_file_name}
    return JSONResponse(result)

@app.get("/predict", response_class=JSONResponse)
async def get_prediction():
    pred = ""
    while len(os.listdir(IMG_DIR)) <= 0:
        print("No image available. Retrying in 5 seconds...")
        await asyncio.sleep(5)
    pred = predict()
    result = pred
    response = JSONResponse(content=result)
    for filename in os.listdir(IMG_DIR):
        file_path = os.path.join(IMG_DIR, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print(f'Failed to delete {file_path}. Reason: {e}')
    return response


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)

