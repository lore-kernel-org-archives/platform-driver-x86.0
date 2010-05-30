From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: intel_scu_ipc: send correct ipc command based on platform [Patch
 2/4]
Date: Sun, 30 May 2010 23:02:39 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F773@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_0AE3E14D83C76F4994657326177D1FF9042CE9F773bgsmsx501garc_"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:52801 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751740Ab0E3Rcs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 May 2010 13:32:48 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Cox, Alan" <alan.cox@intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F773bgsmsx501garc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

  Ipc command parameters for read/write/update pmic/msic registers depend o=
n platform type.
Corrections are made to previous patch based on Mathew garret comments


From 3648c6c24c967c95eb0a6466c279330c24a4900b Mon Sep 17 00:00:00 2001
From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Sun, 30 May 2010 22:30:51 +0530
Subject: [PATCH] corrections to send correct ipc command to read/write of m=
sic/pmic registers
 pci id for medfield platform added
 return value of ipc_data_readl changed from u8 to u32

	modified:   intel_scu_ipc.c

Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c |   43 ++++++++++++++++++++++--------=
----
 1 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/in=
tel_scu_ipc.c
index b2101ec..4c7c335 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -190,7 +190,7 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count,=
 u32 op, u32 id)
 		return -ENODEV;
 	}
=20
-	if (platform =3D=3D 1) {
+	if (platform =3D=3D PLATFORM_LANGWELL) {
 		/* Entry is 4 bytes for read/write, 5 bytes for read modify */
 		for (nc =3D 0; nc < count; nc++) {
 			cbuf[offset] =3D addr[nc];
@@ -206,28 +206,40 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 coun=
t, u32 op, u32 id)
 		for (nc =3D 0, offset =3D 0; nc < count; nc++, offset +=3D 4)
 			ipc_data_writel(wbuf[nc], offset); /* Write wbuff */
=20
+		if (id !=3D IPC_CMD_PCNTRL_M)
+			ipc_command((count*4) << 16 |  id << 12 | 0 << 8 | op);
+		else
+			ipc_command((count*5) << 16 |  id << 12 | 0 << 8 | op);
+
 	} else {
-		for (nc =3D 0, offset =3D 0; nc < count; nc++, offset +=3D 2)
-			ipc_data_writel(addr[nc], offset); /* Write addresses */
-		if (id !=3D IPC_CMD_PCNTRL_R) {
-			for (nc =3D 0; nc < count; nc++, offset++)
-				ipc_data_writel(data[nc], offset); /* Write data */
-			if (id =3D=3D IPC_CMD_PCNTRL_M)
-				ipc_data_writel(data[nc + 1], offset); /* Mask value*/
+		for (nc =3D 0; nc < count; nc++, offset +=3D 2) {
+			cbuf[offset] =3D addr[nc];
+			cbuf[offset + 1] =3D addr[nc] >> 8;
 		}
-	}
=20
-	if (id !=3D IPC_CMD_PCNTRL_M)
-		ipc_command((count * 3) << 16 |  id << 12 | 0 << 8 | op);
-	else
-		ipc_command((count * 4) << 16 |  id << 12 | 0 << 8 | op);
+		if (id =3D=3D IPC_CMD_PCNTRL_R) {
+			for (nc =3D 0, offset =3D 0; nc < count; nc++, offset +=3D 4)
+				ipc_data_writel(wbuf[nc], offset);
+			ipc_command((count*2) << 16 |  id << 12 | 0 << 8 | op);
+		} else if (id =3D=3D IPC_CMD_PCNTRL_W) {
+			for (nc =3D 0; nc < count; nc++, offset +=3D 1)
+				cbuf[offset] =3D data[nc];
+			for (nc =3D 0, offset =3D 0; nc < count; nc++, offset +=3D 4)
+				ipc_data_writel(wbuf[nc], offset);
+			ipc_command((count*3) << 16 |  id << 12 | 0 << 8 | op);
+		} else if (id =3D=3D IPC_CMD_PCNTRL_M) {
+			cbuf[offset] =3D data[0];
+			cbuf[offset + 1] =3D data[1];
+			ipc_data_writel(wbuf[0], 0); /* Write wbuff */
+			ipc_command(4 << 16 |  id << 12 | 0 << 8 | op);
+		}
+	}
=20
 	err =3D busy_loop();
-
 	if (id =3D=3D IPC_CMD_PCNTRL_R) { /* Read rbuf */
 		/* Workaround: values are read as 0 without memcpy_fromio */
 		memcpy_fromio(cbuf, ipcdev.ipc_base + IPC_READ_BUFFER, 16);
-		if (platform =3D=3D 1) {
+		if (platform =3D=3D PLATFORM_LANGWELL) {
 			for (nc =3D 0, offset =3D 2; nc < count; nc++, offset +=3D 3)
 				data[nc] =3D ipc_data_readb(offset);
 		} else {
@@ -796,6 +808,7 @@ static void ipc_remove(struct pci_dev *pdev)
=20
 static const struct pci_device_id pci_ids[] =3D {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x080e)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x082a)},
 	{ 0,}
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
--=20
1.5.4.5


--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F773bgsmsx501garc_
Content-Type: application/octet-stream;
	name="0002-corrections-to-send-correct-ipc-command-to-read-writ.patch"
Content-Description: 0002-corrections-to-send-correct-ipc-command-to-read-writ.patch
Content-Disposition: attachment;
	filename="0002-corrections-to-send-correct-ipc-command-to-read-writ.patch";
	size=3417; creation-date="Sun, 30 May 2010 23:01:56 GMT";
	modification-date="Sun, 30 May 2010 23:01:56 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzNjQ4YzZjMjRjOTY3Yzk1ZWIwYTY0NjZjMjc5MzMwYzI0YTQ5MDBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+
CkRhdGU6IFN1biwgMzAgTWF5IDIwMTAgMjI6MzA6NTEgKzA1MzAKU3ViamVjdDogW1BBVENIXSBj
b3JyZWN0aW9ucyB0byBzZW5kIGNvcnJlY3QgaXBjIGNvbW1hbmQgdG8gcmVhZC93cml0ZSBvZiBt
c2ljL3BtaWMgcmVnaXN0ZXJzCiBwY2kgaWQgZm9yIG1lZGZpZWxkIHBsYXRmb3JtIGFkZGVkCiBy
ZXR1cm4gdmFsdWUgb2YgaXBjX2RhdGFfcmVhZGwgY2hhbmdlZCBmcm9tIHU4IHRvIHUzMgoKCW1v
ZGlmaWVkOiAgIGludGVsX3NjdV9pcGMuYwoKU2lnbmVkLW9mZi1ieTogU3JlZWRoYXJhIERTIDxz
cmVlZGhhcmEuZHNAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3Nj
dV9pcGMuYyB8ICAgNDMgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9zY3VfaXBjLmMgYi9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9pbnRlbF9zY3VfaXBjLmMKaW5kZXggYjIxMDFlYy4uNGM3YzMzNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfc2N1X2lwYy5jCisrKyBiL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2ludGVsX3NjdV9pcGMuYwpAQCAtMTkwLDcgKzE5MCw3IEBAIHN0YXRpYyBpbnQgcHdy
X3JlZ19yZHdyKHUxNiAqYWRkciwgdTggKmRhdGEsIHUzMiBjb3VudCwgdTMyIG9wLCB1MzIgaWQp
CiAJCXJldHVybiAtRU5PREVWOwogCX0KIAotCWlmIChwbGF0Zm9ybSA9PSAxKSB7CisJaWYgKHBs
YXRmb3JtID09IFBMQVRGT1JNX0xBTkdXRUxMKSB7CiAJCS8qIEVudHJ5IGlzIDQgYnl0ZXMgZm9y
IHJlYWQvd3JpdGUsIDUgYnl0ZXMgZm9yIHJlYWQgbW9kaWZ5ICovCiAJCWZvciAobmMgPSAwOyBu
YyA8IGNvdW50OyBuYysrKSB7CiAJCQljYnVmW29mZnNldF0gPSBhZGRyW25jXTsKQEAgLTIwNiwy
OCArMjA2LDQwIEBAIHN0YXRpYyBpbnQgcHdyX3JlZ19yZHdyKHUxNiAqYWRkciwgdTggKmRhdGEs
IHUzMiBjb3VudCwgdTMyIG9wLCB1MzIgaWQpCiAJCWZvciAobmMgPSAwLCBvZmZzZXQgPSAwOyBu
YyA8IGNvdW50OyBuYysrLCBvZmZzZXQgKz0gNCkKIAkJCWlwY19kYXRhX3dyaXRlbCh3YnVmW25j
XSwgb2Zmc2V0KTsgLyogV3JpdGUgd2J1ZmYgKi8KIAorCQlpZiAoaWQgIT0gSVBDX0NNRF9QQ05U
UkxfTSkKKwkJCWlwY19jb21tYW5kKChjb3VudCo0KSA8PCAxNiB8ICBpZCA8PCAxMiB8IDAgPDwg
OCB8IG9wKTsKKwkJZWxzZQorCQkJaXBjX2NvbW1hbmQoKGNvdW50KjUpIDw8IDE2IHwgIGlkIDw8
IDEyIHwgMCA8PCA4IHwgb3ApOworCiAJfSBlbHNlIHsKLQkJZm9yIChuYyA9IDAsIG9mZnNldCA9
IDA7IG5jIDwgY291bnQ7IG5jKyssIG9mZnNldCArPSAyKQotCQkJaXBjX2RhdGFfd3JpdGVsKGFk
ZHJbbmNdLCBvZmZzZXQpOyAvKiBXcml0ZSBhZGRyZXNzZXMgKi8KLQkJaWYgKGlkICE9IElQQ19D
TURfUENOVFJMX1IpIHsKLQkJCWZvciAobmMgPSAwOyBuYyA8IGNvdW50OyBuYysrLCBvZmZzZXQr
KykKLQkJCQlpcGNfZGF0YV93cml0ZWwoZGF0YVtuY10sIG9mZnNldCk7IC8qIFdyaXRlIGRhdGEg
Ki8KLQkJCWlmIChpZCA9PSBJUENfQ01EX1BDTlRSTF9NKQotCQkJCWlwY19kYXRhX3dyaXRlbChk
YXRhW25jICsgMV0sIG9mZnNldCk7IC8qIE1hc2sgdmFsdWUqLworCQlmb3IgKG5jID0gMDsgbmMg
PCBjb3VudDsgbmMrKywgb2Zmc2V0ICs9IDIpIHsKKwkJCWNidWZbb2Zmc2V0XSA9IGFkZHJbbmNd
OworCQkJY2J1ZltvZmZzZXQgKyAxXSA9IGFkZHJbbmNdID4+IDg7CiAJCX0KLQl9CiAKLQlpZiAo
aWQgIT0gSVBDX0NNRF9QQ05UUkxfTSkKLQkJaXBjX2NvbW1hbmQoKGNvdW50ICogMykgPDwgMTYg
fCAgaWQgPDwgMTIgfCAwIDw8IDggfCBvcCk7Ci0JZWxzZQotCQlpcGNfY29tbWFuZCgoY291bnQg
KiA0KSA8PCAxNiB8ICBpZCA8PCAxMiB8IDAgPDwgOCB8IG9wKTsKKwkJaWYgKGlkID09IElQQ19D
TURfUENOVFJMX1IpIHsKKwkJCWZvciAobmMgPSAwLCBvZmZzZXQgPSAwOyBuYyA8IGNvdW50OyBu
YysrLCBvZmZzZXQgKz0gNCkKKwkJCQlpcGNfZGF0YV93cml0ZWwod2J1ZltuY10sIG9mZnNldCk7
CisJCQlpcGNfY29tbWFuZCgoY291bnQqMikgPDwgMTYgfCAgaWQgPDwgMTIgfCAwIDw8IDggfCBv
cCk7CisJCX0gZWxzZSBpZiAoaWQgPT0gSVBDX0NNRF9QQ05UUkxfVykgeworCQkJZm9yIChuYyA9
IDA7IG5jIDwgY291bnQ7IG5jKyssIG9mZnNldCArPSAxKQorCQkJCWNidWZbb2Zmc2V0XSA9IGRh
dGFbbmNdOworCQkJZm9yIChuYyA9IDAsIG9mZnNldCA9IDA7IG5jIDwgY291bnQ7IG5jKyssIG9m
ZnNldCArPSA0KQorCQkJCWlwY19kYXRhX3dyaXRlbCh3YnVmW25jXSwgb2Zmc2V0KTsKKwkJCWlw
Y19jb21tYW5kKChjb3VudCozKSA8PCAxNiB8ICBpZCA8PCAxMiB8IDAgPDwgOCB8IG9wKTsKKwkJ
fSBlbHNlIGlmIChpZCA9PSBJUENfQ01EX1BDTlRSTF9NKSB7CisJCQljYnVmW29mZnNldF0gPSBk
YXRhWzBdOworCQkJY2J1ZltvZmZzZXQgKyAxXSA9IGRhdGFbMV07CisJCQlpcGNfZGF0YV93cml0
ZWwod2J1ZlswXSwgMCk7IC8qIFdyaXRlIHdidWZmICovCisJCQlpcGNfY29tbWFuZCg0IDw8IDE2
IHwgIGlkIDw8IDEyIHwgMCA8PCA4IHwgb3ApOworCQl9CisJfQogCiAJZXJyID0gYnVzeV9sb29w
KCk7Ci0KIAlpZiAoaWQgPT0gSVBDX0NNRF9QQ05UUkxfUikgeyAvKiBSZWFkIHJidWYgKi8KIAkJ
LyogV29ya2Fyb3VuZDogdmFsdWVzIGFyZSByZWFkIGFzIDAgd2l0aG91dCBtZW1jcHlfZnJvbWlv
ICovCiAJCW1lbWNweV9mcm9taW8oY2J1ZiwgaXBjZGV2LmlwY19iYXNlICsgSVBDX1JFQURfQlVG
RkVSLCAxNik7Ci0JCWlmIChwbGF0Zm9ybSA9PSAxKSB7CisJCWlmIChwbGF0Zm9ybSA9PSBQTEFU
Rk9STV9MQU5HV0VMTCkgewogCQkJZm9yIChuYyA9IDAsIG9mZnNldCA9IDI7IG5jIDwgY291bnQ7
IG5jKyssIG9mZnNldCArPSAzKQogCQkJCWRhdGFbbmNdID0gaXBjX2RhdGFfcmVhZGIob2Zmc2V0
KTsKIAkJfSBlbHNlIHsKQEAgLTc5Niw2ICs4MDgsNyBAQCBzdGF0aWMgdm9pZCBpcGNfcmVtb3Zl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgcGNpX2lkc1tdID0gewogCXtQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfSU5URUwsIDB4MDgw
ZSl9LAorCXtQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfSU5URUwsIDB4MDgyYSl9LAogCXsgMCx9
CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIHBjaV9pZHMpOwotLSAKMS41LjQuNQoK

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F773bgsmsx501garc_--
