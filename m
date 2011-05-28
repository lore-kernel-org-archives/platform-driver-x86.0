From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 0/2] acer-wmi: remove threeg and interface sysfs
 files
Date: Fri, 27 May 2011 19:06:30 -0600
Message-ID: <4DE0D736020000230002D272@novprvlin0050.provo.novell.com>
References: <1306317507-11743-1-git-send-email-jlee@novell.com>
 <20110527163006.GC16769@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20110527163006.GC16769@srcf.ucam.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

Hi Matthew,=20

=E6=96=BC =E4=BA=94=EF=BC=8C2011-05-27 =E6=96=BC 17:30 +0100=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> I think that we should probably put these through a proper deprecatio=
n=20
> cycle. Can you document them in the deprecation listing and add some=20
> printks to tell people that they're going away, and then we'll drop t=
hem=20
> in a couple of releases?
>=20

Got it!

Like the following patch?

Thank's
Joey Lee

From c9308632bd0b17005d3f6cd2eaf27e1d053f40fb Mon Sep 17 00:00:00 2001
=46rom: Lee, Chun-Yi <jlee@novell.com>
Date: Sat, 28 May 2011 09:02:41 +0800
Subject: [PATCH] acer-wmi: schedule threeg and interface sysfs for feat=
ure removal

we can now autodetect internal 3G device and already have the threeg
rfkill device. So, we plan to remove threeg sysfs support for it's no
longer necessary.

We also plan to remove interface sysfs file that exposed which ACPI-WMI
interface that was used by acer-wmi driver. It will replaced by informa=
tion
log when acer-wmi initial.

We keep it around for userspace compatibility reasons, schedule removal
in 2012.

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 Documentation/feature-removal-schedule.txt |   13 +++++++++++++
 drivers/platform/x86/acer-wmi.c            |    3 +++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/Documentation/feature-removal-schedule.txt b/Documentation=
/feature-removal-schedule.txt
index 492e81d..8427ad0 100644
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@ -580,3 +580,16 @@ Why:	These legacy callbacks should no longer be us=
ed as i2c-core offers
 Who:	Jean Delvare <khali@linux-fr.org>
=20
 ----------------------------
+
+What:   threeg and interface sysfs files in /sys/devices/platform/acer=
-wmi
+When:   2012
+Why:    In 2.6.40, we can now autodetect internal 3G device and alread=
y have
+	the threeg rfkill device. So, we plan to remove threeg sysfs support
+	for it's no longer necessary.
+
+	We also plan to remove interface sysfs file that exposed which ACPI-W=
MI
+	interface that was used by acer-wmi driver. It will replaced by
+	information log when acer-wmi initial.
+Who:    Lee, Chun-Yi <jlee@novell.com>
+
+----------------------------
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index 1495539..7e7e668 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1396,6 +1396,8 @@ static ssize_t show_bool_threeg(struct device *de=
v,
 {
 	u32 result; \
 	acpi_status status;
+
+	pr_info("This threeg sysfs will be removed in 2012.");
 	if (wmi_has_guid(WMID_GUID3))
 		status =3D wmid3_get_device_status(&result,
 				ACER_WMID3_GDS_THREEG);
@@ -1421,6 +1423,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, sho=
w_bool_threeg,
 static ssize_t show_interface(struct device *dev, struct device_attrib=
ute *attr,
 	char *buf)
 {
+	pr_info("This interface sysfs will be removed in 2012.");
 	switch (interface->type) {
 	case ACER_AMW0:
 		return sprintf(buf, "AMW0\n");
--=20
1.6.0.2
