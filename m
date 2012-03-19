From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 3/3 v3] asus-nb-wmi: move WAPF variable into quirks_entry
Date: Mon, 19 Mar 2012 17:46:32 +0800
Message-ID: <CAMz9Wg9e6GVYi9THaKywzYK4_2gzWaCscH7f=yzwawBVOkE8zw@mail.gmail.com>
References: <1332138824-9673-1-git-send-email-acelan.kao@canonical.com>
	<1332138824-9673-3-git-send-email-acelan.kao@canonical.com>
	<CAHR064jE6auZFvkQYJ0hELcBaWNWDCv=CkOt2W4QZODDmpLowQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:42538 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752585Ab2CSJqe convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 05:46:34 -0400
Received: by wgbdr13 with SMTP id dr13so797081wgb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 02:46:32 -0700 (PDT)
In-Reply-To: <CAHR064jE6auZFvkQYJ0hELcBaWNWDCv=CkOt2W4QZODDmpLowQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

2012/3/19 Corentin Chary <corentin.chary@gmail.com>:
> On Mon, Mar 19, 2012 at 7:33 AM, AceLan Kao <acelan.kao@canonical.com=
> wrote:
>> Some models work better with different values of wapf, so move the
>> variable into quriks_entry to make it more easy to give a specific
>> value to different models.
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>> =A0drivers/platform/x86/asus-nb-wmi.c | =A0 =A02 +-
>> =A0drivers/platform/x86/asus-wmi.c =A0 =A0| =A0 =A04 ++--
>> =A0drivers/platform/x86/asus-wmi.h =A0 =A0| =A0 =A02 +-
>> =A0drivers/platform/x86/eeepc-wmi.c =A0 | =A0 =A02 +-
>> =A04 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x=
86/asus-nb-wmi.c
>> index 396dafc..9dd7b93 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -53,7 +53,7 @@ MODULE_PARM_DESC(wapf, "WAPF value");
>>
>> =A0static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
>> =A0{
>
> Missing "driver->quirks =3D asus_unknown_quriks" (or similar). quirks=
 is
> NULL here, and the module will segfault (unfortunatly I tried without
> reading the code and it did :p).

So sorry about that, I'm not aware of the loading sequence of the
asus-nb-wmi module,
I thought it can see drivers->quirks which assigned from eeepc-wmi modu=
le.
If I allocate a new asus_unknown_quirks here, then it might be
overwriten by eeepc-wmi later,
if both of the modules will be loaded.
Moreover, asus-nb-wmi should have the ability to access the
asus_quirks defined in eeepc-wmi,
so, the better way to do this is the detect_quirks function pointer
should point to the same function
in the eeepc-wmi.
Do you have any good idea of this?

>
>> - =A0 =A0 =A0 driver->wapf =3D wapf;
>> + =A0 =A0 =A0 driver->quirks->wapf =3D wapf;
>> =A0}
>>
>> =A0static const struct key_entry asus_nb_wmi_keymap[] =3D {
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
>> index 9cd459a..1d2047d 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -1471,9 +1471,9 @@ static int asus_wmi_platform_init(struct asus_=
wmi *asus)
>>
>> =A0 =A0 =A0 =A0/* CWAP allow to define the behavior of the Fn+F2 key=
,
>> =A0 =A0 =A0 =A0 * this method doesn't seems to be present on Eee PCs=
 */
>> - =A0 =A0 =A0 if (asus->driver->wapf >=3D 0)
>> + =A0 =A0 =A0 if (asus->driver->quirks->wapf >=3D 0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0asus_wmi_set_devstate(ASUS_WMI_DEVID_=
CWAP,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 asus->driver->wapf, NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 asus->driver->quirks->wapf, NULL);
>>
>> =A0 =A0 =A0 =A0return asus_wmi_sysfs_init(asus->platform_device);
>> =A0}
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/=
asus-wmi.h
>> index 35003e4..d43b667 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -39,10 +39,10 @@ struct quirk_entry {
>> =A0 =A0 =A0 =A0bool hotplug_wireless;
>> =A0 =A0 =A0 =A0bool scalar_panel_brightness;
>> =A0 =A0 =A0 =A0bool store_backlight_power;
>> + =A0 =A0 =A0 int wapf;
>> =A0};
>>
>> =A0struct asus_wmi_driver {
>> - =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wapf;
>> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 brightnes=
s;
>> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 panel_pow=
er;
>>
>> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86=
/eeepc-wmi.c
>> index c1a0ac0..7e15d54 100644
>> --- a/drivers/platform/x86/eeepc-wmi.c
>> +++ b/drivers/platform/x86/eeepc-wmi.c
>> @@ -207,10 +207,10 @@ static int eeepc_wmi_probe(struct platform_dev=
ice *pdev)
>> =A0static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
>> =A0{
>> =A0 =A0 =A0 =A0quirks =3D driver->quirks;
>> - =A0 =A0 =A0 driver->wapf =3D -1;
>> =A0 =A0 =A0 =A0driver->panel_power =3D FB_BLANK_UNBLANK;
>> =A0 =A0 =A0 =A0driver->quirks =3D &quirk_asus_unknown;
>> =A0 =A0 =A0 =A0driver->quirks->hotplug_wireless =3D hotplug_wireless=
;
>> + =A0 =A0 =A0 driver->quirks->wapf =3D -1;
>> =A0 =A0 =A0 =A0dmi_check_system(asus_quirks);
>> =A0}
>>
>> --
>> 1.7.9.1
>>
>
>
>
> --
> Corentin Chary
> http://xf.iksaif.net
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
