From: Alessandro Guido <ag@alessandroguido.name>
Subject: [RESEND] Re: NULL pointer dereference in sony-laptop
Date: Fri, 01 Apr 2011 15:17:50 +0200
Message-ID: <4D95D07E.8060908@alessandroguido.name>
References: <4D94B9AE.6090004@alessandroguido.name>	<20110401002935.GA25651@kamineko.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060403020007010700030402"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:34093 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750874Ab1DANRD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Apr 2011 09:17:03 -0400
Received: by wya21 with SMTP id 21so2929719wya.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 01 Apr 2011 06:17:01 -0700 (PDT)
In-Reply-To: <20110401002935.GA25651@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------060403020007010700030402
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[First try got blocked from platform-driver-x86 antispam filter]

On Fri, Apr 1, 2011 at 2:29 AM, Mattia Dongili <malattia@linux.it> wrote:

> Hi Alessandro,
>
> I am under the impression that the SNC devices gets a notification early
> during initialization when we still haven't read the available handles.
> This patch should fix it but if my thoughts are incorrect then it may
> break something else later.
> Give it a try and let me know (it may apply with a little fuzz).
> Also, could you try to load the module with and without the patch using
> the parameter debug=1 ?
>
> diff --git a/drivers/platform/x86/sony-laptop.c
> b/drivers/platform/x86/sony-laptop.c
> index cfe4493..bed6ebd 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -808,6 +808,11 @@ static int sony_nc_handles_cleanup(struct
> platform_device *pd)
>  static int sony_find_snc_handle(int handle)
>  {
>        int i;
> +
> +       /* not initialized yet, return early */
> +       if (!handles)
> +               return -1;
> +
>        for (i = 0; i < 0x10; i++) {
>                if (handles->cap[i] == handle) {
>                        dprintk("found handle 0x%.4x (offset: 0x%.2x)\n",


It works, thanks!

I've attached debug output from sony-laptop with and without the patch 
as you requested.


--------------060403020007010700030402
Content-Type: application/octet-stream;
 name="patched.dmesg"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patched.dmesg"

c29ueS1sYXB0b3A6IFNvbnkgTm90ZWJvb2sgQ29udHJvbCBEcml2ZXIgdjAuNi4Kc29ueS1s
YXB0b3A6IG1ldGhvZDogbmFtZTogR0JSVCwgYXJncyAwCnNvbnktbGFwdG9wOiBtZXRob2Q6
IG5hbWU6IFNCUlQsIGFyZ3MgMQpzb255LWxhcHRvcDogbWV0aG9kOiBuYW1lOiBHUEJSLCBh
cmdzIDAKc29ueS1sYXB0b3A6IG1ldGhvZDogbmFtZTogU1BCUiwgYXJncyAxCnNvbnktbGFw
dG9wOiBtZXRob2Q6IG5hbWU6IFBXQUssIGFyZ3MgMApzb255LWxhcHRvcDogbWV0aG9kOiBu
YW1lOiBHSEtFLCBhcmdzIDAKc29ueS1sYXB0b3A6IG1ldGhvZDogbmFtZTogR1dEUCwgYXJn
cyAwCnNvbnktbGFwdG9wOiBtZXRob2Q6IG5hbWU6IEdTTkUsIGFyZ3MgMQpzb255LWxhcHRv
cDogbWV0aG9kOiBuYW1lOiBTU05FLCBhcmdzIDEKc29ueS1sYXB0b3A6IG1ldGhvZDogbmFt
ZTogQ1NYQiwgYXJncyAxCnNvbnktbGFwdG9wOiBtZXRob2Q6IG5hbWU6IFNPRFYsIGFyZ3Mg
MQpzb255LWxhcHRvcDogbWV0aG9kOiBuYW1lOiBHRERJLCBhcmdzIDAKc29ueS1sYXB0b3A6
IG1ldGhvZDogbmFtZTogU1RDUywgYXJncyAxCnNvbnktbGFwdG9wOiBtZXRob2Q6IG5hbWU6
IFJCTUYsIGFyZ3MgMQpzb255LWxhcHRvcDogbWV0aG9kOiBuYW1lOiBSU0JJLCBhcmdzIDEK
c29ueS1sYXB0b3A6IG1ldGhvZDogbmFtZTogQ0JNRiwgYXJncyAxCmlucHV0OiBTb255IFZh
aW8gS2V5cyBhcyAvZGV2aWNlcy9MTlhTWVNUTTowMC9kZXZpY2U6MDAvUE5QMEEwMzowMC9k
ZXZpY2U6MTgvU05ZNTAwMTowMC9pbnB1dC9pbnB1dDExCmlucHV0OiBTb255IFZhaW8gSm9n
ZGlhbCBhcyAvZGV2aWNlcy92aXJ0dWFsL2lucHV0L2lucHV0MTIKc29ueS1sYXB0b3A6IEZv
dW5kIGJyaWdodG5lc3NfZGVmYXVsdCBnZXR0ZXI6IEdQQlIKc29ueS1sYXB0b3A6IEZvdW5k
IGJyaWdodG5lc3NfZGVmYXVsdCBzZXR0ZXI6IFNQQlIKc29ueS1sYXB0b3A6IEZvdW5kIGZu
a2V5IGdldHRlcjogR0hLRQo=
--------------060403020007010700030402
Content-Type: application/octet-stream;
 name="unpatched.dmesg"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="unpatched.dmesg"

c29ueS1sYXB0b3A6IFNvbnkgTm90ZWJvb2sgQ29udHJvbCBEcml2ZXIgdjAuNi4Kc29ueS1s
YXB0b3A6IG1ldGhvZDogbmFtZTogR0JSVCwgYXJncyAwCnNvbnktbGFwdG9wOiBtZXRob2Q6
IG5hbWU6IFNCUlQsIGFyZ3MgMQpzb255LWxhcHRvcDogbWV0aG9kOiBuYW1lOiBHUEJSLCBh
cmdzIDAKc29ueS1sYXB0b3A6IG1ldGhvZDogbmFtZTogU1BCUiwgYXJncyAxCnNvbnktbGFw
dG9wOiBtZXRob2Q6IG5hbWU6IFBXQUssIGFyZ3MgMApzb255LWxhcHRvcDogbWV0aG9kOiBu
YW1lOiBHSEtFLCBhcmdzIDAKc29ueS1sYXB0b3A6IG1ldGhvZDogbmFtZTogR1dEUCwgYXJn
cyAwCnNvbnktbGFwdG9wOiBtZXRob2Q6IG5hbWU6IEdTTkUsIGFyZ3MgMQpzb255LWxhcHRv
cDogbWV0aG9kOiBuYW1lOiBTU05FLCBhcmdzIDEKc29ueS1sYXB0b3A6IG1ldGhvZDogbmFt
ZTogQ1NYQiwgYXJncyAxCnNvbnktbGFwdG9wOiBtZXRob2Q6IG5hbWU6IFNPRFYsIGFyZ3Mg
MQpzb255LWxhcHRvcDogbWV0aG9kOiBuYW1lOiBHRERJLCBhcmdzIDAKc29ueS1sYXB0b3A6
IG1ldGhvZDogbmFtZTogU1RDUywgYXJncyAxCnNvbnktbGFwdG9wOiBtZXRob2Q6IG5hbWU6
IFJCTUYsIGFyZ3MgMQpzb255LWxhcHRvcDogbWV0aG9kOiBuYW1lOiBSU0JJLCBhcmdzIDEK
c29ueS1sYXB0b3A6IG1ldGhvZDogbmFtZTogQ0JNRiwgYXJncyAxCmlucHV0OiBTb255IFZh
aW8gS2V5cyBhcyAvZGV2aWNlcy9MTlhTWVNUTTowMC9kZXZpY2U6MDAvUE5QMEEwMzowMC9k
ZXZpY2U6MTgvU05ZNTAwMTowMC9pbnB1dC9pbnB1dDExCmlucHV0OiBTb255IFZhaW8gSm9n
ZGlhbCBhcyAvZGV2aWNlcy92aXJ0dWFsL2lucHV0L2lucHV0MTIKQlVHOiB1bmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgICAobnVsbCkKSVA6
IFs8ZjgwMjEwNjA+XSBzb255X2ZpbmRfc25jX2hhbmRsZSsweDEwLzB4NzAgW3NvbnlfbGFw
dG9wXQoqcGRlID0gMDAwMDAwMDAgCk9vcHM6IDAwMDAgWyMxXSBQUkVFTVBUIApsYXN0IHN5
c2ZzIGZpbGU6IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb255LWxhcHRvcC91ZXZlbnQKTW9k
dWxlcyBsaW5rZWQgaW46IHNvbnlfbGFwdG9wKCspCgpQaWQ6IDE0OTQsIGNvbW06IG1vZHBy
b2JlIE5vdCB0YWludGVkIDIuNi4zOS1yYzEtMDAxMDMtZzZhYmE3NGYgIzMgU29ueSBDb3Jw
b3JhdGlvbiBWR04tRlMyMTVTCkVJUDogMDA2MDpbPGY4MDIxMDYwPl0gRUZMQUdTOiAwMDAx
MDI4MiBDUFU6IDAKRUlQIGlzIGF0IHNvbnlfZmluZF9zbmNfaGFuZGxlKzB4MTAvMHg3MCBb
c29ueV9sYXB0b3BdCkVBWDogMDAwMDAxMmYgRUJYOiAwMDAwMDAwMCBFQ1g6IDAwMDAwMDAw
IEVEWDogMDAwMDAwMDAKRVNJOiBmNjU1OWUwNCBFREk6IGY2NTJmNDAwIEVCUDogMDAwMDAw
MDAgRVNQOiBmNjU1OWRiMAogRFM6IDAwN2IgRVM6IDAwN2IgRlM6IDAwMDAgR1M6IDAwMzMg
U1M6IDAwNjgKUHJvY2VzcyBtb2Rwcm9iZSAocGlkOiAxNDk0LCB0aT1mNjU1ODAwMCB0YXNr
PWY1ZDA2YTQwIHRhc2sudGk9ZjY1NTgwMDApClN0YWNrOgogMDAwMDAwMDAgZjY1NTllMDQg
ZjY1MmY0MDAgMDAwMDAwMDAgZjgwMjMxMjYgZjgwMjI5MDAgMDAwMDAwMDAgMDAwMDAwMDAK
IDAwMDAwMDAwIGY2NTEyMzAwIDAwMDAwMDAwIGMxMGYzNWI1IGY2NTU5ZTE4IGY1YzI3ZjAw
IGY2NTU5ZTE4IGMxMGYyZGNjCiBjMTBmMmFkMyAwMDAwNDFlZCBmNjQwM2MwMCBmNWMyNjhh
MCBmNjUxMjMwMCAwMDAwMDAwMCBmNjUyZjQwMCBmODAyNTg0MApDYWxsIFRyYWNlOgogWzxm
ODAyMzEyNj5dID8gc29ueV9uY19hZGQrMHgyODYvMHg4YjAgW3NvbnlfbGFwdG9wXQogWzxm
ODAyMjkwMD5dID8gc29ueV9uY191cGRhdGVfc3RhdHVzX25nKzB4MzAvMHgzMCBbc29ueV9s
YXB0b3BdCiBbPGMxMGYzNWI1Pl0gPyBzeXNmc19kb19jcmVhdGVfbGluaysweGM1LzB4MWYw
CiBbPGMxMGYyZGNjPl0gPyBzeXNmc19hZGRfb25lKzB4MWMvMHhjMAogWzxjMTBmMmFkMz5d
ID8gc3lzZnNfYWRkcm1fZmluaXNoKzB4MTMvMHhhMAogWzxjMTE4MjBhMj5dID8gYWNwaV9k
ZXZpY2VfcHJvYmUrMHgzNy8weGVlCiBbPGMxMWM2ZTE1Pl0gPyBkcml2ZXJfcHJvYmVfZGV2
aWNlKzB4ODUvMHgxOTAKIFs8YzExODI0YTE+XSA/IGFjcGlfbWF0Y2hfZGV2aWNlX2lkcysw
eDI3LzB4NGQKIFs8YzExYzZmOTk+XSA/IF9fZHJpdmVyX2F0dGFjaCsweDc5LzB4ODAKIFs8
YzExYzZmMjA+XSA/IGRyaXZlcl9wcm9iZV9kZXZpY2UrMHgxOTAvMHgxOTAKIFs8YzExYzYw
OGI+XSA/IGJ1c19mb3JfZWFjaF9kZXYrMHg0Yi8weDcwCiBbPGMxMWM2YjM2Pl0gPyBkcml2
ZXJfYXR0YWNoKzB4MTYvMHgyMAogWzxjMTFjNmYyMD5dID8gZHJpdmVyX3Byb2JlX2Rldmlj
ZSsweDE5MC8weDE5MAogWzxjMTFjNjgyNz5dID8gYnVzX2FkZF9kcml2ZXIrMHgxOTcvMHgy
NzAKIFs8YzExODFmZGY+XSA/IGFjcGlfZGV2aWNlX2hpZCsweDEzLzB4MTMKIFs8YzExYzc0
OTc+XSA/IGRyaXZlcl9yZWdpc3RlcisweDU3LzB4ZjAKIFs8ZjgwODEwNGQ+XSA/IHNvbnlf
bGFwdG9wX2luaXQrMHg0ZC8weDc5IFtzb255X2xhcHRvcF0KIFs8YzEwMDExZjM+XSA/IGRv
X29uZV9pbml0Y2FsbCsweDMzLzB4MTcwCiBbPGMxMDQyYzNkPl0gPyBfX2Jsb2NraW5nX25v
dGlmaWVyX2NhbGxfY2hhaW4rMHg0ZC8weDYwCiBbPGY4MDgxMDAwPl0gPyAweGY4MDgwZmZm
CiBbPGMxMDUyM2YxPl0gPyBzeXNfaW5pdF9tb2R1bGUrMHgxNTEvMHgxYTUwCiBbPGMxMGEz
OGM5Pl0gPyBzeXNfY2xvc2UrMHg2OS8weGUwCiBbPGMxMzFkMzBjPl0gPyBzeXNlbnRlcl9k
b19jYWxsKzB4MTIvMHgyMgpDb2RlOiBkMCBjMyA4OSBmNiA4ZCBiYyAyNyAwMCAwMCAwMCAw
MCA4MyBmYSAwMSBiOCBlYSBmZiBmZiBmZiAwZiA0NyBkMCBlYiBlNyA4ZCA3NiAwMCA1MyAz
MSBkYiA4MyBlYyAwYyA4YiAwZCA2YyA2NCAwMiBmOCA4ZCA3NCAyNiAwMCA8MGY+IGI3IDE0
IDU5IDM5IGMyIDc0IDIwIDQzIDgzIGZiIDEwIDc1IGYyIDhiIDE1IDE0IDY0IDAyIGY4IDg1
IApFSVA6IFs8ZjgwMjEwNjA+XSBzb255X2ZpbmRfc25jX2hhbmRsZSsweDEwLzB4NzAgW3Nv
bnlfbGFwdG9wXSBTUzpFU1AgMDA2ODpmNjU1OWRiMApDUjI6IDAwMDAwMDAwMDAwMDAwMDAK
LS0tWyBlbmQgdHJhY2UgNmZkM2Y1NjY5MzE4YTk1NCBdLS0tCg==
--------------060403020007010700030402--
