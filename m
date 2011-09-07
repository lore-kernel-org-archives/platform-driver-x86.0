From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: support Acer Aspire/eMachines 4739z
Date: Wed, 07 Sep 2011 23:05:14 +0800
Message-ID: <1315407914.8674.70.camel@linux-s257.site>
References: <1315380728-22031-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:41832 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755776Ab1IGQMP (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Wed, 7 Sep 2011 12:12:15 -0400
In-Reply-To: <1315380728-22031-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org


=E6=96=BC =E4=B8=89=EF=BC=8C2011-09-07 =E6=96=BC 15:32 +0800=EF=BC=8CAc=
eLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> There are 2 kind of 4739Z, the one that vendor name is ACER sents out
> the correct brightness key events, so we use the

Current brightness key events means the Fn key direct send out key code
but not from wmi notify event?

> quirk_acer_travelmate_2490. And another one with eMachines as it's
> vendor name follows Acer WMI spec. and doesn't sent out brightness ke=
y
> events, so I added a new quirk, quirk_acer_aspire_4739z, for it, and
> handle the key events in acer_wmi_notify().
>=20
> BTW, we need other key event types that defined in Acer WMI spec., so
> I added them in acer_wmi_event_ids enumerate.
>=20
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   69 +++++++++++++++++++++++++++++=
+++++++--
>  1 files changed, 65 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index df730c9..257c7f2 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -94,6 +94,10 @@ MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D1=
4026");
> =20
>  enum acer_wmi_event_ids {
>  	WMID_HOTKEY_EVENT =3D 0x1,
> +	WMID_HOTKEY_BREAK_EVENT =3D 0x02,
> +	WMID_GRAPHIC_SWITCH_EVENT =3D 0x03,

Please change to 0x2 and 0x3 for consistency in this enum.

> +	WMID_BRIGHTNESS_CHANGE_EVENT =3D 0x4,
> +	WMID_SENSOR_EVENT =3D 0x5,
>  };
> =20
>  static const struct key_entry acer_wmi_keymap[] =3D {
> @@ -112,9 +116,9 @@ static const struct key_entry acer_wmi_keymap[] =3D=
 {
>  	{KE_IGNORE, 0x45, {KEY_STOP} },
>  	{KE_IGNORE, 0x48, {KEY_VOLUMEUP} },
>  	{KE_IGNORE, 0x49, {KEY_VOLUMEDOWN} },
> -	{KE_IGNORE, 0x61, {KEY_SWITCHVIDEOMODE} },
> -	{KE_IGNORE, 0x62, {KEY_BRIGHTNESSUP} },
> -	{KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },


Why enable 0x61, 0x62 and 0x63? Does it for Aspire 4739z or eMachines
4739z?
Why choice 0x61, 0x62 and 0x63?
0x61, 0x62 and 0x63 are from your machine's wmi notify event result?

But I didn't see the result from your following code.

> +	{KE_KEY, 0x61, {KEY_SWITCHVIDEOMODE} },
> +	{KE_KEY, 0x62, {KEY_BRIGHTNESSUP} },
> +	{KE_KEY, 0x63, {KEY_BRIGHTNESSDOWN} },
>  	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
>  	{KE_IGNORE, 0x81, {KEY_SLEEP} },
>  	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
> @@ -131,6 +135,15 @@ struct event_return_value {
>  	u32 reserved;
>  } __attribute__((packed));
> =20
> +
> +struct brightness_event_return_value {
> +	u8 function;
> +	u8 brightness_level1;
> +	u8 brightness_level2;

Please don't use brightness_level"1" or level"2", it confused to me or
other code reviewer and nobody can remember the definition after a
couple of months.
Please try to give them more meaningful names.

> +	u8 reserved;
> +	u32 reserved2;
> +} __attribute__((packed));
> +
>  /*
>   * GUID3 Get Device Status device flags
>   */
> @@ -199,6 +212,7 @@ enum interface_flags {
>  #define ACER_DEFAULT_THREEG    0
> =20
>  static int max_brightness =3D 0xF;
> +static int cur_brightness=3D 9;
> =20

Why should you control the current brightness level but not control by
_BCL/_BCM in DSDT?

>  static int mailled =3D -1;
>  static int brightness =3D -1;
> @@ -310,6 +324,10 @@ static struct quirk_entry quirk_lenovo_ideapad_s=
205 =3D {
>  	.wireless =3D 3,
>  };
> =20
> +static struct quirk_entry quirk_acer_aspire_4739z=3D {
> +	.brightness =3D 2,
> +};
> +
>  /* The Aspire One has a dummy ACPI-WMI interface - disable it */
>  static struct dmi_system_id __devinitdata acer_blacklist[] =3D {
>  	{
> @@ -368,6 +386,24 @@ static struct dmi_system_id acer_quirks[] =3D {
>  	},
>  	{
>  		.callback =3D dmi_matched,
> +		.ident =3D "Acer Aspire 4739Z",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
> +		},
> +		.driver_data =3D &quirk_acer_travelmate_2490,
> +	},

Why "Acer Aspire 4739Z" set to quirk the same with travelmate 2490?
There only have a mailled capability flag in this quirk, why you used
it?=20
Does that because Aspire 4739Z also have mail hotkey button?=20

If the answer is NO, then don't need add a new quirk.

> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Acer eMachines 4739Z",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "eMachines"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
> +		},
> +		.driver_data =3D &quirk_acer_aspire_4739z,
> +	},
> +	{
> +		.callback =3D dmi_matched,
>  		.ident =3D "Acer Aspire 5100",
>  		.matches =3D {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> @@ -1446,7 +1482,7 @@ static void acer_rfkill_exit(void)
>  static ssize_t show_bool_threeg(struct device *dev,
>  	struct device_attribute *attr, char *buf)
>  {
> -	u32 result; \
> +	u32 result;
>  	acpi_status status;
> =20
>  	pr_info("This threeg sysfs will be removed in 2012"
> @@ -1501,6 +1537,7 @@ static void acer_wmi_notify(u32 value, void *co=
ntext)
>  	struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
>  	union acpi_object *obj;
>  	struct event_return_value return_value;
> +	struct brightness_event_return_value brightness_return_value;
>  	acpi_status status;
>  	u16 device_state;
>  	const struct key_entry *key;
> @@ -1531,6 +1568,7 @@ static void acer_wmi_notify(u32 value, void *co=
ntext)
> =20
>  	switch (return_value.function) {
>  	case WMID_HOTKEY_EVENT:
> +	case WMID_HOTKEY_BREAK_EVENT:
>  		device_state =3D return_value.device_state;
>  		pr_debug("device state: 0x%x\n", device_state);
> =20
> @@ -1558,6 +1596,29 @@ static void acer_wmi_notify(u32 value, void *c=
ontext)
>  						   1, true);
>  		}
>  		break;
> +	case WMID_BRIGHTNESS_CHANGE_EVENT:
> +		// to avoid the brightness event be handled twice
> +		if( quirks->brightness !=3D 2)
> +			break;
> +		brightness_return_value =3D *((struct brightness_event_return_valu=
e *)&return_value);
> +		/* brightness is decreasing */
> +		if( cur_brightness > brightness_return_value.brightness_level1)
> +			key =3D sparse_keymap_entry_from_scancode(acer_wmi_input_dev, 0x6=
3);
> +		/* brightness is increasing */
> +		else if( cur_brightness < brightness_return_value.brightness_level=
1)
> +			key =3D sparse_keymap_entry_from_scancode(acer_wmi_input_dev, 0x6=
2);
> +		/* brightness is already at the bottom */
> +		else if( cur_brightness =3D=3D 0)
> +			key =3D sparse_keymap_entry_from_scancode(acer_wmi_input_dev, 0x6=
3);
> +		/* brightness is already at the top */
> +		else if( cur_brightness =3D=3D 9)
> +			key =3D sparse_keymap_entry_from_scancode(acer_wmi_input_dev, 0x6=
2);
> +
> +		sparse_keymap_report_entry(acer_wmi_input_dev, key, 1, true);
> +		cur_brightness=3D return_value.key_num;
> +		break;

The same,=20
why should you control the brightness level number in acer-wmi driver?
Does it not control by acpi video driver and _BCL/_BCM in DSDT?=20

And, why choice 0x62, 0x63? The above 2 number is not from your wmi
notify result, why use them?

> +	case WMID_GRAPHIC_SWITCH_EVENT:
> +	case WMID_SENSOR_EVENT:
>  	default:
>  		pr_warn("Unknown function number - %d - %d\n",
>  			return_value.function, return_value.key_num);

Thank's a lot!
Joey Lee
