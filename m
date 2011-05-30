From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] acer-wmi: schedule threeg and interface sysfs for
 feature removal
Date: Mon, 30 May 2011 03:05:14 -0600
Message-ID: <4DE3EA6A020000230002D3A1@novprvlin0050.provo.novell.com>
References: <1306714900-26916-1-git-send-email-jlee@novell.com>
 <201105300947.01009.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201105300947.01009.trenn@suse.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: trenn@suse.de
Cc: corentincj@iksaif.net, dtor@mail.ru, Joey Lee <JLee@novell.com>, mjg@redhat.com, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

Hi Thomas,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2011-05-30 =E6=96=BC 09:47 +0200=EF=BC=8CTh=
omas Renninger =E6=8F=90=E5=88=B0=EF=BC=9A
> On Monday, May 30, 2011 02:21:40 AM Lee, Chun-Yi wrote:
> > we can now autodetect internal 3G device and already have the three=
g
> > rfkill device. So, we plan to remove threeg sysfs support for it's =
no
> > longer necessary.
> >=20
> > We also plan to remove interface sysfs file that exposed which ACPI=
-WMI
> > interface that was used by acer-wmi driver. It will replaced by inf=
ormation
> > log when acer-wmi initial.
> >=20
> > We keep it around for userspace compatibility reasons, schedule rem=
oval
> > in 2012.
>=20
> ...
>=20
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index 1495539..7e7e668 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -1396,6 +1396,8 @@ static ssize_t show_bool_threeg(struct device=
 *dev,
> >  {
> >  	u32 result; \
> >  	acpi_status status;
> > +
> > +	pr_info("This threeg sysfs will be removed in 2012.");
> You could also add:
>             " - used by: %s\n", current->comm);
> then it's easier to identify and fix the app still making use of it.
>=20
>=20
> >  	if (wmi_has_guid(WMID_GUID3))
> >  		status =3D wmid3_get_device_status(&result,
> >  				ACER_WMID3_GDS_THREEG);
> > @@ -1421,6 +1423,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR,=
 show_bool_threeg,
> >  static ssize_t show_interface(struct device *dev, struct device_at=
tribute *attr,
> >  	char *buf)
> >  {
> > +	pr_info("This interface sysfs will be removed in 2012.");
> Same.
> >  	switch (interface->type) {
> >  	case ACER_AMW0:
> >  		return sprintf(buf, "AMW0\n");
>=20
>    Thomas

Thank's for your review and suggestion, I modified patch like the
following:

From 0dc691b3f99794a6b91728413919720454a9be44 Mon Sep 17 00:00:00 2001
=46rom: Lee, Chun-Yi <jlee@novell.com>
Date: Mon, 30 May 2011 16:58:27 +0800
Subject: [PATCH v2] acer-wmi: schedule threeg and interface sysfs for f=
eature removal

we can now autodetect internal 3G device and already have the threeg
rfkill device. So, we plan to remove threeg sysfs support for it's no
longer necessary.

We also plan to remove interface sysfs file that exposed which ACPI-WMI
interface that was used by acer-wmi driver. It will replaced by informa=
tion
log when acer-wmi initial.

We keep it around for userspace compatibility reasons, schedule removal
in 2012.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 Documentation/feature-removal-schedule.txt |   13 +++++++++++++
 drivers/platform/x86/acer-wmi.c            |   11 +++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/feature-removal-schedule.txt b/Documentation=
/feature-removal-schedule.txt
index ff31b1c..c8c18d7 100644
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@ -564,3 +564,16 @@ Why:	Superseded by the UVCIOC_CTRL_QUERY ioctl.
 Who:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
index 005417b..9408cd5 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1400,6 +1400,9 @@ static ssize_t show_bool_threeg(struct device *de=
v,
 {
 	u32 result; \
 	acpi_status status;
+
+	pr_info("This threeg sysfs will be removed in 2012"
+		" - used by: %s\n", current->comm);
 	if (wmi_has_guid(WMID_GUID3))
 		status =3D wmid3_get_device_status(&result,
 				ACER_WMID3_GDS_THREEG);
@@ -1415,8 +1418,10 @@ static ssize_t set_bool_threeg(struct device *de=
v,
 {
 	u32 tmp =3D simple_strtoul(buf, NULL, 10);
 	acpi_status status =3D set_u32(tmp, ACER_CAP_THREEG);
-		if (ACPI_FAILURE(status))
-			return -EINVAL;
+	pr_info("This threeg sysfs will be removed in 2012"
+		" - used by: %s\n", current->comm);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
 	return count;
 }
 static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
@@ -1425,6 +1430,8 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, sho=
w_bool_threeg,
 static ssize_t show_interface(struct device *dev, struct device_attrib=
ute *attr,
 	char *buf)
 {
+	pr_info("This interface sysfs will be removed in 2012"
+		" - used by: %s\n", current->comm);
 	switch (interface->type) {
 	case ACER_AMW0:
 		return sprintf(buf, "AMW0\n");
--=20
1.6.0.2
