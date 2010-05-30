From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: intel_scu_ipc: detect CPU type automatically [Patch 1/4]
Date: Sun, 30 May 2010 22:58:43 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F772@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_0AE3E14D83C76F4994657326177D1FF9042CE9F772bgsmsx501garc_"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:45101 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750995Ab0E3R2v (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 May 2010 13:28:51 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Cox, Alan" <alan.cox@intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F772bgsmsx501garc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

  Intel SCU message formats depend upon the processor type. Replace the mod=
ule option with automatic detection of the processor type.

Resending the patch

From 443010eead6d69e3b60b460fd3f82344de95da5d Mon Sep 17 00:00:00 2001
From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Fri, 28 May 2010 13:53:38 +0530
Subject: [PATCH] changes to find platform type during int
 	modified:   intel_scu_ipc.c


Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/in=
tel_scu_ipc.c
index 576c3ed..b2101ec 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -23,7 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pci.h>
 #include <linux/interrupt.h>
-#include <asm/setup.h>
+#include <asm/mrst.h>
 #include <asm/intel_scu_ipc.h>
=20
 /* IPC defines the following message types */
@@ -78,12 +78,9 @@ struct intel_scu_ipc_dev {
=20
 static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
=20
-static int platform =3D 1;
-module_param(platform, int, 0);
-MODULE_PARM_DESC(platform, "1 for moorestown platform");
-
-
-
+#define PLATFORM_LANGWELL 1
+#define PLATFORM_PENWELL 2
+static int platform;		/* Platform type */
=20
 /*
  * IPC Read Buffer (Read Only):
@@ -813,6 +810,14 @@ static struct pci_driver ipc_driver =3D {
=20
 static int __init intel_scu_ipc_init(void)
 {
+	if (boot_cpu_data.x86 =3D=3D 6 &&
+		boot_cpu_data.x86_model =3D=3D 0x27 &&
+		boot_cpu_data.x86_mask =3D=3D 1)
+			platform =3D PLATFORM_PENWELL;
+	else if (boot_cpu_data.x86 =3D=3D 6 &&
+		boot_cpu_data.x86_model =3D=3D 0x26)
+			platform =3D PLATFORM_LANGWELL;
+
 	return  pci_register_driver(&ipc_driver);
 }
=20
--=20
1.5.4.5


--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F772bgsmsx501garc_
Content-Type: application/octet-stream;
	name="0001-changes-to-find-platform-type-during-int.patch"
Content-Description: 0001-changes-to-find-platform-type-during-int.patch
Content-Disposition: attachment;
	filename="0001-changes-to-find-platform-type-during-int.patch"; size=1638;
	creation-date="Sun, 30 May 2010 23:01:56 GMT";
	modification-date="Sun, 30 May 2010 23:01:56 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0NDMwMTBlZWFkNmQ2OWUzYjYwYjQ2MGZkM2Y4MjM0NGRlOTVkYTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+
CkRhdGU6IEZyaSwgMjggTWF5IDIwMTAgMTM6NTM6MzggKzA1MzAKU3ViamVjdDogW1BBVENIXSBj
aGFuZ2VzIHRvIGZpbmQgcGxhdGZvcm0gdHlwZSBkdXJpbmcgaW50CiAJbW9kaWZpZWQ6ICAgaW50
ZWxfc2N1X2lwYy5jCgoKU2lnbmVkLW9mZi1ieTogU3JlZWRoYXJhIERTIDxzcmVlZGhhcmEuZHNA
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMuYyB8ICAg
MTkgKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVs
X3NjdV9pcGMuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMuYwppbmRleCA1
NzZjM2VkLi5iMjEwMWVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9z
Y3VfaXBjLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfc2N1X2lwYy5jCkBAIC0y
Myw3ICsyMyw3IEBACiAjaW5jbHVkZSA8bGludXgvcG0uaD4KICNpbmNsdWRlIDxsaW51eC9wY2ku
aD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KLSNpbmNsdWRlIDxhc20vc2V0dXAuaD4K
KyNpbmNsdWRlIDxhc20vbXJzdC5oPgogI2luY2x1ZGUgPGFzbS9pbnRlbF9zY3VfaXBjLmg+CiAK
IC8qIElQQyBkZWZpbmVzIHRoZSBmb2xsb3dpbmcgbWVzc2FnZSB0eXBlcyAqLwpAQCAtNzgsMTIg
Kzc4LDkgQEAgc3RydWN0IGludGVsX3NjdV9pcGNfZGV2IHsKIAogc3RhdGljIHN0cnVjdCBpbnRl
bF9zY3VfaXBjX2RldiAgaXBjZGV2OyAvKiBPbmx5IG9uZSBmb3Igbm93ICovCiAKLXN0YXRpYyBp
bnQgcGxhdGZvcm0gPSAxOwotbW9kdWxlX3BhcmFtKHBsYXRmb3JtLCBpbnQsIDApOwotTU9EVUxF
X1BBUk1fREVTQyhwbGF0Zm9ybSwgIjEgZm9yIG1vb3Jlc3Rvd24gcGxhdGZvcm0iKTsKLQotCi0K
KyNkZWZpbmUgUExBVEZPUk1fTEFOR1dFTEwgMQorI2RlZmluZSBQTEFURk9STV9QRU5XRUxMIDIK
K3N0YXRpYyBpbnQgcGxhdGZvcm07CQkvKiBQbGF0Zm9ybSB0eXBlICovCiAKIC8qCiAgKiBJUEMg
UmVhZCBCdWZmZXIgKFJlYWQgT25seSk6CkBAIC04MTMsNiArODEwLDE0IEBAIHN0YXRpYyBzdHJ1
Y3QgcGNpX2RyaXZlciBpcGNfZHJpdmVyID0gewogCiBzdGF0aWMgaW50IF9faW5pdCBpbnRlbF9z
Y3VfaXBjX2luaXQodm9pZCkKIHsKKwlpZiAoYm9vdF9jcHVfZGF0YS54ODYgPT0gNiAmJgorCQli
b290X2NwdV9kYXRhLng4Nl9tb2RlbCA9PSAweDI3ICYmCisJCWJvb3RfY3B1X2RhdGEueDg2X21h
c2sgPT0gMSkKKwkJCXBsYXRmb3JtID0gUExBVEZPUk1fUEVOV0VMTDsKKwllbHNlIGlmIChib290
X2NwdV9kYXRhLng4NiA9PSA2ICYmCisJCWJvb3RfY3B1X2RhdGEueDg2X21vZGVsID09IDB4MjYp
CisJCQlwbGF0Zm9ybSA9IFBMQVRGT1JNX0xBTkdXRUxMOworCiAJcmV0dXJuICBwY2lfcmVnaXN0
ZXJfZHJpdmVyKCZpcGNfZHJpdmVyKTsKIH0KIAotLSAKMS41LjQuNQoK

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F772bgsmsx501garc_--
