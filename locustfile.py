from locust import HttpUser, task, between

class FlaskUser(HttpUser):
    wait_time = between(1, 5)
    # self.
    def on_start(self):
        pass
    
    @task
    def interfact(self):
        self.client.get(self.client.base_url)
        
    @task
    def predict(self):
        self.client.post(
            '/predict', {
                "CHAS": {
                    "0": 0
                },
                "RM": {
                    "0": 6.575
                },
                "TAX": {
                    "0": 296.0
                },
                "PTRATIO": {
                    "0": 15.3
                },
                "B": {
                    "0": 396.9
                },
                "LSTAT": {
                    "0": 4.98
                }
            },
            headers="Content-Type: application/json"
        )