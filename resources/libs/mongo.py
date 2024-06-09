from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://mobile:mobileapi@cluster0.ds607aw.mongodb.net/MobileAPI?retryWrites=true&w=majority&appName=Cluster0')

db = client['MobileAPI']

@keyword('Remove task from database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text': task_name})
    print('Removendo a tarefa ' + task_name)

