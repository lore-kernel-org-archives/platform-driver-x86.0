From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 1/2 v2] asus-wmi: add scalar board brightness adj. support
Date: Fri, 16 Mar 2012 17:40:27 +0800
Message-ID: <CAMz9Wg9ikS9wsgV3nGTzMpHHAGGH+XwrX4m+TQTaGMqRewbEKw@mail.gmail.com>
References: <1331878839-6657-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064h+hg_GTDBu6TMojH3+NLgfkXqp6e23OuDe1UbxPdHDyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:40657 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760371Ab2CPJk2 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 16 Mar 2012 05:40:28 -0400
Received: by wejx9 with SMTP id x9so3711309wej.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Mar 2012 02:40:27 -0700 (PDT)
In-Reply-To: <CAHR064h+hg_GTDBu6TMojH3+NLgfkXqp6e23OuDe1UbxPdHDyQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

Sure, I'll do it next week.

Best regards,
AceLan Kao.

2012/3/16 Corentin Chary <corentin.chary@gmail.com>:
> On Fri, Mar 16, 2012 at 7:20 AM, AceLan Kao <acelan.kao@canonical.com=
> wrote:
>> Some ASUS ET2012E/I All-in-One machines that use a scalar board
>> to control the brightness, and they only accept brightness up and do=
wn
>> command. So, I introduced a get_scalar_command() function to pass th=
e
>> command to the scalar board through WMI.
>>
>> Besides, we have to store the brightness value locally, for we need =
the
>> old value to know the brightness value is increasing or decreasing.
>>
>> BTW, since there is no way to retrieve the actual brightness(it woul=
d be
>> a fixed value), and the max brightness value would be fixed to 1, so=
 we
>> have to keep passing the brightness up/down command when we reached =
the
>> max brightness value or 0.
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>> =A0drivers/platform/x86/asus-wmi.c =A0| =A0 33 +++++++++++++--
>> =A0drivers/platform/x86/asus-wmi.h =A0| =A0 10 ++++-
>> =A0drivers/platform/x86/eeepc-wmi.c | =A0 84 +++++++++++++++++++++++=
+++-----------
>> =A03 files changed, 95 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
>> index 72d731c..538a886 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -784,7 +784,8 @@ static int asus_new_rfkill(struct asus_wmi *asus=
,
>> =A0 =A0 =A0 =A0arfkill->dev_id =3D dev_id;
>> =A0 =A0 =A0 =A0arfkill->asus =3D asus;
>>
>> - =A0 =A0 =A0 if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN && asus->driver-=
>hotplug_wireless)
>> + =A0 =A0 =A0 if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN &&
>> + =A0 =A0 =A0 =A0 =A0 asus->driver->quirks->hotplug_wireless)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*rfkill =3D rfkill_alloc(name, &asus-=
>platform_device->dev, type,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 &asus_rfkill_wlan_ops, arfkill);
>> =A0 =A0 =A0 =A0else
>> @@ -895,7 +896,7 @@ static int asus_wmi_rfkill_init(struct asus_wmi =
*asus)
>> =A0 =A0 =A0 =A0if (result && result !=3D -ENODEV)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto exit;
>>
>> - =A0 =A0 =A0 if (!asus->driver->hotplug_wireless)
>> + =A0 =A0 =A0 if (!asus->driver->quirks->hotplug_wireless)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto exit;
>>
>> =A0 =A0 =A0 =A0result =3D asus_setup_pci_hotplug(asus);
>> @@ -1116,13 +1117,33 @@ static int read_brightness(struct backlight_=
device *bd)
>> =A0 =A0 =A0 =A0return retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK;
>> =A0}
>>
>> +static u32 get_scalar_command(struct backlight_device *bd)
>> +{
>> + =A0 =A0 =A0 struct asus_wmi *asus =3D bl_get_data(bd);
>> + =A0 =A0 =A0 u32 ctrl_param =3D 0;
>> +
>> + =A0 =A0 =A0 if ((asus->driver->brightness < bd->props.brightness) =
||
>> + =A0 =A0 =A0 =A0 =A0 bd->props.brightness =3D=3D bd->props.max_brig=
htness)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D 0x00008001;
>> + =A0 =A0 =A0 else if ((asus->driver->brightness > bd->props.brightn=
ess) ||
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bd->props.brightness =3D=3D 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D 0x00008000;
>> +
>> + =A0 =A0 =A0 asus->driver->brightness =3D bd->props.brightness;
>> +
>> + =A0 =A0 =A0 return ctrl_param;
>> +}
>> +
>> =A0static int update_bl_status(struct backlight_device *bd)
>> =A0{
>> =A0 =A0 =A0 =A0struct asus_wmi *asus =3D bl_get_data(bd);
>> =A0 =A0 =A0 =A0u32 ctrl_param;
>> =A0 =A0 =A0 =A0int power, err;
>>
>> - =A0 =A0 =A0 ctrl_param =3D bd->props.brightness;
>> + =A0 =A0 =A0 if (asus->driver->quirks->scalar_panel_brightness)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D get_scalar_command(bd);
>> + =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_param =3D bd->props.brightness;
>>
>> =A0 =A0 =A0 =A0err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_BRIGHTNE=
SS,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0ctrl_param, NULL);
>> @@ -1200,6 +1221,8 @@ static int asus_wmi_backlight_init(struct asus=
_wmi *asus)
>> =A0 =A0 =A0 =A0bd->props.power =3D power;
>> =A0 =A0 =A0 =A0backlight_update_status(bd);
>>
>> + =A0 =A0 =A0 asus->driver->brightness =3D bd->props.brightness;
>> +
>> =A0 =A0 =A0 =A0return 0;
>> =A0}
>>
>> @@ -1622,8 +1645,8 @@ static int asus_wmi_add(struct platform_device=
 *pdev)
