### 연습용 코드입니당

import json

def json_tree(j):
    dic = json.loads(j)

    result = "root"

    def print_key_recursive(d, depth):
        result = ''
        if isinstance(d, dict):
            for key in d:
                result += '\n' + '  ' * depth + '|--' + key
                result += print_key_recursive(d[key], depth+1)

        return result

    result += print_key_recursive(dic, 0)

    return result

if __name__ == "__main__":
    test_json = json.dumps({
        "test1" : {
            "test2" : {
                "test3" : "test4"
            },
            "test5" : {
                "test6" : "test7"
            }
        }
    })

    print(json_tree(test_json))