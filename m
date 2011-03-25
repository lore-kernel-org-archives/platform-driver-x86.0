From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/4] asus-laptop: Pegatron Lucid ALS sensor
Date: Fri, 25 Mar 2011 08:48:07 +0100
Message-ID: <AANLkTinxsdwGy+DynOoEp=WFuL0ML8Zk3b8mDx74fKHW@mail.gmail.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
	<1301004130-3294-3-git-send-email-andy.ross@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:37039 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932812Ab1CYHsI convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Mar 2011 03:48:08 -0400
Received: by eyx24 with SMTP id 24so395585eyx.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Mar 2011 00:48:07 -0700 (PDT)
In-Reply-To: <1301004130-3294-3-git-send-email-andy.ross@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Ross <andy.ross@windriver.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Thu, Mar 24, 2011 at 11:02 PM, Andy Ross <andy.ross@windriver.com> w=
rote:
> Ambient light sensor for Pegatron Lucid. =C2=A0Supports pre-existing
> ls_switch sysfs interface to en/disable automatic control, and export=
s
> the brightness from the device as "ls_value".
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
> =C2=A0drivers/platform/x86/asus-laptop.c | =C2=A0 70 ++++++++++++++++=
+++++++++++++++++---
> =C2=A01 files changed, 65 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index ec46d71..6651d8c 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -214,9 +214,15 @@ static char *display_get_paths[] =3D {
>
> =C2=A0/* For Pegatron Lucid tablet */
> =C2=A0#define DEVICE_NAME_PEGA =C2=A0 =C2=A0 =C2=A0 "Lucid"
> +
> =C2=A0#define METHOD_PEGA_ENABLE =C2=A0 =C2=A0 "ENPR"
> =C2=A0#define METHOD_PEGA_DISABLE =C2=A0 =C2=A0"DAPR"
> +#define PEGA_ALS =C2=A0 =C2=A0 =C2=A0 0x04
> +#define PEGA_ALS_POWER 0x05
> +
> =C2=A0#define METHOD_PEGA_READ =C2=A0 =C2=A0 =C2=A0 "RDLN"
> +#define PEGA_READ_ALS_H =C2=A0 =C2=A0 =C2=A0 =C2=A00x02
> +#define PEGA_READ_ALS_L =C2=A0 =C2=A0 =C2=A0 =C2=A00x03
>
> =C2=A0/*
> =C2=A0* Define a specific led structure to keep the main structure cl=
ean
> @@ -378,6 +384,12 @@ static bool asus_check_pega_lucid(struct asus_la=
ptop *asus)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !acpi_check_handle(asus->handle, M=
ETHOD_PEGA_READ, NULL);
> =C2=A0}
>
> +static int asus_pega_lucid_set(struct asus_laptop *asus, int unit, b=
ool enable)
> +{
> + =C2=A0 =C2=A0 =C2=A0 char *method =3D enable ? METHOD_PEGA_ENABLE :=
 METHOD_PEGA_DISABLE;
> + =C2=A0 =C2=A0 =C2=A0 return write_acpi_int(asus->handle, method, un=
it);
> +}
> +
> =C2=A0/* Generic LED function */
> =C2=A0static int asus_led_set(struct asus_laptop *asus, const char *m=
ethod,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 int value)
> @@ -1046,7 +1058,15 @@ static ssize_t store_disp(struct device *dev, =
struct device_attribute *attr,
> =C2=A0*/
> =C2=A0static void asus_als_switch(struct asus_laptop *asus, int value=
)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 if (write_acpi_int(asus->handle, METHOD_ALS_CO=
NTROL, value))
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> + =C2=A0 =C2=A0 =C2=A0 if (asus->have_pega_lucid) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D asus_pega_=
lucid_set(asus, PEGA_ALS, value);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ret =3D asus_pega_lucid_set(asus, PEGA_ALS_POWER, value);
> + =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D write_acpi=
_int(asus->handle, METHOD_ALS_CONTROL, value);
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 if (ret)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warning("Er=
ror setting light sensor switch\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->light_switch =3D value;
> =C2=A0}
> @@ -1103,6 +1123,35 @@ static ssize_t store_lslvl(struct device *dev,=
 struct device_attribute *attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return rv;
> =C2=A0}
>
> +static int pega_int_read(struct asus_laptop *asus, int arg, int *res=
ult)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer buffer =3D { ACPI_ALLOCATE_=
BUFFER, NULL };
> + =C2=A0 =C2=A0 =C2=A0 int err =3D write_acpi_int_ret(asus->handle, M=
ETHOD_PEGA_READ, arg,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&buffer);
> + =C2=A0 =C2=A0 =C2=A0 if (!err) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 union acpi_object =
*obj =3D buffer.pointer;

I think a kfree(buffer.pointer); is missing here.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj && obj->ty=
pe =3D=3D ACPI_TYPE_INTEGER)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *result =3D obj->integer.value;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 err =3D -EIO;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return err;
> +}
> +
> +static ssize_t show_lsvalue(struct device *dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct asus_laptop *asus =3D dev_get_drvdata(d=
ev);
> + =C2=A0 =C2=A0 =C2=A0 int err, hi, lo;
> +
> + =C2=A0 =C2=A0 =C2=A0 err =3D pega_int_read(asus, PEGA_READ_ALS_H, &=
hi);
> + =C2=A0 =C2=A0 =C2=A0 if (!err)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D pega_int_r=
ead(asus, PEGA_READ_ALS_L, &lo);
> + =C2=A0 =C2=A0 =C2=A0 if (!err)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf=
, "%d\n", 10 * hi + lo);
> + =C2=A0 =C2=A0 =C2=A0 return err;
> +}
> +
> =C2=A0/*
> =C2=A0* GPS
> =C2=A0*/
> @@ -1300,6 +1349,7 @@ static DEVICE_ATTR(wimax, S_IRUGO | S_IWUSR, sh=
ow_wimax, store_wimax);
> =C2=A0static DEVICE_ATTR(wwan, S_IRUGO | S_IWUSR, show_wwan, store_ww=
an);
> =C2=A0static DEVICE_ATTR(display, S_IRUGO | S_IWUSR, show_disp, store=
_disp);
> =C2=A0static DEVICE_ATTR(ledd, S_IRUGO | S_IWUSR, show_ledd, store_le=
dd);
> +static DEVICE_ATTR(ls_value, S_IRUGO, show_lsvalue, NULL);

