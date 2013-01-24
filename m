From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] acer-wmi: do not use 'devices' uninitialized
Date: Thu, 24 Jan 2013 14:12:58 +0100
Message-ID: <1359033178.1325.15.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <jlee@suse.com>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit f20aaba9819d0801fb1314363f97239da0100bac ("acer-wmi: fix obj is
NULL but dereferenced") introduced a GCC warning:
    drivers/platform/x86/acer-wmi.c: In function =E2=80=98acer_wmi_init=
=E2=80=99:
    drivers/platform/x86/acer-wmi.c:1216:14: warning: =E2=80=98devices=E2=
=80=99 may be used uninitialized in this function [-Wmaybe-uninitialize=
d]
    drivers/platform/x86/acer-wmi.c:1193:6: note: =E2=80=98devices=E2=80=
=99 was declared here

GCC is correct. In WMID_set_capabilities() there are now clearly codepa=
ths
that use 'devices' uninitialized. (WMID_set_capabilities() is apparentl=
y
inlined in acer_wmi_init().) Previously that couldn't happen. So rework
the code to use the previous logic, but also make sure 'obj' will not b=
e
dereferenced while NULL.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Compile tested only!

 drivers/platform/x86/acer-wmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index afed701..0ddac19 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1197,14 +1197,12 @@ static acpi_status WMID_set_capabilities(void)
 		return status;
=20
 	obj =3D (union acpi_object *) out.pointer;
-	if (obj) {
-		if (obj->type =3D=3D ACPI_TYPE_BUFFER &&
+	if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
 			(obj->buffer.length =3D=3D sizeof(u32) ||
 			obj->buffer.length =3D=3D sizeof(u64))) {
 			devices =3D *((u32 *) obj->buffer.pointer);
-		} else if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
+	} else if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
 			devices =3D (u32) obj->integer.value;
-		}
 	} else {
 		kfree(out.pointer);
 		return AE_ERROR;
--=20
1.7.11.7
