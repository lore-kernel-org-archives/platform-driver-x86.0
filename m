Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86D2DA779
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Aug 2025 19:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755026014; cv=none; b=fL07rIUnzMCljA9Md+fRNc7oZ0sJz0aNhCkcxvN5SuJhz2/xNIGojgzZoz/GmMLR37Fz0BU/fYlByaRi1ob/XeVctDxW7nWS+yM6BQduw0OgAumBGJDlux0/kYR7FKwpkDiONxU8cMq7M2hiaQ1TnC8+mXK5juVlCZWjrVWwKTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755026014; c=relaxed/simple;
	bh=e3y0KxtUkcKGZh9/oTJPeL6Fc3bv5rgi6fWid/eKLFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SftNhEBixyXbAmTDsbNi0Oz7k9OdYEEB2hYJcohFciyfr57xsOhSyN0dZOrIOCE62Elv3VNW+D7HXnCVmIaDqNUVLJvB0fOlaIbme+dD4FHjrXBLwfKYzNyjBSUg1AvWVodJTQH7AH1H0U7tXArV/Gpr4mLy6Wn2F8VcImPw6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=jbzlE977; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=lmh2+pw3; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="jbzlE977";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="lmh2+pw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1755025104; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=WoK0K97EorhCFt609I7t9b8P6u4nWdC/a1/DvNx7ZVY=;
 b=jbzlE977l6R8e6P0iV4E8JwH3QLjUFv4Sc4q/5UxhVPwFFSauQU9Mazzt5SK0U74x7xTZ
 UBf93GzlpoX9/3o1TSyinP9dxMhRmHM4Lp2VnJxLdQUeDO5Aa8gnGr1fzdD3jJNbJYOoWYo
 DRfwT6PyCYLgNu6/EF9O/oYCwDY1g1+5BMNQGkYHpINiU7LEs3C7Gzwfv3i1OJUUYuPz7fL
 nKpw97z1THMPkYN+ZxTq6xuQaK7ut1dkGTmbku5+JwFbA5fNoNDM3oQDaJ6h9/Pks0fhg+Z
 u9QuWYQ/55AJXpGloCtvZL5msIkpZF0cynSOF5+b1Q9H4ttrUZCwrEKv8rNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1755025104; h=from : subject :
 to : message-id : date;
 bh=WoK0K97EorhCFt609I7t9b8P6u4nWdC/a1/DvNx7ZVY=;
 b=lmh2+pw33b72bYMwxO09MXlptAMaiaVHk8f7S9HtCkXQ8xe2o5LkIIM1oLjGF3La8Ku/e
 HYwYU7KI/vN9eQXM26fLdtZ4FFQtivL/iwrOEXLKwAQ1AJcbEykt36kDxiprsmKavTE+f2D
 W7BJNej9K2cNLZndVgDVqIrKJYL1M0Qc4iJ5UV+qLX3F1moHI9/adbWcx1dpXgYZK+kBIIJ
 fUyVOAEFnCUahNUTBFP5kZJMOI123UK5Qm+Xk7MDj27eDMi8R0oPkuHVOxYiZ43fXPMW8XU
 gHkiKWGCN1ytC+0gVZX/DOe/FiCYtmvC/Rzu7ViWPl7I/bGsRCEGR8RtM4pw==
Received: from [10.152.250.198] (helo=vilez.localnet)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uluCQ-FnQW0hPxeLA-g28o;
	Tue, 12 Aug 2025 18:58:18 +0000
From: Edip Hazuri <edip@medip.dev>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: hansg@kernel.org, kuba@kernel.org, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Edip Hazuri <edip@medip.dev>
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add support for Fn+P hotkey
Date: Tue, 12 Aug 2025 21:58:12 +0300
Message-ID: <5043622.GXAFRqVoOG@vilez>
In-Reply-To: <d567817f-f871-c84a-a56f-9b27fb4888f6@linux.intel.com>
References: 
 <20250802212149.16707-2-edip@medip.dev>
 <20250802213541.18791-2-edip@medip.dev>
 <d567817f-f871-c84a-a56f-9b27fb4888f6@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854s19uKCa87U
X-smtpcorp-track: IvYrHyhdjpXG.P2eb62eqMAca.bRYIzQhFQIm

