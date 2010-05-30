From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: inetl_scu_ipc: Remove indirect read/write api [Patch 4/4]
Date: Sun, 30 May 2010 23:14:24 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F775@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_0AE3E14D83C76F4994657326177D1FF9042CE9F775bgsmsx501garc_"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:62431 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751740Ab0E3Roi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 May 2010 13:44:38 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Cox, Alan" <alan.cox@intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F775bgsmsx501garc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

SCU firmware nolonger supports IPC_CMD_INDIRECT_WR and IPC_CMD_INDIRECT_RD =
commands.
intel_scu_ipc_register_read and intel_scu_ipc_register_write api are remove=
d fromintel_scu_ipc driver

Resending the previous patch



From 654d48348b8812ea2f1cb2d393f53b266d59773b Mon Sep 17 00:00:00 2001
From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Sun, 30 May 2010 22:53:30 +0530
Subject: [PATCH] intel_scu_ipc_register_read/write api removed as scu firmw=
are nolonger support these
 	modified:   ../../../arch/x86/include/asm/intel_scu_ipc.h
 	modified:   intel_scu_ipc.c


Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h |   14 ------
 drivers/platform/x86/intel_scu_ipc.c |   86 ------------------------------=
----
 2 files changed, 0 insertions(+), 100 deletions(-)

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/in=
tel_scu_ipc.h
index 4470c9a..fa2a3fd 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -28,20 +28,6 @@ int intel_scu_ipc_writev(u16 *addr, u8 *data, int len);
 /* Update single register based on the mask */
 int intel_scu_ipc_update_register(u16 addr, u8 data, u8 mask);
=20
-/*
- * Indirect register read
- * Can be used when SCCB(System Controller Configuration Block) register
- * HRIM(Honor Restricted IPC Messages) is set (bit 23)
- */
-int intel_scu_ipc_register_read(u32 addr, u32 *data);
-
-/*
- * Indirect register write
- * Can be used when SCCB(System Controller Configuration Block) register
- * HRIM(Honor Restricted IPC Messages) is set (bit 23)
- */
-int intel_scu_ipc_register_write(u32 addr, u32 data);
-
 /* Issue commands to the SCU with or without data */
 int intel_scu_ipc_simple_command(int cmd, int sub);
 int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/in=
tel_scu_ipc.c
index 30e5231..debc93e 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -38,10 +38,6 @@
 #define IPC_CMD_PCNTRL_R      1 /* Register read */
 #define IPC_CMD_PCNTRL_M      2 /* Register read-modify-write */
=20
-/* Miscelaneous Command ids */
-#define IPC_CMD_INDIRECT_RD   2 /* 32bit indirect read */
-#define IPC_CMD_INDIRECT_WR   5 /* 32bit indirect write */
-
 /*
  * IPC register summary
  *
@@ -116,24 +112,6 @@ static inline void ipc_data_writel(u32 data, u32 offse=
t) /* Write ipc data */
 }
