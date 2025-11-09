import asyncdispatch, httpclient, json

const api = "https://bartender.painel.coopers.pro/api"
var headers = newHttpHeaders({
  "Connection": "keep-alive", 
  "Host": "bartender.painel.coopers.pro",
  "Content-Type": "application/json", 
  "accept": "application/json", 
  "user-agent": "Dalvik/2.1.0 (Linux; U; Android 7.1.2; SM-G965N Build/QP1A.190711.020)"
})

proc get_recipe_by_category_id*(category_id:int,page:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/recipes?category_id=" & $category_id & "&page=" & $page)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc search_req*(q:string,page:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/recipes/search?query=" & q & "&page=" & $page)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()


proc get_recipe_categories*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/recipe_categories")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
