import http.client as hc

host = "your_endpoint"

method = "GET"

url = "url_path"

conn = hc.HTTPConnection(host)

conn.request(method, url)

resp = conn.getresponse()

if resp.status != 200:
    print(f"Status: {resp.status}, reason: {resp.reason}")
else:
    body = resp.read().decode("utf-8")
    print(body)

conn.close()
