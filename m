From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: enable resume on lid open
Date: Fri, 18 May 2012 12:36:36 +0200
Message-ID: <CAHR064hpeteKkwjkbHc9FOTbSVhX9MRYgx2dYHtPYLVN-UkzqQ@mail.gmail.com>
References: <1337331418-6616-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:45999 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762700Ab2ERKgi convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 06:36:38 -0400
Received: by bkcji2 with SMTP id ji2so2229988bkc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 May 2012 03:36:36 -0700 (PDT)
In-Reply-To: <1337331418-6616-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, May 18, 2012 at 10:56 AM, AceLan Kao <acelan.kao@canonical.com>=
 wrote:
> According to the ASUS WMI spec., to enable resume on lid open should
> use the device ID(0x00120032), but it doesn't work indeed.
>
> After discussing with ASUS' BIOS engineer, they say wake on lid open
> doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the =
same
> device ID with deep S3(0x00120031), and the deep S3(resume on lid ope=
n)
> is disable by default.
>
> It's reasonable to resume the system while opening the lid, so add it
> in the asus-wmi driver and tested the code on ASUS X100CH and ASUS 10=
15CX.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-wmi.c | =C2=A0 10 ++++++++++

Please also update Documentation/ABI/testing/sysfs-platform-asus-wmi

> =C2=A01 file changed, 10 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index b1b8b0b..7f31f44 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -137,6 +137,9 @@ MODULE_LICENSE("GPL");
> =C2=A0/* Power */
> =C2=A0#define ASUS_WMI_DEVID_PROCESSOR_STATE 0x00120012
>
> +/* Deep S3 / Resume on LID open */
> +#define ASUS_WMI_DEVID_LID_RESUME =C2=A0 =C2=A0 =C2=A00x00120031
> +
> =C2=A0/* DSTS masks */
> =C2=A0#define ASUS_WMI_DSTS_STATUS_BIT =C2=A0 =C2=A0 =C2=A0 0x0000000=
1
> =C2=A0#define ASUS_WMI_DSTS_UNKNOWN_BIT =C2=A0 =C2=A0 =C2=A00x0000000=
2
> @@ -1372,6 +1375,7 @@ static ssize_t show_sys_wmi(struct asus_wmi *as=
us, int devid, char *buf)
> =C2=A0ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS_WMI_DEVID_TOUC=
HPAD);
> =C2=A0ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA=
);
> =C2=A0ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREA=
DER);
> +ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RES=
UME);
>
> =C2=A0static ssize_t store_cpufv(struct device *dev, struct device_at=
tribute *attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const char *buf, size_t count)
> @@ -1397,6 +1401,7 @@ static struct attribute *platform_attributes[] =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_camera.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_cardr.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&dev_attr_touchpad.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_lid_resume.attr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL
> =C2=A0};
>
> @@ -1415,6 +1420,8 @@ static umode_t asus_sysfs_is_visible(struct kob=
ject *kobj,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devid =3D ASUS=
_WMI_DEVID_CARDREADER;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (attr =3D=3D &dev_attr_touchpad.at=
tr)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devid =3D ASUS=
_WMI_DEVID_TOUCHPAD;
> + =C2=A0 =C2=A0 =C2=A0 else if (attr =3D=3D &dev_attr_lid_resume.attr=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devid =3D ASUS_WMI=
_DEVID_LID_RESUME;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (devid !=3D -1)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D !(asus_=
wmi_get_devstate_simple(asus, devid) < 0);
> @@ -1488,6 +1495,9 @@ static int asus_wmi_platform_init(struct asus_w=
mi *asus)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus_wmi_set_d=
evstate(ASUS_WMI_DEVID_CWAP,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->dr=
iver->quirks->wapf, NULL);
>
> + =C2=A0 =C2=A0 =C2=A0 /* Enable resume on lid open */
> + =C2=A0 =C2=A0 =C2=A0 asus_wmi_set_devstate(ASUS_WMI_DEVID_LID_RESUM=
E, 1, &rv);

Is this setting persistant on accross re-boot ? Is the setting exposed
in the bios ?
What is the default value (off I guess ?) ?


--=20
Corentin Chary
http://xf.iksaif.net
