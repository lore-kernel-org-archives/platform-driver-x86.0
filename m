From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v2 2/2] eeepc-wmi: Add cpufv sysfs interface
Date: Thu, 21 Oct 2010 08:45:37 +0200
Message-ID: <AANLkTik3agz60dxGvuHTFOr=4aUdg9t5jRgFjO6q-3mp@mail.gmail.com>
References: <1286840838-16844-1-git-send-email-chris@cnpbagwell.com>
	<1286840838-16844-2-git-send-email-chris@cnpbagwell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:38564 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757296Ab0JUGpj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Oct 2010 02:45:39 -0400
Received: by ewy20 with SMTP id 20so5439944ewy.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Oct 2010 23:45:38 -0700 (PDT)
In-Reply-To: <1286840838-16844-2-git-send-email-chris@cnpbagwell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: chris@cnpbagwell.com, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Tue, Oct 12, 2010 at 1:47 AM,  <chris@cnpbagwell.com> wrote:
> From: Chris Bagwell <chris@cnpbagwell.com>
>
> eeepc-laptop provides a sysfs interface to read and control what it
> calls cpufv. =C2=A0When WMI is enabled, the ACPI interface changes sl=
ightly
> and becames a write-only control with 3 valid values.
>
> Expose cpufv again to allow for user space utils that can extended ba=
ttery
> life noticably and come a little closer to parity with eeepc-laptop.
>
> Write-only is OK for most user space apps because read status was
> mostly used to prevent unneeded mode changes. =C2=A0Since this same c=
heck
> to ignore changes to same mode also exists in the DSDT then it was
> wasted ACPI call.
>
> acpi_osi=3D"!Windows 2009" can be used for get back eeepc-laptop's
> read support of cpufv for debugging things such as behaviour
> during resume.
>
> This patch was tested with EEE PC 1005PE by monitoring powertop outpu=
t while
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
> index 21df266..462ceab 100644
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
> @@ -297,6 +298,49 @@ static void eeepc_wmi_notify(u32 value, void *co=
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
> @@ -392,8 +436,14 @@ static int __init eeepc_wmi_init(void)
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
> @@ -408,6 +458,7 @@ static void __exit eeepc_wmi_exit(void)
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
>

Seems ok.
Matthew, could you add that one for inclusion in 2.6.37 ?

Chris, could you document cpufv in
Documentation/ABI/testing/sysfs-platform-eeepc-wmi (see eeepc-laptop
example) ?
I don't think the lacking documentation should delay this patch because=
:
- most of platform-x86 are not documented at all
- the merge window is open, and we should'nt miss that.

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
