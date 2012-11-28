From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 3/6] msi-laptop: Code cleanups
Date: Wed, 28 Nov 2012 11:11:50 +0800
Message-ID: <1354072310.21227.962.camel@linux-s257.site>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
	 <1353796141-1470-4-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:42382 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437Ab2K1DMt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Nov 2012 22:12:49 -0500
In-Reply-To: <1353796141-1470-4-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com

=E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:28 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Replaced msi_init_rfkill() by msi_update_rfkill(), removed delays by
> replacing delayed works by just works and made msi_laptop_i8042_filte=
r()
> filter out KEY_TOUCHPAD_TOGGLE when sending KEY_TOUCHPAD_ON and
> KEY_TOUCHPAD_OFF.

Please separate to 2 patches, one for touchpad key and other one for
rfkill.

And,=20
I am not agree for the clean up to msi_init_rfkill unless it causes
problem on U90/U100. Did you find any issue on U90/U100?

I delay 1 magic second for msi_rfkill_init because there have other MSI
model need a delay time after we set SCM mode through write EC
register.=20
So, please don't change the code for msi_init_rfkill delay work, just
keep it works with other MSI shipping machines.

>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  drivers/platform/x86/msi-laptop.c | 67 ++++++++++++++---------------=
----------
>  1 file changed, 24 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86=
/msi-laptop.c
> index 7ba107a..3b6f494 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -600,8 +600,23 @@ static const struct rfkill_ops rfkill_threeg_ops=
 =3D {
>  	.set_block =3D rfkill_threeg_set
>  };
> =20
> +static void msi_update_rfkill(struct work_struct *ignored)
> +{
> +	get_wireless_state_ec_standard();
> +
> +	if (rfk_wlan)
> +		rfkill_set_sw_state(rfk_wlan, !wlan_s);
> +	if (rfk_bluetooth)
> +		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
> +	if (rfk_threeg)
> +		rfkill_set_sw_state(rfk_threeg, !threeg_s);
> +}
> +static DECLARE_WORK(msi_rfkill_work, msi_update_rfkill);
> +
>  static void rfkill_cleanup(void)
>  {
> +	cancel_work_sync(&msi_rfkill_work);
> +
>  	if (rfk_bluetooth) {
>  		rfkill_unregister(rfk_bluetooth);
>  		rfkill_destroy(rfk_bluetooth);
> @@ -618,19 +633,6 @@ static void rfkill_cleanup(void)
>  	}
>  }
> =20
> -static void msi_update_rfkill(struct work_struct *ignored)
> -{
> -	get_wireless_state_ec_standard();
> -
> -	if (rfk_wlan)
> -		rfkill_set_sw_state(rfk_wlan, !wlan_s);
> -	if (rfk_bluetooth)
> -		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
> -	if (rfk_threeg)
> -		rfkill_set_sw_state(rfk_threeg, !threeg_s);
> -}
> -static DECLARE_DELAYED_WORK(msi_rfkill_work, msi_update_rfkill);
> -
>  static void msi_send_touchpad_key(struct work_struct *ignored)
>  {
>  	u8 rdata;
> @@ -644,7 +646,7 @@ static void msi_send_touchpad_key(struct work_str=
uct *ignored)
>  		(rdata & MSI_STANDARD_EC_TOUCHPAD_MASK) ?
>  		KEY_TOUCHPAD_ON : KEY_TOUCHPAD_OFF, 1, true);
>  }
> -static DECLARE_DELAYED_WORK(msi_touchpad_work, msi_send_touchpad_key=
);
> +static DECLARE_WORK(msi_touchpad_work, msi_send_touchpad_key);
> =20
>  static bool msi_laptop_i8042_filter(unsigned char data, unsigned cha=
r str,
>  				struct serio *port)
> @@ -662,14 +664,16 @@ static bool msi_laptop_i8042_filter(unsigned ch=
ar data, unsigned char str,
>  		extended =3D false;
>  		switch (data) {
>  		case 0xE4:
> -			schedule_delayed_work(&msi_touchpad_work,
> -				round_jiffies_relative(0.5 * HZ));
> -			break;
> +			schedule_work(&msi_touchpad_work);

Don't remove the 0.5 magic delay, please! It will cause other shipped
MSI machines got problem could not capture the real change of EC
register.

> +		case 0x64:
> +			/* Filter out KEY_TOUCHPAD_TOGGLE and send only
> +			 * KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF
> +			 */
> +			return true;

Why this patch filter out 0x64 key? What's the scan code emitted when
press the touchpad on/off Fn key on U100? Does it emit
KEY_TOUCHPAD_TOGGLE and KEY_TOUCHPAD_ON/OFF at the same time?

>  		case 0x54:
>  		case 0x62:
>  		case 0x76:
> -			schedule_delayed_work(&msi_rfkill_work,
> -				round_jiffies_relative(0.5 * HZ));
> +			schedule_work(&msi_rfkill_work);
>  			break;
>  		}
>  	}
> @@ -677,31 +681,11 @@ static bool msi_laptop_i8042_filter(unsigned ch=
ar data, unsigned char str,
>  	return false;
>  }
> =20
> -static void msi_init_rfkill(struct work_struct *ignored)
> -{
> -	if (rfk_wlan) {
> -		rfkill_set_sw_state(rfk_wlan, !wlan_s);
> -		rfkill_wlan_set(NULL, !wlan_s);
> -	}
> -	if (rfk_bluetooth) {
> -		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
> -		rfkill_bluetooth_set(NULL, !bluetooth_s);
> -	}
> -	if (rfk_threeg) {
> -		rfkill_set_sw_state(rfk_threeg, !threeg_s);
> -		rfkill_threeg_set(NULL, !threeg_s);
> -	}
> -}
> -static DECLARE_DELAYED_WORK(msi_rfkill_init, msi_init_rfkill);
> -
>  static int rfkill_init(struct platform_device *sdev)
>  {
>  	/* add rfkill */
>  	int retval;
> =20
> -	/* keep the hardware wireless state */
> -	get_wireless_state_ec_standard();
> -
>  	rfk_bluetooth =3D rfkill_alloc("msi-bluetooth", &sdev->dev,
>  				RFKILL_TYPE_BLUETOOTH,
>  				&rfkill_bluetooth_ops, NULL);
> @@ -736,8 +720,7 @@ static int rfkill_init(struct platform_device *sd=
ev)
>  	}
> =20
>  	/* schedule to run rfkill state initial */
> -	schedule_delayed_work(&msi_rfkill_init,
> -				round_jiffies_relative(1 * HZ));
> +	schedule_work(&msi_rfkill_work);
> =20
>  	return 0;
> =20
> @@ -951,7 +934,6 @@ fail_platform_device2:
> =20
>  	if (load_scm_model) {
>  		i8042_remove_filter(msi_laptop_i8042_filter);
> -		cancel_delayed_work_sync(&msi_rfkill_work);
>  		rfkill_cleanup();
>  	}
>  	platform_device_del(msipf_device);
> @@ -976,7 +958,6 @@ static void __exit msi_cleanup(void)
>  	if (load_scm_model) {
>  		i8042_remove_filter(msi_laptop_i8042_filter);
>  		msi_laptop_input_destroy();
> -		cancel_delayed_work_sync(&msi_rfkill_work);
>  		rfkill_cleanup();
>  	}
> =20

Thanks a lot!
Joey Lee
