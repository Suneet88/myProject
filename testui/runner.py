import argparse
import os
import subprocess

__VARIABLE_FILE_PATH = 'variables/config.py'


def _get_args_obj_():
    parser = argparse.ArgumentParser()
    parser.add_argument("--browser", help="browser name")
    parser.add_argument("--url", help="url to hit")
    parser.add_argument("--include", help="tags of testcase to execute")
    return parser.parse_args()


def prepare_cmd(args):
    __CMD = 'robot -d reports --variablefile ' + __VARIABLE_FILE_PATH
    __TESTS = 'test/'
    if not args.browser is None:
        __CMD += ' --variable BROWSER:' + args.browser
    if not args.url is None:
        __CMD += ' --variable BROWSER:' + args.url
    __CMD += __TESTS
    return __CMD


def run_robot_suite(cmd):
    FNULL = open(os.devnull, 'w')
    subprocess.call(cmd, stdout=FNULL, stderr=subprocess.STDOUT)


def main():
    args = _get_args_obj_()
    __CMD = prepare_cmd()
    run_robot_suite(__CMD)


if __name__ == '__main__':
    main()
