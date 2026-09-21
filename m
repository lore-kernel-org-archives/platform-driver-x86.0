Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923304AB1DF;
	Mon, 21 Sep 2026 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002592; cv=pass; b=gOi0JIJppKiskrFFnc/yTX0wxtHiNITW2Xlj6Z7+4Xgp6vJa1Kis2pB2rmjtDPgmmppkhSG+INPThNTi72ko7CrEI+xCoyRVlS9vlGhcIJAUqSnh2ofl28/nvz1IBp2LYvY0ngCONcGDBudZ3vlfRLH13PqB2piRWeuIwuGWTD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002592; c=relaxed/simple;
	bh=la1Du8mcXxdGqPf40SMi2OLT9f2OHZwOTUuKXcJx3wI=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UfW5CB/lL4EGGB8IiMrszyHq3trdB14JcaCCiaaTnr/fKzLraPZdNtf6mvAxPBZvWgvCZrt5nkOKeKxVF/Vfh8UJC5oH3c+qRqbt6kDRU5q2xgqI3N88GB8z8q5CNMqb6VNAz1A27S27PtAfWAq//BFIoI8ZeR+p8MlmoQsf/Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Dr95RtgF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Dr95RtgF"
ARC-Seal: i=1; a=rsa-sha256; t=1790002558; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kcKBhyLEF+sAAg/FKzjQBHTlTM1+96/KF9qTnDErk0RtV410w+VlAXT3EgebT+1vMYN/NAEg/7ZypXCJSn7DFN2MTRDxw/4wiNkA5XW7O1zvzw2CGgsI/yaBW5oNvjq/D9sACwUTGxNOmbTjKcNwWI9kk3hRr9WvGSfKkdYQNoo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790002558; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jppDzJ/nQ0LcrEVRAHD4jQ/mRCVXofUB8MV5D9p5u8U=; 
	b=bQTx6GpkhQyxJwYZPmKbEB94xa0rPnJVcpWOdJ4cYGP3B8cGy/oL1Um8jAwk67velVNNqCribJKmmeBCRHADxQ8USY50sevL2DB+V1cUx+MNCZcmfynVxMB6ut4dylrJsTNpzq2zgZQq4A8ppVmy5lDL8IexcZw/J3CeBmac8pw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790002558;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=jppDzJ/nQ0LcrEVRAHD4jQ/mRCVXofUB8MV5D9p5u8U=;
	b=Dr95RtgFNHu9PtWP3B4VDnKg5k04POyM15HPyieqQPHWgsFuwqFB1IosZEzhpVER
	KhFbtJWxLlNUoVUSCzHUKuJ6PQ1Ymw3c/em9lDsNsuKj8KRScauRoh03eNgm7IDyjbU
	1TTiAKZn2H49lgVLW8zZdoOqcy/z3fUvGAJ+UY+G0vzLqFKP+TpqtKd9MssDLEgGtrl
	zsrfu8S6cxIgWLg1rE6P4Yqqv0pnRDDysLNXfk3aqssi8QZnPGaBU2ko5lJAhqBXdsl
	Xklf9EM6JoIda6czjrG+u082tnM03KCAbOdVS0MpPJT2N+p4pKAtFRI5HxJNXTbJJKj
	c+2uKYMzNw==
Received: by smtp.zohomail.com with SMTPS id 1790002557953542.0689697822978;
	Mon, 21 Sep 2026 07:55:57 -0700 (PDT)
Message-ID: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch
 as SW_CAMERA_LENS_COVER
From: Rong Zhang <i@rong.moe>
To: Marco Giunta <marco_giunta@outlook.it>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Hans de Goede <hansg@kernel.org>
Cc: Huang Wei <huangwei@kylinos.cn>, "Derek J . Clark"
	 <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
References: 
	<SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Type: multipart/mixed; boundary="=-9hxTBI5gC9HmuJByyWXn"
Date: Mon, 21 Sep 2026 22:50:50 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.848.60
X-ZohoMailClient: External

--=-9hxTBI5gC9HmuJByyWXn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Macro,

