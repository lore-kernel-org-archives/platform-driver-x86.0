Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBF3423A77;
	Wed,  6 May 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073527; cv=none; b=eI7aGPTxAeEO87TEh4y/i9muGAyogTaQgtHLmmf247miVTGztX/TiWt6FWlRx2qaUiVOeO7S4IfbCugOPjOGZAuFbG2j3ZrPuZgB77+dEt8ysF3GMowwqAAHq24jV5EAP5XURbrv1onb/FcGafnc93Id7jE5WWvl1LXYw9Q3KRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073527; c=relaxed/simple;
	bh=LyaCEmhcSmHJAstgCnemuWhi5powmILn3k/ax2Kf5nQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o/JRPio32YUOkMLS8sqGZxMao9flFIHFgy1bxpFuiRYwNzf+Jwcf1XX6mrvYEtMueih0gUVFhitH1JaHR1ZhOm3NpHtem5jWVYsABBFpxPZK7LICTOb4gn2Y8yL7GMLCDanyrB6u6iJHukHRPgu2WHkDei/seT9aW5AeWe4ydpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eju7oTmH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eju7oTmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778073526; x=1809609526;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LyaCEmhcSmHJAstgCnemuWhi5powmILn3k/ax2Kf5nQ=;
  b=eju7oTmHt2W7cIsN73n3UXd24wPwZZyE0azaTb0zgzsBbgPFuX/UIeIS
   kqNefBU15DgWrz6c3fvg1G3hLWMZc6BkGRqszjFArvPWZkV/cT2VEJ79/
   Qd5s5OVk9p9Dhbd0f1ZchYogSB3jODQfdXdK2GSTH+c9tIMNhpo4H2wiE
   sreM8iXbRbyUjhgTqhn+YEaW8jde/oiKY45nW+ZE0TuympY2Gj1DOxWqb
   LjC9leKD5fxHRgh8Yxr+fZLmi5EyQavsrE5NF/bZSpmBFrysvaF/jdLxv
   Htrl7JIorOBSN2/ABxDl5Tx0CVVz/gqCcHVMP95SZQf7iCXF6XVxNV8ey
   w==;
X-CSE-ConnectionGUID: c6sjDokiQq+zcZTITgENuA==
X-CSE-MsgGUID: 5ERwd4PsTZOzu3IiWZr8ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90100986"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90100986"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:18:45 -0700
X-CSE-ConnectionGUID: 0vinEgtGRuChyz96bQlA1g==
X-CSE-MsgGUID: LvPOjjjAScKolnXMJ6jL3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="229732717"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:18:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 May 2026 16:18:39 +0300 (EEST)
To: =?ISO-8859-15?Q?Jos=E9_Guilherme_de_Castro_Rodrigues?= <jose.guilherme.cr.bh@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix camera key led on Zenbook
 S14
In-Reply-To: <afFAvIbAS6ue3ZaF@djouze-zen>
Message-ID: <cd3fc0ef-c15a-8f41-9162-c042daa44969@linux.intel.com>
References: <adg6GzkykThAB_4u@djouze-zen> <ce2a2f37-ad8a-647c-0db8-83f6efd99f12@linux.intel.com> <afFAvIbAS6ue3ZaF@djouze-zen>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1759019684-1778073519=:980"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1759019684-1778073519=:980
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 28 Apr 2026, Jos=E9 Guilherme de Castro Rodrigues wrote:

> Thanks for the comment, Ilpo.
>=20
> On Tue, Apr 28, 2026 at 11:22:20AM +0300, Ilpo J=E4rvinen wrote:
> > While I believe you are "correct" that userspace won't see a thing, is=
=20
> > this really correct way to implement support for this device?
>=20
> At first, I created another sysfs attribute that basically duplicated
> the logic that is used for the "asus::camera" attribute, with the
> exception being the value that was written to it, of course. I noticed,
> however, that calling asus_wmi_set_devstate() had not effect on the LED
> state. The LED only toggled when I read the attribute, which then called
> asus_wmi_get_devstate().
>=20
> I don't know if this is a quirk for this device, or if all devices that
> expose ASUS_WMI_DEVID_CAMERA_LED_NEG behave the same, but the LED is not
> toggled until I call asus_wmi_get_devstate() - be it when detecting a
> key press (hardware change) or after the sysfs attribute is written to
> (software change).
>=20
> Since in this case the LED state would not change after a write to the
> sysfs attribute, I went in the "do not make it visible to userspace at
> all" direction.
>=20
> > I mean the camera led init in asus_wmi_led_init() is gated by=20
> > asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) but should tha=
t=20
> > be gated by either CAMERA_LED or CAMERA_LED_NEG and the related code in=
=20
> > *_camera_led_*() that now only uses ASUS_WMI_DEVID_CAMERA_LED=20
> > should use which ever of them is available?
>=20
> Yes, I think what you said makes sense as it would give userspace access
> to the resource without creating a new attribute.
>=20
> In this case, I feel like a good option would be to gate the camera led
> initialization by both IDs, and assume that the write and read works as
> they probably should for CAMERA_LED_NEG. Then, somehow add a quirk for
> this specific device that performs a read when the key is pressed, and=20
> right after the sysfs attribute is written to. If we can confirm that
> this behavior is expected when writing to CAMERA_LED_NEG, it might not
> need to be a quirk. Unfortunately, I am not able to try this on other
> devices.
>=20
> What do you think about it?

So if I understood you correctly with LED_NEG (unknown if it's just on=20
your device or generally with it),

This doesn't work: set
This works: set+get

The extra get shouldn't be that harmful so doing that always if=20
CAMERA_LED_NEG is being used is okay at least with me (make sure to add=20
add a comment though so it can be known later why it's there even 10=20
years from now).

--=20
 i.

--8323328-1759019684-1778073519=:980--
