From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] acer-wmi: does not poll device status when WMI
 event is available
Date: Mon, 28 Mar 2011 02:43:36 -0600
Message-ID: <4D90E4E8020000230002A7D8@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: corentincj@iksaif.net, dtor@mail.ru, mjg@redhat.com, carlos@strangeworlds.co.uk, trenn@suse.de

=E6=96=BC =E5=85=AD=EF=BC=8C2011-03-19 =E6=96=BC 07:46 +0800=EF=BC=8CLe=
e, Chun-Yi =E6=8F=90=E5=88=B0=EF=BC=9A
> Acer WMI hotkey event's result include current device status, just
> need sync the status to killswitch after acer-wmi driver receive
> hotkey event but not always poll device status. This is good for
> performance.
>=20
> But, if use EC raw mode, Acer BIOS will not emit wmi event and
> leave EC to control device status. So, still startup polling job
> when doesn't detect WMI event GUID or user choice to use ec_raw_mode.
>=20
> Tested on Acer TravelMate 8572 notebook.
>=20
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Dmitry Torokhov <dtor@mail.ru>
> Cc: Corentin Chary <corentincj@iksaif.net>
> Cc: Thomas Renninger <trenn@suse.de>
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   20 ++++++++++++++++++--
>  1 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 1953c70..9764ddc 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1224,14 +1224,17 @@ static int acer_rfkill_init(struct device *de=
v)
>  		}
>  	}
> =20
> -	schedule_delayed_work(&acer_rfkill_work, round_jiffies_relative(HZ)=
);
> +	if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
> +		schedule_delayed_work(&acer_rfkill_work,
> +			round_jiffies_relative(HZ));
> =20
>  	return 0;
>  }
> =20
>  static void acer_rfkill_exit(void)
>  {
> -	cancel_delayed_work_sync(&acer_rfkill_work);
> +	if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
> +		cancel_delayed_work_sync(&acer_rfkill_work);
> =20
>  	rfkill_unregister(wireless_rfkill);
>  	rfkill_destroy(wireless_rfkill);
> @@ -1332,6 +1335,19 @@ static void acer_wmi_notify(u32 value, void *c=
ontext)
>  				return_value.key_num, 1, true))
>  			pr_warning("Unknown key number - 0x%x\n",
>  				return_value.key_num);
> +		if (return_value.device_state) {
> +			u16 device_state =3D return_value.device_state;
> +			pr_debug("deivces states: 0x%x\n", device_state);
> +			if (has_cap(ACER_CAP_WIRELESS))
> +				rfkill_set_sw_state(wireless_rfkill,
> +				!(device_state & ACER_WMID3_GDS_WIRELESS));
> +			if (has_cap(ACER_CAP_BLUETOOTH))
> +				rfkill_set_sw_state(bluetooth_rfkill,
> +				!(device_state & ACER_WMID3_GDS_BLUETOOTH));
> +			if (has_cap(ACER_CAP_THREEG))
> +				rfkill_set_sw_state(threeg_rfkill,
> +				!(device_state & ACER_WMID3_GDS_THREEG));
> +		}
>  		break;
>  	default:
>  		pr_warning("Unknown function number - %d - %d\n",

That will be better move the set devices state to before send out key
event when rfkill-input enabled:

@@ -1338,6 +1341,19 @@ static void acer_wmi_notify(u32 value, void *con=
text)
=20
        switch (return_value.function) {
        case WMID_HOTKEY_EVENT:
+               if (return_value.device_state) {
+                       u16 device_state =3D return_value.device_state;
+                       pr_debug("deivces states: 0x%x\n", device_state=
);
+                       if (has_cap(ACER_CAP_WIRELESS))
+                               rfkill_set_sw_state(wireless_rfkill,
+                               !(device_state & ACER_WMID3_GDS_WIRELES=
S));
+                       if (has_cap(ACER_CAP_BLUETOOTH))
+                               rfkill_set_sw_state(bluetooth_rfkill,
+                               !(device_state & ACER_WMID3_GDS_BLUETOO=
TH));
+                       if (has_cap(ACER_CAP_THREEG))
+                               rfkill_set_sw_state(threeg_rfkill,
+                               !(device_state & ACER_WMID3_GDS_THREEG)=
);
+               }
                if (!sparse_keymap_report_event(acer_wmi_input_dev,
                                return_value.key_num, 1, true))
                        pr_warning("Unknown key number - 0x%x\n",

Will send out v2 patch for review.


Thank's
Joey Lee