On Sun, 2026-09-20 at 22:28 +0200, Marco Giunta wrote:
> On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legion
> Pro 7 16AFR10H, a switch on the side disables the camera. This is handled
> by the firmware, which also sends event 0x0d (camera disabled) or 0x0c
> (camera enabled) through the WMI event GUID handled with
> ideapad_wmi_context_fn_keys. These events are currently reported as
> KEY_UNKNOWN.
>=20
> Other Lenovo laptops expose a similar camera switch through a separate WM=
I
> GUID, which lenovo-wmi-camera reports as SW_CAMERA_LENS_COVER since
> commit d98bf6a6ed61 ("platform/x86: lenovo-wmi-camera: Use
> SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS"). That driver does not
> bind on these laptops, so do the same here: as the switch state cannot be
> read from the firmware, register a separate input device with the switch
> on the first event, and report the state carried by each event.
>=20
> Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
> ---
> Changes in v2:
>=20
> * Add lockdep_assert_held(&ideapad_shared_mutex) and a comment at the top
>   of ideapad_camera_switch_report() to document and check that the WMI
>   notify path is serialized through ideapad_shared_mutex (suggested by
>   Huang Wei)
> * Replace dev_warn() with dev_warn_once() in
>   ideapad_camera_switch_report() so that a persistent registration failur=
e
>   does not log a warning on every toggle (suggested by Huang Wei)
>=20
> Link to v1: https://lore.kernel.org/platform-driver-x86/SN6PR19MB23039910=
DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com/
>=20
> Notes (copied verbatim from v1, to keep the context easily accessible):
>=20
> * I considered a couple of alternatives to the approach in this patch:
>=20
>   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABLE:
>=20
>       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABLE } },
>       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISABLE } },
>=20
>       similar to the touchpad off/on hkey events (66/67) this driver emit=
s
>       after the firmware has toggled the touchpad state.=C2=A0However, HU=
TRR72
>       describes these hkey events as asserting a camera access state for
>       the host to apply, rather than reporting one the firmware has
>       already applied.=C2=A0
>=20

Well, it really doesn't matter how the specification says; what matters
is how devices in reality do: whenever the HID Usage Table doesn't define
a usage for hardware/firmware to report the already-applied value but
defines a usage for notifying the host to apply a specific value, a lot
of devices will emerge, using the latter even when the former is
intended.

For example, many USB Audio Class devices come with volume control
buttons or knobs. Some of them tune the volume themselves as well as
emitting Volume Increment/Decrement HID events.

In this case, the audio stack, in response to the HID events,
intentionally overrides the volume set by hardware, effectively
synchronizing the hardware and software volume value.

The pattern has become so common that many devices like that also
implement an internal timeout mechanism. They only set the volume
themselves when reaching the timeout with no UAC volume control request
received.

IOW, it doesn't matter whether the hardware/firmware has done its job as
long as the subsequent software control is harmless. That's why we can
safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggled the
touchpad state. They cause the desktop environment to mask/unmask
touchpad input, which is essentially a no-op (thus a safe operation) when
the firmware has already disabled/enabled the touchpad.

Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABLE is also
OK. It's just...

> Furthermore, lenovo-wmi-camera moved away from
>       these hkey events in favor of SW_CAMERA_LENS_COVER in the quoted
>       commit, which is arguably the closest relevant precedent.

...relatively new and isn't widely used compared to SW_CAMERA_LENS_COVER.

Thus, I agreed that using SW_CAMERA_LENS_COVER is a better approach as it
aligns with other drivers' behavior. The patch seems over-engineered
though, see below.

>    =20
>   2.  Ignore these events like the firmware-handled FnLock events:
>=20
> 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
> 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
>=20
>       This fixes the KEY_UNKNOWN issue, but userspace gets no information=
.
>    =20
>   Overall, in the end I copied the approach of the lenovo-wmi-camera
>   driver. Kindly let me know if there are other/better solutions.
>    =20
> * Unlike the touchpad, whose state this driver reads with VPCCMD_R_TOUCHP=
AD
>   at probe, on resume and on each event,=C2=A0
>=20

At least for the input device, the synchronization on probe or on resume
does not matter, as no input event is emitted due to !send_events.

> the camera switch state is only
>   available in EC-private fields, and the two tested laptops even use
>   different ones. Hence the lenovo-wmi-camera approach: the switch appear=
s
>   on the first event, and a change made while suspended is not reported,
>   leaving the state wrong until the switch is toggled again.

