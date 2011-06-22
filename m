From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 2/2] acer-wmi: Only update rfkill status for
 associated hotkey events
Date: Wed, 22 Jun 2011 04:15:46 -0600
Message-ID: <4E024D72020000230002E93C@novprvlin0050.provo.novell.com>
References: <20110621165859.GB25609@thinkpad-t410>
 <1308675633-10384-2-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:40043 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752552Ab1FVKPu (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:3:1>);
	Wed, 22 Jun 2011 06:15:50 -0400
In-Reply-To: <1308675633-10384-2-git-send-email-seth.forshee@canonical.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: seth.forshee@canonical.com
Cc: Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-06-21 =E6=96=BC 12:00 -0500=EF=BC=8CSe=
th Forshee =E6=8F=90=E5=88=B0=EF=BC=9A
> acer-wmi is indiscriminately using the device state from hotkey
> events to update the various rfkill states. On the Aspire 1830 this
> can result in a soft block on the wlan when the touchpad hotkey is
> pressed, as it is reporting a non-zero device state that does not
> reflect the wireless status. To fix this, only update rfkill states
> when a wlan or bluetooth hotkey is pressed.
>=20
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   41 ++++++++++++++++++++++++-----=
---------
>  1 files changed, 26 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 0dd6986..591eb7a 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1446,6 +1446,8 @@ static void acer_wmi_notify(u32 value, void *co=
ntext)
>  	union acpi_object *obj;
>  	struct event_return_value return_value;
>  	acpi_status status;
> +	u16 device_state;
> +	const struct key_entry *key;
> =20
>  	status =3D wmi_get_event_data(value, &response);
>  	if (status !=3D AE_OK) {
> @@ -1473,23 +1475,32 @@ static void acer_wmi_notify(u32 value, void *=
context)
> =20
>  	switch (return_value.function) {
>  	case WMID_HOTKEY_EVENT:
> -		if (return_value.device_state) {
> -			u16 device_state =3D return_value.device_state;
> -			pr_debug("device state: 0x%x\n", device_state);
> -			if (has_cap(ACER_CAP_WIRELESS))
> -				rfkill_set_sw_state(wireless_rfkill,
> -				!(device_state & ACER_WMID3_GDS_WIRELESS));
> -			if (has_cap(ACER_CAP_BLUETOOTH))
> -				rfkill_set_sw_state(bluetooth_rfkill,
> -				!(device_state & ACER_WMID3_GDS_BLUETOOTH));
> -			if (has_cap(ACER_CAP_THREEG))
> -				rfkill_set_sw_state(threeg_rfkill,
> -				!(device_state & ACER_WMID3_GDS_THREEG));
> -		}
> -		if (!sparse_keymap_report_event(acer_wmi_input_dev,
> -				return_value.key_num, 1, true))
> +		device_state =3D return_value.device_state;
> +		pr_debug("device state: 0x%x\n", device_state);
> +
> +		key =3D sparse_keymap_entry_from_scancode(acer_wmi_input_dev,
> +							return_value.key_num);
> +		if (!key) {
>  			pr_warn("Unknown key number - 0x%x\n",
>  				return_value.key_num);
> +		} else {
> +			switch (key->keycode) {
> +			case KEY_WLAN:
> +			case KEY_BLUETOOTH:
> +				if (has_cap(ACER_CAP_WIRELESS))
> +					rfkill_set_sw_state(wireless_rfkill,
> +						!(device_state & ACER_WMID3_GDS_WIRELESS));
> +				if (has_cap(ACER_CAP_THREEG))
> +					rfkill_set_sw_state(threeg_rfkill,
> +						!(device_state & ACER_WMID3_GDS_THREEG));
> +				if (has_cap(ACER_CAP_BLUETOOTH))
> +					rfkill_set_sw_state(bluetooth_rfkill,
> +						!(device_state & ACER_WMID3_GDS_BLUETOOTH));
> +				break;
> +			}
> +			sparse_keymap_report_entry(acer_wmi_input_dev, key,
> +						   1, true);
> +		}
>  		break;
>  	default:
>  		pr_warn("Unknown function number - %d - %d\n",

Signed-off-by: Lee, Chun-Yi <jlee@novell.com>

Tested on Acer TravelMate 8572, patch works no problem!


Thank's for your patch!
Joey Lee
