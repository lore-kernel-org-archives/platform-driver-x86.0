From: Rashika Kheria <rashika.kheria@gmail.com>
Subject: [PATCH 1/2] drivers: platform: Mark functions as static in hp_accel.c
Date: Fri, 13 Dec 2013 12:56:34 +0530
Message-ID: <89355c5023baba63de7d1313b3f52818b0fb9202.1386919194.git.rashika.kheria@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, josh@joshtriplett.org
List-Id: platform-driver-x86.vger.kernel.org

This patch marks the functions lis3lv02d_acpi_init(),
lis3lv02d_acpi_read() and lis3lv02d_acpi_write() as static in
x86/hp_accel.c because they are not used outside this file.

Thus, it also eliminates the following warnings in x86/hp_accel.c:
drivers/platform/x86/hp_accel.c:91:5: warning: no previous prototype fo=
r =E2=80=98lis3lv02d_acpi_init=E2=80=99 [-Wmissing-prototypes]
drivers/platform/x86/hp_accel.c:109:5: warning: no previous prototype f=
or =E2=80=98lis3lv02d_acpi_read=E2=80=99 [-Wmissing-prototypes]
drivers/platform/x86/hp_accel.c:132:5: warning: no previous prototype f=
or =E2=80=98lis3lv02d_acpi_write=E2=80=99 [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
---
 drivers/platform/x86/hp_accel.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_=
accel.c
index a8e43cf..01b619e 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -88,7 +88,7 @@ MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
  *
  * Returns 0 on success.
  */
-int lis3lv02d_acpi_init(struct lis3lv02d *lis3)
+static int lis3lv02d_acpi_init(struct lis3lv02d *lis3)
 {
 	struct acpi_device *dev =3D lis3->bus_priv;
 	if (acpi_evaluate_object(dev->handle, METHOD_NAME__INI,
@@ -106,7 +106,7 @@ int lis3lv02d_acpi_init(struct lis3lv02d *lis3)
  *
  * Returns 0 on success.
  */
-int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *ret)
+static int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *re=
t)
 {
 	struct acpi_device *dev =3D lis3->bus_priv;
 	union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
@@ -129,7 +129,7 @@ int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int=
 reg, u8 *ret)
  *
  * Returns 0 on success.
  */
-int lis3lv02d_acpi_write(struct lis3lv02d *lis3, int reg, u8 val)
+static int lis3lv02d_acpi_write(struct lis3lv02d *lis3, int reg, u8 va=
l)
 {
 	struct acpi_device *dev =3D lis3->bus_priv;
 	unsigned long long ret; /* Not used when writting */
--=20
1.7.9.5
