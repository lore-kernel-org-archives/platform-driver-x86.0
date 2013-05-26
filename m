From: Daniel Serpell <daniel.serpell@gmail.com>
Subject: [PATCH] sony-laptop: Reading gfx_switch_status in SVS13A15GLB
Date: Sat, 25 May 2013 20:12:43 -0400
Message-ID: <CANepG=Ot72gY8qacyTvte1oGO8ymEj69xgrvdKg1Q8McMddKLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=f46d044306421bccd804dd93e46a
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:48700 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758291Ab3EZAMp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 May 2013 20:12:45 -0400
Received: by mail-we0-f175.google.com with SMTP id p60so3577806wes.20
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 May 2013 17:12:43 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

--f46d044306421bccd804dd93e46a
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Thank you for your work in the sony-laptop kernel module.

I have a Vaio SVS13A15GLB laptop, and today tried the module in the
kernel version 3.10-rc2, that allows reading back the status of the
"gfx" switch.

But in my laptop, when the switch is in the STAMINA position, the
driver reports "speed", and in the "SPEED" position, reports "stamina"
:-(

Reading the status produced the following log in dmesg, with "debug=1":

In SPEED position:
[30084.337256] sony_laptop: found handle 0x015b (offset: 0x05)
[30084.337613] sony_laptop: __call_snc_method: [SN07:0x0000000000000005]
[30084.337618] sony_laptop: called SN07 with 0x0005 (result: 0x0000)

In STAMINA position:
[29976.398723] sony_laptop: found handle 0x015b (offset: 0x05)
[29976.399087] sony_laptop: __call_snc_method: [SN07:0x0000000000000005]
[29976.399092] sony_laptop: called SN07 with 0x0005 (result: 0x0001)

Reading the code, it seems that the status shown is not ok.

Attached is a patch to fix this.

Thanks,

    Daniel.

--f46d044306421bccd804dd93e46a
Content-Type: application/octet-stream; name="gfx-reporting.patch"
Content-Disposition: attachment; filename="gfx-reporting.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hh5h3kdl0

RnJvbTogRGFuaWVsIFNlcnBlbGwgPGRhbmllbC5zZXJwZWxsQGdtYWlsLmNvbT4KCkZpeCByZXBv
cnRpbmcgb2Ygc29ueS1sYXB0b3AgZ2Z4X3N3aXRjaF9zdGF0dXMuCgpTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgU2VycGVsbCA8ZGFuaWVsLnNlcnBlbGxAZ21haWwuY29tPgoKZGlmZiBhL2RyaXZlcnMv
cGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9zb255LWxh
cHRvcC5jCi0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMJMjAxMy0wNS0y
NSAxOToyODo0MS43NjY0ODY4MDcgLTA0MDAKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvc29u
eS1sYXB0b3AuYwkyMDEzLTA1LTI1IDIwOjA1OjE0LjI3NDQyOTMzNSAtMDQwMApAQCAtMjQ0MCw3
ICsyNDQwLDcgQEAKIAlpZiAocG9zIDwgMCkKIAkJcmV0dXJuIHBvczsKIAotCXJldHVybiBzbnBy
aW50ZihidWZmZXIsIFBBR0VfU0laRSwgIiVzXG4iLCBwb3MgPyAic3BlZWQiIDogInN0YW1pbmEi
KTsKKwlyZXR1cm4gc25wcmludGYoYnVmZmVyLCBQQUdFX1NJWkUsICIlc1xuIiwgcG9zID09IFNQ
RUVEID8gInNwZWVkIiA6ICJzdGFtaW5hIik7CiB9CiAKIHN0YXRpYyBpbnQgc29ueV9uY19nZnhf
c3dpdGNoX3NldHVwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkLAo=
--f46d044306421bccd804dd93e46a--