Could you document that new file in
Documentation/ABI/testing/sysfs-platform-asus-laptop ?

> =C2=A0static DEVICE_ATTR(ls_level, S_IRUGO | S_IWUSR, show_lslvl, sto=
re_lslvl);
> =C2=A0static DEVICE_ATTR(ls_switch, S_IRUGO | S_IWUSR, show_lssw, sto=
re_lssw);
> =C2=A0static DEVICE_ATTR(gps, S_IRUGO | S_IWUSR, show_gps, store_gps)=
;
> @@ -1312,6 +1362,7 @@ static struct attribute *asus_attributes[] =3D =
{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_wwan.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_display.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_ledd.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_ls_value.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_ls_level.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_ls_switch.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_gps.attr,
> @@ -1349,8 +1400,15 @@ static mode_t asus_sysfs_is_visible(struct kob=
ject *kobj,
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (attr =3D=3D &dev_attr_ls_switch=
=2Eattr ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr =3D=
=3D &dev_attr_ls_level.attr) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 supported =3D !acp=
i_check_handle(handle, METHOD_ALS_CONTROL, NULL) &&
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 !acpi_check_handle(handle, METHOD_ALS_LEVEL, NULL=
);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asus->have_peg=
a_lucid) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /* no ls_level interface on the Lucid */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 supported =3D attr =3D=3D &dev_attr_ls_switch.attr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 supported =3D !acpi_check_handle(handle, METHOD_ALS_CONTROL, NU=
LL) &&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !acpi_check_handle(ha=
ndle, METHOD_ALS_LEVEL, NULL);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 } else if (attr =3D=3D &dev_attr_ls_value.attr=
) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 supported =3D asus=
->have_pega_lucid;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (attr =3D=3D &dev_attr_gps.attr)=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0supported =3D =
!acpi_check_handle(handle, METHOD_GPS_ON, NULL) &&
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0!acpi_check_handle(handle, METHOD_GPS_OFF, =
NULL) &&
> @@ -1562,8 +1620,10 @@ static int __devinit asus_acpi_init(struct asu=
s_laptop *asus)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->light_switch =3D 0; /* Default to li=
ght sensor disabled */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->light_level =3D 5; =C2=A0/* level 5 =
for sensor sensitivity */
>
> - =C2=A0 =C2=A0 =C2=A0 if (!acpi_check_handle(asus->handle, METHOD_AL=
S_CONTROL, NULL) &&
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !acpi_check_handle(asus->handle,=
 METHOD_ALS_LEVEL, NULL)) {
> + =C2=A0 =C2=A0 =C2=A0 if (asus->have_pega_lucid) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus_als_switch(as=
us, asus->light_switch);
> + =C2=A0 =C2=A0 =C2=A0 } else if (!acpi_check_handle(asus->handle, ME=
THOD_ALS_CONTROL, NULL) &&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!acpi=
_check_handle(asus->handle, METHOD_ALS_LEVEL, NULL)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus_als_switc=
h(asus, asus->light_switch);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus_als_level=
(asus, asus->light_level);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> --
> 1.7.1
>
>



--=20
Corentin Chary
http://xf.iksaif.net
