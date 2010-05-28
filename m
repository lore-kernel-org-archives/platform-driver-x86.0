From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: [Patch 2/4] intel scu ipc
Date: Fri, 28 May 2010 14:10:51 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F49E@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_0AE3E14D83C76F4994657326177D1FF9042CE9F49Ebgsmsx501garc_"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:15360 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751158Ab0E1ImB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 May 2010 04:42:01 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "mjg@redhat.com" <mjg@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Alan Cox <alan@linux.intel.com>

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F49Ebgsmsx501garc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

  Hello,

Please review and accept the patch

From cfe6eb1f2ea12732f03d4edee85c50ba713a9d36 Mon Sep 17 00:00:00 2001
From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Fri, 28 May 2010 13:55:44 +0530
Subject: [PATCH] changes to work on both moorestown and medfield
 new pci id added for medfiled
 return type of ipc_data_readl chnaged from u8 u32
 	modified:   intel_scu_ipc.c


Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c |   53 +++++++++++++++++++++---------=
----
 1 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/in=
tel_scu_ipc.c
index b2101ec..ffd304a 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -151,7 +151,7 @@ static inline u8 ipc_data_readb(u32 offset) /* Read ipc=
 byte data */
 	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
=20
-static inline u8 ipc_data_readl(u32 offset) /* Read ipc u32 data */
+static inline u32 ipc_data_readl(u32 offset) /* Read ipc u32 data */
 {
 	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
@@ -181,18 +181,19 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 coun=
t, u32 op, u32 id)
 	int nc;
 	u32 offset =3D 0;
 	u32 err =3D 0;
-	u8 cbuf[IPC_WWBUF_SIZE] =3D { '\0' };
+	u8 cbuf[IPC_WWBUF_SIZE] =3D { };
 	u32 *wbuf =3D (u32 *)&cbuf;
=20
 	mutex_lock(&ipclock);