So the difference compared to the lenovo-wmi-camera approach is only
about when and how the input device is registered.

On recent models, the firmware neither emits VPCCMD_R_TOUCHPAD nor
toggles the touchpad. It leaves the job to software by emitting WMI key
event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ideapad_keymap.
It'd be tidier to take that approach and reuse the existing input device.
Sparse keymap supports KEY_SW, so it's viable to map the two WMI events
to SW_CAMERA_LENS_COVER with appropriate switch value.

I've attached a patch implementing the approach. Could you test if it
works on your devices? If so, you may submit my patch yourself by adding
a From: pseudo header with my identity and swapping the two Signed-off-
by: tags. I can also submit it myself as long as you permit me to do so.

>=20
> * For reference, on KDE Plasma 6.7.5, using the Legion's touchpad toggle
>   button shows an OSD, but nothing on a SW_CAMERA_LENS_COVER change or if
>   sending KEY_CAMERA_ACCESS_ENABLE/DISABLE events. I am not sure whether
>   this is simply a case of "not implemented yet" or if I misunderstood ho=
w
>   these events are supposed to be used to communicate with userspace.
>   Please feel free to correct me here.

I believe KDE Plasma has not implemented it yet. You may raise an issue
on their Bugzilla.

Thanks,
Rong

>  =20
> Best regards,
> Marco
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 59 ++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 207368f5d489..0066638ee332 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -178,6 +178,7 @@ struct ideapad_private {
>  	struct ideapad_rfk_priv rfk_priv[IDEAPAD_RFKILL_DEV_NUM];
>  	struct platform_device *platform_device;
>  	struct input_dev *inputdev;
> +	struct input_dev *camera_switch_idev;
>  	struct backlight_device *blightdev;
>  	struct ideapad_dytc_priv *dytc;
>  	struct dentry *debug;
> @@ -1410,10 +1411,43 @@ static int ideapad_input_init(struct ideapad_priv=
ate *priv)
>  	return err;
>  }
> =20
> +static int ideapad_camera_switch_init(struct ideapad_private *priv, bool=
 covered)
