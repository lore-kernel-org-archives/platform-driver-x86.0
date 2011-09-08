From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] acer-wmi: support Acer Aspire/eMachines 4739z
Date: Thu, 8 Sep 2011 11:15:55 +0800
Message-ID: <CAMz9Wg_bdoKw=QzgNiYySrbJrgkvu8psf00GAsa+Y70D-=shdQ@mail.gmail.com>
References: <1315380728-22031-1-git-send-email-acelan.kao@canonical.com>
	<1315387833.8674.62.camel@linux-s257.site>
	<CAMz9Wg_xtTmhnQ8Kuj5hzom_iFP7GeOMco_0pNj2-1T=N_BJNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001485f881b499195904ac657a1f
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:37837 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932080Ab1IHDP4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Sep 2011 23:15:56 -0400
Received: by qyk7 with SMTP id 7so85869qyk.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Sep 2011 20:15:55 -0700 (PDT)
In-Reply-To: <CAMz9Wg_xtTmhnQ8Kuj5hzom_iFP7GeOMco_0pNj2-1T=N_BJNw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

--001485f881b499195904ac657a1f
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: quoted-printable

Hi,

The new patch is as attached.

Best regards,
AceLan Kao.

=A6b 2011=A6~9=A4=EB8=A4=E9=A4W=A4=C810:30=A1AAceLan Kao <acelan.kao@canoni=
cal.com> =BCg=B9D=A1G
> Hi,
>
> 2011/9/7 joeyli <jlee@suse.com>:
>> =A9=F3 =A4T=A1A2011-09-07 =A9=F3 15:32 +0800=A1AAceLan Kao =B4=A3=A8=EC=
=A1G
>>> There are 2 kind of 4739Z, the one that vendor name is ACER sents out
>>> the correct brightness key events, so we use the
>>
>> Current brightness key events means the Fn key direct send out key code
>> but not from wmi notify event?
> Currently, most of the machines send out the correctly brightness key
> code from EC,
> so we don't have to handle them. The video ACPI will capture the
> events and adjust
> the brightness.
> Acer Aspire 4739Z sends out the correct brightness key code as other
> machines do.
> Acer eMachines 4739Z doesn't sends out correct key codes, it sends out
> meaningless
> key codes, so we have to capture the brightness event from WMI and remapp=
ing to
> the correct key code and raise the correct key events to ACPI.
>
>>
>>> quirk_acer_travelmate_2490. And another one with eMachines as it's
>>> vendor name follows Acer WMI spec. and doesn't sent out brightness key
>>> events, so I added a new quirk, quirk_acer_aspire_4739z, for it, and
>>> handle the key events in acer_wmi_notify().
>>>
>>> BTW, we need other key event types that defined in Acer WMI spec., so
>>> I added them in acer_wmi_event_ids enumerate.
>>>
>>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>>> ---
>>>  drivers/platform/x86/acer-wmi.c |   69 +++++++++++++++++++++++++++++++=
+++++--
>>>  1 files changed, 65 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
>>> index df730c9..257c7f2 100644
>>> --- a/drivers/platform/x86/acer-wmi.c
>>> +++ b/drivers/platform/x86/acer-wmi.c
>>> @@ -94,6 +94,10 @@ MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D140=
26");
>>>
>>>  enum acer_wmi_event_ids {
>>>       WMID_HOTKEY_EVENT =3D 0x1,
>>> +     WMID_HOTKEY_BREAK_EVENT =3D 0x02,
>>> +     WMID_GRAPHIC_SWITCH_EVENT =3D 0x03,
>>
>> Please change to 0x2 and 0x3 for consistency in this enum.
> Okay, will do.
>
>>
>>> +     WMID_BRIGHTNESS_CHANGE_EVENT =3D 0x4,
>>> +     WMID_SENSOR_EVENT =3D 0x5,
>>>  };
>>>
>>>  static const struct key_entry acer_wmi_keymap[] =3D {
>>> @@ -112,9 +116,9 @@ static const struct key_entry acer_wmi_keymap[] =3D=
 {
>>>       {KE_IGNORE, 0x45, {KEY_STOP} },
>>>       {KE_IGNORE, 0x48, {KEY_VOLUMEUP} },
>>>       {KE_IGNORE, 0x49, {KEY_VOLUMEDOWN} },
>>> -     {KE_IGNORE, 0x61, {KEY_SWITCHVIDEOMODE} },
>>> -     {KE_IGNORE, 0x62, {KEY_BRIGHTNESSUP} },
>>> -     {KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },
>>> +     {KE_KEY, 0x61, {KEY_SWITCHVIDEOMODE} },
>>> +     {KE_KEY, 0x62, {KEY_BRIGHTNESSUP} },
>>> +     {KE_KEY, 0x63, {KEY_BRIGHTNESSDOWN} },
>>
>> Why enable 0x61, 0x62 and 0x63? Does it for Aspire 4739z or eMachines
>> 4739z?
> It's only for eMachines now and only be activated when quirk->brightness =
=3D=3D 2.
>
>> Why choice 0x61, 0x62 and 0x63?
>> 0x61, 0x62 and 0x63 are from your machine's wmi notify event result?
> They used to be those values, so I just enable them.
> And indeed, Acer Aspire 4739Z reports those key codes, 0x62, 0x63, while
> brightness key be pressed, so I think other machines might report the sam=
e key
> codes, but they don't need to handle that.
> acer-wmi doesn't handle brightness change event, so there will be an
> error message
> comes from acer_wmi_notify(), says "Unknown function number - 3 - xx", th=
at's
> why those value became ignored.
>
> We can choose any value we like other than, 0x62, 0x63, since we don't ca=
re what
> key codes are reported, I just need a mapping entry here, so that
> I can use sparse_keymap_report_entry() later in acer_wmi_notify()
> function to report
> the correct brightness key events.
>
>>
>> But I didn't see the result from your following code.=3D
> In acer_wmi_notify() function, I use the values, 0x62, 0x63, directly
> to remap to the
> correct brightness key code.
>
>>
>>>       {KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} }, /* Display Switch */
>>>       {KE_IGNORE, 0x81, {KEY_SLEEP} },
>>>       {KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} }, /* Touch Pad On/Off */
>>> @@ -131,6 +135,15 @@ struct event_return_value {
>>>       u32 reserved;
>>>  } __attribute__((packed));
>>>
>>> +
>>> +struct brightness_event_return_value {
>>> +     u8 function;
>>> +     u8 brightness_level1;
>>> +     u8 brightness_level2;
>>
>> Please don't use brightness_level"1" or level"2", it confused to me or
>> other code reviewer and nobody can remember the definition after a
>> couple of months.
>> Please try to give them more meaningful names.
> Got it.
>
>>
>>> +     u8 reserved;
>>> +     u32 reserved2;
>>> +} __attribute__((packed));
>>> +
>>>  /*
>>>   * GUID3 Get Device Status device flags
>>>   */
>>> @@ -199,6 +212,7 @@ enum interface_flags {
>>>  #define ACER_DEFAULT_THREEG    0
>>>
>>>  static int max_brightness =3D 0xF;
>>> +static int cur_brightness=3D 9;
>>>
>>
>> Why should you control the current brightness level but not control by
>> _BCL/_BCM in DSDT?
> The value here is just recording the current brightness.
> Because we don't know which key the user pressed, we just know the
> brightness change event happened and what the new brightness value is,
> so we should record the current brightness value and then compare to the
> new value, so that we could know the brightness up or down key be pressed=
.
>
> Although, in the WMI spec., the brightness value is defined from 0x0 ~ 0x=
64,
> what I observed is 0 ~ 9, so I assume that the default brightness is 9, t=
he max.
> The value could be wrong for the first time adjusting the brightness, tha=
t's not
> perfect, but acceptable I think.
>
>>
>>>  static int mailled =3D -1;
>>>  static int brightness =3D -1;
>>> @@ -310,6 +324,10 @@ static struct quirk_entry quirk_lenovo_ideapad_s20=
5 =3D {
>>>       .wireless =3D 3,
>>>  };
>>>
>>> +static struct quirk_entry quirk_acer_aspire_4739z=3D {
>>> +     .brightness =3D 2,
>>> +};
>>> +
>>>  /* The Aspire One has a dummy ACPI-WMI interface - disable it */
>>>  static struct dmi_system_id __devinitdata acer_blacklist[] =3D {
>>>       {
>>> @@ -368,6 +386,24 @@ static struct dmi_system_id acer_quirks[] =3D {
>>>       },
>>>       {
>>>               .callback =3D dmi_matched,
>>> +             .ident =3D "Acer Aspire 4739Z",
>>> +             .matches =3D {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
>>> +             },
>>> +             .driver_data =3D &quirk_acer_travelmate_2490,
>>> +     },
>>
>> Why "Acer Aspire 4739Z" set to quirk the same with travelmate 2490?
>> There only have a mailled capability flag in this quirk, why you used
>> it?
>> Does that because Aspire 4739Z also have mail hotkey button?
>>
>> If the answer is NO, then don't need add a new quirk.
> Sorry, I missunderstanding it, there is no mailled on it, I'll remove it.
>
>>
>>> +     {
>>> +             .callback =3D dmi_matched,
>>> +             .ident =3D "Acer eMachines 4739Z",
>>> +             .matches =3D {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "eMachines"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
>>> +             },
>>> +             .driver_data =3D &quirk_acer_aspire_4739z,
>>> +     },
>>> +     {
>>> +             .callback =3D dmi_matched,
>>>               .ident =3D "Acer Aspire 5100",
>>>               .matches =3D {
>>>                       DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>>> @@ -1446,7 +1482,7 @@ static void acer_rfkill_exit(void)
>>>  static ssize_t show_bool_threeg(struct device *dev,
>>>       struct device_attribute *attr, char *buf)
>>>  {
>>> -     u32 result; \
>>> +     u32 result;
>>>       acpi_status status;
>>>
>>>       pr_info("This threeg sysfs will be removed in 2012"
>>> @@ -1501,6 +1537,7 @@ static void acer_wmi_notify(u32 value, void *cont=
ext)
>>>       struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
>>>       union acpi_object *obj;
>>>       struct event_return_value return_value;
>>> +     struct brightness_event_return_value brightness_return_value;
>>>       acpi_status status;
>>>       u16 device_state;
>>>       const struct key_entry *key;
>>> @@ -1531,6 +1568,7 @@ static void acer_wmi_notify(u32 value, void *cont=
ext)
>>>
>>>       switch (return_value.function) {
>>>       case WMID_HOTKEY_EVENT:
>>> +     case WMID_HOTKEY_BREAK_EVENT:
>>>               device_state =3D return_value.device_state;
>>>               pr_debug("device state: 0x%x\n", device_state);
>>>
>>> @@ -1558,6 +1596,29 @@ static void acer_wmi_notify(u32 value, void *con=
text)
>>>                                                  1, true);
>>>               }
>>>               break;
>>> +     case WMID_BRIGHTNESS_CHANGE_EVENT:
>>> +             // to avoid the brightness event be handled twice
>>> +             if( quirks->brightness !=3D 2)
>>> +                     break;
>>> +             brightness_return_value =3D *((struct brightness_event_re=
turn_value *)&return_value);
>>> +             /* brightness is decreasing */
>>> +             if( cur_brightness > brightness_return_value.brightness_l=
evel1)
>>> +                     key =3D sparse_keymap_entry_from_scancode(acer_wm=
i_input_dev, 0x63);
>>> +             /* brightness is increasing */
>>> +             else if( cur_brightness < brightness_return_value.brightn=
ess_level1)
>>> +                     key =3D sparse_keymap_entry_from_scancode(acer_wm=
i_input_dev, 0x62);
>>> +             /* brightness is already at the bottom */
>>> +             else if( cur_brightness =3D=3D 0)
>>> +                     key =3D sparse_keymap_entry_from_scancode(acer_wm=
i_input_dev, 0x63);
>>> +             /* brightness is already at the top */
>>> +             else if( cur_brightness =3D=3D 9)
>>> +                     key =3D sparse_keymap_entry_from_scancode(acer_wm=
i_input_dev, 0x62);
>>> +
>>> +             sparse_keymap_report_entry(acer_wmi_input_dev, key, 1, tr=
ue);
>>> +             cur_brightness=3D return_value.key_num;
>>> +             break;
>>
>> The same,
>> why should you control the brightness level number in acer-wmi driver?
>> Does it not control by acpi video driver and _BCL/_BCM in DSDT?
>>
>> And, why choice 0x62, 0x63? The above 2 number is not from your wmi
>> notify result, why use them?
> The problem is that the BIOS/EC doesn't send out the correct brightness
> key events, the BIOS engineer just choose non-used values for those keys
> that are defined in Acer WMI spec. Because they think those key events
> should be captured from WMI, not from BIOS/EC.
> So that, we have to read the brightness change event from WMI key events.
> And then use the ACPI way to adjust the brightness.
>
>>
>>> +     case WMID_GRAPHIC_SWITCH_EVENT:
>>> +     case WMID_SENSOR_EVENT:
>>>       default:
>>>               pr_warn("Unknown function number - %d - %d\n",
>>>                       return_value.function, return_value.key_num);
>>
>>
>> Thank's a lot!
>> Joey Lee
>>
>>
>
> Best regards,
> AceLan Kao.
>
> --
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

--001485f881b499195904ac657a1f
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-acer-wmi-support-Acer-Aspire-eMachines-4739z.patch"
Content-Disposition: attachment;
	filename="0001-acer-wmi-support-Acer-Aspire-eMachines-4739z.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gsb601xc0

RnJvbSAxN2I5ZDAzYzE4MmRhNmM5ZGJhNGRjMzlkYTU4NTBlOGZhYzFkNDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBY2VMYW4gS2FvIDxhY2VsYW4ua2FvQGNhbm9uaWNhbC5jb20+
CkRhdGU6IFRodSwgOCBTZXAgMjAxMSAxMDo0MzowOCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGFj
ZXItd21pOiBzdXBwb3J0IEFjZXIgQXNwaXJlL2VNYWNoaW5lcyA0NzM5egoKVGhlcmUgYXJlIDIg
a2luZCBvZiA0NzM5WiwgdGhlIG9uZSB0aGF0IHZlbmRvciBuYW1lIGlzIEFDRVIgc2VudHMgb3V0
CnRoZSBjb3JyZWN0IGJyaWdodG5lc3Mga2V5IGV2ZW50cywgc28gd2UgZG9uJ3QgbmVlZCBxdWly
ayBmb3IgaXQuCkFuZCBhbm90aGVyIG9uZSB3aXRoIGVNYWNoaW5lcyBhcyBpdCdzIHZlbmRvciBu
YW1lIGZvbGxvd3MgQWNlciBXTUkgc3BlYy4KYW5kIGRvZXNuJ3Qgc2VudCBvdXQgYnJpZ2h0bmVz
cyBrZXkgZXZlbnRzLCBzbyBJIGFkZGVkIGEgbmV3IHF1aXJrLApxdWlya19hY2VyX2FzcGlyZV80
NzM5eiwgZm9yIGl0LCBhbmQgaGFuZGxlIHRoZSBrZXkgZXZlbnRzIGluCmFjZXJfd21pX25vdGlm
eSgpLgoKQlRXLCB3ZSBuZWVkIG90aGVyIGtleSBldmVudCB0eXBlcyB0aGF0IGRlZmluZWQgaW4g
QWNlciBXTUkgc3BlYy4sIHNvCkkgYWRkZWQgdGhlbSBpbiBhY2VyX3dtaV9ldmVudF9pZHMgZW51
bWVyYXRlLgoKU2lnbmVkLW9mZi1ieTogQWNlTGFuIEthbyA8YWNlbGFuLmthb0BjYW5vbmljYWwu
Y29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FjZXItd21pLmMgfCAgIDc3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2FjZXItd21pLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hY2VyLXdtaS5jCmluZGV4IGRm
NzMwYzkuLmEzNTMxNTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FjZXItd21p
LmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvYWNlci13bWkuYwpAQCAtOTQsNiArOTQsMTAg
QEAgTU9EVUxFX0FMSUFTKCJ3bWk6Njc2QUExNUUtNkE0Ny00RDlGLUEyQ0MtMUU2RDE4RDE0MDI2
Iik7CiAKIGVudW0gYWNlcl93bWlfZXZlbnRfaWRzIHsKIAlXTUlEX0hPVEtFWV9FVkVOVCA9IDB4
MSwKKwlXTUlEX0hPVEtFWV9CUkVBS19FVkVOVCA9IDB4MiwKKwlXTUlEX0dSQVBISUNfU1dJVENI
X0VWRU5UID0gMHgzLAorCVdNSURfQlJJR0hUTkVTU19DSEFOR0VfRVZFTlQgPSAweDQsCisJV01J
RF9TRU5TT1JfRVZFTlQgPSAweDUsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGtleV9lbnRy
eSBhY2VyX3dtaV9rZXltYXBbXSA9IHsKQEAgLTExMiw5ICsxMTYsOSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGtleV9lbnRyeSBhY2VyX3dtaV9rZXltYXBbXSA9IHsKIAl7S0VfSUdOT1JFLCAweDQ1
LCB7S0VZX1NUT1B9IH0sCiAJe0tFX0lHTk9SRSwgMHg0OCwge0tFWV9WT0xVTUVVUH0gfSwKIAl7
S0VfSUdOT1JFLCAweDQ5LCB7S0VZX1ZPTFVNRURPV059IH0sCi0Je0tFX0lHTk9SRSwgMHg2MSwg
e0tFWV9TV0lUQ0hWSURFT01PREV9IH0sCi0Je0tFX0lHTk9SRSwgMHg2Miwge0tFWV9CUklHSFRO
RVNTVVB9IH0sCi0Je0tFX0lHTk9SRSwgMHg2Mywge0tFWV9CUklHSFRORVNTRE9XTn0gfSwKKwl7
S0VfS0VZLCAweDYxLCB7S0VZX1NXSVRDSFZJREVPTU9ERX0gfSwKKwl7S0VfS0VZLCAweDYyLCB7
S0VZX0JSSUdIVE5FU1NVUH0gfSwKKwl7S0VfS0VZLCAweDYzLCB7S0VZX0JSSUdIVE5FU1NET1dO
fSB9LAogCXtLRV9LRVksIDB4NjQsIHtLRVlfU1dJVENIVklERU9NT0RFfSB9LAkvKiBEaXNwbGF5
IFN3aXRjaCAqLwogCXtLRV9JR05PUkUsIDB4ODEsIHtLRVlfU0xFRVB9IH0sCiAJe0tFX0tFWSwg
MHg4Miwge0tFWV9UT1VDSFBBRF9UT0dHTEV9IH0sCS8qIFRvdWNoIFBhZCBPbi9PZmYgKi8KQEAg
LTEzMSw2ICsxMzUsMTUgQEAgc3RydWN0IGV2ZW50X3JldHVybl92YWx1ZSB7CiAJdTMyIHJlc2Vy
dmVkOwogfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKTsKIAorCitzdHJ1Y3QgYnJpZ2h0bmVzc19l
dmVudCB7CisJdTggZnVuY3Rpb247CisJdTggYnJpZ2h0bmVzczsKKwl1OCBicmlnaHRuZXNzXzJu
ZF9kaXNwbGF5OworCXU4IHJlc2VydmVkOworCXUzMiByZXNlcnZlZDI7Cit9IF9fcGFja2VkOwor
CiAvKgogICogR1VJRDMgR2V0IERldmljZSBTdGF0dXMgZGV2aWNlIGZsYWdzCiAgKi8KQEAgLTE5
OSw2ICsyMTIsNyBAQCBlbnVtIGludGVyZmFjZV9mbGFncyB7CiAjZGVmaW5lIEFDRVJfREVGQVVM
VF9USFJFRUcgICAgMAogCiBzdGF0aWMgaW50IG1heF9icmlnaHRuZXNzID0gMHhGOworc3RhdGlj
IGludCBjdXJfYnJpZ2h0bmVzcyA9IDk7CiAKIHN0YXRpYyBpbnQgbWFpbGxlZCA9IC0xOwogc3Rh
dGljIGludCBicmlnaHRuZXNzID0gLTE7CkBAIC0zMTAsNiArMzI0LDEwIEBAIHN0YXRpYyBzdHJ1
Y3QgcXVpcmtfZW50cnkgcXVpcmtfbGVub3ZvX2lkZWFwYWRfczIwNSA9IHsKIAkud2lyZWxlc3Mg
PSAzLAogfTsKIAorc3RhdGljIHN0cnVjdCBxdWlya19lbnRyeSBxdWlya19hY2VyX2FzcGlyZV80
NzM5eiA9IHsKKwkuYnJpZ2h0bmVzcyA9IDIsCit9OworCiAvKiBUaGUgQXNwaXJlIE9uZSBoYXMg
YSBkdW1teSBBQ1BJLVdNSSBpbnRlcmZhY2UgLSBkaXNhYmxlIGl0ICovCiBzdGF0aWMgc3RydWN0
IGRtaV9zeXN0ZW1faWQgX19kZXZpbml0ZGF0YSBhY2VyX2JsYWNrbGlzdFtdID0gewogCXsKQEAg
LTM2OCw2ICszODYsMjMgQEAgc3RhdGljIHN0cnVjdCBkbWlfc3lzdGVtX2lkIGFjZXJfcXVpcmtz
W10gPSB7CiAJfSwKIAl7CiAJCS5jYWxsYmFjayA9IGRtaV9tYXRjaGVkLAorCQkuaWRlbnQgPSAi
QWNlciBBc3BpcmUgNDczOVoiLAorCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9NQVRDSChETUlfU1lT
X1ZFTkRPUiwgIkFjZXIiKSwKKwkJCURNSV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiQVM0NzM5
WiIpLAorCQl9LAorCX0sCisJeworCQkuY2FsbGJhY2sgPSBkbWlfbWF0Y2hlZCwKKwkJLmlkZW50
ID0gIkFjZXIgZU1hY2hpbmVzIDQ3MzlaIiwKKwkJLm1hdGNoZXMgPSB7CisJCQlETUlfTUFUQ0go
RE1JX1NZU19WRU5ET1IsICJlTWFjaGluZXMiKSwKKwkJCURNSV9NQVRDSChETUlfUFJPRFVDVF9O
QU1FLCAiQVM0NzM5WiIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAmcXVpcmtfYWNlcl9hc3Bp
cmVfNDczOXosCisJfSwKKwl7CisJCS5jYWxsYmFjayA9IGRtaV9tYXRjaGVkLAogCQkuaWRlbnQg
PSAiQWNlciBBc3BpcmUgNTEwMCIsCiAJCS5tYXRjaGVzID0gewogCQkJRE1JX01BVENIKERNSV9T
WVNfVkVORE9SLCAiQWNlciIpLApAQCAtMTQ0Niw3ICsxNDgxLDcgQEAgc3RhdGljIHZvaWQgYWNl
cl9yZmtpbGxfZXhpdCh2b2lkKQogc3RhdGljIHNzaXplX3Qgc2hvd19ib29sX3RocmVlZyhzdHJ1
Y3QgZGV2aWNlICpkZXYsCiAJc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1
ZikKIHsKLQl1MzIgcmVzdWx0OyBcCisJdTMyIHJlc3VsdDsKIAlhY3BpX3N0YXR1cyBzdGF0dXM7
CiAKIAlwcl9pbmZvKCJUaGlzIHRocmVlZyBzeXNmcyB3aWxsIGJlIHJlbW92ZWQgaW4gMjAxMiIK
QEAgLTE1MDEsNiArMTUzNiw3IEBAIHN0YXRpYyB2b2lkIGFjZXJfd21pX25vdGlmeSh1MzIgdmFs
dWUsIHZvaWQgKmNvbnRleHQpCiAJc3RydWN0IGFjcGlfYnVmZmVyIHJlc3BvbnNlID0geyBBQ1BJ
X0FMTE9DQVRFX0JVRkZFUiwgTlVMTCB9OwogCXVuaW9uIGFjcGlfb2JqZWN0ICpvYmo7CiAJc3Ry
dWN0IGV2ZW50X3JldHVybl92YWx1ZSByZXR1cm5fdmFsdWU7CisJc3RydWN0IGJyaWdodG5lc3Nf
ZXZlbnQgYnJpZ2h0bmVzc192YWx1ZTsKIAlhY3BpX3N0YXR1cyBzdGF0dXM7CiAJdTE2IGRldmlj
ZV9zdGF0ZTsKIAljb25zdCBzdHJ1Y3Qga2V5X2VudHJ5ICprZXk7CkBAIC0xNTMxLDYgKzE1Njcs
NyBAQCBzdGF0aWMgdm9pZCBhY2VyX3dtaV9ub3RpZnkodTMyIHZhbHVlLCB2b2lkICpjb250ZXh0
KQogCiAJc3dpdGNoIChyZXR1cm5fdmFsdWUuZnVuY3Rpb24pIHsKIAljYXNlIFdNSURfSE9US0VZ
X0VWRU5UOgorCWNhc2UgV01JRF9IT1RLRVlfQlJFQUtfRVZFTlQ6CiAJCWRldmljZV9zdGF0ZSA9
IHJldHVybl92YWx1ZS5kZXZpY2Vfc3RhdGU7CiAJCXByX2RlYnVnKCJkZXZpY2Ugc3RhdGU6IDB4
JXhcbiIsIGRldmljZV9zdGF0ZSk7CiAKQEAgLTE1NTgsNiArMTU5NSwzOCBAQCBzdGF0aWMgdm9p
ZCBhY2VyX3dtaV9ub3RpZnkodTMyIHZhbHVlLCB2b2lkICpjb250ZXh0KQogCQkJCQkJICAgMSwg
dHJ1ZSk7CiAJCX0KIAkJYnJlYWs7CisJY2FzZSBXTUlEX0JSSUdIVE5FU1NfQ0hBTkdFX0VWRU5U
OgorCQkvKiB0byBhdm9pZCB0aGUgYnJpZ2h0bmVzcyBldmVudCBiZSBoYW5kbGVkIHR3aWNlICov
CisJCWlmIChxdWlya3MtPmJyaWdodG5lc3MgIT0gMikKKwkJCWJyZWFrOworCQkvKiB3ZSBuZWVk
IEFDUEkgdmlkZW8gYmFja2xpZ2h0IHN1cHBvcnQgKi8KKwkJaWYgKCFhY3BpX3ZpZGVvX2JhY2ts
aWdodF9zdXBwb3J0KCkpCisJCQlicmVhazsKKworCQlicmlnaHRuZXNzX3ZhbHVlID0KKwkJCSoo
KHN0cnVjdCBicmlnaHRuZXNzX2V2ZW50ICopJnJldHVybl92YWx1ZSk7CisJCS8qIGJyaWdodG5l
c3MgaXMgZGVjcmVhc2luZyAqLworCQlpZiAoY3VyX2JyaWdodG5lc3MgPiBicmlnaHRuZXNzX3Zh
bHVlLmJyaWdodG5lc3MpCisJCQlrZXkgPSBzcGFyc2Vfa2V5bWFwX2VudHJ5X2Zyb21fc2NhbmNv
ZGUoCisJCQkJCWFjZXJfd21pX2lucHV0X2RldiwgMHg2Myk7CisJCS8qIGJyaWdodG5lc3MgaXMg
aW5jcmVhc2luZyAqLworCQllbHNlIGlmIChjdXJfYnJpZ2h0bmVzcyA8IGJyaWdodG5lc3NfdmFs
dWUuYnJpZ2h0bmVzcykKKwkJCWtleSA9IHNwYXJzZV9rZXltYXBfZW50cnlfZnJvbV9zY2FuY29k
ZSgKKwkJCQkJYWNlcl93bWlfaW5wdXRfZGV2LCAweDYyKTsKKwkJLyogYnJpZ2h0bmVzcyBpcyBh
bHJlYWR5IGF0IHRoZSBib3R0b20gKi8KKwkJZWxzZSBpZiAoY3VyX2JyaWdodG5lc3MgPT0gMCkK
KwkJCWtleSA9IHNwYXJzZV9rZXltYXBfZW50cnlfZnJvbV9zY2FuY29kZSgKKwkJCQkJYWNlcl93
bWlfaW5wdXRfZGV2LCAweDYzKTsKKwkJLyogYnJpZ2h0bmVzcyBpcyBhbHJlYWR5IGF0IHRoZSB0
b3AgKi8KKwkJZWxzZSBpZiAoY3VyX2JyaWdodG5lc3MgPT0gOSkKKwkJCWtleSA9IHNwYXJzZV9r
ZXltYXBfZW50cnlfZnJvbV9zY2FuY29kZSgKKwkJCQkJYWNlcl93bWlfaW5wdXRfZGV2LCAweDYy
KTsKKworCQlzcGFyc2Vfa2V5bWFwX3JlcG9ydF9lbnRyeShhY2VyX3dtaV9pbnB1dF9kZXYsIGtl
eSwgMSwgdHJ1ZSk7CisJCWN1cl9icmlnaHRuZXNzID0gcmV0dXJuX3ZhbHVlLmtleV9udW07CisJ
CWJyZWFrOworCWNhc2UgV01JRF9HUkFQSElDX1NXSVRDSF9FVkVOVDoKKwljYXNlIFdNSURfU0VO
U09SX0VWRU5UOgogCWRlZmF1bHQ6CiAJCXByX3dhcm4oIlVua25vd24gZnVuY3Rpb24gbnVtYmVy
IC0gJWQgLSAlZFxuIiwKIAkJCXJldHVybl92YWx1ZS5mdW5jdGlvbiwgcmV0dXJuX3ZhbHVlLmtl
eV9udW0pOwotLSAKMS43LjUuNAoK
--001485f881b499195904ac657a1f--
