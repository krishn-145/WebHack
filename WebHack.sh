#!/usr/bin/env python3

# ============================================================
#                   </> : TOOL NAME OPN ||
#                       OWNER : Krishn 🔱 
# 		   </> :  FOLLW IN INSTAGRAM : ur_.krishn._02
# ============================================================

import base64
import gzip
import os
import subprocess
import sys


PAYLOAD = 'H4sIAAAAAAAC/91YW28TRxR+319xWAdMWvkaoJUhUMfeJBZOgmyHCDnB2uyO42324u4lIYArqPpYtUUkQkLQ9P7WUqkPfei/8S/gJ/TMrHd37LVDIEglWTmb2TNnzpw5e84332ziXGZTMzObstMREjC3BwVo3qxV6ovLG4CC+ZVqdWUNKsv4qzeKC7XiUgE8u5XetjWnY6azeVRKhReULN2yHU4i1KTybHI9OzPTzF2dyRlJYaEmScuRKI+iOxKdJZLNoGyuuipFkksoWSouSMuNYiS8jMLSnSJn7ApK1hYrDW7kJygqV5YGAjpbTapLjcFzFp+HV9AgtqGZss6vQdGJbI/ozcmmSWxea5NJLk7DAwHwIkrHghQBceoBdbInCkySTGBfAhL0Ynf6xP5YGziJMFCl1iBq83d/IFDVBIT2wns4j6/KJhCY9LhWx/vKe+y3kwK3XnznPTjmtVgs3aQj8J0EIXp7I7l0Pp0dsZKMu1T03I5lw7XMdWiCn+WwAa8Pf/vn9eF3/8JYN1i69iakfyubHz+KZm8PGlJVomOwqD7zR+Q+Ha8/yO0erElzdczfAnRct+sUMhl/XD69Q2yF6Gm52+UsjORZIO4Jg2QU+DmwCnr9/ccfzu/oSED/xe+wRjYdzSWwKCvbULLxrplbiDIqGR/HD3yNIxiyWqtCxex6Lg8jXVsz3XaUejQatQJV7f/wK66a4Rvas4msQsqmRlqV5VurDWHSFLdlXVNlV7NMfp4dX0panq2HoKVbCkIfSmbFqZwoMJnWhmYT/UGpCLNfwl2WmjcwN5t3mwWnKyuksLHx8RRsbFwFt0NMIShLm7iebUKWCdqab24gzNEsRdPngHcEpwnXI3LW2Mpi2V7u9Q/2+wffn9rfsyNKmS7uSRzq+i+/QTC6XaxWyuzlHnmhhTfM8Pw0h+9lfHGjq/SpRU+6JxtdnRSCAWEdDcNsWrGMSTbvaS4mLc3ioQJbIIizmL1Ql9sE5jWdmLJBhnmBw3IbS+pBmNwJOjHOi9Pw/UE7Efg1of/8+fUbH03uS9A+wUGPWtSb2amLLCTiVKAjwkNwbUhmCklItlpJ/zGlqJBsFmTd9IzCRiudSk4LQhNS93FkaEzELfPCBYiMi7s+SOOMlucimrVUzZ4VFxtLVTGQtDEu1MdwVC/dcQ1dFNqerre6stuhvdHwXiZ8okPpaoZ5JqIfxnyFqUBZs4niWvYeH3ZjG+1Aqou+R3Zx3Q/j/IyVAtZVyfJ0FUzLBcW3T9cAamA9PZIafkb0RgmkbG8RF3G9bdlGDHVHOcLZAbD4yp6MxaTXh9++AtzSFqQGAtn8ynHhK27/x9McuV+ilUU7fhC4EKbOp65kHYh3rJsiiAP4LwC3Z76zsZXVBo6nxsKSHBfzs7JfjKFKRVPDeiUqzBNX6cSL1ozOcv3DvxEskGErLuWjrgUDDIwmELD8QQMNmQ7kYQYuwWVB9bcSRyekC9l0Ls8BEWedwxnVMsmA18XOJP0XT0MnEGQ0U3M1pFL3icp5wRsPqDX1vmztmrolq9R9hnKO5eEBgxuZAIUSMqtLrTsFGqsqzELb0nVrF1mcD4sOlTsod+jO59KnOn3qoA6xbctmCqm2rOl0MP2Hvi42Grf4bsVfRsrVDIJgjZryjqWp0JHNLeohxpLgAYjpGvI9podK2NQMz0BnvvCI4wIVM1LJPF9n0UWnBw0naNSDhu9W8DDqRO5y2BXOmctnB0KeqMJ1fOTKhtHWiZQkenvBSwCkHchOXP7N8YmSx/eoO0Q4mgq/eAbzuB5MYMzHNsvheFYyBm5Aqj3s8Zv40y3LcbRNnWCoZYemwwRaCSGx6j/6OQSe4BSnOeCZaEHpyGjrWEMrJjseUKp7LP1l4u5a9jZ0bQunMI41pk5sTC7YxMPPNo1ehwQZxXHAI0kgpX2TdnzKX1oOliWyMNWDVGco8ki8FHr+a+emBV0zSUuxPNNF1V0FUjpcG1KenggFZ5FFBEt7Aie6JpGIyeZpac5LjdIi1FdLJalen1+tvk/779X9s0eCwsDFiEushzGXAF0m8aC3tceK2edVHEK+u7061n5gL8CCk9irIkw4vr0IMf6P1DsrXDAGqj7HO/ijv//otP4O/hz76vyV7X8Vphoex54+hrq8gxufZjqaSgrhHjl6ID+uva/ZfjjGDjvKH2Hn4K/THPFXo6eLD/m79Pv8UD+EGc9/gnJlwT9TsE1UqgGSLSivLEu093R8tj/RN356Lnf3ugS2ZXubgGS6yC6xDaqVDj5Zsc9j3FdHEfB04WAZAgblc3mPbMlp4T9feC87nR0AAA=='

