import io
from enum import Enum
from fastapi import FastAPI
from typing import Optional
from pydantic import BaseModel
from fastapi.responses import ORJSONResponse, HTMLResponse, StreamingResponse
import pandas as pd


app = FastAPI()


class RoleName(str, Enum):
    admin = "admin"
    writer = "writer"
    reader = "reader"


class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None


@app.get("/")
def root():
    return {"message": "Hello World from Master U Galileo"}


@app.get('users/me')
def read_current_user(user_id:str):
    return {"user_id": 'The current logged user'}


@app.get("users/{user_id}")
def read_user(user_id:str):
    return {"user_id": user_id}


@app.get("roles/{role_name}")
def get_role_permissions(role_name:str):
    if role_name == RoleName.admin:
        return {'role_name': role_name, 'permissions': 'full access'}

    if role_name == RoleName.writer:
        return {'role_name': role_name, 'permissions': 'write access'}

    if role_name == RoleName.reader:
        return {'role_name': role_name, 'permissions': 'read access only'}

fake_items_db =[{'item_name': 'uno'},
                {'item_name': 'dos'},
                {'item_name': 'tres'}]


@app.get("/items/")
def read_items_db(skip: int = 0, limit:int = 10):
    return fake_items_db[skip: skip + limit]


@app.get("/items/{item_id}")
def read_item_query(item_id: int, query:Optional[str] = None):
    message = {"item_id": item_id}
    if query:
        message["query"] = query

    return message


@app.get("users/{user_id}/items/{item_id}")
def read_user_item(user_id:int, item_id:int, query:Optional[str] = None, describe:bool = False):
    item = {"item_id": item_id,
            "owner_id": user_id}

    if query:
        item["query"] = query

    if not describe:
        item['description'] = "This is a long description for an item"

    return item


@app.post("/items/")
def create_item(item: Item):
    return{
        'message': 'The item was successfully created',
        'item': item.dict()
    }


@app.put("/items/{item_id}")
def update_item(item_id: int, item: Item):
    if item.tax == 0 or item.tax is None:
        item.tax = item.price*0.12

    return {
        'message': 'The item was updated',
        'item_id': item_id,
        'item': item.dict()
    }


@app.get("itemsall/", response_class=ORJSONResponse)
def read_long_json():
    return [
        {'item_id': 'item'},{'item_id': 'item'},{'item_id': 'item'},
        {'item_id': 'item'},{'item_id': 'item'},{'item_id': 'item'},
        {'item_id': 'item'},{'item_id': 'item'},{'item_id': 'item'}
    ]


@app.get("/html", response_class=HTMLResponse)
def read_html():
    return """
        <html>
            <head><title>Some HTML in here</title></head>
            <body><h1>Look ma! HTML!</h1></body>
        </html>
        """

@app.get("/csv")
def get_csv():
    df = pd.DataFrame({'columnA': [1, 2], 'columnB': [3, 4]})

    stream = io.StringIO()

    df.to_csv(stream, index=False)

    response = StreamingResponse(iter([stream.getvalue()]), media_type='text/csv')
    response.headers['Content-Disposition'] = "attachment; filename=my_awesome_report.csv"

    return response


#tarea
### GET
@app.get("/operaciones/suma/{n1}/{n2}")
def suma(n1: float, n2: float):
    return n1+n2

@app.get("/operaciones/resta/{n1}/{n2}")
def resta(n1: float, n2: float):
    return n1-n2

@app.get("/operaciones/mult/{n1}/{n2}")
def multiplicacion(n1: float, n2: float):
    return n1*n2

@app.get("/operaciones/div/{n1}/{n2}")
def division(n1: float, n2: float):
    return n1/n2

## Post

@app.post("/operaciones_post/sum")
def suma_post(n1: float, n2: float):
    return {
        'n1': n1,
        'n2': n2,
        'total': n1+n2
    }

@app.post("/operaciones_post/resta")
def resta_post(n1: float, n2: float):
    return {
        'n1': n1,
        'n2': n2,
        'total': n1-n2
    }

@app.post("/operaciones_post/mult")
def multi_post(n1: float, n2: float):
    return {
        'n1': n1,
        'n2': n2,
        'total': n1*n2
    }

@app.post("/operaciones_post/div")
def multi_post(n1: float, n2: float):
    return {
        'n1': n1,
        'n2': n2,
        'total': n1/n2
    }

# uvicorn main:app --reload --port=8000
# http://127.0.0.1:8000/docs
