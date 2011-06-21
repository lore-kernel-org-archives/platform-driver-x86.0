From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi problem handling device states from WMI events
Date: Tue, 21 Jun 2011 04:30:06 -0600
Message-ID: <4E00FF4E020000230002E852@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:54874 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752478Ab1FUKaO (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:3:1>);
	Tue, 21 Jun 2011 06:30:14 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <JLee@novell.com>
Cc: seth.forshee@canonical.com, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-06-21 =E6=96=BC 10:16 +0000=EF=BC=8Cjo=
eyli(Joey Lee) =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Seth,=20
>=20
> =E6=96=BC =E4=B8=80=EF=BC=8C2011-06-20 =E6=96=BC 14:06 -0500=EF=BC=8C=
Seth Forshee =E6=8F=90=E5=88=B0=EF=BC=9A
> > Hi Joey,
> >=20
> > acer-wmi is indiscriminately using the device state from hotkey eve=
nts
> > to update the various rfkill states. On the Aspire 1830 this can re=
sult
> > in a soft block on the wlan when the touchpad hotkey is pressed, as=
 it
> > is reporting a non-zero device state that does not reflect the wire=
less
> > status.
> >=20
>=20
> Thank's for you found out this issue, I didn't meet it because touchp=
ad
> hotkey didn't emit any wmi event on my Acer TravelMate 8572.=20
>=20
> I will double check it.
>=20

Just checked, it also emit touchpad wmi event, I missed it.

Will test your patch, I will check KEY_WLAN and KEY_BLUETOOTH in the
same case to update killswitch states.


Thank's a lot1
Joey Lee

> > I beleive the following (untested) patch is a roughly correct fix f=
or
> > this issue.  It changes acer-wmi to only update the rfkill states w=
hen
> > the appropriate hotkeys are pressed, but I'm a little unsure about =
the
> > way I've split out the rfkill updates acording to the hotkeys. I do=
n't
> > see any support in the driver for a 3G hotkey, so I've grouped it w=
ith
> > the wlan key, and I have split out bluetooth to be handled separate=
ly
> > from these. Does this patch look correct?
> >=20
> > Thanks,
> > Seth
> >=20
>=20
> Yes, I thought your patch can avoid acer-wmi update killswitch state
> base on the result from non-Communication button.
>=20
> On some Acer machines only have one wireless key, the key only emit
> KEY_WIRELESS but EC updates 3 communication devices' states, I though=
t
> we can direct update 3 killswitch state when received KEY_WLAN or
> KEY_BLUETOOTH. maybe like this:
>=20
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
>=20
> Of course need more testing on my and your Acer machines.
> I will double check this patch on my TravelMate 8572 then reply resul=
t
> on this mail tomorrow.
>=20
>=20
> Thank's a lot!
> Joey Lee
>=20
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index 005417b..592328d 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -1445,6 +1445,8 @@ static void acer_wmi_notify(u32 value, void *=
context)
> >  	union acpi_object *obj;
> >  	struct event_return_value return_value;
> >  	acpi_status status;
> > +	u16 device_state;
> > +	const struct key_entry *key;
> > =20
> >  	status =3D wmi_get_event_data(value, &response);
> >  	if (status !=3D AE_OK) {
> > @@ -1472,23 +1474,33 @@ static void acer_wmi_notify(u32 value, void=
 *context)
> > =20
> >  	switch (return_value.function) {
> >  	case WMID_HOTKEY_EVENT:
> > -		if (return_value.device_state) {
> > -			u16 device_state =3D return_value.device_state;
> > -			pr_debug("device state: 0x%x\n", device_state);
> > -			if (has_cap(ACER_CAP_WIRELESS))
> > -				rfkill_set_sw_state(wireless_rfkill,
> > -				!(device_state & ACER_WMID3_GDS_WIRELESS));
> > -			if (has_cap(ACER_CAP_BLUETOOTH))
> > -				rfkill_set_sw_state(bluetooth_rfkill,
> > -				!(device_state & ACER_WMID3_GDS_BLUETOOTH));
> > -			if (has_cap(ACER_CAP_THREEG))
> > -				rfkill_set_sw_state(threeg_rfkill,
> > -				!(device_state & ACER_WMID3_GDS_THREEG));
> > -		}
> > -		if (!sparse_keymap_report_event(acer_wmi_input_dev,
> > -				return_value.key_num, 1, true))
> > +		device_state =3D return_value.device_state;
> > +		pr_debug("device state: 0x%x\n", device_state);
> > +
> > +		key =3D sparse_keymap_entry_from_scancode(acer_wmi_input_dev,
> > +							return_value.key_num);
> > +		if (!key) {
> >  			pr_warn("Unknown key number - 0x%x\n",
> >  				return_value.key_num);
> > +		} else {
> > +			switch (key->keycode) {
> > +			case KEY_WLAN:
> > +				if (has_cap(ACER_CAP_WIRELESS))
> > +					rfkill_set_sw_state(wireless_rfkill,
> > +						!(device_state & ACER_WMID3_GDS_WIRELESS));
> > +				if (has_cap(ACER_CAP_THREEG))
> > +					rfkill_set_sw_state(threeg_rfkill,
> > +						!(device_state & ACER_WMID3_GDS_THREEG));
> > +				break;
> > +			case KEY_BLUETOOTH:
> > +				if (has_cap(ACER_CAP_BLUETOOTH))
> > +					rfkill_set_sw_state(bluetooth_rfkill,
> > +						!(device_state & ACER_WMID3_GDS_BLUETOOTH));
> > +				break;
> > +			}
> > +			sparse_keymap_report_entry(acer_wmi_input_dev, key,
> > +						   1, true);
> > +		}
> >  		break;
> >  	default:
> >  		pr_warn("Unknown function number - %d - %d\n",
>=20