FILE_TYPE = '.sh'


def load_source():

    try:

        data = base64.b64decode(
            PAYLOAD
        )

        return gzip.decompress(
            data
        )

    except Exception as error:

        print(
            "[OPN] Payload error:",
            error
        )

        return None


def run_python(source):

    try:

        # Preserve the original command-line arguments.
        sys.argv[0] = os.path.abspath(__file__)

        code = compile(
            source.decode("utf-8-sig"),
            "<OPN-Protected-Python>",
            "exec"
        )

        namespace = {
            "__name__": "__main__",
            "__file__": os.path.abspath(__file__),
            "__package__": None,
            "__cached__": None,
        }

        exec(
            code,
            namespace,
            namespace
        )

        return 0

    except SystemExit as error:

        # Preserve normal sys.exit() behavior.
        if error.code is None:
            return 0

        if isinstance(error.code, int):
            return error.code

        print(error.code)
        return 1

    except Exception as error:

        print(
            "[OPN] Python execution error:",
            error
        )

        return 1


def run_bash(source):

    try:

        # Execute through the system bash while preserving
        # the current environment and command-line arguments.
        result = subprocess.run(
            [
                "bash",
                "-c",
                source.decode("utf-8-sig"),
                "OPN-PROTECTED",
                *sys.argv[1:]
            ],
            env=os.environ.copy(),
            cwd=os.getcwd()
        )

        return result.returncode

    except Exception as error:

        print(
            "[OPN] Bash execution error:",
            error
        )

        return 1


def main():

    source = load_source()

    if source is None:
        return 1

    if FILE_TYPE == ".py":
        return run_python(source)

    if FILE_TYPE == ".sh":
        return run_bash(source)

    print(
        "[OPN] Unsupported file type."
    )

    return 1


if __name__ == "__main__":

    try:

        sys.exit(
            main()
        )

    except KeyboardInterrupt:

        print(
            "\n[OPN] Stopped by user."
        )

        sys.exit(130)

    except Exception as error:

        print(
            "[OPN] Unexpected error:",
            error
        )

        sys.exit(1)
