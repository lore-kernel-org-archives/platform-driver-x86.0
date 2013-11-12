From: William Wilhelm <willat8@gmail.com>
Subject: asus-nb-wmi.c for UX31E
Date: Wed, 13 Nov 2013 10:25:50 +1100
Message-ID: <CAOzBiV41xJam-_3OX7DBm+y32SeMQPgy-heVov-rYtWGneum2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=089e0149ca3a4cae6d04eb032ba3
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:59117 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753327Ab3KLXZv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Nov 2013 18:25:51 -0500
Received: by mail-ve0-f177.google.com with SMTP id jz11so3731354veb.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2013 15:25:50 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

--089e0149ca3a4cae6d04eb032ba3
Content-Type: text/plain; charset=ISO-8859-1

Hello

I was asked to send a copy of the bug report concerning lighting the
WiFi LED on the UX31E after resuming from S3. Below is the contents of
the original report. Attached is the diff for the changes I made to
revert back to 3.10.x behaviour.

Faithfully,
Will

First ever bug report so hope I'm doing it correctly.

After upgrade to 3.10.x to 3.11.x my WiFi LED no longer relights after
resume from S3 sleep. asus-nb-wmi is built as module and loaded by
init on boot. System is Zenbook UX31E.

Setting WAPF=4 seems to revert back to 3.10.x behaviour.

--089e0149ca3a4cae6d04eb032ba3
Content-Type: text/plain; charset=US-ASCII; name="ux31e.diff"
Content-Disposition: attachment; filename="ux31e.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hnxrq6mm0

LS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy1uYi13bWkuYwkyMDEzLTExLTA0IDEwOjQx
OjUxLjAwMDAwMDAwMCArMTEwMAorKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLW5iLXdt
aS5jCTIwMTMtMTEtMTMgMTA6MTU6MjUuMTU2NjY1NTE5ICsxMTAwCkBAIC0xOTgsNiArMTk4LDE1
IEBACiAJCX0sCiAJCS5kcml2ZXJfZGF0YSA9ICZxdWlya19hc3VzX3g0MDF1LAogCX0sCisJewor
CQkuY2FsbGJhY2sgPSBkbWlfbWF0Y2hlZCwKKwkJLmlkZW50ID0gIkFTVVNUZUsgQ09NUFVURVIg
SU5DLiBVWDMxRSIsCisJCS5tYXRjaGVzID0geworCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9S
LCAiQVNVU1RlSyBDb21wdXRlciBJbmMuIiksCisJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFN
RSwgIlVYMzFFIiksCisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICZxdWlya19hc3VzX3g0MDF1LAor
CX0sCiAJe30sCiB9OwogCg==
--089e0149ca3a4cae6d04eb032ba3--
