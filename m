From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/3 v3] asus-wmi: add scalar board brightness adj. support
Date: Mon, 19 Mar 2012 10:08:02 +0100
Message-ID: <CAHR064iuCZv+GhpnRRoED7JJ25-2_EUt2uZF=bdBwK3kBD0nQQ@mail.gmail.com>
References: <1332138824-9673-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:52290 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754726Ab2CSJID convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 05:08:03 -0400
Received: by bkcik5 with SMTP id ik5so4071919bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 02:08:02 -0700 (PDT)
In-Reply-To: <1332138824-9673-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Mar 19, 2012 at 7:33 AM, AceLan Kao <acelan.kao@canonical.com> =
wrote:
> Some ASUS ET2012E/I All-in-One machines that use a scalar board
> to control the brightness, and they only accept brightness up and dow=
n
> command. So, I introduced a get_scalar_command() function to pass the
> command to the scalar board through WMI.
>
> Besides, we have to store the brightness value locally, for we need t=
he
> old value to know the brightness value is increasing or decreasing.
>
> BTW, since there is no way to retrieve the actual brightness(it would=
 be
> a fixed value), and the max brightness value would be fixed to 1, so =
we
> have to keep passing the brightness up/down command when we reached t=
he
> max brightness value or 0.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-nb-wmi.c | =C2=A0 =C2=A02 +-
> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0 =C2=A0| =C2=A0 33 ++++++=
++++++--
> =C2=A0drivers/platform/x86/asus-wmi.h =C2=A0 =C2=A0| =C2=A0 10 +++-
> =C2=A0drivers/platform/x86/eeepc-wmi.c =C2=A0 | =C2=A0 84 +++++++++++=
++++++++++++++-----------
> =C2=A04 files changed, 96 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x8=
6/asus-nb-wmi.c
> index b0859d4..396dafc 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -99,7 +99,7 @@ static struct asus_wmi_driver asus_nb_wmi_driver =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.keymap =3D asus_nb_wmi_keymap,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.input_name =3D "Asus WMI hotkeys",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.input_phys =3D ASUS_NB_WMI_FILE "/input0"=
,
> - =C2=A0 =C2=A0 =C2=A0 .quirks =3D asus_nb_wmi_quirks,
> + =C2=A0 =C2=A0 =C2=A0 .detect_quirks =3D asus_nb_wmi_quirks,
> =C2=A0};
>
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 72d731c..ea80fbe 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -784,7 +784,8 @@ static int asus_new_rfkill(struct asus_wmi *asus,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0arfkill->dev_id =3D dev_id;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0arfkill->asus =3D asus;
>
> - =C2=A0 =C2=A0 =C2=A0 if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN && asus-=
>driver->hotplug_wireless)
> + =C2=A0 =C2=A0 =C2=A0 if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN &&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus->driver->quirks->hotplug_wi=
reless)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rfkill =3D rf=
kill_alloc(name, &asus->platform_device->dev, type,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &asus_r=
fkill_wlan_ops, arfkill);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> @@ -895,7 +896,7 @@ static int asus_wmi_rfkill_init(struct asus_wmi *=
asus)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (result && result !=3D -ENODEV)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;
>
> - =C2=A0 =C2=A0 =C2=A0 if (!asus->driver->hotplug_wireless)
> + =C2=A0 =C2=A0 =C2=A0 if (!asus->driver->quirks->hotplug_wireless)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D asus_setup_pci_hotplug(asus);
> @@ -1116,13 +1117,33 @@ static int read_brightness(struct backlight_d=
evice *bd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval & ASUS_WMI_DSTS_BRIGHTNESS_M=
ASK;
> =C2=A0}
>
> +static u32 get_scalar_command(struct backlight_device *bd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct asus_wmi *asus =3D bl_get_data(bd);
> + =C2=A0 =C2=A0 =C2=A0 u32 ctrl_param =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 if ((asus->driver->brightness < bd->props.brig=
htness) ||
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bd->props.brightness =3D=3D bd->=
props.max_brightness)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D 0x0=
0008001;
> + =C2=A0 =C2=A0 =C2=A0 else if ((asus->driver->brightness > bd->props=
=2Ebrightness) ||
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bd->props.br=
ightness =3D=3D 0)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D 0x0=
0008000;
> +
> + =C2=A0 =C2=A0 =C2=A0 asus->driver->brightness =3D bd->props.brightn=
ess;
> +
> + =C2=A0 =C2=A0 =C2=A0 return ctrl_param;
> +}
> +
> =C2=A0static int update_bl_status(struct backlight_device *bd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_wmi *asus =3D bl_get_data(bd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ctrl_param;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int power, err;
>
> - =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D bd->props.brightness;
> + =C2=A0 =C2=A0 =C2=A0 if (asus->driver->quirks->scalar_panel_brightn=
ess)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D get=
_scalar_command(bd);
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D bd-=
>props.brightness;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D asus_wmi_set_devstate(ASUS_WMI_DEV=
ID_BRIGHTNESS,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl_param, NUL=
L);
> @@ -1200,6 +1221,8 @@ static int asus_wmi_backlight_init(struct asus_=
wmi *asus)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bd->props.power =3D power;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0backlight_update_status(bd);
>
> + =C2=A0 =C2=A0 =C2=A0 asus->driver->brightness =3D bd->props.brightn=
ess;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> @@ -1622,8 +1645,8 @@ static int asus_wmi_add(struct platform_device =
*pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0wdrv->platform_device =3D pdev;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(asus->platform_device=
, asus);
>
> - =C2=A0 =C2=A0 =C2=A0 if (wdrv->quirks)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdrv->quirks(asus-=
>driver);
> + =C2=A0 =C2=A0 =C2=A0 if (wdrv->detect_quirks)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdrv->detect_quirk=
s(asus->driver);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D asus_wmi_platform_init(asus);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/a=
sus-wmi.h
> index 8147c10..ac7dd4e 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -35,9 +35,14 @@ struct module;
> =C2=A0struct key_entry;
> =C2=A0struct asus_wmi;
>
> +struct quirk_entry {
> + =C2=A0 =C2=A0 =C2=A0 bool hotplug_wireless;
> + =C2=A0 =C2=A0 =C2=A0 bool scalar_panel_brightness;
> +};
> +
> =C2=A0struct asus_wmi_driver {
> - =C2=A0 =C2=A0 =C2=A0 bool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug_wireless;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wapf;
> + =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*name;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *owner;
> @@ -47,13 +52,14 @@ struct asus_wmi_driver {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct key_entry =C2=A0*keymap;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*input_name;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*input_phys;
> + =C2=A0 =C2=A0 =C2=A0 struct quirk_entry =C2=A0 =C2=A0 =C2=A0*quirks=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Returns new code, value, and autoreleas=
e values in arguments.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Return ASUS_WMI_KEY_IGNORE in code if e=
vent should be ignored. */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*key_filter) (struct asus_wmi_driver=
 *driver, int *code,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *value, bool *autorelease);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int (*probe) (struct platform_device *devi=
ce);
> - =C2=A0 =C2=A0 =C2=A0 void (*quirks) (struct asus_wmi_driver *driver=
);
> + =C2=A0 =C2=A0 =C2=A0 void (*detect_quirks) (struct asus_wmi_driver =
*driver);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_driver =C2=A0platform_driv=
er;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *platform_device;
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 9f6e643..ad254ae 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -48,6 +48,7 @@ MODULE_LICENSE("GPL");
>
> =C2=A0MODULE_ALIAS("wmi:"EEEPC_WMI_EVENT_GUID);
>
> +static struct quirk_entry *quirks;
> =C2=A0static bool hotplug_wireless;
>
> =C2=A0module_param(hotplug_wireless, bool, 0444);
> @@ -87,6 +88,59 @@ static const struct key_entry eeepc_wmi_keymap[] =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_END, 0},
> =C2=A0};
>
> +static struct quirk_entry quirk_asus_unknown =3D {
> +};
> +
> +static struct quirk_entry quirk_asus_1000h =3D {
> + =C2=A0 =C2=A0 =C2=A0 .hotplug_wireless =3D true,
> +};
> +
> +static struct quirk_entry quirk_asus_et2012_type3 =3D {
> + =C2=A0 =C2=A0 =C2=A0 .scalar_panel_brightness =3D true,
> +};
> +
> +static int dmi_matched(const struct dmi_system_id *dmi)
> +{
> + =C2=A0 =C2=A0 =C2=A0 char *model;
> + =C2=A0 =C2=A0 =C2=A0 quirks =3D dmi->driver_data;
> +
> + =C2=A0 =C2=A0 =C2=A0 model =3D (char *)dmi->matches[1].substr;
> + =C2=A0 =C2=A0 =C2=A0 if (unlikely(strncmp(model, "ET2012", 6) =3D=3D=
 0)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct dmi_d=
evice *dev =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char oemstring[30]=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((dev =3D dm=
i_find_device(DMI_DEV_TYPE_OEM_STRING, NULL,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dev))) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (sscanf(dev->name, "AEMS%24c", oemstring) =3D=3D 1) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oemstring[18] =3D=3D '3')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 quirks =
=3D &quirk_asus_et2012_type3;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return 1;
> +}
> +
> +static struct dmi_system_id asus_quirks[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .callback =3D dmi_=
matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ident =3D "ASUSTe=
K Computer INC. 1000H",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer INC."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_PRODUCT_NAME, "1000H"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_data =3D &=
quirk_asus_1000h,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .callback =3D dmi_=
matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ident =3D "ASUSTe=
K Computer INC. ET2012E/I",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer INC."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_PRODUCT_NAME, "ET2012"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_data =3D &=
quirk_asus_unknown,
> + =C2=A0 =C2=A0 =C2=A0 },

Add an end marker here "{},"
I think it's present in the second patch, but should be in that one.

> +};
> +
> =C2=A0static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_w=
mi, int *code,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int *value, bool *a=
utorelease)
> =C2=A0{
> @@ -141,33 +195,13 @@ static int eeepc_wmi_probe(struct platform_devi=
ce *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> -static void eeepc_dmi_check(struct asus_wmi_driver *driver)
> -{
> - =C2=A0 =C2=A0 =C2=A0 const char *model;
> -
> - =C2=A0 =C2=A0 =C2=A0 model =3D dmi_get_system_info(DMI_PRODUCT_NAME=
);
> - =C2=A0 =C2=A0 =C2=A0 if (!model)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> -
> - =C2=A0 =C2=A0 =C2=A0 /*
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* Whitelist for wlan hotplug
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* Asus 1000H needs the current hotplug c=
ode to handle
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fn+F2 correctly. We may add other Asus=
 here later, but
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* it seems that most of the laptops supp=
orted by asus-wmi
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* don't need to be on this list
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> - =C2=A0 =C2=A0 =C2=A0 if (strcmp(model, "1000H") =3D=3D 0) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver->hotplug_wi=
reless =3D true;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("wlan hotp=
lug enabled\n");
> - =C2=A0 =C2=A0 =C2=A0 }
> -}
> -
> =C2=A0static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 driver->hotplug_wireless =3D hotplug_wireless;
> + =C2=A0 =C2=A0 =C2=A0 quirks =3D driver->quirks;

I don't think you should do that.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->wapf =3D -1;
> - =C2=A0 =C2=A0 =C2=A0 eeepc_dmi_check(driver);
> + =C2=A0 =C2=A0 =C2=A0 driver->quirks =3D &quirk_asus_unknown;
> + =C2=A0 =C2=A0 =C2=A0 driver->quirks->hotplug_wireless =3D hotplug_w=
ireless;
> + =C2=A0 =C2=A0 =C2=A0 dmi_check_system(asus_quirks);

Missing "driver->quirks =3D quirks" (quriks was set by the dmi callback=
 here).

> =C2=A0}
>
> =C2=A0static struct asus_wmi_driver asus_wmi_driver =3D {
> @@ -179,7 +213,7 @@ static struct asus_wmi_driver asus_wmi_driver =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.input_phys =3D EEEPC_WMI_FILE "/input0",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.key_filter =3D eeepc_wmi_key_filter,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D eeepc_wmi_probe,
> - =C2=A0 =C2=A0 =C2=A0 .quirks =3D eeepc_wmi_quirks,
> + =C2=A0 =C2=A0 =C2=A0 .detect_quirks =3D eeepc_wmi_quirks,
> =C2=A0};
>
>
> --
> 1.7.9.1
>



--=20
Corentin Chary
http://xf.iksaif.net