> +{
> +	struct input_dev *idev;
> +	int err;
> +
> +	idev =3D input_allocate_device();
> +	if (!idev)
> +		return -ENOMEM;
> +
> +	idev->name =3D "Ideapad Camera Switch";
> +	idev->phys =3D "ideapad/input1";
> +	idev->id.bustype =3D BUS_HOST;
> +	idev->dev.parent =3D &priv->platform_device->dev;
> +
> +	input_set_capability(idev, EV_SW, SW_CAMERA_LENS_COVER);
> +	input_report_switch(idev, SW_CAMERA_LENS_COVER, covered);
> +	input_sync(idev);
> +
> +	err =3D input_register_device(idev);
> +	if (err) {
> +		input_free_device(idev);
> +		return err;
> +	}
> +
> +	priv->camera_switch_idev =3D idev;
> +	return 0;
> +}
> +
>  static void ideapad_input_exit(struct ideapad_private *priv)
>  {
>  	input_unregister_device(priv->inputdev);
>  	priv->inputdev =3D NULL;
> +
> +	if (priv->camera_switch_idev) {
> +		input_unregister_device(priv->camera_switch_idev);
> +		priv->camera_switch_idev =3D NULL;
> +	}
>  }
> =20
>  static void ideapad_input_report(struct ideapad_private *priv,
> @@ -1422,6 +1456,22 @@ static void ideapad_input_report(struct ideapad_pr=
ivate *priv,
>  	sparse_keymap_report_event(priv->inputdev, scancode, 1, true);
>  }
> =20
> +static void ideapad_camera_switch_report(struct ideapad_private *priv, b=
ool covered)
> +{
> +	/* The WMI notify path is serialized through ideapad_shared_mutex */
> +	lockdep_assert_held(&ideapad_shared_mutex);
> +
> +	if (!priv->camera_switch_idev) {
> +		if (ideapad_camera_switch_init(priv, covered))
> +			dev_warn_once(&priv->platform_device->dev,
> +				      "Failed to register camera switch input device\n");
> +		return;
> +	}
> +
> +	input_report_switch(priv->camera_switch_idev, SW_CAMERA_LENS_COVER, cov=
ered);
> +	input_sync(priv->camera_switch_idev);
> +}
> +
>  static void ideapad_input_novokey(struct ideapad_private *priv)
>  {
>  	unsigned long long_pressed;
> @@ -2312,6 +2362,15 @@ static void ideapad_wmi_notify(struct wmi_device *=
wdev, union acpi_object *data)
>  			break;
>  		}
> =20
> +		/*
> +		 * Camera switch, handled by the firmware:
> +		 * 0x0c camera enabled, 0x0d camera disabled
> +		 */
> +		if (data->integer.value =3D=3D 0x0c || data->integer.value =3D=3D 0x0d=
) {
> +			ideapad_camera_switch_report(priv, data->integer.value =3D=3D 0x0d);
> +			break;
> +		}
> +
>  		/* 0x02 FnLock, 0x03 Esc */
>  		if (data->integer.value =3D=3D 0x02 || data->integer.value =3D=3D 0x03=
)
>  			ideapad_fn_lock_led_notify(priv, data->integer.value =3D=3D 0x02);
>=20
> base-commit: f475845eaf3d749114a63270bf2efea459e14dd2

--=-9hxTBI5gC9HmuJByyWXn
Content-Disposition: attachment;
	filename*0=0001-platform-x86-ideapad-laptop-report-camera-switch-as-sw_c;
	filename*1=amera_lens_cover.patch
Content-Type: text/x-patch;
	name*0=0001-platform-x86-ideapad-laptop-report-camera-switch-as-sw_camer;
	name*1=a_lens_cover.patch; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA2OWFmZjlhODcwNWUyZWUyOGE1OTcyMmZhMTMzYzZlNDkyZmU1MjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb25nIFpoYW5nIDxpQHJvbmcubW9lPgpEYXRlOiBNb24sIDIx
IFNlcCAyMDI2IDIxOjQ3OjE3ICswODAwClN1YmplY3Q6IFtQQVRDSCB2M10gcGxhdGZvcm0veDg2
OiBpZGVhcGFkLWxhcHRvcDogUmVwb3J0IGNhbWVyYSBzd2l0Y2ggYXMgU1dfQ0FNRVJBX0xFTlNf
Q09WRVIKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PSJ1dGYtOCIKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogN2JpdApNZXNzYWdlLUlkOiA8MjAy
NjA5MjEtaWRlYXBhZC1sYXB0b3AtY2FtZXJhLXN3LXYzLTEtZjAyOGYwMDdmNmQ3QHJvbmcubW9l
PgpYLUNoYW5nZS1JRDogODUxMWM2ZGEtaWRlYXBhZC1sYXB0b3AtY2FtZXJhLXN3LTk0OGU0NjUz
YjIwZQoKT24gY2VydGFpbiAyMDI1IExlbm92byBsYXB0b3BzLCBzdWNoIGFzIHRoZSBZb2dhIFBy
byA3IDE0QVNQMTAgYW5kIExlZ2lvbgpQcm8gNyAxNkFGUjEwSCwgYSBzd2l0Y2ggb24gdGhlIHNp
ZGUgZGlzYWJsZXMgdGhlIGNhbWVyYS4gVGhpcyBpcyBoYW5kbGVkCmJ5IHRoZSBmaXJtd2FyZSwg
d2hpY2ggYWxzbyBzZW5kcyBldmVudCAweDBkIChjYW1lcmEgZGlzYWJsZWQpIG9yIDB4MGMKKGNh
bWVyYSBlbmFibGVkKSB0aHJvdWdoIHRoZSBXTUkgZXZlbnQgR1VJRCBoYW5kbGVkIHdpdGgKaWRl
YXBhZF93bWlfY29udGV4dF9mbl9rZXlzLiBUaGVzZSBldmVudHMgYXJlIGN1cnJlbnRseSByZXBv
cnRlZCBhcwpLRVlfVU5LTk9XTi4KCk90aGVyIExlbm92byBsYXB0b3BzIGV4cG9zZSBhIHNpbWls
YXIgY2FtZXJhIHN3aXRjaCB0aHJvdWdoIGEgc2VwYXJhdGUgV01JCkdVSUQsIHdoaWNoIGxlbm92
by13bWktY2FtZXJhIHJlcG9ydHMgYXMgU1dfQ0FNRVJBX0xFTlNfQ09WRVIgc2luY2UKY29tbWl0
IGQ5OGJmNmE2ZWQ2MSAoInBsYXRmb3JtL3g4NjogbGVub3ZvLXdtaS1jYW1lcmE6IFVzZQpTV19D
QU1FUkFfTEVOU19DT1ZFUiBpbnN0ZWFkIG9mIEtFWV9DQU1FUkFfQUNFU1MiKS4gVGhhdCBkcml2
ZXIgZG9lcyBub3QKYmluZCBvbiB0aGVzZSBsYXB0b3BzLCBzbyBtYXAgdGhlIFdNSSBldmVudHMg
dG8gU1dfQ0FNRVJBX0xFTlNfQ09WRVIgYXMKd2VsbCB2aWEgc3BhcnNlIGtleW1hcCBLRV9TVy4K
CkNvLWRldmVsb3BlZC1ieTogTWFyY28gR2l1bnRhIDxtYXJjb19naXVudGFAb3V0bG9vay5pdD4K
U2lnbmVkLW9mZi1ieTogTWFyY28gR2l1bnRhIDxtYXJjb19naXVudGFAb3V0bG9vay5pdD4KU2ln
bmVkLW9mZi1ieTogUm9uZyBaaGFuZyA8aUByb25nLm1vZT4KLS0tCiBkcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9sZW5vdm8vaWRlYXBhZC1sYXB0b3AuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9sZW5vdm8vaWRlYXBhZC1sYXB0b3AuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2xlbm92by9p
ZGVhcGFkLWxhcHRvcC5jCmluZGV4IDgyMTM1MjQ1MDRlZS4uM2U5MWNjMWRmNmMyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9sZW5vdm8vaWRlYXBhZC1sYXB0b3AuYworKysgYi9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni9sZW5vdm8vaWRlYXBhZC1sYXB0b3AuYwpAQCAtMTM2NSw2ICsx
MzY1LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2V5X2VudHJ5IGlkZWFwYWRfa2V5bWFwW10g
PSB7CiAJeyBLRV9LRVksICAgMHgyOSB8IElERUFQQURfV01JX0tFWSwgeyBLRVlfVE9VQ0hQQURf
VE9HR0xFIH0gfSwKIAl7IEtFX0tFWSwgICAweDJhIHwgSURFQVBBRF9XTUlfS0VZLCB7IEtFWV9S
T09UX01FTlUgfSB9LAogCisJLyoKKwkgKiBXTUkgc3dpdGNoZXMKKwkgKgorCSAqIFNvbWUgZGV2
aWNlcyBjb21lIHdpdGggcGh5c2ljYWwgc3dpdGNoZXMuIFdoZW5ldmVyIGEgc3dpdGNoIGlzCisJ
ICogdG9nZ2xlZCwgYW4gV01JIGV2ZW50IGlzIGVtaXR0ZWQgdG8gaW5mb3JtIHRoZSBzb2Z0d2Fy
ZSBhYm91dCB0aGUKKwkgKiBzd2l0Y2gncyBsYXRlc3Qgc3RhdGUuCisJICovCisKKwkvKiBDYW1l
cmEgc3dpdGNoICovCisJeyBLRV9TVywJMHgwYyB8IElERUFQQURfV01JX0tFWSwgLnN3ID0geyBT
V19DQU1FUkFfTEVOU19DT1ZFUiwgMCB9IH0sCisJeyBLRV9TVywJMHgwZCB8IElERUFQQURfV01J
X0tFWSwgLnN3ID0geyBTV19DQU1FUkFfTEVOU19DT1ZFUiwgMSB9IH0sCisKIAl7IEtFX0VORCB9
LAogfTsKIAoKLS0tCmJhc2UtY29tbWl0OiA1MThlNWI3OTRjMDZjMGYwZWI0MGRmM2UyMDIyNzRh
NjYyMDJjMTM3CmNoYW5nZS1pZDogODUxMWM2ZGEtaWRlYXBhZC1sYXB0b3AtY2FtZXJhLXN3LTk0
OGU0NjUzYjIwZQoKVGhhbmtzLApSb25nCg==


--=-9hxTBI5gC9HmuJByyWXn--
