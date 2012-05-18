From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] asus-wmi: control backlight power through WMI, not ACPI
Date: Fri, 18 May 2012 14:48:49 +0800
Message-ID: <CAMz9Wg8pibKD0GfaAXUbRLxAkGu=j-0WOKzTqvNBrFSmQVnXnw@mail.gmail.com>
References: <1337161162-27792-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064jGFxZtOYJDNu1qOsyxrxBJ-ckqzotgKrZvLLyQvJ81Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:53373 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761946Ab2ERGsu convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 02:48:50 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so2472988wgb.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 May 2012 23:48:50 -0700 (PDT)
In-Reply-To: <CAHR064jGFxZtOYJDNu1qOsyxrxBJ-ckqzotgKrZvLLyQvJ81Rg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

2012/5/18 Corentin Chary <corentincj@iksaif.net>:
> On Wed, May 16, 2012 at 11:39 AM, AceLan Kao <acelan.kao@canonical.co=
m> wrote:
>> BugLink: https://bugs.launchpad.net/bugs/1000146
>>
>> Some h/w that can adjust screen brightness through ACPI functions, b=
ut
>> can't turn on/off the backlight power correctly. So, we list those h=
/w in
>> quirks and try to turn on/off the backlight power through WMI.
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>> =A0drivers/platform/x86/asus-wmi.c =A0| =A0 =A09 ++++++++-
>> =A0drivers/platform/x86/asus-wmi.h =A0| =A0 =A01 +
>> =A0drivers/platform/x86/eeepc-wmi.c | =A0 23 +++++++++++++++++++++++
>> =A03 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
>> index 77aadde..beda7fc 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -69,6 +69,7 @@ MODULE_LICENSE("GPL");
>> =A0#define NOTIFY_BRNDOWN_MAX =A0 =A0 =A0 =A0 =A0 =A0 0x2e
>> =A0#define NOTIFY_KBD_BRTUP =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xc4
>> =A0#define NOTIFY_KBD_BRTDWN =A0 =A0 =A0 =A0 =A0 =A0 =A00xc5
>> +#define NOTIFY_BACKLIGHT_POWER =A0 =A0 =A0 =A0 0xe9
>>
>> =A0/* WMI Methods */
>> =A0#define ASUS_WMI_METHODID_SPEC =A0 =A0 =A0 =A0 0x43455053 /* BIOS=
 SPECification */
>> @@ -1288,6 +1289,11 @@ static void asus_wmi_notify(u32 value, void *=
context)
>> =A0 =A0 =A0 =A0if (code =3D=3D NOTIFY_BRNUP_MIN || code =3D=3D NOTIF=
Y_BRNDOWN_MIN) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!acpi_video_backlight_support())
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0asus_wmi_backlight_no=
tify(asus, orig_code);
>> + =A0 =A0 =A0 } else if (asus->driver->quirks->wmi_backlight_power &=
&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0code =3D=3D NOTIFY_BACKLIGHT_PO=
WER) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct backlight_device *bd =3D asus->=
backlight_device;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bd->props.power =3D !bd->props.power;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 backlight_update_status(bd);
>> =A0 =A0 =A0 =A0} else if (!sparse_keymap_report_event(asus->inputdev=
, code,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 key_value, autorelease))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_info("Unknown key %x pressed\n", c=
ode);
>> @@ -1681,7 +1687,8 @@ static int asus_wmi_add(struct platform_device=
 *pdev)
>> =A0 =A0 =A0 =A0if (err)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_rfkill;
>>
>> - =A0 =A0 =A0 if (!acpi_video_backlight_support()) {
>> + =A0 =A0 =A0 if (!acpi_video_backlight_support() ||
>> + =A0 =A0 =A0 =A0 =A0 asus->driver->quirks->wmi_backlight_power) {
>
> So you override any acpi_backlight=3D[vendor|video] settings ? That
> doesn't looks right.
> Can't you just send KEY_DISPLAYTOGGLE when the key is pressed, and le=
t
> userspace adjust the proper /sys/class/backlight file ?
Userspace app, such as gnome-settings-daemon, will use
/sys/class/backlight/acpi_video0
as it's first choice if there is one.
But ACPI function to toggle the backlight power is not working, and
from our BIOS engineer,
ACPI doesn't define the backlight power section, but ASUS WMI does.
So, I think it would have less problem to turn on/off backlight power
through WMI.

And, yes, calling asus_wmi_backlight_init() is not a good idea here.
We have to record the backlight power status by ourselves if we didn't =
call it.
Let me show you another version of patch later.

> What does the key do exactly without driver ? Does it just send a
> notification or does it also poke the hardware ?
It's a WMI event notify, and will be mapped to the key shown below
        { KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
Just a notification.

>
>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D asus_wmi_backlight_init(asus)=
;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err && err !=3D -ENODEV)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_backlight;
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/=
asus-wmi.h
>> index d43b667..9c1da8b 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -39,6 +39,7 @@ struct quirk_entry {
>> =A0 =A0 =A0 =A0bool hotplug_wireless;
>> =A0 =A0 =A0 =A0bool scalar_panel_brightness;
>> =A0 =A0 =A0 =A0bool store_backlight_power;
>> + =A0 =A0 =A0 bool wmi_backlight_power;
>> =A0 =A0 =A0 =A0int wapf;
>> =A0};
>>
>> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86=
/eeepc-wmi.c
>> index 6567613..8d31f4e 100644
>> --- a/drivers/platform/x86/eeepc-wmi.c
>> +++ b/drivers/platform/x86/eeepc-wmi.c
>> @@ -107,6 +107,11 @@ static struct quirk_entry quirk_asus_et2012_typ=
e3 =3D {
>> =A0 =A0 =A0 =A0.store_backlight_power =3D true,
>> =A0};
>>
>> +static struct quirk_entry quirk_asus_x101ch =3D {
>> + =A0 =A0 =A0 /* We need this when ACPI function doesn't do this wel=
l */
>> + =A0 =A0 =A0 .wmi_backlight_power =3D true,
>> +};
>> +
>> =A0static struct quirk_entry *quirks;
>>
>> =A0static void et2012_quirks(void)
>> @@ -157,6 +162,24 @@ static struct dmi_system_id asus_quirks[] =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.driver_data =3D &quirk_asus_unknown,
>> =A0 =A0 =A0 =A0},
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "ASUSTeK Computer INC. X101=
CH",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VEND=
OR, "ASUSTeK COMPUTER INC."),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_=
NAME, "X101CH"),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_asus_x101ch,
>> + =A0 =A0 =A0 },
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "ASUSTeK Computer INC. 1015=
CX",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VEND=
OR, "ASUSTeK COMPUTER INC."),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_=
NAME, "1015CX"),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_asus_x101ch,
>> + =A0 =A0 =A0 },
>> =A0 =A0 =A0 =A0{},
>> =A0};
>>
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-d=
river-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
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
