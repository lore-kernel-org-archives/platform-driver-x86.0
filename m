Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1930363CB
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594355; cv=none; b=RsLZtRnFD27eOgDPRPjFp4mNUkDvNf0qNGIx/qpkcRh4RSKdgZnjI91C3Jng4S5sf7ZRemqZctOuOMeJJvGNVNzy3Hd/wYjCAlb19UIqWVImgI1OegVJg3pi4SPNZtjXD447TnuzwLxrQgcVB9Huon0B9BFZoT8RW5mIUHF543w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594355; c=relaxed/simple;
	bh=3xw0RIk5EwDPXgTRQ+xYWo3Bi5jSxdLrZGpdKTJBOjs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VZ62XxHowotXG03TQue152IlOLPWVpZfw8B8Tqr6k5UAHeL3Xn43ImgWe8PfhIIAX9NxU6SEY/EENzrSeKihwwULqMZH+Q4tmMWQuYm02hzI9z0wUemrL3/JDcKVAMxrIuKTAEL4IC/Cw/lImEiH8mRfrHyiX6AUbsPUmPD2OK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUez2sTk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUez2sTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712594354; x=1744130354;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3xw0RIk5EwDPXgTRQ+xYWo3Bi5jSxdLrZGpdKTJBOjs=;
  b=LUez2sTkDKgWSo+o1LEXyNe9gWIrJHhdu58knTkP/IdTG1i1I6c0wGzA
   EGsZItbKUYd9CPaCzDaTEGeCzmGL8w8wtK+QIffRvaV7kzwRdKGEg2W7X
   2HRKgh48t1GSOOAWcFY+YlssgRBnYJsI2g4nZH3JVjOqQCv6wJWxfkCCX
   rAdchwiOBDehaOhI2XcdUU+uicnyC1+Uh8lMjaQ2O0IcC1cNwUdkAHiWt
   Oczk/M2Q5A2qtj5+6PwA41OFFwdd/nVoS5WIXuhHhAGREj0cGRzUdCPQ7
   6Hav7UDMQ5FQxM24iu1+w4RTk6vpxEIX0NbkRGsNaSu4tp3qSkaAqC1Xm
   w==;
X-CSE-ConnectionGUID: mWkK1Nt4Ro+bdscu3U5P1Q==
X-CSE-MsgGUID: BLVY7069TSu4YqC0QCSf+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7727284"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7727284"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 09:39:13 -0700
X-CSE-ConnectionGUID: ITCya+fnRl6VUFwoDkCUIw==
X-CSE-MsgGUID: gKZXAlLJRS68sqAGJZdCMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="51130924"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 09:39:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Apr 2024 19:39:08 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: toshiba_acpi: Silence logging for some
 events
In-Reply-To: <451bb318-aeb0-466f-9507-4983dcfa4858@redhat.com>
Message-ID: <55639aeb-09c5-b411-f97f-dc4ec7b43d05@linux.intel.com>
References: <20240402124351.167152-1-hdegoede@redhat.com> <171259093806.17776.3713671881492753491.b4-ty@linux.intel.com> <451bb318-aeb0-466f-9507-4983dcfa4858@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-310862142-1712594348=:14302"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-310862142-1712594348=:14302
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 8 Apr 2024, Hans de Goede wrote:
> On 4/8/24 5:42 PM, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 02 Apr 2024 14:43:51 +0200, Hans de Goede wrote:
> >=20
> >> Stop logging unknown event / unknown keycode messages on suspend /
> >> resume on a Toshiba Portege Z830:
> >>
> >> 1. The Toshiba Portege Z830 sends a 0x8e event when the power button
> >> is pressed, ignore this.
> >>
> >> 2. The Toshiba Portege Z830 sends a 0xe00 hotkey event on resume from
> >> suspend, ignore this.
> >>
> >> [...]
> >=20
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo branch only once I've pushed my
> > local branch there, which might take a while.
> >=20
> > The list of commits applied:
> > [1/1] platform/x86: toshiba_acpi: Silence logging for some events
> >       commit: 0dd50b3e2c3d651ea972c97cff1af67870f3deaf
>=20
> Thanks.
>=20
> Note I had also applied this to my review-hans branch for for-next,
> I'll drop it there.

Okay, I even tried hard to avoid that by checking what you had in=20
review-hans branch but we just happened to work nearly at the same time=20
so it didn't help.

--=20
 i.

--8323328-310862142-1712594348=:14302--
