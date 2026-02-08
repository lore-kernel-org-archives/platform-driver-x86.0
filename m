Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068C8342CA5;
	Sun,  8 Feb 2026 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770584640; cv=pass; b=dxRkHfB7nu4RUfNUJxLZ0d8gOSlbvd9ImH/L5NQnBg4KWF8FaidSk5vXkL13POMs0XJ3kbsKAZX7ooarf8WbFxUCE2M1r7KgRS1kOjA6gaDTmTcyF42nXBNbAqJ8ZoB+AtIGRZPkloewKcnxgRbbNzlXi1KMpelBvzXtx8pMpVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770584640; c=relaxed/simple;
	bh=g/1h9e/AoMVaJNq/Z1DHcJgGGLmV2zpXaUQ3NioXUy8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Fp7i54F2EBI4htde0uMm9dwW0HrCeJcImI2PfWW4m+lwO6a5Rs0A0i0P1/H4coJ92or0kcwlRYCO4E7Z/kWmbqwOnav5IlYZEwK42jqz+USWe0F+tk3GSGWacCTrhXedkcQuEqDkfL1OSe2qomV0B9DmzlkaR9Wq114xjK1os+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KF6EKCXG; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KF6EKCXG"
ARC-Seal: i=1; a=rsa-sha256; t=1770584617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fZlrIchb5L3OWDtQO6s0ODfANk6LXMayeqLmZ2YlNyUtnmFz1eyv3dCFPs96DxUwtpTYjalrQA20uIz5CMg8CBRxVBBwokcZ9p07+7qslIVvUioil0TRdpKfRb0lsL8yZ1VLOqKm7lEY/87MFyjW+wxL+S0VG9OCackqsKjuTC4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770584617; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J/YwehlJY3pCmTOF43wMS7bagJlMPhUcvr+rIfpEQWU=; 
	b=KR2BI3n+Q5siI1R7y5xb08NMcwtRwXtEMmIIvBWQOMvJzs1DmWUwRDZiOQ79dTpxehWS6k2Or1f5Mj9f9ycSp0vZJez/yvqUwZ1q/cFkRrnZblcmqhMi0dffpe1TR95mEePiQpHI1zAiTRZsHffnE7GCQEdq92oqXFBIJ4v+O4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770584617;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=J/YwehlJY3pCmTOF43wMS7bagJlMPhUcvr+rIfpEQWU=;
	b=KF6EKCXGz5HWZO0ClwPs30g2Y2ATPyZfEhoPt/w4I/yifN+nAKWxZlo5g6FG6AQY
	A1R+qxetN9KRwv11Qq1ju8lwll9Zwoi9ivMA5+ME2vaFvEJE6PBfs1rUq+ocm5uJqU6
	/8+2mbUpuSWsI5oa7LmzeKBLDBd0paBxXuF/O4VUBNV+mn4mNW3DIJL6vwOkJY7Ux2T
	iKnd9TmiO7zYCTQFzSwSUcrtQ2o2MsyzjCKTdiNMJg8djk5RCF7gq1+HYX9HuOlVosQ
	3b+yn88oWPe85h0Gt1/4rCeksbHbxkBke14ARhVURJi2jXVCLhvK1kA2TCxADdg14SW
	S0n8F5iO5A==
Received: by mx.zohomail.com with SMTPS id 1770584614551972.3880796340507;
	Sun, 8 Feb 2026 13:03:34 -0800 (PST)
Message-ID: <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic
 max_brightness
From: Rong Zhang <i@rong.moe>
To: Hans de Goede <hansg@kernel.org>, Vishnu Sankar <vishnuocv@gmail.com>, 
	mpearson-lenovo@squebb.ca
Cc: hmh@hmh.eng.br, derekjohn.clark@gmail.com,
 ilpo.jarvinen@linux.intel.com, 	ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 vsankar@lenovo.com
In-Reply-To: <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
References: <20260203232219.11683-1-vishnuocv@gmail.com>
		 <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Feb 2026 04:58:28 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Hans, Vishnu and Mark,

On Sun, 2026-02-08 at 11:54 +0100, Hans de Goede wrote:
> Hi Vishnu,
>=20
> On 4-Feb-26 00:22, Vishnu Sankar wrote:
> > Dynamically detect keyboard backlight capabilities and set
> > max_brightness correctly (2 for old models, 3 for new models
> > with Auto mode).
>=20
> Thank you for your patch.
>=20
> If I understand this correctly, writing 3 as level does not
> make the backlight more bright then writing 2, but instead
> it puts the backlight in some auto mode ?
>=20
> If I've that correct then  userspace should keep seeing
> a range of 0 - 2 and the special auto mode value should
> be reported / be made settable through a separate als_enabled
> sysfs attribute under the LED class device. See:
>=20
> Documentation/ABI/testing/sysfs-platform-dell-laptop
>=20
> You can add extra attributes there by setting the groups
> member of the struct led_classdev, see kbd_led_groups[]
> in drivers/platform/x86/dell/dell-laptop.c, except that
> you should use a .is_visible callback to only show this
> on hw which supports it and you only need 1 group with
> 1 attribute.

When I implemented "als_enabled" for ideapad-laptop, Mark Pearson
suggested it'd better to introduce "something similar to
LED_BRIGHT_HW_CHANGED"=C2=A0rather than using custom attributes, as "this i=
s
going to be a common feature across multiple vendors it might need
doing at a common layer". Also, auto mode can be activated by HW as a
result of user input, so we need an approach to notify userspace just
like what LED_BRIGHT_HW_CHANGED does. More importantly, the read value
of the brightness attribute becomes nonsense when auto mode is on. This
matches the semantic of hw control trigger.

