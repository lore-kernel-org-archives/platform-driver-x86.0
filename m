From: Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH] acer-wmi: fix a problem that variable 'devices' may be used
 uninitialized
Date: Wed, 16 Jan 2013 10:26:21 +0800
Message-ID: <1358303181.2252.22.camel@rzhang1-mobl4>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:16572 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756779Ab3APC0l (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Jan 2013 21:26:41 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

=46rom fcf93a0a34fea5df219e579341c3a45aa3e90b8f Mon Sep 17 00:00:00 200=
1
=46rom: Zhang Rui <rui.zhang@intel.com>
Date: Tue, 15 Jan 2013 09:05:23 +0800
Subject: [PATCH] acer-wmi: fix a problem that variable 'devices' may be=
 used uninitialized

drivers/platform/x86/acer-wmi.c: In function =E2=80=98acer_wmi_init=E2=80=
=99:
drivers/platform/x86/acer-wmi.c:1216:14: warning: =E2=80=98devices=E2=80=
=99 may be used uninitialized in this function [-Wuninitialized]
drivers/platform/x86/acer-wmi.c:1193:6: note: =E2=80=98devices=E2=80=99=
 was declared here

In WMID_set_capabilities(), 'devices' will be used uninitialized
if the returned object is neither a buffer nor an integer.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/platform/x86/acer-wmi.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index afed701..c471ad4 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1197,14 +1197,13 @@ static acpi_status WMID_set_capabilities(void)
 		return status;
=20
 	obj =3D (union acpi_object *) out.pointer;
-	if (obj) {
-		if (obj->type =3D=3D ACPI_TYPE_BUFFER &&
-			(obj->buffer.length =3D=3D sizeof(u32) ||
-			obj->buffer.length =3D=3D sizeof(u64))) {
-			devices =3D *((u32 *) obj->buffer.pointer);
-		} else if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
-			devices =3D (u32) obj->integer.value;
-		}
+
+	if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
+		(obj->buffer.length =3D=3D sizeof(u32) ||
+		obj->buffer.length =3D=3D sizeof(u64))) {
+		devices =3D *((u32 *) obj->buffer.pointer);
+	} else if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
+		devices =3D (u32) obj->integer.value;
 	} else {
 		kfree(out.pointer);
 		return AE_ERROR;
--=20
1.7.9.5
