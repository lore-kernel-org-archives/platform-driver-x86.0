From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 2/3] asus-wmi: report brightness key events
Date: Mon, 12 Mar 2012 09:34:38 +0800
Message-ID: <CAMz9Wg9g=ifbNKnAjubfHzos7aOwTd7RV7DsgAnPu5R=dvTrXw@mail.gmail.com>
References: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
	<1331259429-6216-3-git-send-email-acelan.kao@canonical.com>
	<CAHR064jnpNcoL3XnounWq=iV0ZPrUGeuzxw6Dzfksj5unS_PTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:42743 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753412Ab2CLBej convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 11 Mar 2012 21:34:39 -0400
Received: by wibhq7 with SMTP id hq7so2975350wib.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Mar 2012 18:34:38 -0700 (PDT)
In-Reply-To: <CAHR064jnpNcoL3XnounWq=iV0ZPrUGeuzxw6Dzfksj5unS_PTQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

No, I don't use acpi_backlight=3Dvendor or something like that.
And there is no ACPI backlight functions in the BIOS.
Yes, we just need to inform the userspace to update the backlight
brightness status,
and I found that using backlight_notify doesn't work, so I let it send
the key event directly.

Best regards,
AceLan Kao.

2012/3/9 Corentin Chary <corentin.chary@gmail.com>:
> On Fri, Mar 9, 2012 at 3:17 AM, AceLan Kao <acelan.kao@canonical.com>=
 wrote:
>> Some ASUS ET2012 All-in-One machines will handle the brightness even=
ts
>> from BIOS, but we still need the key events to inform X to draw the
>> brightness OSD.
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>> =A0drivers/platform/x86/asus-wmi.c =A0| =A0 =A08 +++++++-
>> =A0drivers/platform/x86/asus-wmi.h =A0| =A0 =A01 +
>> =A0drivers/platform/x86/eeepc-wmi.c | =A0 =A07 ++++++-
>> =A03 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
>> index 48e96f3..80c05ff 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -1272,7 +1272,13 @@ static void asus_wmi_notify(u32 value, void *=
context)
>>
>> =A0 =A0 =A0 =A0if (code =3D=3D NOTIFY_BRNUP_MIN || code =3D=3D NOTIF=
Y_BRNDOWN_MIN) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!acpi_video_backlight_support())
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 asus_wmi_backlight_not=
ify(asus, orig_code);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(asus->dri=
ver->need_brightness_event))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sparse=
_keymap_report_event(asus->inputdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 code, key_value, autorelease);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 asus_w=
mi_backlight_notify(asus, orig_code);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> If events are already handled by the BIOS you need to use
> backlight_notify. Keys are only sent when userspace need to update th=
e
> backlight by itself. The GUI should only use uevents sent by the
> backlight device.
> Is the generic ACPI backlight functional ? Do you have to use
> acpi_backlight=3Dvendor ?
>
>> =A0 =A0 =A0 =A0} else if (!sparse_keymap_report_event(asus->inputdev=
, code,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 key_value, autorelease))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_info("Unknown key %x pressed\n", c=
ode);
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/=
asus-wmi.h
>> index 45fb62c..d6683ba 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -38,6 +38,7 @@ struct asus_wmi;
>> =A0struct asus_wmi_driver {
>> =A0 =A0 =A0 =A0bool =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hotplug_w=
ireless;
>> =A0 =A0 =A0 =A0bool =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0scalar_pa=
nel_brightness;
>> + =A0 =A0 =A0 bool =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0need_brigh=
tness_event;
>> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wapf;
>>
>> =A0 =A0 =A0 =A0const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*name;
>> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86=
/eeepc-wmi.c
>> index c5f4c64..311f317 100644
>> --- a/drivers/platform/x86/eeepc-wmi.c
>> +++ b/drivers/platform/x86/eeepc-wmi.c
>> @@ -63,6 +63,8 @@ MODULE_PARM_DESC(hotplug_wireless,
>>
>> =A0static const struct key_entry eeepc_wmi_keymap[] =3D {
>> =A0 =A0 =A0 =A0/* Sleep already handled via generic ACPI code */
>> + =A0 =A0 =A0 { KE_KEY, 0x11, { KEY_BRIGHTNESSUP } },
>> + =A0 =A0 =A0 { KE_KEY, 0x20, { KEY_BRIGHTNESSDOWN } },
>> =A0 =A0 =A0 =A0{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
>> =A0 =A0 =A0 =A0{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
>> =A0 =A0 =A0 =A0{ KE_KEY, 0x32, { KEY_MUTE } },
>> @@ -167,7 +169,9 @@ static void eeepc_dmi_check(struct asus_wmi_driv=
er *driver)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char oemstring[30];
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while ((dev =3D dmi_find_device(DMI_D=
EV_TYPE_OEM_STRING, NULL, dev))) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (sscanf(dev->name,=
 "AEMS%24c", oemstring) =3D=3D 1) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (oe=
mstring[18] =3D=3D '3')
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (oe=
mstring[18] =3D=3D '1')
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 driver->need_brightness_event =3D true;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else i=
f (oemstring[18] =3D=3D '3')
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0driver->scalar_panel_brightness =3D true;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break=
;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> @@ -179,6 +183,7 @@ static void eeepc_wmi_quirks(struct asus_wmi_dri=
ver *driver)
>> =A0{
>> =A0 =A0 =A0 =A0driver->hotplug_wireless =3D hotplug_wireless;
>> =A0 =A0 =A0 =A0driver->scalar_panel_brightness =3D false;
>> + =A0 =A0 =A0 driver->need_brightness_event =3D false;
>> =A0 =A0 =A0 =A0driver->wapf =3D -1;
>> =A0 =A0 =A0 =A0eeepc_dmi_check(driver);
>> =A0}
>> --
>> 1.7.9
>>
>
>
>
> --
> Corentin Chary
> http://xf.iksaif.net



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