I agreed with Mark and had a proposal of allowing HW to initiate a
transition from "none" to hw control trigger and vice versa. See the
thread in
https://lore.kernel.org/all/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastma=
il.com/

I hadn't push it further due to other things taking the priority,
though I already had a PoC back to then. I quickly rebased the PoC with
some cleanups and put it here for preview:

https://github.com/Rongronggg9/linux/tree/leds-trigger-hw-changed

I will find some time to refine it and send an RFC series.

Thanks,
Rong

> Regards,
>=20
> Hans
>=20
>=20
>=20
>=20
>=20
>=20
> >=20
> > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > ---
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 33 ++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/plat=
form/x86/lenovo/thinkpad_acpi.c
> > index cc19fe520ea9..f670cdd1791e 100644
> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > @@ -5043,6 +5043,9 @@ static struct ibm_struct video_driver_data =3D {
> >  static enum led_brightness kbdlight_brightness;
> >  static DEFINE_MUTEX(kbdlight_mutex);
> > =20
> > +/* Maximum level supported by hardware, will be updated in init */
> > +static int kbdlight_max_level =3D 2;
> > +
> >  static int kbdlight_set_level(int level)
> >  {
> >  	int ret =3D 0;
> > @@ -5050,6 +5053,10 @@ static int kbdlight_set_level(int level)
> >  	if (!hkey_handle)
> >  		return -ENXIO;
> > =20
> > +	/* Validate against detected max level */
> > +	if (level < 0 || level > kbdlight_max_level)
> > +		return -EINVAL;
> > +
> >  	mutex_lock(&kbdlight_mutex);
> > =20
> >  	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
> > @@ -5075,6 +5082,7 @@ static int kbdlight_get_level(void)
> >  	if (status < 0)
> >  		return status;
> > =20
> > +	/* Status can be 0, 1, 2, or 3 (Auto) */
> >  	return status & 0x3;
> >  }
> > =20
> > @@ -5143,7 +5151,7 @@ static enum led_brightness kbdlight_sysfs_get(str=
uct led_classdev *led_cdev)
> >  static struct tpacpi_led_classdev tpacpi_led_kbdlight =3D {
> >  	.led_classdev =3D {
> >  		.name		=3D "tpacpi::kbd_backlight",
> > -		.max_brightness	=3D 2,
> > +		.max_brightness	=3D 2,	/*Initial value, will be updated in init*/
> >  		.flags		=3D LED_BRIGHT_HW_CHANGED,
> >  		.brightness_set_blocking =3D &kbdlight_sysfs_set,
> >  		.brightness_get	=3D &kbdlight_sysfs_get,
> > @@ -5167,6 +5175,17 @@ static int __init kbdlight_init(struct ibm_init_=
struct *iibm)
> >  	kbdlight_brightness =3D kbdlight_sysfs_get(NULL);
> >  	tp_features.kbdlight =3D 1;
> > =20
> > +	/* Detect hardware capabilities and set max_brightness */
> > +	if (acpi_evalf(hkey_handle, NULL, "MLCS", "dd", 3)) {
> > +		/* MLCS accepts level 3 - new ThinkPad with Auto mode */
> > +		kbdlight_max_level =3D 3;
> > +		tpacpi_led_kbdlight.led_classdev.max_brightness =3D 3;
> > +	} else {
> > +		/* MLCS rejects level 3 - old ThinkPad */
> > +		kbdlight_max_level =3D 2;
> > +		tpacpi_led_kbdlight.led_classdev.max_brightness =3D 2;
> > +	}
> > +
> >  	rc =3D led_classdev_register(&tpacpi_pdev->dev,
> >  				   &tpacpi_led_kbdlight.led_classdev);
> >  	if (rc < 0) {
> > @@ -5201,6 +5220,7 @@ static int kbdlight_set_level_and_update(int leve=
l)
> >  static int kbdlight_read(struct seq_file *m)
> >  {
> >  	int level;
> > +	int i;
> > =20
> >  	if (!tp_features.kbdlight) {
> >  		seq_printf(m, "status:\t\tnot supported\n");
> > @@ -5210,9 +5230,13 @@ static int kbdlight_read(struct seq_file *m)
> >  			seq_printf(m, "status:\t\terror %d\n", level);
> >  		else
> >  			seq_printf(m, "status:\t\t%d\n", level);
> > -		seq_printf(m, "commands:\t0, 1, 2\n");
> > -	}
> > =20
> > +		/* Show available commands based on hardware */
> > +		seq_puts(m, "commands:\t0");
> > +		for (i =3D 1; i <=3D tpacpi_led_kbdlight.led_classdev.max_brightness=
; i++)
> > +			seq_printf(m, ", %d", i);
> > +		seq_puts(m, "\n");
> > +	}
> >  	return 0;
> >  }
> > =20
> > @@ -5230,7 +5254,8 @@ static int kbdlight_write(char *buf)
> >  			return res;
> >  	}
> > =20
> > -	if (level >=3D 3 || level < 0)
> > +	/* Validate against max level */
> > +	if (level < 0 || level > tpacpi_led_kbdlight.led_classdev.max_brightn=
ess)
> >  		return -EINVAL;
> > =20
> >  	return kbdlight_set_level_and_update(level);
