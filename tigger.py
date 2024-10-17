import os,sys,base64
import gitlab

# 获取所有环境变量
env_vars = os.environ
if len(sys.argv) > 1:
    gl = gitlab.Gitlab(private_token=sys.argv[1])
else:
    print("No arguments private_token were provided.")
    exit(255)

# 过滤出包含 'BRANCH' 的环境变量
branch_vars = {key: value for key, value in env_vars.items() if '_BRANCH' in key}

# 打印结果
for key, value in branch_vars.items():
    print(f"{key}: {value}")
 
print("PROJECT_LIST: " + env_vars.get('PROJECT_LIST'))
print("NS: " + str(env_vars.get('NS')))
print("ENV_NAME: " + str(env_vars.get('ENV_NAME')))
print("TIME: " + str(env_vars.get('TIME')))
print("BRANCH_INFO_BASE64: " + str(env_vars.get('BRANCH_INFO_BASE64')))
vars = base64.b64decode(str(env_vars.get('BRANCH_INFO_BASE64'))).decode('utf-8')
print("vars: " + str(vars))
gp.pipelines.create({'ref': 'master', 'variables': [{'key': 'PROJECT_LIST', 'value': projects},{'key': 'NS', 'value': pid},{'key': 'ENV_NAME', 'value': traffic},{'key': 'TIME', 'value': datetime.datetime.now().strftime("%Y%m%d%H%M%S")}, {'key': 'BRANCH_INFO_BASE64', 'value': vars_base64}] + vars})
