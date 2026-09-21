Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850D4B1D0E;
	Mon, 21 Sep 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003312; cv=pass; b=MRDGcOydY1+Zks4ydOTFYBqDwRVVY/CkTMv2PfkZ9BXY4qrb2aSwTdMKEE8Ew7/BVKfCZiZC6AAzTEUA/G1oedPFBiVcPtcgZ9Cu8fCMb3H5KFBuvbpP/RWIe2idNH89t4IBO5k+Bf/n2o//9tEBGOAVyC4QRtLKjL2VE6NR1Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003312; c=relaxed/simple;
	bh=T+Evgj2h18hUxJ5dYxEhkYuemsYHiwIa9IeHwm2GMKQ=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oFFjlm9r5FrHgEAPqCOeFyXvFESGPvhHRRrBiR7dMIvCP+QIieAFR72XAqx+AFUemQCKJaGxzp/Bd9dYKtUk4Vir17m15eqAfFFNg5wR6unkF/B3Ik5bao7p9pOB4GGLtuEy6OYeWbzPSrwom9nlXeH+XjAgyxoK2m8W+W9RBGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qq+4Qz6v; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qq+4Qz6v"
ARC-Seal: i=1; a=rsa-sha256; t=1790003290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aN0XE75k148UPlRLwKMZIXsGi24MKVn23DHKShtVM0rF2w2yAVrSUQypOlxFrEicsFnv2ITNWOpJmVPaCnENRk5S+WbNj+usE7JRdCbMS2cCteIvF7y3AhA1sK5dK94KEb2/gPlQreyqQe7oMLfp4FgnpEWir4nFtiizoBGxd+U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790003290; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kch+YhEHfatueDzXb02aqqJNBrk+Jc7t6yHN1ZFCJZg=; 
	b=XzKOdFn/DtRWBU9B0qooutwr0oEfmX3dmtxITaRHxHrzS3xyz/ykUzswlWc5o+9KqpDgXcrIasrLTV0DpividhSd92FrOPWBGEzRBRm2VoOut2EpEYbZJswRitthscjO+D+rDmJnYpMbTiPXa9PCnwNiLj+0QtG1zxscfoMdZmA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790003290;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Kch+YhEHfatueDzXb02aqqJNBrk+Jc7t6yHN1ZFCJZg=;
	b=qq+4Qz6vMnWX1h2HjwkHV1PC60+8AiZr7HdV3b4wIRuNRj8Z1buUjg2rk6ohDj1v
	4CWPwinZFA1Bh7lQgFues6+F1b0kpkJ/vXJOOgLelcpcHGq4e91aJGD9SM3OdrCduQ0
	yjee+kdWUQy60+yodPTvEE959+60vfnIwj9xE6U4MxMVmDzCb3sHQOWiQcwYjMvA/r5
	bJEz8EAqiXVSnXbogZm18tkd22/kHxaKekSLfccyfqgWBnl/aoUp0XsHLzCB9u1RMtG
	8/0dQDnYPUC9iZuhzu04viE5zcppni84T70RoxsAtfCF4Y0wUuw4ywObQ3bgReTGga5
	ROHycnMVkw==
Received: by smtp.zohomail.com with SMTPS id 1790003289532554.5573174339265;
	Mon, 21 Sep 2026 08:08:09 -0700 (PDT)
Message-ID: <7ff9f813abc2ebba8a7a9618b68ed3fde7022a60.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch
 as SW_CAMERA_LENS_COVER
From: Rong Zhang <i@rong.moe>
To: Marco Giunta <marco_giunta@outlook.it>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Hans de Goede <hansg@kernel.org>
Cc: Huang Wei <huangwei@kylinos.cn>, "Derek J . Clark"
	 <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
References: 
	<SN6PR19MB2303E25270E1A460ABC76EA3FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
	 <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:03:04 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Marco,

On Mon, 2026-09-21 at 22:50 +0800, Rong Zhang wrote:
> Hi Macro,

Whoops, I mistyped your name. Sorry for that. My fingers definitely have
their own thoughts.

Thanks,
Rong

