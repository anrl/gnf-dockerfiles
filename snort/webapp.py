from flask import Flask 
from flask import request
from flask_restful import Api, Resource, reqparse 

app = Flask(__name__)
api = Api(app)

class Notification(Resource):
    def get(self, data):
        return "GET Works", 200

    def post(self):
        print "Received data from [snort] logs"
        print request.get_data()
        print "------------------------------"
        return "POST Works", 200
        
    def put(self, data):
        return "PUT Works", 200

    def delete(self, data):
        return "DELETE Works", 200


api.add_resource(Notification, "/notification")
app.run(host='0.0.0.0', port='8081', debug=True)