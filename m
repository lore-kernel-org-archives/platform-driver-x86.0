From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] asus-wmi: enable resume on lid open
Date: Tue, 22 May 2012 11:13:48 +0800
Message-ID: <CAMz9Wg-mmJ45bRDW-KWvj6zzBG0dnL-n43TXvt0oO3=_V5eELw@mail.gmail.com>
References: <1337331418-6616-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064hpeteKkwjkbHc9FOTbSVhX9MRYgx2dYHtPYLVN-UkzqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:46119 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab2EVDNu convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 May 2012 23:13:50 -0400
Received: by wgbdr13 with SMTP id dr13so5581621wgb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 May 2012 20:13:49 -0700 (PDT)
In-Reply-To: <CAHR064hpeteKkwjkbHc9FOTbSVhX9MRYgx2dYHtPYLVN-UkzqQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

2012/5/18 Corentin Chary <corentincj@iksaif.net>:
> On Fri, May 18, 2012 at 10:56 AM, AceLan Kao <acelan.kao@canonical.co=
m> wrote:
>> According to the ASUS WMI spec., to enable resume on lid open should
>> use the device ID(0x00120032), but it doesn't work indeed.
>>
>> After discussing with ASUS' BIOS engineer, they say wake on lid open
>> doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the=
 same
>> device ID with deep S3(0x00120031), and the deep S3(resume on lid op=
en)
>> is disable by default.
>>
>> It's reasonable to resume the system while opening the lid, so add i=
t
>> in the asus-wmi driver and tested the code on ASUS X100CH and ASUS 1=
015CX.
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>> =A0drivers/platform/x86/asus-wmi.c | =A0 10 ++++++++++
>
> Please also update Documentation/ABI/testing/sysfs-platform-asus-wmi
ok, and the kernel version should be marked as 3.5, right?

>> =A01 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
>> index b1b8b0b..7f31f44 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -137,6 +137,9 @@ MODULE_LICENSE("GPL");
>> =A0/* Power */
>> =A0#define ASUS_WMI_DEVID_PROCESSOR_STATE 0x00120012
>>
>> +/* Deep S3 / Resume on LID open */
>> +#define ASUS_WMI_DEVID_LID_RESUME =A0 =A0 =A00x00120031
>> +
>> =A0/* DSTS masks */
>> =A0#define ASUS_WMI_DSTS_STATUS_BIT =A0 =A0 =A0 0x00000001
>> =A0#define ASUS_WMI_DSTS_UNKNOWN_BIT =A0 =A0 =A00x00000002
>> @@ -1372,6 +1375,7 @@ static ssize_t show_sys_wmi(struct asus_wmi *a=
sus, int devid, char *buf)
>> =A0ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS_WMI_DEVID_TOUCHP=
AD);
>> =A0ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA);
>> =A0ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADE=
R);
>> +ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RE=
SUME);
>>
>> =A0static ssize_t store_cpufv(struct device *dev, struct device_attr=
ibute *attr,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *buf,=
 size_t count)
>> @@ -1397,6 +1401,7 @@ static struct attribute *platform_attributes[]=
 =3D {
>> =A0 =A0 =A0 =A0&dev_attr_camera.attr,
>> =A0 =A0 =A0 =A0&dev_attr_cardr.attr,
>> =A0 =A0 =A0 =A0&dev_attr_touchpad.attr,
>> + =A0 =A0 =A0 &dev_attr_lid_resume.attr,
>> =A0 =A0 =A0 =A0NULL
>> =A0};
>>
>> @@ -1415,6 +1420,8 @@ static umode_t asus_sysfs_is_visible(struct ko=
bject *kobj,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0devid =3D ASUS_WMI_DEVID_CARDREADER;
>> =A0 =A0 =A0 =A0else if (attr =3D=3D &dev_attr_touchpad.attr)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0devid =3D ASUS_WMI_DEVID_TOUCHPAD;
>> + =A0 =A0 =A0 else if (attr =3D=3D &dev_attr_lid_resume.attr)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 devid =3D ASUS_WMI_DEVID_LID_RESUME;
>>
>> =A0 =A0 =A0 =A0if (devid !=3D -1)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ok =3D !(asus_wmi_get_devstate_simple=
(asus, devid) < 0);
>> @@ -1488,6 +1495,9 @@ static int asus_wmi_platform_init(struct asus_=
wmi *asus)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0asus_wmi_set_devstate(ASUS_WMI_DEVID_=
CWAP,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0asus->driver->quirks->wapf, NULL);
>>
>> + =A0 =A0 =A0 /* Enable resume on lid open */
>> + =A0 =A0 =A0 asus_wmi_set_devstate(ASUS_WMI_DEVID_LID_RESUME, 1, &r=
v);
>
> Is this setting persistant on accross re-boot ? Is the setting expose=
d
> in the bios ?
> What is the default value (off I guess ?) ?
The setting persists after hot reboot, but will be reset after cold boo=
t.
And yes, the default value is off.
This setting is not exposed in the BIOS on the 2 models I have,
but for older  Asus EeePC(X101), we found there is an option for that.
Maybe it just because of the different BIOS team.

Considering that there might be an option in BIOS, so I remove the
code to enable
the wake on lid open while inserting the the module.
Userspace apps should handle this by themselves.

Best regards,
AceLan Kao.

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