>=20
> On Sun, 2026-09-20 at 22:28 +0200, Marco Giunta wrote:
> > On certain 2025 Lenovo laptops, such as the Yoga Pro 7 14ASP10 and Legi=
on
> > Pro 7 16AFR10H, a switch on the side disables the camera. This is handl=
ed
> > by the firmware, which also sends event 0x0d (camera disabled) or 0x0c
> > (camera enabled) through the WMI event GUID handled with
> > ideapad_wmi_context_fn_keys. These events are currently reported as
> > KEY_UNKNOWN.
> >=20
> > Other Lenovo laptops expose a similar camera switch through a separate =
WMI
> > GUID, which lenovo-wmi-camera reports as SW_CAMERA_LENS_COVER since
> > commit d98bf6a6ed61 ("platform/x86: lenovo-wmi-camera: Use
> > SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS"). That driver does no=
t
> > bind on these laptops, so do the same here: as the switch state cannot =
be
> > read from the firmware, register a separate input device with the switc=
h
> > on the first event, and report the state carried by each event.
> >=20
> > Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
> > ---
> > Changes in v2:
> >=20
> > * Add lockdep_assert_held(&ideapad_shared_mutex) and a comment at the t=
op
> >   of ideapad_camera_switch_report() to document and check that the WMI
> >   notify path is serialized through ideapad_shared_mutex (suggested by
> >   Huang Wei)
> > * Replace dev_warn() with dev_warn_once() in
> >   ideapad_camera_switch_report() so that a persistent registration fail=
ure
> >   does not log a warning on every toggle (suggested by Huang Wei)
> >=20
> > Link to v1: https://lore.kernel.org/platform-driver-x86/SN6PR19MB230399=
10DD1918BEE3825BAFFC862@SN6PR19MB2303.namprd19.prod.outlook.com/
> >=20
> > Notes (copied verbatim from v1, to keep the context easily accessible):
> >=20
> > * I considered a couple of alternatives to the approach in this patch:
> >=20
> >   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABLE:
> >=20
> >       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABLE } },
> >       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISABLE } }=
,
> >=20
> >       similar to the touchpad off/on hkey events (66/67) this driver em=
its
> >       after the firmware has toggled the touchpad state.=C2=A0However, =
HUTRR72
> >       describes these hkey events as asserting a camera access state fo=
r
> >       the host to apply, rather than reporting one the firmware has
> >       already applied.=C2=A0
> >=20
>=20
> Well, it really doesn't matter how the specification says; what matters
> is how devices in reality do: whenever the HID Usage Table doesn't define
> a usage for hardware/firmware to report the already-applied value but
> defines a usage for notifying the host to apply a specific value, a lot
> of devices will emerge, using the latter even when the former is
> intended.
>=20
> For example, many USB Audio Class devices come with volume control
> buttons or knobs. Some of them tune the volume themselves as well as
> emitting Volume Increment/Decrement HID events.
>=20
> In this case, the audio stack, in response to the HID events,
> intentionally overrides the volume set by hardware, effectively
> synchronizing the hardware and software volume value.
>=20
> The pattern has become so common that many devices like that also
> implement an internal timeout mechanism. They only set the volume
> themselves when reaching the timeout with no UAC volume control request
> received.
>=20
> IOW, it doesn't matter whether the hardware/firmware has done its job as
> long as the subsequent software control is harmless. That's why we can
> safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggled the
> touchpad state. They cause the desktop environment to mask/unmask
> touchpad input, which is essentially a no-op (thus a safe operation) when
> the firmware has already disabled/enabled the touchpad.
>=20
> Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABLE is also
> OK. It's just...
>=20
> > Furthermore, lenovo-wmi-camera moved away from
> >       these hkey events in favor of SW_CAMERA_LENS_COVER in the quoted
> >       commit, which is arguably the closest relevant precedent.
>=20
> ...relatively new and isn't widely used compared to SW_CAMERA_LENS_COVER.
>=20
> Thus, I agreed that using SW_CAMERA_LENS_COVER is a better approach as it
> aligns with other drivers' behavior. The patch seems over-engineered
> though, see below.
>=20
> >    =20
> >   2.  Ignore these events like the firmware-handled FnLock events:
> >=20
> > 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
> > 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
> >=20
> >       This fixes the KEY_UNKNOWN issue, but userspace gets no informati=
on.
> >    =20
> >   Overall, in the end I copied the approach of the lenovo-wmi-camera
> >   driver. Kindly let me know if there are other/better solutions.
> >    =20
> > * Unlike the touchpad, whose state this driver reads with VPCCMD_R_TOUC=
HPAD
> >   at probe, on resume and on each event,=C2=A0
> >=20
>=20
> At least for the input device, the synchronization on probe or on resume
> does not matter, as no input event is emitted due to !send_events.
>=20
> > the camera switch state is only
> >   available in EC-private fields, and the two tested laptops even use
> >   different ones. Hence the lenovo-wmi-camera approach: the switch appe=
ars
> >   on the first event, and a change made while suspended is not reported=
,
> >   leaving the state wrong until the switch is toggled again.
>=20
> So the difference compared to the lenovo-wmi-camera approach is only
> about when and how the input device is registered.
>=20
> On recent models, the firmware neither emits VPCCMD_R_TOUCHPAD nor
> toggles the touchpad. It leaves the job to software by emitting WMI key
> event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ideapad_keymap.
> It'd be tidier to take that approach and reuse the existing input device.
> Sparse keymap supports KEY_SW, so it's viable to map the two WMI events
> to SW_CAMERA_LENS_COVER with appropriate switch value.
>=20
> I've attached a patch implementing the approach. Could you test if it
> works on your devices? If so, you may submit my patch yourself by adding
> a From: pseudo header with my identity and swapping the two Signed-off-
> by: tags. I can also submit it myself as long as you permit me to do so.
>=20
> >=20
> > * For reference, on KDE Plasma 6.7.5, using the Legion's touchpad toggl=
e
> >   button shows an OSD, but nothing on a SW_CAMERA_LENS_COVER change or =
if
> >   sending KEY_CAMERA_ACCESS_ENABLE/DISABLE events. I am not sure whethe=
r
> >   this is simply a case of "not implemented yet" or if I misunderstood =
how
> >   these events are supposed to be used to communicate with userspace.
> >   Please feel free to correct me here.
>=20
> I believe KDE Plasma has not implemented it yet. You may raise an issue
> on their Bugzilla.
>=20
> Thanks,
> Rong
>=20
> >  =20
> > Best regards,
> > Marco
> > ---
> >  drivers/platform/x86/lenovo/ideapad-laptop.c | 59 ++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/pla=
tform/x86/lenovo/ideapad-laptop.c
> > index 207368f5d489..0066638ee332 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > @@ -178,6 +178,7 @@ struct ideapad_private {
> >  	struct ideapad_rfk_priv rfk_priv[IDEAPAD_RFKILL_DEV_NUM];
> >  	struct platform_device *platform_device;
> >  	struct input_dev *inputdev;
> > +	struct input_dev *camera_switch_idev;
> >  	struct backlight_device *blightdev;
> >  	struct ideapad_dytc_priv *dytc;
> >  	struct dentry *debug;
> > @@ -1410,10 +1411,43 @@ static int ideapad_input_init(struct ideapad_pr=
ivate *priv)
> >  	return err;
> >  }
> > =20
> > +static int ideapad_camera_switch_init(struct ideapad_private *priv, bo=
ol covered)
> > +{
> > +	struct input_dev *idev;
> > +	int err;
> > +
> > +	idev =3D input_allocate_device();
> > +	if (!idev)
> > +		return -ENOMEM;
> > +
> > +	idev->name =3D "Ideapad Camera Switch";
> > +	idev->phys =3D "ideapad/input1";
> > +	idev->id.bustype =3D BUS_HOST;
> > +	idev->dev.parent =3D &priv->platform_device->dev;
> > +
> > +	input_set_capability(idev, EV_SW, SW_CAMERA_LENS_COVER);
> > +	input_report_switch(idev, SW_CAMERA_LENS_COVER, covered);
> > +	input_sync(idev);
> > +
> > +	err =3D input_register_device(idev);
> > +	if (err) {
> > +		input_free_device(idev);
> > +		return err;
> > +	}
> > +
> > +	priv->camera_switch_idev =3D idev;
> > +	return 0;
> > +}
> > +
> >  static void ideapad_input_exit(struct ideapad_private *priv)
> >  {
> >  	input_unregister_device(priv->inputdev);
> >  	priv->inputdev =3D NULL;
> > +
> > +	if (priv->camera_switch_idev) {
> > +		input_unregister_device(priv->camera_switch_idev);
> > +		priv->camera_switch_idev =3D NULL;
> > +	}
> >  }
> > =20
> >  static void ideapad_input_report(struct ideapad_private *priv,
> > @@ -1422,6 +1456,22 @@ static void ideapad_input_report(struct ideapad_=
private *priv,
> >  	sparse_keymap_report_event(priv->inputdev, scancode, 1, true);
> >  }
> > =20
> > +static void ideapad_camera_switch_report(struct ideapad_private *priv,=
 bool covered)
> > +{
> > +	/* The WMI notify path is serialized through ideapad_shared_mutex */
> > +	lockdep_assert_held(&ideapad_shared_mutex);
> > +
> > +	if (!priv->camera_switch_idev) {
> > +		if (ideapad_camera_switch_init(priv, covered))
> > +			dev_warn_once(&priv->platform_device->dev,
> > +				      "Failed to register camera switch input device\n");
> > +		return;
> > +	}
> > +
> > +	input_report_switch(priv->camera_switch_idev, SW_CAMERA_LENS_COVER, c=
overed);
> > +	input_sync(priv->camera_switch_idev);
> > +}
> > +
> >  static void ideapad_input_novokey(struct ideapad_private *priv)
> >  {
> >  	unsigned long long_pressed;
> > @@ -2312,6 +2362,15 @@ static void ideapad_wmi_notify(struct wmi_device=
 *wdev, union acpi_object *data)
> >  			break;
> >  		}
> > =20
> > +		/*
> > +		 * Camera switch, handled by the firmware:
> > +		 * 0x0c camera enabled, 0x0d camera disabled
> > +		 */
> > +		if (data->integer.value =3D=3D 0x0c || data->integer.value =3D=3D 0x=
0d) {
> > +			ideapad_camera_switch_report(priv, data->integer.value =3D=3D 0x0d)=
;
> > +			break;
> > +		}
> > +
> >  		/* 0x02 FnLock, 0x03 Esc */
> >  		if (data->integer.value =3D=3D 0x02 || data->integer.value =3D=3D 0x=
03)
> >  			ideapad_fn_lock_led_notify(priv, data->integer.value =3D=3D 0x02);
> >=20
> > base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
