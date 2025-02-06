# Unhandled JSON Structure in Dart API Call

This repository demonstrates a common error in Dart when handling JSON responses from APIs: making assumptions about the JSON structure. The code assumes the JSON response is always a list of maps, leading to runtime errors if the structure differs.

## Bug Description
The `fetchData` function fetches data from an API and parses the JSON response. It then iterates over the response assuming it's a list, attempting to access the `name` property of each item. If the JSON response isn't a list of maps with a `name` property, a runtime error will occur.

## Solution
The solution involves adding proper type checking and handling various JSON structures to prevent runtime errors.  The improved code gracefully handles cases where the JSON isn't a list or lacks the expected properties.