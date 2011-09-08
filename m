From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] acer-wmi: support Acer Aspire/eMachines 4739z
Date: Thu, 8 Sep 2011 10:30:18 +0800
Message-ID: <CAMz9Wg_xtTmhnQ8Kuj5hzom_iFP7GeOMco_0pNj2-1T=N_BJNw@mail.gmail.com>
References: <1315380728-22031-1-git-send-email-acelan.kao@canonical.com>
	<1315387833.8674.62.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f42.google.com ([209.85.216.42]:34322 "EHLO
	mail-qw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757485Ab1IHCaU convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Sep 2011 22:30:20 -0400
Received: by qwi4 with SMTP id 4so287351qwi.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Sep 2011 19:30:19 -0700 (PDT)
In-Reply-To: <1315387833.8674.62.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

Hi,

2011/9/7 joeyli <jlee@suse.com>:
> =A9=F3 =A4T=A1A2011-09-07 =A9=F3 15:32 +0800=A1AAceLan Kao =B4=A3=A8=EC=
=A1G
>> There are 2 kind of 4739Z, the one that vendor name is ACER sents ou=
t
>> the correct brightness key events, so we use the
>
> Current brightness key events means the Fn key direct send out key co=
de
> but not from wmi notify event?
Currently, most of the machines send out the correctly brightness key
code from EC,
so we don't have to handle them. The video ACPI will capture the
events and adjust
the brightness.
Acer Aspire 4739Z sends out the correct brightness key code as other
machines do.
Acer eMachines 4739Z doesn't sends out correct key codes, it sends out
meaningless
key codes, so we have to capture the brightness event from WMI and rema=
pping to
the correct key code and raise the correct key events to ACPI.

>
>> quirk_acer_travelmate_2490. And another one with eMachines as it's
>> vendor name follows Acer WMI spec. and doesn't sent out brightness k=
ey
>> events, so I added a new quirk, quirk_acer_aspire_4739z, for it, and
>> handle the key events in acer_wmi_notify().
>>
>> BTW, we need other key event types that defined in Acer WMI spec., s=
o
>> I added them in acer_wmi_event_ids enumerate.
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>>  drivers/platform/x86/acer-wmi.c |   69 ++++++++++++++++++++++++++++=
++++++++--
>>  1 files changed, 65 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/=
acer-wmi.c
>> index df730c9..257c7f2 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -94,6 +94,10 @@ MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D=
14026");
>>
>>  enum acer_wmi_event_ids {
>>       WMID_HOTKEY_EVENT =3D 0x1,
>> +     WMID_HOTKEY_BREAK_EVENT =3D 0x02,
>> +     WMID_GRAPHIC_SWITCH_EVENT =3D 0x03,
>
> Please change to 0x2 and 0x3 for consistency in this enum.
Okay, will do.

>
>> +     WMID_BRIGHTNESS_CHANGE_EVENT =3D 0x4,
>> +     WMID_SENSOR_EVENT =3D 0x5,
>>  };
>>
>>  static const struct key_entry acer_wmi_keymap[] =3D {
>> @@ -112,9 +116,9 @@ static const struct key_entry acer_wmi_keymap[] =
=3D {
>>       {KE_IGNORE, 0x45, {KEY_STOP} },
>>       {KE_IGNORE, 0x48, {KEY_VOLUMEUP} },
>>       {KE_IGNORE, 0x49, {KEY_VOLUMEDOWN} },
>> -     {KE_IGNORE, 0x61, {KEY_SWITCHVIDEOMODE} },
>> -     {KE_IGNORE, 0x62, {KEY_BRIGHTNESSUP} },
>> -     {KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },
>> +     {KE_KEY, 0x61, {KEY_SWITCHVIDEOMODE} },
>> +     {KE_KEY, 0x62, {KEY_BRIGHTNESSUP} },
>> +     {KE_KEY, 0x63, {KEY_BRIGHTNESSDOWN} },
>
> Why enable 0x61, 0x62 and 0x63? Does it for Aspire 4739z or eMachines
> 4739z?
It's only for eMachines now and only be activated when quirk->brightnes=
s =3D=3D 2.

> Why choice 0x61, 0x62 and 0x63?
> 0x61, 0x62 and 0x63 are from your machine's wmi notify event result?
They used to be those values, so I just enable them.
And indeed, Acer Aspire 4739Z reports those key codes, 0x62, 0x63, whil=
e
brightness key be pressed, so I think other machines might report the s=
ame key
codes, but they don't need to handle that.
acer-wmi doesn't handle brightness change event, so there will be an
error message
comes from acer_wmi_notify(), says "Unknown function number - 3 - xx", =
that's
why those value became ignored.

We can choose any value we like other than, 0x62, 0x63, since we don't =
care what
key codes are reported, I just need a mapping entry here, so that
I can use sparse_keymap_report_entry() later in acer_wmi_notify()
function to report
the correct brightness key events.

>
> But I didn't see the result from your following code.=3D
In acer_wmi_notify() function, I use the values, 0x62, 0x63, directly
to remap to the
correct brightness key code.

>
>>       {KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} }, /* Display Switch */
>>       {KE_IGNORE, 0x81, {KEY_SLEEP} },
>>       {KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} }, /* Touch Pad On/Off */
>> @@ -131,6 +135,15 @@ struct event_return_value {
>>       u32 reserved;
>>  } __attribute__((packed));
>>
>> +
>> +struct brightness_event_return_value {
>> +     u8 function;
>> +     u8 brightness_level1;
>> +     u8 brightness_level2;
>
> Please don't use brightness_level"1" or level"2", it confused to me o=
r
> other code reviewer and nobody can remember the definition after a
> couple of months.
> Please try to give them more meaningful names.
Got it.

>
>> +     u8 reserved;
>> +     u32 reserved2;
>> +} __attribute__((packed));
>> +
>>  /*
>>   * GUID3 Get Device Status device flags
>>   */
>> @@ -199,6 +212,7 @@ enum interface_flags {
>>  #define ACER_DEFAULT_THREEG    0
>>
>>  static int max_brightness =3D 0xF;
>> +static int cur_brightness=3D 9;
>>
>
> Why should you control the current brightness level but not control b=
y
> _BCL/_BCM in DSDT?
The value here is just recording the current brightness.
Because we don't know which key the user pressed, we just know the
brightness change event happened and what the new brightness value is,
so we should record the current brightness value and then compare to th=
e
new value, so that we could know the brightness up or down key be press=
ed.

Although, in the WMI spec., the brightness value is defined from 0x0 ~ =
0x64,
what I observed is 0 ~ 9, so I assume that the default brightness is 9,=
 the max.
The value could be wrong for the first time adjusting the brightness, t=
hat's not
perfect, but acceptable I think.

>
>>  static int mailled =3D -1;
>>  static int brightness =3D -1;
>> @@ -310,6 +324,10 @@ static struct quirk_entry quirk_lenovo_ideapad_=
s205 =3D {
>>       .wireless =3D 3,
>>  };
>>
>> +static struct quirk_entry quirk_acer_aspire_4739z=3D {
>> +     .brightness =3D 2,
>> +};
>> +
>>  /* The Aspire One has a dummy ACPI-WMI interface - disable it */
>>  static struct dmi_system_id __devinitdata acer_blacklist[] =3D {
>>       {
>> @@ -368,6 +386,24 @@ static struct dmi_system_id acer_quirks[] =3D {
>>       },
>>       {
>>               .callback =3D dmi_matched,
>> +             .ident =3D "Acer Aspire 4739Z",
>> +             .matches =3D {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
>> +             },
>> +             .driver_data =3D &quirk_acer_travelmate_2490,
>> +     },
>
> Why "Acer Aspire 4739Z" set to quirk the same with travelmate 2490?
> There only have a mailled capability flag in this quirk, why you used
> it?
> Does that because Aspire 4739Z also have mail hotkey button?
>
> If the answer is NO, then don't need add a new quirk.
Sorry, I missunderstanding it, there is no mailled on it, I'll remove i=
t.

>
>> +     {
>> +             .callback =3D dmi_matched,
>> +             .ident =3D "Acer eMachines 4739Z",
>> +             .matches =3D {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "eMachines"),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
>> +             },
>> +             .driver_data =3D &quirk_acer_aspire_4739z,
>> +     },
>> +     {
>> +             .callback =3D dmi_matched,
>>               .ident =3D "Acer Aspire 5100",
>>               .matches =3D {
>>                       DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>> @@ -1446,7 +1482,7 @@ static void acer_rfkill_exit(void)
>>  static ssize_t show_bool_threeg(struct device *dev,
>>       struct device_attribute *attr, char *buf)
>>  {
>> -     u32 result; \
>> +     u32 result;
>>       acpi_status status;
>>
>>       pr_info("This threeg sysfs will be removed in 2012"
>> @@ -1501,6 +1537,7 @@ static void acer_wmi_notify(u32 value, void *c=
ontext)
>>       struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL }=
;
>>       union acpi_object *obj;
>>       struct event_return_value return_value;
>> +     struct brightness_event_return_value brightness_return_value;
>>       acpi_status status;
>>       u16 device_state;
>>       const struct key_entry *key;
>> @@ -1531,6 +1568,7 @@ static void acer_wmi_notify(u32 value, void *c=
ontext)
>>
>>       switch (return_value.function) {
>>       case WMID_HOTKEY_EVENT:
>> +     case WMID_HOTKEY_BREAK_EVENT:
>>               device_state =3D return_value.device_state;
>>               pr_debug("device state: 0x%x\n", device_state);
>>
>> @@ -1558,6 +1596,29 @@ static void acer_wmi_notify(u32 value, void *=
context)
>>                                                  1, true);
>>               }
>>               break;
>> +     case WMID_BRIGHTNESS_CHANGE_EVENT:
>> +             // to avoid the brightness event be handled twice
>> +             if( quirks->brightness !=3D 2)
>> +                     break;
>> +             brightness_return_value =3D *((struct brightness_event=
_return_value *)&return_value);
>> +             /* brightness is decreasing */
>> +             if( cur_brightness > brightness_return_value.brightnes=
s_level1)
>> +                     key =3D sparse_keymap_entry_from_scancode(acer=
_wmi_input_dev, 0x63);
>> +             /* brightness is increasing */
>> +             else if( cur_brightness < brightness_return_value.brig=
htness_level1)
>> +                     key =3D sparse_keymap_entry_from_scancode(acer=
_wmi_input_dev, 0x62);
>> +             /* brightness is already at the bottom */
>> +             else if( cur_brightness =3D=3D 0)
>> +                     key =3D sparse_keymap_entry_from_scancode(acer=
_wmi_input_dev, 0x63);
>> +             /* brightness is already at the top */
>> +             else if( cur_brightness =3D=3D 9)
>> +                     key =3D sparse_keymap_entry_from_scancode(acer=
_wmi_input_dev, 0x62);
>> +
>> +             sparse_keymap_report_entry(acer_wmi_input_dev, key, 1,=
 true);
>> +             cur_brightness=3D return_value.key_num;
>> +             break;
>
> The same,
> why should you control the brightness level number in acer-wmi driver=
?
> Does it not control by acpi video driver and _BCL/_BCM in DSDT?
>
> And, why choice 0x62, 0x63? The above 2 number is not from your wmi
> notify result, why use them?
The problem is that the BIOS/EC doesn't send out the correct brightness
key events, the BIOS engineer just choose non-used values for those key=
s
that are defined in Acer WMI spec. Because they think those key events
should be captured from WMI, not from BIOS/EC.
So that, we have to read the brightness change event from WMI key event=
s.
And then use the ACPI way to adjust the brightness.

>
>> +     case WMID_GRAPHIC_SWITCH_EVENT:
>> +     case WMID_SENSOR_EVENT:
>>       default:
>>               pr_warn("Unknown function number - %d - %d\n",
>>                       return_value.function, return_value.key_num);
>
>
> Thank's a lot!
> Joey Lee
>
>

Best regards,
AceLan Kao.

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