>> =A0 =A0 =A0 =A0wdrv->platform_device =3D pdev;
>> =A0 =A0 =A0 =A0platform_set_drvdata(asus->platform_device, asus);
>>
>> - =A0 =A0 =A0 if (wdrv->quirks)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 wdrv->quirks(asus->driver);
>> + =A0 =A0 =A0 if (wdrv->asus_quirks)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 wdrv->asus_quirks(asus->driver);
>>
>> =A0 =A0 =A0 =A0err =3D asus_wmi_platform_init(asus);
>> =A0 =A0 =A0 =A0if (err)
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/=
asus-wmi.h
>> index 8147c10..6c344ef 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -35,9 +35,14 @@ struct module;
>> =A0struct key_entry;
>> =A0struct asus_wmi;
>>
>> +struct quirk_entry {
>> + =A0 =A0 =A0 bool hotplug_wireless;
>> + =A0 =A0 =A0 bool scalar_panel_brightness;
>> +};
>> +
>> =A0struct asus_wmi_driver {
>> - =A0 =A0 =A0 bool =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hotplug_wi=
reless;
>> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wapf;
>> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 brightness=
;
>>
>> =A0 =A0 =A0 =A0const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*name;
>> =A0 =A0 =A0 =A0struct module =A0 =A0 =A0 =A0 =A0 *owner;
>> @@ -47,13 +52,14 @@ struct asus_wmi_driver {
>> =A0 =A0 =A0 =A0const struct key_entry =A0*keymap;
>> =A0 =A0 =A0 =A0const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*input_name;
>> =A0 =A0 =A0 =A0const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*input_phys;
>> + =A0 =A0 =A0 struct quirk_entry =A0 =A0 =A0*quirks;
>> =A0 =A0 =A0 =A0/* Returns new code, value, and autorelease values in=
 arguments.
>> =A0 =A0 =A0 =A0 * Return ASUS_WMI_KEY_IGNORE in code if event should=
 be ignored. */
>> =A0 =A0 =A0 =A0void (*key_filter) (struct asus_wmi_driver *driver, i=
nt *code,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int =
*value, bool *autorelease);
>>
>> =A0 =A0 =A0 =A0int (*probe) (struct platform_device *device);
>> - =A0 =A0 =A0 void (*quirks) (struct asus_wmi_driver *driver);
>> + =A0 =A0 =A0 void (*asus_quirks) (struct asus_wmi_driver *driver);
>>
>> =A0 =A0 =A0 =A0struct platform_driver =A0platform_driver;
>> =A0 =A0 =A0 =A0struct platform_device *platform_device;
>> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86=
/eeepc-wmi.c
>> index 9f6e643..6de69ab 100644
>> --- a/drivers/platform/x86/eeepc-wmi.c
>> +++ b/drivers/platform/x86/eeepc-wmi.c
>> @@ -48,6 +48,7 @@ MODULE_LICENSE("GPL");
>>
>> =A0MODULE_ALIAS("wmi:"EEEPC_WMI_EVENT_GUID);
>>
>> +static struct quirk_entry *quirks;
>> =A0static bool hotplug_wireless;
>>
>> =A0module_param(hotplug_wireless, bool, 0444);
>> @@ -87,6 +88,59 @@ static const struct key_entry eeepc_wmi_keymap[] =
=3D {
>> =A0 =A0 =A0 =A0{ KE_END, 0},
>> =A0};
>>
>> +static struct quirk_entry quirk_asus_unknown =3D {
>> +};
>> +
>> +static struct quirk_entry quirk_asus_1000h =3D {
>> + =A0 =A0 =A0 .hotplug_wireless =3D true,
>> +};
>> +
>> +static struct quirk_entry quirk_asus_et2012_type3 =3D {
>> + =A0 =A0 =A0 .scalar_panel_brightness =3D true,
>> +};
>> +
>> +static int dmi_matched(const struct dmi_system_id *dmi)
>> +{
>> + =A0 =A0 =A0 char *model;
>> + =A0 =A0 =A0 quirks =3D dmi->driver_data;
>> +
>> + =A0 =A0 =A0 model =3D (char *)dmi->matches[1].substr;
>> + =A0 =A0 =A0 if (unlikely(strncmp(model, "ET2012", 6) =3D=3D 0)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct dmi_device *dev =3D NULL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 char oemstring[30];
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while ((dev =3D dmi_find_device(DMI_DE=
V_TYPE_OEM_STRING, NULL,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 dev))) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (sscanf(dev->name, =
"AEMS%24c", oemstring) =3D=3D 1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (oe=
mstring[18] =3D=3D '3')
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 quirks =3D &quirk_asus_et2012_type3;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 }
>> + =A0 =A0 =A0 return 1;
>> +}
>> +
>> +static struct dmi_system_id asus_quirks[] =3D {
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "ASUSTeK Computer INC. 1000=
H",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VEND=
OR, "ASUSTeK Computer INC."),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_=
NAME, "1000H"),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_asus_1000h,
>> + =A0 =A0 =A0 },
>> + =A0 =A0 =A0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_matched,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "ASUSTeK Computer INC. ET20=
12E/I",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VEND=
OR, "ASUSTeK Computer INC."),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_=
NAME, "ET2012"),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D &quirk_asus_unknown,
>> + =A0 =A0 =A0 },
>> +};
>> +
>> =A0static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi=
, int *code,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsi=
gned int *value, bool *autorelease)
>> =A0{
>> @@ -141,33 +195,13 @@ static int eeepc_wmi_probe(struct platform_dev=
ice *pdev)
>> =A0 =A0 =A0 =A0return 0;
>> =A0}
>>
>> -static void eeepc_dmi_check(struct asus_wmi_driver *driver)
>> -{
>> - =A0 =A0 =A0 const char *model;
>> -
>> - =A0 =A0 =A0 model =3D dmi_get_system_info(DMI_PRODUCT_NAME);
>> - =A0 =A0 =A0 if (!model)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> -
>> - =A0 =A0 =A0 /*
>> - =A0 =A0 =A0 =A0* Whitelist for wlan hotplug
>> - =A0 =A0 =A0 =A0*
>> - =A0 =A0 =A0 =A0* Asus 1000H needs the current hotplug code to hand=
le
>> - =A0 =A0 =A0 =A0* Fn+F2 correctly. We may add other Asus here later=
, but
>> - =A0 =A0 =A0 =A0* it seems that most of the laptops supported by as=
us-wmi
>> - =A0 =A0 =A0 =A0* don't need to be on this list
>> - =A0 =A0 =A0 =A0*/
>> - =A0 =A0 =A0 if (strcmp(model, "1000H") =3D=3D 0) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 driver->hotplug_wireless =3D true;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_info("wlan hotplug enabled\n");
>> - =A0 =A0 =A0 }
>> -}
>> -
>> =A0static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
>> =A0{
>> - =A0 =A0 =A0 driver->hotplug_wireless =3D hotplug_wireless;
>> + =A0 =A0 =A0 quirks =3D driver->quirks;
>> =A0 =A0 =A0 =A0driver->wapf =3D -1;
>> - =A0 =A0 =A0 eeepc_dmi_check(driver);
>> + =A0 =A0 =A0 driver->quirks =3D &quirk_asus_unknown;
>> + =A0 =A0 =A0 driver->quirks->hotplug_wireless =3D hotplug_wireless;
>> + =A0 =A0 =A0 dmi_check_system(asus_quirks);
>> =A0}
>>
>> =A0static struct asus_wmi_driver asus_wmi_driver =3D {
>> @@ -179,7 +213,7 @@ static struct asus_wmi_driver asus_wmi_driver =3D=
 {
>> =A0 =A0 =A0 =A0.input_phys =3D EEEPC_WMI_FILE "/input0",
>> =A0 =A0 =A0 =A0.key_filter =3D eeepc_wmi_key_filter,
>> =A0 =A0 =A0 =A0.probe =3D eeepc_wmi_probe,
>> - =A0 =A0 =A0 .quirks =3D eeepc_wmi_quirks,
>> + =A0 =A0 =A0 .asus_quirks =3D eeepc_wmi_quirks,
>> =A0};
>>
>>
>> --
>> 1.7.9.1
>>
>
> Hey,
>
> Much better, but you forgot to update asus-nb-wmi.c when changing
> "quirks" to "asus_quirks" (by the way "detect_quirks() is probably a
> better name) :).
> While doing that, could you also put wapf too in quirks_entry (some
> models works better with different values of wapf) ?
>
> Thanks !
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
