From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: Patch [3/4] intel scu ipc
Date: Fri, 28 May 2010 14:12:35 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F4A4@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A4bgsmsx501garc_"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:5648 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757136Ab0E1Io3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 May 2010 04:44:29 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "mjg@redhat.com" <mjg@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Alan Cox <alan@linux.intel.com>

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A4bgsmsx501garc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

  Hello,
Please review and accept the patch

From f8d29b90e6015387451062a6a5ae1499de120ab4 Mon Sep 17 00:00:00 2001
From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Fri, 28 May 2010 14:04:02 +0530
Subject: [PATCH] chnages to avoid late initialization of driver
 ipc driver needs to be initialized before any other driver using ipc
 	modified:   intel_scu_ipc.c


Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/in=
tel_scu_ipc.c
index ffd304a..8bb3fda 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -834,14 +834,8 @@ static int __init intel_scu_ipc_init(void)
 	return  pci_register_driver(&ipc_driver);
 }
=20
-static void __exit intel_scu_ipc_exit(void)
-{
-	pci_unregister_driver(&ipc_driver);
-}
-
 MODULE_AUTHOR("Sreedhara DS <sreedhara.ds@intel.com>");
 MODULE_DESCRIPTION("Intel SCU IPC driver");
 MODULE_LICENSE("GPL");
=20
-module_init(intel_scu_ipc_init);
-module_exit(intel_scu_ipc_exit);
+fs_initcall(intel_scu_ipc_init);
--=20
1.5.4.5


--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A4bgsmsx501garc_
Content-Type: application/octet-stream;
	name="0003-chnages-to-avoid-late-initialization-of-driver.patch"
Content-Description: 0003-chnages-to-avoid-late-initialization-of-driver.patch
Content-Disposition: attachment;
	filename="0003-chnages-to-avoid-late-initialization-of-driver.patch";
	size=1133; creation-date="Fri, 28 May 2010 14:13:30 GMT";
	modification-date="Fri, 28 May 2010 14:13:30 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmOGQyOWI5MGU2MDE1Mzg3NDUxMDYyYTZhNWFlMTQ5OWRlMTIwYWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+
CkRhdGU6IEZyaSwgMjggTWF5IDIwMTAgMTQ6MDQ6MDIgKzA1MzAKU3ViamVjdDogW1BBVENIXSBj
aG5hZ2VzIHRvIGF2b2lkIGxhdGUgaW5pdGlhbGl6YXRpb24gb2YgZHJpdmVyCiBpcGMgZHJpdmVy
IG5lZWRzIHRvIGJlIGluaXRpYWxpemVkIGJlZm9yZSBhbnkgb3RoZXIgZHJpdmVyIHVzaW5nIGlw
YwogCW1vZGlmaWVkOiAgIGludGVsX3NjdV9pcGMuYwoKClNpZ25lZC1vZmYtYnk6IFNyZWVkaGFy
YSBEUyA8c3JlZWRoYXJhLmRzQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9p
bnRlbF9zY3VfaXBjLmMgfCAgICA4ICstLS0tLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9pbnRlbF9zY3VfaXBjLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9zY3VfaXBjLmMK
aW5kZXggZmZkMzA0YS4uOGJiM2ZkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
aW50ZWxfc2N1X2lwYy5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMu
YwpAQCAtODM0LDE0ICs4MzQsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBpbnRlbF9zY3VfaXBjX2lu
aXQodm9pZCkKIAlyZXR1cm4gIHBjaV9yZWdpc3Rlcl9kcml2ZXIoJmlwY19kcml2ZXIpOwogfQog
Ci1zdGF0aWMgdm9pZCBfX2V4aXQgaW50ZWxfc2N1X2lwY19leGl0KHZvaWQpCi17Ci0JcGNpX3Vu
cmVnaXN0ZXJfZHJpdmVyKCZpcGNfZHJpdmVyKTsKLX0KLQogTU9EVUxFX0FVVEhPUigiU3JlZWRo
YXJhIERTIDxzcmVlZGhhcmEuZHNAaW50ZWwuY29tPiIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJJ
bnRlbCBTQ1UgSVBDIGRyaXZlciIpOwogTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwogCi1tb2R1bGVf
aW5pdChpbnRlbF9zY3VfaXBjX2luaXQpOwotbW9kdWxlX2V4aXQoaW50ZWxfc2N1X2lwY19leGl0
KTsKK2ZzX2luaXRjYWxsKGludGVsX3NjdV9pcGNfaW5pdCk7Ci0tIAoxLjUuNC41Cgo=

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A4bgsmsx501garc_--
