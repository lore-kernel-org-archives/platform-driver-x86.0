From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: Patch [4/4] intel scu ipc
Date: Fri, 28 May 2010 14:14:06 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F4A6@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A6bgsmsx501garc_"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41055 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757165Ab0E1Ion (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 May 2010 04:44:43 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "mjg@redhat.com" <mjg@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Alan Cox <alan@linux.intel.com>

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A6bgsmsx501garc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Hello,
Please review and accept the patch

From 1ec87c0aece6fa90f7b44b3e21f2b35035e3317e Mon Sep 17 00:00:00 2001
From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Fri, 28 May 2010 14:06:35 +0530
Subject: [PATCH] Remove indirect read write api support.
 Firmware nolonger support these api, security issue
 	modified:   ../../../arch/x86/include/asm/intel_scu_ipc.h
 	modified:   intel_scu_ipc.c


Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h |   14 ------
 drivers/platform/x86/intel_scu_ipc.c |   82 ------------------------------=
----
 2 files changed, 0 insertions(+), 96 deletions(-)

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
index 8bb3fda..9c3da65 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -116,24 +116,6 @@ static inline void ipc_data_writel(u32 data, u32 offse=
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
@@ -414,70 +396,6 @@ int intel_scu_ipc_update_register(u16 addr, u8 bits, u=
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


--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A6bgsmsx501garc_
Content-Type: application/octet-stream;
	name="0004-Remove-indirect-read-write-api-support.patch"
Content-Description: 0004-Remove-indirect-read-write-api-support.patch
Content-Disposition: attachment;
	filename="0004-Remove-indirect-read-write-api-support.patch"; size=4418;
	creation-date="Fri, 28 May 2010 14:13:30 GMT";
	modification-date="Fri, 28 May 2010 14:13:30 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxZWM4N2MwYWVjZTZmYTkwZjdiNDRiM2UyMWYyYjM1MDM1ZTMzMTdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmVlZGhhcmEgRFMgPHNyZWVkaGFyYS5kc0BpbnRlbC5jb20+
CkRhdGU6IEZyaSwgMjggTWF5IDIwMTAgMTQ6MDY6MzUgKzA1MzAKU3ViamVjdDogW1BBVENIXSBS
ZW1vdmUgaW5kaXJlY3QgcmVhZCB3cml0ZSBhcGkgc3VwcG9ydC4KIEZpcm13YXJlIG5vbG9uZ2Vy
IHN1cHBvcnQgdGhlc2UgYXBpLCBzZWN1cml0eSBpc3N1ZQogCW1vZGlmaWVkOiAgIC4uLy4uLy4u
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2ludGVsX3NjdV9pcGMuaAogCW1vZGlmaWVkOiAgIGludGVs
X3NjdV9pcGMuYwoKClNpZ25lZC1vZmYtYnk6IFNyZWVkaGFyYSBEUyA8c3JlZWRoYXJhLmRzQGlu
dGVsLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnRlbF9zY3VfaXBjLmggfCAgIDE0
IC0tLS0tLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfc2N1X2lwYy5jIHwgICA4MiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0
aW9ucygrKSwgOTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9h
c20vaW50ZWxfc2N1X2lwYy5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vaW50ZWxfc2N1X2lwYy5o
CmluZGV4IDQ0NzBjOWEuLmZhMmEzZmQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2ludGVsX3NjdV9pcGMuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnRlbF9zY3VfaXBj
LmgKQEAgLTI4LDIwICsyOCw2IEBAIGludCBpbnRlbF9zY3VfaXBjX3dyaXRldih1MTYgKmFkZHIs
IHU4ICpkYXRhLCBpbnQgbGVuKTsKIC8qIFVwZGF0ZSBzaW5nbGUgcmVnaXN0ZXIgYmFzZWQgb24g
dGhlIG1hc2sgKi8KIGludCBpbnRlbF9zY3VfaXBjX3VwZGF0ZV9yZWdpc3Rlcih1MTYgYWRkciwg
dTggZGF0YSwgdTggbWFzayk7CiAKLS8qCi0gKiBJbmRpcmVjdCByZWdpc3RlciByZWFkCi0gKiBD
YW4gYmUgdXNlZCB3aGVuIFNDQ0IoU3lzdGVtIENvbnRyb2xsZXIgQ29uZmlndXJhdGlvbiBCbG9j
aykgcmVnaXN0ZXIKLSAqIEhSSU0oSG9ub3IgUmVzdHJpY3RlZCBJUEMgTWVzc2FnZXMpIGlzIHNl
dCAoYml0IDIzKQotICovCi1pbnQgaW50ZWxfc2N1X2lwY19yZWdpc3Rlcl9yZWFkKHUzMiBhZGRy
LCB1MzIgKmRhdGEpOwotCi0vKgotICogSW5kaXJlY3QgcmVnaXN0ZXIgd3JpdGUKLSAqIENhbiBi
ZSB1c2VkIHdoZW4gU0NDQihTeXN0ZW0gQ29udHJvbGxlciBDb25maWd1cmF0aW9uIEJsb2NrKSBy
ZWdpc3RlcgotICogSFJJTShIb25vciBSZXN0cmljdGVkIElQQyBNZXNzYWdlcykgaXMgc2V0IChi
aXQgMjMpCi0gKi8KLWludCBpbnRlbF9zY3VfaXBjX3JlZ2lzdGVyX3dyaXRlKHUzMiBhZGRyLCB1
MzIgZGF0YSk7Ci0KIC8qIElzc3VlIGNvbW1hbmRzIHRvIHRoZSBTQ1Ugd2l0aCBvciB3aXRob3V0
IGRhdGEgKi8KIGludCBpbnRlbF9zY3VfaXBjX3NpbXBsZV9jb21tYW5kKGludCBjbWQsIGludCBz
dWIpOwogaW50IGludGVsX3NjdV9pcGNfY29tbWFuZChpbnQgY21kLCBpbnQgc3ViLCB1MzIgKmlu
LCBpbnQgaW5sZW4sCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9zY3Vf
aXBjLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF9zY3VfaXBjLmMKaW5kZXggOGJiM2Zk
YS4uOWMzZGE2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfc2N1X2lw
Yy5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3NjdV9pcGMuYwpAQCAtMTE2LDI0
ICsxMTYsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaXBjX2RhdGFfd3JpdGVsKHUzMiBkYXRhLCB1
MzIgb2Zmc2V0KSAvKiBXcml0ZSBpcGMgZGF0YSAqLwogfQogCiAvKgotICogSVBDIGRlc3RpbmF0
aW9uIFBvaW50ZXIgKFdyaXRlIE9ubHkpOgotICogVXNlIGNvbnRlbnQgYXMgcG9pbnRlciBmb3Ig
ZGVzdGluYXRpb24gd3JpdGUKLSAqLwotc3RhdGljIGlubGluZSB2b2lkIGlwY193cml0ZV9kcHRy
KHUzMiBkYXRhKSAvKiBXcml0ZSBkcHRyIGRhdGEgKi8KLXsKLQl3cml0ZWwoZGF0YSwgaXBjZGV2
LmlwY19iYXNlICsgMHgwQyk7Ci19Ci0KLS8qCi0gKiBJUEMgU291cmNlIFBvaW50ZXIgKFdyaXRl
IE9ubHkpOgotICogVXNlIGNvbnRlbnQgYXMgcG9pbnRlciBmb3IgcmVhZCBsb2NhdGlvbgotKi8K
LXN0YXRpYyBpbmxpbmUgdm9pZCBpcGNfd3JpdGVfc3B0cih1MzIgZGF0YSkgLyogV3JpdGUgZHB0
ciBkYXRhICovCi17Ci0Jd3JpdGVsKGRhdGEsIGlwY2Rldi5pcGNfYmFzZSArIDB4MDgpOwotfQot
Ci0vKgogICogU3RhdHVzIFJlZ2lzdGVyIChSZWFkIE9ubHkpOgogICogRHJpdmVyIHdpbGwgcmVh
ZCB0aGlzIHJlZ2lzdGVyIHRvIGdldCB0aGUgcmVhZHkvYnVzeSBzdGF0dXMgb2YgdGhlIElQQwog
ICogYmxvY2sgYW5kIGVycm9yIHN0YXR1cyBvZiB0aGUgSVBDIGNvbW1hbmQgdGhhdCB3YXMganVz
dCBwcm9jZXNzZWQgYnkgU0NVCkBAIC00MTQsNzAgKzM5Niw2IEBAIGludCBpbnRlbF9zY3VfaXBj
X3VwZGF0ZV9yZWdpc3Rlcih1MTYgYWRkciwgdTggYml0cywgdTggbWFzaykKIEVYUE9SVF9TWU1C
T0woaW50ZWxfc2N1X2lwY191cGRhdGVfcmVnaXN0ZXIpOwogCiAvKioKLSAqCWludGVsX3NjdV9p
cGNfcmVnaXN0ZXJfcmVhZAktCTMyYml0IGluZGlyZWN0IHJlYWQKLSAqCUBhZGRyOiByZWdpc3Rl
ciBhZGRyZXNzCi0gKglAdmFsdWU6IDMyYml0IHZhbHVlIHJldHVybgotICoKLSAqCVBlcmZvcm1z
IElBIDMyIGJpdCBpbmRpcmVjdCByZWFkLCByZXR1cm5zIDAgb24gc3VjY2Vzcywgb3IgYW4KLSAq
CWVycm9yIGNvZGUuCi0gKgotICoJQ2FuIGJlIHVzZWQgd2hlbiBTQ0NCKFN5c3RlbSBDb250cm9s
bGVyIENvbmZpZ3VyYXRpb24gQmxvY2spIHJlZ2lzdGVyCi0gKglIUklNKEhvbm9yIFJlc3RyaWN0
ZWQgSVBDIE1lc3NhZ2VzKSBpcyBzZXQgKGJpdCAyMykKLSAqCi0gKglUaGlzIGZ1bmN0aW9uIG1h
eSBzbGVlcC4gTG9ja2luZyBmb3IgU0NVIGFjY2Vzc2VzIGlzIGhhbmRsZWQgZm9yCi0gKgl0aGUg
Y2FsbGVyLgotICovCi1pbnQgaW50ZWxfc2N1X2lwY19yZWdpc3Rlcl9yZWFkKHUzMiBhZGRyLCB1
MzIgKnZhbHVlKQotewotCXUzMiBlcnIgPSAwOwotCi0JbXV0ZXhfbG9jaygmaXBjbG9jayk7Ci0J
aWYgKGlwY2Rldi5wZGV2ID09IE5VTEwpIHsKLQkJbXV0ZXhfdW5sb2NrKCZpcGNsb2NrKTsKLQkJ
cmV0dXJuIC1FTk9ERVY7Ci0JfQotCWlwY193cml0ZV9zcHRyKGFkZHIpOwotCWlwY19jb21tYW5k
KDQgPDwgMTYgfCBJUENfQ01EX0lORElSRUNUX1JEKTsKLQllcnIgPSBidXN5X2xvb3AoKTsKLQkq
dmFsdWUgPSBpcGNfZGF0YV9yZWFkbCgwKTsKLQltdXRleF91bmxvY2soJmlwY2xvY2spOwotCXJl
dHVybiBlcnI7Ci19Ci1FWFBPUlRfU1lNQk9MKGludGVsX3NjdV9pcGNfcmVnaXN0ZXJfcmVhZCk7
Ci0KLS8qKgotICoJaW50ZWxfc2N1X2lwY19yZWdpc3Rlcl93cml0ZQktCTMyYml0IGluZGlyZWN0
IHdyaXRlCi0gKglAYWRkcjogcmVnaXN0ZXIgYWRkcmVzcwotICoJQHZhbHVlOiAzMmJpdCB2YWx1
ZSB0byB3cml0ZQotICoKLSAqCVBlcmZvcm1zIElBIDMyIGJpdCBpbmRpcmVjdCB3cml0ZSwgcmV0
dXJucyAwIG9uIHN1Y2Nlc3MsIG9yIGFuCi0gKgllcnJvciBjb2RlLgotICoKLSAqCUNhbiBiZSB1
c2VkIHdoZW4gU0NDQihTeXN0ZW0gQ29udHJvbGxlciBDb25maWd1cmF0aW9uIEJsb2NrKSByZWdp
c3RlcgotICoJSFJJTShIb25vciBSZXN0cmljdGVkIElQQyBNZXNzYWdlcykgaXMgc2V0IChiaXQg
MjMpCi0gKgotICoJVGhpcyBmdW5jdGlvbiBtYXkgc2xlZXAuIExvY2tpbmcgZm9yIFNDVSBhY2Nl
c3NlcyBpcyBoYW5kbGVkIGZvcgotICoJdGhlIGNhbGxlci4KLSAqLwotaW50IGludGVsX3NjdV9p
cGNfcmVnaXN0ZXJfd3JpdGUodTMyIGFkZHIsIHUzMiB2YWx1ZSkKLXsKLQl1MzIgZXJyID0gMDsK
LQotCW11dGV4X2xvY2soJmlwY2xvY2spOwotCWlmIChpcGNkZXYucGRldiA9PSBOVUxMKSB7Ci0J
CW11dGV4X3VubG9jaygmaXBjbG9jayk7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KLQlpcGNfd3Jp
dGVfZHB0cihhZGRyKTsKLQlpcGNfZGF0YV93cml0ZWwodmFsdWUsIDApOwotCWlwY19jb21tYW5k
KDQgPDwgMTYgfCBJUENfQ01EX0lORElSRUNUX1dSKTsKLQllcnIgPSBidXN5X2xvb3AoKTsKLQlt
dXRleF91bmxvY2soJmlwY2xvY2spOwotCXJldHVybiBlcnI7Ci19Ci1FWFBPUlRfU1lNQk9MKGlu
dGVsX3NjdV9pcGNfcmVnaXN0ZXJfd3JpdGUpOwotCi0vKioKICAqCWludGVsX3NjdV9pcGNfc2lt
cGxlX2NvbW1hbmQJLQlzZW5kIGEgc2ltcGxlIGNvbW1hbmQKICAqCUBjbWQ6IGNvbW1hbmQKICAq
CUBzdWI6IHN1YiB0eXBlCi0tIAoxLjUuNC41Cgo=

--_002_0AE3E14D83C76F4994657326177D1FF9042CE9F4A6bgsmsx501garc_--