+
 	if (ipcdev.pdev =3D=3D NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
=20
-	if (platform =3D=3D 1) {
+	if (platform =3D=3D PLATFORM_LANGWELL) {
 		/* Entry is 4 bytes for read/write, 5 bytes for read modify */
-		for (nc =3D 0; nc < count; nc++) {
+		for (nc =3D 0; nc < count; nc++, offset +=3D 3) {
 			cbuf[offset] =3D addr[nc];
 			cbuf[offset + 1] =3D addr[nc] >> 8;
 			if (id !=3D IPC_CMD_PCNTRL_R)
@@ -201,33 +202,44 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 coun=
t, u32 op, u32 id)
 				cbuf[offset + 3] =3D data[nc + 1];
 				offset +=3D 1;
 			}
-			offset +=3D 3;
 		}
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
-		memcpy_fromio(cbuf, ipcdev.ipc_base + IPC_READ_BUFFER, 16);
-		if (platform =3D=3D 1) {
+		memcpy_fromio(cbuf, ipcdev.ipc_base + 0x90, 16);
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


--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F49Ebgsmsx501garc_
Content-Type: application/octet-stream;
	name="0002-changes-to-work-on-both-moorestown-and-medfield.patch"
Content-Description: 0002-changes-to-work-on-both-moorestown-and-medfield.patch
Content-Disposition: attachment;
	filename="0002-changes-to-work-on-both-moorestown-and-medfield.patch";
	size=4222; creation-date="Fri, 28 May 2010 14:13:30 GMT";
	modification-date="Fri, 28 May 2010 14:13:30 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjZmU2ZWIxZjJlYTEyNzMyZjAzZDRlZGVlODVjNTBiYTcxM2E5ZDM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+
CkRhdGU6IEZyaSwgMjggTWF5IDIwMTAgMTM6NTU6NDQgKzA1MzAKU3ViamVjdDogW1BBVENIXSBj
aGFuZ2VzIHRvIHdvcmsgb24gYm90aCBtb29yZXN0b3duIGFuZCBtZWRmaWVsZAogbmV3IHBjaSBp
ZCBhZGRlZCBmb3IgbWVkZmlsZWQKIHJldHVybiB0eXBlIG9mIGlwY19kYXRhX3JlYWRsIGNobmFn
ZWQgZnJvbSB1OCB1MzIKIAltb2RpZmllZDogICBpbnRlbF9zY3VfaXBjLmMKCgpTaWduZWQtb2Zm
LWJ5OiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9w
bGF0Zm9ybS94ODYvaW50ZWxfc2N1X2lwYy5jIHwgICA1MyArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDIwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMu
YyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMuYwppbmRleCBiMjEwMWVjLi5m
ZmQzMDRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9zY3VfaXBjLmMK
KysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfc2N1X2lwYy5jCkBAIC0xNTEsNyArMTUx
LDcgQEAgc3RhdGljIGlubGluZSB1OCBpcGNfZGF0YV9yZWFkYih1MzIgb2Zmc2V0KSAvKiBSZWFk
IGlwYyBieXRlIGRhdGEgKi8KIAlyZXR1cm4gcmVhZGIoaXBjZGV2LmlwY19iYXNlICsgSVBDX1JF
QURfQlVGRkVSICsgb2Zmc2V0KTsKIH0KIAotc3RhdGljIGlubGluZSB1OCBpcGNfZGF0YV9yZWFk
bCh1MzIgb2Zmc2V0KSAvKiBSZWFkIGlwYyB1MzIgZGF0YSAqLworc3RhdGljIGlubGluZSB1MzIg
aXBjX2RhdGFfcmVhZGwodTMyIG9mZnNldCkgLyogUmVhZCBpcGMgdTMyIGRhdGEgKi8KIHsKIAly
ZXR1cm4gcmVhZGwoaXBjZGV2LmlwY19iYXNlICsgSVBDX1JFQURfQlVGRkVSICsgb2Zmc2V0KTsK
IH0KQEAgLTE4MSwxOCArMTgxLDE5IEBAIHN0YXRpYyBpbnQgcHdyX3JlZ19yZHdyKHUxNiAqYWRk
ciwgdTggKmRhdGEsIHUzMiBjb3VudCwgdTMyIG9wLCB1MzIgaWQpCiAJaW50IG5jOwogCXUzMiBv
ZmZzZXQgPSAwOwogCXUzMiBlcnIgPSAwOwotCXU4IGNidWZbSVBDX1dXQlVGX1NJWkVdID0geyAn
XDAnIH07CisJdTggY2J1ZltJUENfV1dCVUZfU0laRV0gPSB7IH07CiAJdTMyICp3YnVmID0gKHUz
MiAqKSZjYnVmOwogCiAJbXV0ZXhfbG9jaygmaXBjbG9jayk7CisKIAlpZiAoaXBjZGV2LnBkZXYg
PT0gTlVMTCkgewogCQltdXRleF91bmxvY2soJmlwY2xvY2spOwogCQlyZXR1cm4gLUVOT0RFVjsK
IAl9CiAKLQlpZiAocGxhdGZvcm0gPT0gMSkgeworCWlmIChwbGF0Zm9ybSA9PSBQTEFURk9STV9M
QU5HV0VMTCkgewogCQkvKiBFbnRyeSBpcyA0IGJ5dGVzIGZvciByZWFkL3dyaXRlLCA1IGJ5dGVz
IGZvciByZWFkIG1vZGlmeSAqLwotCQlmb3IgKG5jID0gMDsgbmMgPCBjb3VudDsgbmMrKykgewor
CQlmb3IgKG5jID0gMDsgbmMgPCBjb3VudDsgbmMrKywgb2Zmc2V0ICs9IDMpIHsKIAkJCWNidWZb
b2Zmc2V0XSA9IGFkZHJbbmNdOwogCQkJY2J1ZltvZmZzZXQgKyAxXSA9IGFkZHJbbmNdID4+IDg7
CiAJCQlpZiAoaWQgIT0gSVBDX0NNRF9QQ05UUkxfUikKQEAgLTIwMSwzMyArMjAyLDQ0IEBAIHN0
YXRpYyBpbnQgcHdyX3JlZ19yZHdyKHUxNiAqYWRkciwgdTggKmRhdGEsIHUzMiBjb3VudCwgdTMy
IG9wLCB1MzIgaWQpCiAJCQkJY2J1ZltvZmZzZXQgKyAzXSA9IGRhdGFbbmMgKyAxXTsKIAkJCQlv
ZmZzZXQgKz0gMTsKIAkJCX0KLQkJCW9mZnNldCArPSAzOwogCQl9CiAJCWZvciAobmMgPSAwLCBv
ZmZzZXQgPSAwOyBuYyA8IGNvdW50OyBuYysrLCBvZmZzZXQgKz0gNCkKIAkJCWlwY19kYXRhX3dy
aXRlbCh3YnVmW25jXSwgb2Zmc2V0KTsgLyogV3JpdGUgd2J1ZmYgKi8KIAorCQlpZiAoaWQgIT0g
SVBDX0NNRF9QQ05UUkxfTSkKKwkJCWlwY19jb21tYW5kKChjb3VudCo0KSA8PCAxNiB8ICBpZCA8
PCAxMiB8IDAgPDwgOCB8IG9wKTsKKwkJZWxzZQorCQkJaXBjX2NvbW1hbmQoKGNvdW50KjUpIDw8
IDE2IHwgIGlkIDw8IDEyIHwgMCA8PCA4IHwgb3ApOworCiAJfSBlbHNlIHsKLQkJZm9yIChuYyA9
IDAsIG9mZnNldCA9IDA7IG5jIDwgY291bnQ7IG5jKyssIG9mZnNldCArPSAyKQotCQkJaXBjX2Rh
dGFfd3JpdGVsKGFkZHJbbmNdLCBvZmZzZXQpOyAvKiBXcml0ZSBhZGRyZXNzZXMgKi8KLQkJaWYg
KGlkICE9IElQQ19DTURfUENOVFJMX1IpIHsKLQkJCWZvciAobmMgPSAwOyBuYyA8IGNvdW50OyBu
YysrLCBvZmZzZXQrKykKLQkJCQlpcGNfZGF0YV93cml0ZWwoZGF0YVtuY10sIG9mZnNldCk7IC8q
IFdyaXRlIGRhdGEgKi8KLQkJCWlmIChpZCA9PSBJUENfQ01EX1BDTlRSTF9NKQotCQkJCWlwY19k
YXRhX3dyaXRlbChkYXRhW25jICsgMV0sIG9mZnNldCk7IC8qIE1hc2sgdmFsdWUqLworCQlmb3Ig
KG5jID0gMDsgbmMgPCBjb3VudDsgbmMrKywgb2Zmc2V0ICs9IDIpIHsKKwkJCWNidWZbb2Zmc2V0
XSA9IGFkZHJbbmNdOworCQkJY2J1ZltvZmZzZXQgKyAxXSA9IGFkZHJbbmNdID4+IDg7CiAJCX0K
LQl9CiAKLQlpZiAoaWQgIT0gSVBDX0NNRF9QQ05UUkxfTSkKLQkJaXBjX2NvbW1hbmQoKGNvdW50
ICogMykgPDwgMTYgfCAgaWQgPDwgMTIgfCAwIDw8IDggfCBvcCk7Ci0JZWxzZQotCQlpcGNfY29t
bWFuZCgoY291bnQgKiA0KSA8PCAxNiB8ICBpZCA8PCAxMiB8IDAgPDwgOCB8IG9wKTsKKwkJaWYg
KGlkID09IElQQ19DTURfUENOVFJMX1IpIHsKKwkJCWZvciAobmMgPSAwLCBvZmZzZXQgPSAwOyBu
YyA8IGNvdW50OyBuYysrLCBvZmZzZXQgKz0gNCkKKwkJCQlpcGNfZGF0YV93cml0ZWwod2J1Zltu
Y10sIG9mZnNldCk7CisJCQlpcGNfY29tbWFuZCgoY291bnQqMikgPDwgMTYgfCAgaWQgPDwgMTIg
fCAwIDw8IDggfCBvcCk7CisJCX0gZWxzZSBpZiAoaWQgPT0gSVBDX0NNRF9QQ05UUkxfVykgewor
CQkJZm9yIChuYyA9IDA7IG5jIDwgY291bnQ7IG5jKyssIG9mZnNldCArPSAxKQorCQkJCWNidWZb
b2Zmc2V0XSA9IGRhdGFbbmNdOworCQkJZm9yIChuYyA9IDAsIG9mZnNldCA9IDA7IG5jIDwgY291
bnQ7IG5jKyssIG9mZnNldCArPSA0KQorCQkJCWlwY19kYXRhX3dyaXRlbCh3YnVmW25jXSwgb2Zm
c2V0KTsKKwkJCWlwY19jb21tYW5kKChjb3VudCozKSA8PCAxNiB8ICBpZCA8PCAxMiB8IDAgPDwg
OCB8IG9wKTsKKwkJfSBlbHNlIGlmIChpZCA9PSBJUENfQ01EX1BDTlRSTF9NKSB7CisJCQljYnVm
W29mZnNldF0gPSBkYXRhWzBdOworCQkJY2J1ZltvZmZzZXQgKyAxXSA9IGRhdGFbMV07CisJCQlp
cGNfZGF0YV93cml0ZWwod2J1ZlswXSwgMCk7IC8qIFdyaXRlIHdidWZmICovCisJCQlpcGNfY29t
bWFuZCg0IDw8IDE2IHwgIGlkIDw8IDEyIHwgMCA8PCA4IHwgb3ApOworCQl9CisJfQogCiAJZXJy
ID0gYnVzeV9sb29wKCk7Ci0KIAlpZiAoaWQgPT0gSVBDX0NNRF9QQ05UUkxfUikgeyAvKiBSZWFk
IHJidWYgKi8KIAkJLyogV29ya2Fyb3VuZDogdmFsdWVzIGFyZSByZWFkIGFzIDAgd2l0aG91dCBt
ZW1jcHlfZnJvbWlvICovCi0JCW1lbWNweV9mcm9taW8oY2J1ZiwgaXBjZGV2LmlwY19iYXNlICsg
SVBDX1JFQURfQlVGRkVSLCAxNik7Ci0JCWlmIChwbGF0Zm9ybSA9PSAxKSB7CisJCW1lbWNweV9m
cm9taW8oY2J1ZiwgaXBjZGV2LmlwY19iYXNlICsgMHg5MCwgMTYpOworCQlpZiAocGxhdGZvcm0g
PT0gUExBVEZPUk1fTEFOR1dFTEwpIHsKIAkJCWZvciAobmMgPSAwLCBvZmZzZXQgPSAyOyBuYyA8
IGNvdW50OyBuYysrLCBvZmZzZXQgKz0gMykKIAkJCQlkYXRhW25jXSA9IGlwY19kYXRhX3JlYWRi
KG9mZnNldCk7CiAJCX0gZWxzZSB7CkBAIC03OTYsNiArODA4LDcgQEAgc3RhdGljIHZvaWQgaXBj
X3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkIHBjaV9pZHNbXSA9IHsKIAl7UENJX0RFVklDRShQQ0lfVkVORE9SX0lEX0lOVEVM
LCAweDA4MGUpfSwKKwl7UENJX0RFVklDRShQQ0lfVkVORE9SX0lEX0lOVEVMLCAweDA4MmEpfSwK
IAl7IDAsfQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCBwY2lfaWRzKTsKLS0gCjEuNS40
LjUKCg==

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F49Ebgsmsx501garc_--