On Tuesday, August 12, 2025 3:20:48=E2=80=AFPM GMT+03:00 Ilpo J=C3=A4rvinen=
 wrote:
> On Sun, 3 Aug 2025, edip@medip.dev wrote:
> > From: Edip Hazuri <edip@medip.dev>
> >=20
> > Newer Hp Victus (And probably newer omen) e.g. Victus 16-s1011nt that i
> > own have a Fn+P shortcut intended to use with omen gaming hub for
>=20
> Thanks for the patch.
>=20
> It's irrelevant to record in the changelog that you own one. Just
> state what it has. :-)
>=20
> > changing the performance profile. see [1]
>=20
> Why isn't the key made to cycle platform profiles then?
>=20
> > > hp_wmi: Unknown event_id - 27 - 0x7
>=20
> Add empty line here.
>=20
> > Based on the dmesg warning. I found that the key have 27 as event_id and
> > 0x7 as event_data (keycode). I implemented it in the driver and now
> > libinput can capture the event.
>=20
> Please write changelogs in imperative tone. Don't write 'I did x' style
> sentences.
>=20
> > Tested On Victus 16-s1011nt (9Z791EA) with MB 8C9C
>=20
> Tested on
>=20
> Missing .
>=20
> > [1]: https://jpcdn.it/img/adadf6c927ffeb75afd8038f95db400a.png
> >=20
> > Signed-off-by: Edip Hazuri <edip@medip.dev>
> > ---
> >=20
> >  drivers/platform/x86/hp/hp-wmi.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c
> > b/drivers/platform/x86/hp/hp-wmi.c index db5fdee2109..6467ca27db7 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -122,6 +122,7 @@ enum hp_wmi_event_ids {
> >=20
> >  	HPWMI_BATTERY_CHARGE_PERIOD	=3D 0x10,
> >  	HPWMI_SANITIZATION_MODE		=3D 0x17,
> >  	HPWMI_CAMERA_TOGGLE		=3D 0x1A,
> >=20
> > +	HPWMI_FN_P_HOTKEY		=3D 0x1B,
> >=20
> >  	HPWMI_OMEN_KEY			=3D 0x1D,
> >  	HPWMI_SMART_EXPERIENCE_APP	=3D 0x21,
> > =20
> >  };
> >=20
> > @@ -280,6 +281,7 @@ struct bios_rfkill2_state {
> >=20
> >  static const struct key_entry hp_wmi_keymap[] =3D {
> > =20
> >  	{ KE_KEY, 0x02,    { KEY_BRIGHTNESSUP } },
> >  	{ KE_KEY, 0x03,    { KEY_BRIGHTNESSDOWN } },
> >=20
> > +	{ KE_KEY, 0x07,    { KEY_FN_P } },
> >=20
> >  	{ KE_KEY, 0x270,   { KEY_MICMUTE } },
> >  	{ KE_KEY, 0x20e6,  { KEY_PROG1 } },
> >  	{ KE_KEY, 0x20e8,  { KEY_MEDIA } },
> >=20
> > @@ -981,6 +983,15 @@ static void hp_wmi_notify(union acpi_object *obj,
> > void *context)>=20
> >  						key_code,=20
1, true))
> >  		=09
> >  			pr_info("Unknown key code - 0x%x\n",=20
key_code);
> >  	=09
> >  		break;
> >=20
> > +	case HPWMI_FN_P_HOTKEY:
> > +		key_code =3D hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
> > +		if (key_code < 0)
> > +			break;
> > +
> > +		if (!sparse_keymap_report_event(hp_wmi_input_dev,
> > +			key_code, 1, true))
>=20
> This is misaligned.
>=20
> > +			pr_info("Unknown key code - 0x%x\n",=20
key_code);
> > +		break;
>=20
> The code looks 100% identical to that of in HPWMI_BEZEL_BUTTON. But please
> consider what I noted above about cycling platform profiles.
>=20
> >  	case HPWMI_OMEN_KEY:
> >  		if (event_data) /* Only should be true for HP Omen */
> >  	=09
> >  			key_code =3D event_data;

Hi,

Sorry for my mistakes, and thank you for your feedback. I'll consider your=
=20
feedback and submit another patch.

Edip


