Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07FF406298;
	Thu, 11 Jun 2026 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184095; cv=none; b=Ez4kKNIdUIQQM4IEN1tvXRCg6DxQPqveNORdUnW1wR+v6sU99SmDwX78GvXp0BqlbyEO0M9RrsnlQwoK8F+bMayn0ovBxMYjfa5tNkA6jU5g+OTTCRsgU6/aF7sgqJr2RvQVwiG6Xtq63YC1cwmtV2LD/dmzRrwLnaDu9VNdhYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184095; c=relaxed/simple;
	bh=cFxYd0s1au9W7ZLiIlUtyNUbbVWzYL3Ai82Y04G4b40=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gOThw3J4IENc7fKurZA+3IowfMV8YSjRBaGmpD+QUPrmb4aBKeTEf77Uyf1ovXi/hagtim5MqiBitEC4ydpsumJhG41uaHUCB5iXfUhg80XvPCPMLNHrNtVDy38/PN3PQpuvBwwfckoBlkbrYsLnax5Ym+yEX6j7XOFOrwpJtwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJz7Os2C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJz7Os2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781184089; x=1812720089;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cFxYd0s1au9W7ZLiIlUtyNUbbVWzYL3Ai82Y04G4b40=;
  b=FJz7Os2CxGiCF4eiIQ873xle6HHVfQh/h7SSpD5beNGutnak/eq7NEfQ
   ug/Aqsu6qXDJ0HjSMRv8MeTapBxivY1nB16ZgI3/U25PPPRKD1pq1Di+0
   UzJPXX7HLKBpmkxKICG1K9p+R1/ep4p08XTNIyTYzapOE3p80goLZfYcp
   0U+RZBdrW/x5+N3EdO5g2VWU9WzT8Cw31oaWCNQsQXwRWg9wCfxG9OH8j
   woJRy+Zr+TlZbrSy7oONHthzboQ84+zOu41QmvY01QP4uu2lQYmCsOo7g
   cGV2AMVLw55OzkT3NJPB66A0E+XUsT8Omjtw8Wb7ArVZgr5H6vyxbif2X
   w==;
X-CSE-ConnectionGUID: BdV3JVILRfOGvsf1RoBShQ==
X-CSE-MsgGUID: S5iN0nAVQyee1BJuxIxV/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93386040"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93386040"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:21:27 -0700
X-CSE-ConnectionGUID: xFJMPteaRYmGu5HRR7vsmQ==
X-CSE-MsgGUID: paQI5NdwSS2s7SP7lDRoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250763265"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:21:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jun 2026 16:21:21 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, wse@tuxedocomputers.com
Subject: Re: [PATCH 0/7] platform/x86: uniwill-laptop: Support additional
 features
In-Reply-To: <84441528-5f33-4795-a650-8b6fccdaed5e@gmx.de>
Message-ID: <8395fcb7-4de7-85ff-d2ae-a7eefd2dc87c@linux.intel.com>
References: <20260530170813.10166-1-W_Armin@gmx.de> <9c74fdcc-20c2-0722-7932-8fa09872d80b@linux.intel.com> <84441528-5f33-4795-a650-8b6fccdaed5e@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1965774204-1781184081=:1126"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1965774204-1781184081=:1126
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Jun 2026, Armin Wolf wrote:

> Am 10.06.26 um 12:50 schrieb Ilpo J=C3=A4rvinen:
> > On Sat, 30 May 2026, Armin Wolf wrote:
> >=20
> > > This patch series adds support for various new features to the
> > > uniwill-laptop driver. The first patch adds support for the keyboard
> > > backlight available on some models, while the next three patches
> > > add support for additional WMI events, USB powershare and AC auto
> > > boot. The last four patches finally add support for additional device=
s.
> > >=20
> > > The patch series depends on commit b1a9b7a904af ("leds: Introduce the
> > > multi_max_intensity sysfs attribute")
> > > currently sitting inside the for-leds-next branch of the LED subsyste=
m
> > > tree. Without said commit the first patch will apply but not build.
> > >=20
> > > All patches have been tested on my Tuxedo InfinityBook Pro 15 Gen 10
> > > AMD and most work flawlessly, only the AC auto boot feature seems to
> > > be broken on my device. I decided to still include the patch because
> > > it works on other devices.
> > >=20
> > > Armin Wolf (7):
> > >    platform/x86: uniwill-laptop: Add keyboard backlight support
> > >    platform/x86: uniwill-laptop: Handle screen-related events
> > >    platform/x86: uniwill-laptop: Add AC auto boot support
> > >    platform/x86: uniwill-laptop: Add support for USB powershare
> > >    platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pr=
o
> > >    platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
> > >    platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
> > >=20
> > >   .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
> > >   .../admin-guide/laptops/uniwill-laptop.rst    |  27 +
> > >   drivers/platform/x86/uniwill/uniwill-acpi.c   | 609 +++++++++++++++=
++-
> > >   drivers/platform/x86/uniwill/uniwill-wmi.h    |   2 +
> > >   4 files changed, 650 insertions(+), 13 deletions(-)
> >=20
> > Unfortunately, I got this error after applying this series on top of
> > review-ilpo-next:
> >=20
> > drivers/platform/x86/uniwill/uniwill-acpi.c: In function
> > =E2=80=98uniwill_kbd_led_init=E2=80=99:
> > drivers/platform/x86/uniwill/uniwill-acpi.c:1827:49: error: =E2=80=98st=
ruct
> > mc_subled=E2=80=99 has no member named =E2=80=98max_intensity=E2=80=99;=
 did you mean =E2=80=98intensity=E2=80=99?
> >   1827 |                 data->kbd_led_mc_subled_info[i].max_intensity =
=3D
> > KBD_LED_MAX_INTENSITY;
> >=20
> >=20
> The patch series depends on commit b1a9b7a904af ("leds: Introduce the
> multi_max_intensity sysfs attribute")
> currently sitting inside the for-leds-next branch of the LED subsystem
> tree.

Ah, I missed that note.

This will have to wait to the next version then. I've summoned the series=
=20
back to patchwork queue so I won't forget it.

--=20
 i.

--8323328-1965774204-1781184081=:1126--