=20
 /*
- * IPC destination Pointer (Write Only):
- * Use content as pointer for destination write
- */
-static inline void ipc_write_dptr(u32 data) /* Write dptr data */
-{
-	writel(data, ipcdev.ipc_base + 0x0C);
-}
-
-/*
- * IPC Source Pointer (Write Only):
- * Use content as pointer for read location
-*/
-static inline void ipc_write_sptr(u32 data) /* Write dptr data */
-{
-	writel(data, ipcdev.ipc_base + 0x08);
-}
-
-/*
  * Status Register (Read Only):
  * Driver will read this register to get the ready/busy status of the IPC
  * block and error status of the IPC command that was just processed by SC=
U
@@ -414,70 +392,6 @@ int intel_scu_ipc_update_register(u16 addr, u8 bits, u=
8 mask)
 EXPORT_SYMBOL(intel_scu_ipc_update_register);
=20
 /**
- *	intel_scu_ipc_register_read	-	32bit indirect read
- *	@addr: register address
- *	@value: 32bit value return
- *
- *	Performs IA 32 bit indirect read, returns 0 on success, or an
- *	error code.
- *
- *	Can be used when SCCB(System Controller Configuration Block) register
- *	HRIM(Honor Restricted IPC Messages) is set (bit 23)
- *
- *	This function may sleep. Locking for SCU accesses is handled for
- *	the caller.
- */
-int intel_scu_ipc_register_read(u32 addr, u32 *value)
-{
-	u32 err =3D 0;
-
-	mutex_lock(&ipclock);
-	if (ipcdev.pdev =3D=3D NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-	ipc_write_sptr(addr);
-	ipc_command(4 << 16 | IPC_CMD_INDIRECT_RD);
-	err =3D busy_loop();
-	*value =3D ipc_data_readl(0);
-	mutex_unlock(&ipclock);
-	return err;
-}
-EXPORT_SYMBOL(intel_scu_ipc_register_read);
-
-/**
- *	intel_scu_ipc_register_write	-	32bit indirect write
- *	@addr: register address
- *	@value: 32bit value to write
- *
- *	Performs IA 32 bit indirect write, returns 0 on success, or an
- *	error code.
- *
- *	Can be used when SCCB(System Controller Configuration Block) register
- *	HRIM(Honor Restricted IPC Messages) is set (bit 23)
- *
- *	This function may sleep. Locking for SCU accesses is handled for
- *	the caller.
- */
-int intel_scu_ipc_register_write(u32 addr, u32 value)
-{
-	u32 err =3D 0;
-
-	mutex_lock(&ipclock);
-	if (ipcdev.pdev =3D=3D NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-	ipc_write_dptr(addr);
-	ipc_data_writel(value, 0);
-	ipc_command(4 << 16 | IPC_CMD_INDIRECT_WR);
-	err =3D busy_loop();
-	mutex_unlock(&ipclock);
-	return err;
-}
-EXPORT_SYMBOL(intel_scu_ipc_register_write);
-
-/**
  *	intel_scu_ipc_simple_command	-	send a simple command
  *	@cmd: command
  *	@sub: sub type
--=20
1.5.4.5


--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F775bgsmsx501garc_
Content-Type: application/octet-stream;
	name="0004-intel_scu_ipc_register_read-write-api-removed-as-scu.patch"
Content-Description: 0004-intel_scu_ipc_register_read-write-api-removed-as-scu.patch
Content-Disposition: attachment;
	filename="0004-intel_scu_ipc_register_read-write-api-removed-as-scu.patch";
	size=4737; creation-date="Sun, 30 May 2010 23:01:56 GMT";
	modification-date="Sun, 30 May 2010 23:01:56 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2NTRkNDgzNDhiODgxMmVhMmYxY2IyZDM5M2Y1M2IyNjZkNTk3NzNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+
CkRhdGU6IFN1biwgMzAgTWF5IDIwMTAgMjI6NTM6MzAgKzA1MzAKU3ViamVjdDogW1BBVENIXSBp
bnRlbF9zY3VfaXBjX3JlZ2lzdGVyX3JlYWQvd3JpdGUgYXBpIHJlbW92ZWQgYXMgc2N1IGZpcm13
YXJlIG5vbG9uZ2VyIHN1cHBvcnQgdGhlc2UKIAltb2RpZmllZDogICAuLi8uLi8uLi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9pbnRlbF9zY3VfaXBjLmgKIAltb2RpZmllZDogICBpbnRlbF9zY3VfaXBj
LmMKCgpTaWduZWQtb2ZmLWJ5OiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+
Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20vaW50ZWxfc2N1X2lwYy5oIHwgICAxNCAtLS0tLS0K
IGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMuYyB8ICAgODYgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyks
IDEwMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnRl
bF9zY3VfaXBjLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnRlbF9zY3VfaXBjLmgKaW5kZXgg
NDQ3MGM5YS4uZmEyYTNmZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vaW50ZWxf
c2N1X2lwYy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2ludGVsX3NjdV9pcGMuaApAQCAt
MjgsMjAgKzI4LDYgQEAgaW50IGludGVsX3NjdV9pcGNfd3JpdGV2KHUxNiAqYWRkciwgdTggKmRh
dGEsIGludCBsZW4pOwogLyogVXBkYXRlIHNpbmdsZSByZWdpc3RlciBiYXNlZCBvbiB0aGUgbWFz
ayAqLwogaW50IGludGVsX3NjdV9pcGNfdXBkYXRlX3JlZ2lzdGVyKHUxNiBhZGRyLCB1OCBkYXRh
LCB1OCBtYXNrKTsKIAotLyoKLSAqIEluZGlyZWN0IHJlZ2lzdGVyIHJlYWQKLSAqIENhbiBiZSB1
c2VkIHdoZW4gU0NDQihTeXN0ZW0gQ29udHJvbGxlciBDb25maWd1cmF0aW9uIEJsb2NrKSByZWdp
c3RlcgotICogSFJJTShIb25vciBSZXN0cmljdGVkIElQQyBNZXNzYWdlcykgaXMgc2V0IChiaXQg
MjMpCi0gKi8KLWludCBpbnRlbF9zY3VfaXBjX3JlZ2lzdGVyX3JlYWQodTMyIGFkZHIsIHUzMiAq
ZGF0YSk7Ci0KLS8qCi0gKiBJbmRpcmVjdCByZWdpc3RlciB3cml0ZQotICogQ2FuIGJlIHVzZWQg
d2hlbiBTQ0NCKFN5c3RlbSBDb250cm9sbGVyIENvbmZpZ3VyYXRpb24gQmxvY2spIHJlZ2lzdGVy
Ci0gKiBIUklNKEhvbm9yIFJlc3RyaWN0ZWQgSVBDIE1lc3NhZ2VzKSBpcyBzZXQgKGJpdCAyMykK
LSAqLwotaW50IGludGVsX3NjdV9pcGNfcmVnaXN0ZXJfd3JpdGUodTMyIGFkZHIsIHUzMiBkYXRh
KTsKLQogLyogSXNzdWUgY29tbWFuZHMgdG8gdGhlIFNDVSB3aXRoIG9yIHdpdGhvdXQgZGF0YSAq
LwogaW50IGludGVsX3NjdV9pcGNfc2ltcGxlX2NvbW1hbmQoaW50IGNtZCwgaW50IHN1Yik7CiBp
bnQgaW50ZWxfc2N1X2lwY19jb21tYW5kKGludCBjbWQsIGludCBzdWIsIHUzMiAqaW4sIGludCBp
bmxlbiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMuYyBi
L2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMuYwppbmRleCAzMGU1MjMxLi5kZWJj
OTNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9zY3VfaXBjLmMKKysr
IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfc2N1X2lwYy5jCkBAIC0zOCwxMCArMzgsNiBA
QAogI2RlZmluZSBJUENfQ01EX1BDTlRSTF9SICAgICAgMSAvKiBSZWdpc3RlciByZWFkICovCiAj
ZGVmaW5lIElQQ19DTURfUENOVFJMX00gICAgICAyIC8qIFJlZ2lzdGVyIHJlYWQtbW9kaWZ5LXdy
aXRlICovCiAKLS8qIE1pc2NlbGFuZW91cyBDb21tYW5kIGlkcyAqLwotI2RlZmluZSBJUENfQ01E
X0lORElSRUNUX1JEICAgMiAvKiAzMmJpdCBpbmRpcmVjdCByZWFkICovCi0jZGVmaW5lIElQQ19D
TURfSU5ESVJFQ1RfV1IgICA1IC8qIDMyYml0IGluZGlyZWN0IHdyaXRlICovCi0KIC8qCiAgKiBJ
UEMgcmVnaXN0ZXIgc3VtbWFyeQogICoKQEAgLTExNiwyNCArMTEyLDYgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGlwY19kYXRhX3dyaXRlbCh1MzIgZGF0YSwgdTMyIG9mZnNldCkgLyogV3JpdGUgaXBj
IGRhdGEgKi8KIH0KIAogLyoKLSAqIElQQyBkZXN0aW5hdGlvbiBQb2ludGVyIChXcml0ZSBPbmx5
KToKLSAqIFVzZSBjb250ZW50IGFzIHBvaW50ZXIgZm9yIGRlc3RpbmF0aW9uIHdyaXRlCi0gKi8K
LXN0YXRpYyBpbmxpbmUgdm9pZCBpcGNfd3JpdGVfZHB0cih1MzIgZGF0YSkgLyogV3JpdGUgZHB0
ciBkYXRhICovCi17Ci0Jd3JpdGVsKGRhdGEsIGlwY2Rldi5pcGNfYmFzZSArIDB4MEMpOwotfQot
Ci0vKgotICogSVBDIFNvdXJjZSBQb2ludGVyIChXcml0ZSBPbmx5KToKLSAqIFVzZSBjb250ZW50
IGFzIHBvaW50ZXIgZm9yIHJlYWQgbG9jYXRpb24KLSovCi1zdGF0aWMgaW5saW5lIHZvaWQgaXBj
X3dyaXRlX3NwdHIodTMyIGRhdGEpIC8qIFdyaXRlIGRwdHIgZGF0YSAqLwotewotCXdyaXRlbChk
YXRhLCBpcGNkZXYuaXBjX2Jhc2UgKyAweDA4KTsKLX0KLQotLyoKICAqIFN0YXR1cyBSZWdpc3Rl
ciAoUmVhZCBPbmx5KToKICAqIERyaXZlciB3aWxsIHJlYWQgdGhpcyByZWdpc3RlciB0byBnZXQg
dGhlIHJlYWR5L2J1c3kgc3RhdHVzIG9mIHRoZSBJUEMKICAqIGJsb2NrIGFuZCBlcnJvciBzdGF0
dXMgb2YgdGhlIElQQyBjb21tYW5kIHRoYXQgd2FzIGp1c3QgcHJvY2Vzc2VkIGJ5IFNDVQpAQCAt
NDE0LDcwICszOTIsNiBAQCBpbnQgaW50ZWxfc2N1X2lwY191cGRhdGVfcmVnaXN0ZXIodTE2IGFk
ZHIsIHU4IGJpdHMsIHU4IG1hc2spCiBFWFBPUlRfU1lNQk9MKGludGVsX3NjdV9pcGNfdXBkYXRl
X3JlZ2lzdGVyKTsKIAogLyoqCi0gKglpbnRlbF9zY3VfaXBjX3JlZ2lzdGVyX3JlYWQJLQkzMmJp
dCBpbmRpcmVjdCByZWFkCi0gKglAYWRkcjogcmVnaXN0ZXIgYWRkcmVzcwotICoJQHZhbHVlOiAz
MmJpdCB2YWx1ZSByZXR1cm4KLSAqCi0gKglQZXJmb3JtcyBJQSAzMiBiaXQgaW5kaXJlY3QgcmVh
ZCwgcmV0dXJucyAwIG9uIHN1Y2Nlc3MsIG9yIGFuCi0gKgllcnJvciBjb2RlLgotICoKLSAqCUNh
biBiZSB1c2VkIHdoZW4gU0NDQihTeXN0ZW0gQ29udHJvbGxlciBDb25maWd1cmF0aW9uIEJsb2Nr
KSByZWdpc3RlcgotICoJSFJJTShIb25vciBSZXN0cmljdGVkIElQQyBNZXNzYWdlcykgaXMgc2V0
IChiaXQgMjMpCi0gKgotICoJVGhpcyBmdW5jdGlvbiBtYXkgc2xlZXAuIExvY2tpbmcgZm9yIFND
VSBhY2Nlc3NlcyBpcyBoYW5kbGVkIGZvcgotICoJdGhlIGNhbGxlci4KLSAqLwotaW50IGludGVs
X3NjdV9pcGNfcmVnaXN0ZXJfcmVhZCh1MzIgYWRkciwgdTMyICp2YWx1ZSkKLXsKLQl1MzIgZXJy
ID0gMDsKLQotCW11dGV4X2xvY2soJmlwY2xvY2spOwotCWlmIChpcGNkZXYucGRldiA9PSBOVUxM
KSB7Ci0JCW11dGV4X3VubG9jaygmaXBjbG9jayk7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KLQlp
cGNfd3JpdGVfc3B0cihhZGRyKTsKLQlpcGNfY29tbWFuZCg0IDw8IDE2IHwgSVBDX0NNRF9JTkRJ
UkVDVF9SRCk7Ci0JZXJyID0gYnVzeV9sb29wKCk7Ci0JKnZhbHVlID0gaXBjX2RhdGFfcmVhZGwo
MCk7Ci0JbXV0ZXhfdW5sb2NrKCZpcGNsb2NrKTsKLQlyZXR1cm4gZXJyOwotfQotRVhQT1JUX1NZ
TUJPTChpbnRlbF9zY3VfaXBjX3JlZ2lzdGVyX3JlYWQpOwotCi0vKioKLSAqCWludGVsX3NjdV9p
cGNfcmVnaXN0ZXJfd3JpdGUJLQkzMmJpdCBpbmRpcmVjdCB3cml0ZQotICoJQGFkZHI6IHJlZ2lz
dGVyIGFkZHJlc3MKLSAqCUB2YWx1ZTogMzJiaXQgdmFsdWUgdG8gd3JpdGUKLSAqCi0gKglQZXJm
b3JtcyBJQSAzMiBiaXQgaW5kaXJlY3Qgd3JpdGUsIHJldHVybnMgMCBvbiBzdWNjZXNzLCBvciBh
bgotICoJZXJyb3IgY29kZS4KLSAqCi0gKglDYW4gYmUgdXNlZCB3aGVuIFNDQ0IoU3lzdGVtIENv
bnRyb2xsZXIgQ29uZmlndXJhdGlvbiBCbG9jaykgcmVnaXN0ZXIKLSAqCUhSSU0oSG9ub3IgUmVz
dHJpY3RlZCBJUEMgTWVzc2FnZXMpIGlzIHNldCAoYml0IDIzKQotICoKLSAqCVRoaXMgZnVuY3Rp
b24gbWF5IHNsZWVwLiBMb2NraW5nIGZvciBTQ1UgYWNjZXNzZXMgaXMgaGFuZGxlZCBmb3IKLSAq
CXRoZSBjYWxsZXIuCi0gKi8KLWludCBpbnRlbF9zY3VfaXBjX3JlZ2lzdGVyX3dyaXRlKHUzMiBh
ZGRyLCB1MzIgdmFsdWUpCi17Ci0JdTMyIGVyciA9IDA7Ci0KLQltdXRleF9sb2NrKCZpcGNsb2Nr
KTsKLQlpZiAoaXBjZGV2LnBkZXYgPT0gTlVMTCkgewotCQltdXRleF91bmxvY2soJmlwY2xvY2sp
OwotCQlyZXR1cm4gLUVOT0RFVjsKLQl9Ci0JaXBjX3dyaXRlX2RwdHIoYWRkcik7Ci0JaXBjX2Rh
dGFfd3JpdGVsKHZhbHVlLCAwKTsKLQlpcGNfY29tbWFuZCg0IDw8IDE2IHwgSVBDX0NNRF9JTkRJ
UkVDVF9XUik7Ci0JZXJyID0gYnVzeV9sb29wKCk7Ci0JbXV0ZXhfdW5sb2NrKCZpcGNsb2NrKTsK
LQlyZXR1cm4gZXJyOwotfQotRVhQT1JUX1NZTUJPTChpbnRlbF9zY3VfaXBjX3JlZ2lzdGVyX3dy
aXRlKTsKLQotLyoqCiAgKglpbnRlbF9zY3VfaXBjX3NpbXBsZV9jb21tYW5kCS0Jc2VuZCBhIHNp
bXBsZSBjb21tYW5kCiAgKglAY21kOiBjb21tYW5kCiAgKglAc3ViOiBzdWIgdHlwZQotLSAKMS41
LjQuNQoK

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F775bgsmsx501garc_--
