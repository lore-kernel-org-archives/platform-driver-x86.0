From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add cpufv sysfs interface
Date: Mon, 11 Oct 2010 08:29:27 -0500
Message-ID: <AANLkTikMEDAN+PDtY7Fm3uvHBgqJKwoh683Wx49VBzA-@mail.gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
	<1286761702-4304-2-git-send-email-chris@cnpbagwell.com>
	<AANLkTi=Zy1xTmOc286Lq++JipQ+HxLxXzJeZrytWyd3K@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:56794 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754548Ab0JKN32 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Oct 2010 09:29:28 -0400
Received: by gxk6 with SMTP id 6so56364gxk.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2010 06:29:27 -0700 (PDT)
In-Reply-To: <AANLkTi=Zy1xTmOc286Lq++JipQ+HxLxXzJeZrytWyd3K@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Mon, Oct 11, 2010 at 1:44 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> On Mon, Oct 11, 2010 at 3:48 AM, =A0<chris@cnpbagwell.com> wrote:
>> From: Chris Bagwell <chris@cnpbagwell.com>
>>
>> eeepc-laptop provides a sysfs interface to read and control what it
>> calls cpufv. =A0When WMI is enabled, the ACPI interface changes slig=
htly
>> and becames a write-only control with only 3 valid values.
>>
>> Write-only is OK because same DSDT's will ignore duplicate values
>> and even invalid values will be treated same as "0" value.
>>
>> Expose cpufv again to allow for user space utils that can extended b=
attery
>> life noticably and come a little closer to parity with eeepc-laptop.
>>
>> This was tested with EEE PC 1005PE by monitoring powertop output whi=
le
>> writing values of "0", "1", and "2" and by reviewing the decompiled =
DSDT of
>> an 1201NL and comparing it to 1005PE's DSDT.
>>
>> Signed-off-by: Chris Bagwell <chris@cnpbagwell.com>
>> ---
>> =A0drivers/platform/x86/eeepc-wmi.c | =A0 51 +++++++++++++++++++++++=
+++++++++++++++
>> =A01 files changed, 51 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86=
/eeepc-wmi.c
>> index 441b000..988b16c 100644
>> --- a/drivers/platform/x86/eeepc-wmi.c
>> +++ b/drivers/platform/x86/eeepc-wmi.c
>> @@ -57,6 +57,7 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
>>
>> =A0#define EEEPC_WMI_METHODID_DEVS =A0 =A0 =A0 =A00x53564544
>> =A0#define EEEPC_WMI_METHODID_DSTS =A0 =A0 =A0 =A00x53544344
>> +#define EEEPC_WMI_METHODID_CFVS =A0 =A0 =A0 =A00x53564643
>>
>> =A0#define EEEPC_WMI_DEVID_BACKLIGHT =A0 =A0 =A00x00050012
>>
>> @@ -307,6 +308,49 @@ static void eeepc_wmi_notify(u32 value, void *c=
ontext)
>> =A0 =A0 =A0 =A0kfree(obj);
>> =A0}
>>
>> +static int store_cpufv(struct device *dev, struct device_attribute =
*attr,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *buf, size_t=
 count)
>> +{
>> + =A0 =A0 =A0 int value;
>> + =A0 =A0 =A0 struct acpi_buffer input =3D { (acpi_size)sizeof(value=
), &value };
>> + =A0 =A0 =A0 acpi_status status;
>> +
>> + =A0 =A0 =A0 if (!count || sscanf(buf, "%i", &value) !=3D 1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 if (value < 0 || value > 2)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 =A0 status =3D wmi_evaluate_method(EEEPC_WMI_MGMT_GUID,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A01, EEEPC_WMI_METHODID_CFVS, &input, NULL);
>> +
>> + =A0 =A0 =A0 if (ACPI_FAILURE(status))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
>> + =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return count;
>> +}
>> +
>> +static DEVICE_ATTR(cpufv, S_IRUGO | S_IWUSR, NULL, store_cpufv);
>> +
>> +static void eeepc_wmi_sysfs_exit(struct platform_device *device)
>> +{
>> + =A0 =A0 =A0 device_remove_file(&device->dev, &dev_attr_cpufv);
>> +}
>> +
>> +static int eeepc_wmi_sysfs_init(struct platform_device *device)
>> +{
>> + =A0 =A0 =A0 int retval =3D -ENOMEM;
>> +
>> + =A0 =A0 =A0 retval =3D device_create_file(&device->dev, &dev_attr_=
cpufv);
>> + =A0 =A0 =A0 if (retval)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto error_sysfs;
>> +
>> + =A0 =A0 =A0 return 0;
>> +
>> +error_sysfs:
>> + =A0 =A0 =A0 eeepc_wmi_sysfs_exit(platform_device);
>> + =A0 =A0 =A0 return retval;
>> +}
>> +
>> =A0static int __devinit eeepc_wmi_platform_probe(struct platform_dev=
ice *device)
>> =A0{
>> =A0 =A0 =A0 =A0struct eeepc_wmi *eeepc;
>> @@ -402,8 +446,14 @@ static int __init eeepc_wmi_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto del_dev;
>> =A0 =A0 =A0 =A0}
>>
>> + =A0 =A0 =A0 err =3D eeepc_wmi_sysfs_init(platform_device);
>> + =A0 =A0 =A0 if (err)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto del_sysfs;
>> +
>> =A0 =A0 =A0 =A0return 0;
>>
>> +del_sysfs:
>> + =A0 =A0 =A0 eeepc_wmi_sysfs_exit(platform_device);
>> =A0del_dev:
>> =A0 =A0 =A0 =A0platform_device_del(platform_device);
>> =A0put_dev:
>> @@ -418,6 +468,7 @@ static void __exit eeepc_wmi_exit(void)
>> =A0{
>> =A0 =A0 =A0 =A0struct eeepc_wmi *eeepc;
>>
>> + =A0 =A0 =A0 eeepc_wmi_sysfs_exit(platform_device);
>> =A0 =A0 =A0 =A0eeepc =3D platform_get_drvdata(platform_device);
>> =A0 =A0 =A0 =A0platform_driver_unregister(&platform_driver);
>> =A0 =A0 =A0 =A0platform_device_unregister(platform_device);
>> --
>> 1.7.3.1
>>
>
> Seems ok, too bad they don't provide a way to guess the current
> configuration and the number of available settings. Especially when
> all they do is calling the old device.
>

Agree.  But its probably not to bad in real life.  I have some scripts
that monitor dbus and update cpufv based on switching between
batter/ac and powerup.  With eeepc-laptop interface, it does read
previous state to prevent unneeded write but other then that it didn't
seem to useful to read it.  Since acpi is doing same compare logic,
always writing at important transition seems simplest approach for
userland anyways.

Chris
