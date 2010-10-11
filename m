From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add cpufv sysfs interface
Date: Mon, 11 Oct 2010 08:44:23 +0200
Message-ID: <AANLkTi=Zy1xTmOc286Lq++JipQ+HxLxXzJeZrytWyd3K@mail.gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
	<1286761702-4304-2-git-send-email-chris@cnpbagwell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:60493 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752364Ab0JKGoZ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Oct 2010 02:44:25 -0400
Received: by ewy20 with SMTP id 20so443138ewy.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Oct 2010 23:44:24 -0700 (PDT)
In-Reply-To: <1286761702-4304-2-git-send-email-chris@cnpbagwell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: chris@cnpbagwell.com
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Mon, Oct 11, 2010 at 3:48 AM,  <chris@cnpbagwell.com> wrote:
> From: Chris Bagwell <chris@cnpbagwell.com>
>
> eeepc-laptop provides a sysfs interface to read and control what it
> calls cpufv. =C2=A0When WMI is enabled, the ACPI interface changes sl=
ightly
> and becames a write-only control with only 3 valid values.
>
> Write-only is OK because same DSDT's will ignore duplicate values
> and even invalid values will be treated same as "0" value.
>
> Expose cpufv again to allow for user space utils that can extended ba=
ttery
> life noticably and come a little closer to parity with eeepc-laptop.
>
> This was tested with EEE PC 1005PE by monitoring powertop output whil=
e
> writing values of "0", "1", and "2" and by reviewing the decompiled D=
SDT of
> an 1201NL and comparing it to 1005PE's DSDT.
>
> Signed-off-by: Chris Bagwell <chris@cnpbagwell.com>
> ---
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 51 ++++++++++++++++++=
++++++++++++++++++++
> =C2=A01 files changed, 51 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 441b000..988b16c 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -57,6 +57,7 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
>
> =C2=A0#define EEEPC_WMI_METHODID_DEVS =C2=A0 =C2=A0 =C2=A0 =C2=A00x53=
564544
> =C2=A0#define EEEPC_WMI_METHODID_DSTS =C2=A0 =C2=A0 =C2=A0 =C2=A00x53=
544344
> +#define EEEPC_WMI_METHODID_CFVS =C2=A0 =C2=A0 =C2=A0 =C2=A00x5356464=
3
>
> =C2=A0#define EEEPC_WMI_DEVID_BACKLIGHT =C2=A0 =C2=A0 =C2=A00x0005001=
2
>
> @@ -307,6 +308,49 @@ static void eeepc_wmi_notify(u32 value, void *co=
ntext)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj);
> =C2=A0}
>
> +static int store_cpufv(struct device *dev, struct device_attribute *=
attr,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const char *buf, size_t count)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int value;
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer input =3D { (acpi_size)size=
of(value), &value };
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!count || sscanf(buf, "%i", &value) !=3D 1=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 if (value < 0 || value > 2)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> +
> + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_evaluate_method(EEEPC_WMI_MGMT_=
GUID,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01, EEEPC_WMI_ME=
THODID_CFVS, &input, NULL);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return count;
> +}
> +
> +static DEVICE_ATTR(cpufv, S_IRUGO | S_IWUSR, NULL, store_cpufv);
> +
> +static void eeepc_wmi_sysfs_exit(struct platform_device *device)
> +{
> + =C2=A0 =C2=A0 =C2=A0 device_remove_file(&device->dev, &dev_attr_cpu=
fv);
> +}
> +
> +static int eeepc_wmi_sysfs_init(struct platform_device *device)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int retval =3D -ENOMEM;
> +
> + =C2=A0 =C2=A0 =C2=A0 retval =3D device_create_file(&device->dev, &d=
ev_attr_cpufv);
> + =C2=A0 =C2=A0 =C2=A0 if (retval)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error_sysfs;
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +error_sysfs:
> + =C2=A0 =C2=A0 =C2=A0 eeepc_wmi_sysfs_exit(platform_device);
> + =C2=A0 =C2=A0 =C2=A0 return retval;
> +}
> +
> =C2=A0static int __devinit eeepc_wmi_platform_probe(struct platform_d=
evice *device)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct eeepc_wmi *eeepc;
> @@ -402,8 +446,14 @@ static int __init eeepc_wmi_init(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto del_dev;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> + =C2=A0 =C2=A0 =C2=A0 err =3D eeepc_wmi_sysfs_init(platform_device);
> + =C2=A0 =C2=A0 =C2=A0 if (err)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto del_sysfs;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>
> +del_sysfs:
> + =C2=A0 =C2=A0 =C2=A0 eeepc_wmi_sysfs_exit(platform_device);
> =C2=A0del_dev:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_del(platform_device);
> =C2=A0put_dev:
> @@ -418,6 +468,7 @@ static void __exit eeepc_wmi_exit(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct eeepc_wmi *eeepc;
>
> + =C2=A0 =C2=A0 =C2=A0 eeepc_wmi_sysfs_exit(platform_device);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0eeepc =3D platform_get_drvdata(platform_de=
vice);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&platform_drive=
r);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_unregister(platform_device=
);
> --
> 1.7.3.1
>

Seems ok, too bad they don't provide a way to guess the current
configuration and the number of available settings. Especially when
all they do is calling the old device.

--=20
Corentin Chary
http://xf.iksaif.net
