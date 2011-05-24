From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] support wlan hotkey on Acer Travelmate 5735Z
Date: Tue, 24 May 2011 04:31:53 -0600
Message-ID: <4DDC15B9020000230002D051@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: melchior.franz@gmail.com
Cc: Joey Lee <JLee@novell.com>, carlos@strangeworlds.co.uk, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-24 =E6=96=BC 10:35 +0200=EF=BC=8CMe=
lchior FRANZ =E6=8F=90=E5=88=B0=EF=BC=9A
> From: Melchior FRANZ <mfranz@aon.at>
>    =20
> On an Acer Travelmate 5735Z-452G32Mnss the WLAN-enable/disable key
> doesn't send 0x1 as acpi event key code, but 0x3. This patch also
> makes the module ignore hotkey acpi events for functions that are
> already handled without. This avoids warning message "keyboard:
> can't emulate rawmode for keycode 240".
>=20
> Signed-off-by: Melchior FRANZ <mfranz@aon.at>

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>

Thank's for your patch, it also works to me on TravelMate 8572.

Joey Lee

> ---
>=20
> This patch requires that Joey LEE's 64 bit fix be applied,
> otherwise the whole acer-wmi module fails to load on this
> machine. See https://bugzilla.kernel.org/show_bug.cgi?id=3D34142#c21
> (0001-acer-wmi-allow-64-bits-return-buffer-from-WMI-metho.patch)
>=20
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 6cb55a6..fb4ee5f 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -98,13 +98,26 @@ enum acer_wmi_event_ids {
> =20
>  static const struct key_entry acer_wmi_keymap[] =3D {
>  	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
> +	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x12, {KEY_BLUETOOTH} },	/* BT */
>  	{KE_KEY, 0x21, {KEY_PROG1} },    /* Backup */
>  	{KE_KEY, 0x22, {KEY_PROG2} },    /* Arcade */
>  	{KE_KEY, 0x23, {KEY_PROG3} },    /* P_Key */
>  	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
> +	{KE_IGNORE, 0x41, {KEY_MUTE} },
> +	{KE_IGNORE, 0x42, {KEY_PREVIOUSSONG} },
> +	{KE_IGNORE, 0x43, {KEY_NEXTSONG} },
> +	{KE_IGNORE, 0x44, {KEY_PLAYPAUSE} },
> +	{KE_IGNORE, 0x45, {KEY_STOP} },
> +	{KE_IGNORE, 0x48, {KEY_VOLUMEUP} },
> +	{KE_IGNORE, 0x49, {KEY_VOLUMEDOWN} },
> +	{KE_IGNORE, 0x61, {KEY_SWITCHVIDEOMODE} },
> +	{KE_IGNORE, 0x62, {KEY_BRIGHTNESSUP} },
> +	{KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },
>  	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
> +	{KE_IGNORE, 0x81, {KEY_SLEEP} },
>  	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
> +	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
>  	{KE_END, 0}
>  };
> =20
> @@ -1345,7 +1358,7 @@ static void acer_wmi_notify(u32 value, void *co=
ntext)
>  	case WMID_HOTKEY_EVENT:
>  		if (return_value.device_state) {
>  			u16 device_state =3D return_value.device_state;
> -			pr_debug("deivces states: 0x%x\n", device_state);
> +			pr_debug("device state: 0x%x\n", device_state);
>  			if (has_cap(ACER_CAP_WIRELESS))
>  				rfkill_set_sw_state(wireless_rfkill,
>  				!(device_state & ACER_WMID3_GDS_WIRELESS));
