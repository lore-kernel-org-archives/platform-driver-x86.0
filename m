Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A83016E4
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Sep 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758193234; cv=none; b=WExfGj2eP+ypBJdm6pSgqU7l+UTVkqMfOh/eJ/olWvLu3F+W8gQGuWsjqLDRgfcRSY0WAzM/PnSZTWT0vlnOajDsLSdBF0t4MFy3MKC1OsjC0DvyhqrRcNR86CJmiLfhoeOg7GPWogizjuVY9ehxiYDZvF2OxDDCGCAmspOVVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758193234; c=relaxed/simple;
	bh=izZusS8AlJHB/mFQabZgCZuBTzJdwl3GJNLI1vEq0Pk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q4Hj2qVAiyFu+R4eHkj2JOrYibS9nxF7ye68RmLyhBfhDoZMYtDoA5LUnSC2l8xtiDKpbNPh3e7dfVCVYp1++aajosgUFWZX0V7NOQkugMtTDol75Fe1B1UUdC/98VlXh7UZ4Q9dkS/dX3lp7aj0gx3IEwUtoQcrARCWWKpkcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cThwXcYy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cThwXcYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758193233; x=1789729233;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=izZusS8AlJHB/mFQabZgCZuBTzJdwl3GJNLI1vEq0Pk=;
  b=cThwXcYytmnLs2lyLCaJH3cRrkmt+hecn8cN2wn7usLFs/eAUxoBB+Pg
   pEJhKrK0wc8QQ9LXA63UPiWGu4wDUM5x5InsXAYG3ttRw2efZlucvgVt0
   7Twyew7IrA/XIbgJDOqyJquGyiQD4vUAIOU28PVKQZeav/0EdzQELIA1i
   +kJ9Ak+WlMjiOM7dpMo5crwG/jWTd6O7BuCr5uRc5vkHQLBN2gfM4QUaH
   hRDNwUa9LfApmkHakKppGPd2ejtcOu+XVzVKqimK4JOjEXXziQoE4xboq
   N3PoL6EAEezx7QepWxZtRhlubt/0DQfcNit9rD8HyYaMpXwLw7r0xta/R
   w==;
X-CSE-ConnectionGUID: I4+1wFI6TG6pf9CcKDxGSg==
X-CSE-MsgGUID: StGno/bHQ/edP/vwzezpNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60572722"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60572722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 04:00:31 -0700
X-CSE-ConnectionGUID: USTnRIJJTWiYLIZF2jzLFA==
X-CSE-MsgGUID: COnufGNYRey/ZBj/k88cfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="175436123"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 04:00:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 18 Sep 2025 14:00:24 +0300 (EEST)
To: "Shen, Yijun" <Yijun.Shen@dell.com>
cc: Lyndon Sanche <lsanche@lyndeno.ca>, Mario Limonciello <superm1@kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    Patil Rajesh <Patil.Reddy@amd.com>
Subject: RE: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS
 after reboot
In-Reply-To: <BY5PR19MB3922A94D7DE90B27B1013826EB16A@BY5PR19MB3922.namprd19.prod.outlook.com>
Message-ID: <7ac9b0e5-ac27-b207-5223-ff132909e4ae@linux.intel.com>
References: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com> <907c1952-5aea-42f3-9a13-71e2044d406e@kernel.org> <caf582a4-ae29-475e-b321-fa255b6f9379@app.fastmail.com> <BY5PR19MB3922A94D7DE90B27B1013826EB16A@BY5PR19MB3922.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-374084593-1758193224=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-374084593-1758193224=:949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 18 Sep 2025, Shen, Yijun wrote:

Hi Yijun,

> Internal Use - Confidential

You were posting this to a public mailing list and the usual custom is=20
that Tested-by tags are recorded into the public git history of the=20
kernel, which is incompatible with statements like this.

(I understand this line might have been auto-added by your company's email=
=20
system without giving you a reasonable way to opt-out, so please clarify=20
your intent.)

> > -----Original Message-----
> > From: Lyndon Sanche <lsanche@lyndeno.ca>
> > Sent: Wednesday, September 17, 2025 2:16 AM
> > To: Mario Limonciello <superm1@kernel.org>; Shyam Sundar S K <Shyam-
> > sundar.S-k@amd.com>; Hans de Goede <hdegoede@redhat.com>; Ilpo
> > J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Cc: platform-driver-x86@vger.kernel.org; Patil Rajesh
> > <Patil.Reddy@amd.com>; Shen, Yijun <Yijun.Shen@dell.com>
> > Subject: Re: [PATCH v2] platform/x86/dell: Set USTT mode according to B=
IOS
> > after reboot
> >
> >
> > [EXTERNAL EMAIL]
> >
> > On Tue, Sep 16, 2025, at 7:15 AM, Mario Limonciello wrote:
> > > On 9/16/25 6:51 AM, Shyam Sundar S K wrote:
> > >> After a reboot, if the user changes the thermal setting in the BIOS,
> > >> the BIOS applies this change. However, the current `dell-pc` driver
> > >> does not recognize the updated USTT value, resulting in inconsistent
> > >> thermal profiles between Windows and Linux.
> > >>
> > >> To ensure alignment with Windows behavior, read the current USTT
> > >> settings during driver initialization and update the dell-pc USTT
> > >> profile accordingly whenever a change is detected.
> > >>
> > >> Cc: Yijun Shen <Yijun.Shen@Dell.com>
> > >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>=20
> Verified this patch on the issued system.
>=20
> Tested-By: Yijun Shen <Yijun.Shen@Dell.com>

Thanks for testing.

--=20
 i.

> > >>   drivers/platform/x86/dell/dell-pc.c | 9 +++++++++
> > >>   1 file changed, 9 insertions(+)
> > >>
> > >> diff --git a/drivers/platform/x86/dell/dell-pc.c
> > >> b/drivers/platform/x86/dell/dell-pc.c
> > >> index 48cc7511905a..becdd9aaef29 100644
> > >> --- a/drivers/platform/x86/dell/dell-pc.c
> > >> +++ b/drivers/platform/x86/dell/dell-pc.c
> > >> @@ -228,6 +228,8 @@ static int thermal_platform_profile_get(struct
> > >> device *dev,
> > >>
> > >>   static int thermal_platform_profile_probe(void *drvdata, unsigned =
long
> > *choices)
> > >>   {
> > >> +  int current_mode;
> > >> +
> > >>    if (supported_modes & DELL_QUIET)
> > >>            __set_bit(PLATFORM_PROFILE_QUIET, choices);
> > >>    if (supported_modes & DELL_COOL_BOTTOM) @@ -237,6 +239,13
> > @@
> > >> static int thermal_platform_profile_probe(void *drvdata, unsigned lo=
ng
> > *choices)
> > >>    if (supported_modes & DELL_PERFORMANCE)
> > >>            __set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> > >>
> > >> +  /* Make sure that ACPI is in sync with the profile set by USTT */
> > >> +  current_mode =3D thermal_get_mode();
> > >> +  if (current_mode < 0)
> > >> +          return current_mode;
> > >> +
> > >> +  thermal_set_mode(current_mode);
> > >> +
> > >>    return 0;
> > >>   }
> > >>
> >
> > Thank you for this patch.
> >
> > Reviewed-by: Lyndon Sanche <lsanche@lyndeno.ca>
>=20
--8323328-374084593-1758193224=:949--
