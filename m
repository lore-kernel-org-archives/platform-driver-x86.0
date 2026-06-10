Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CD93E450E;
	Wed, 10 Jun 2026 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088624; cv=none; b=C5pOgn6/A3psW8vV9Pyn93iT13+Bq2kATGYqOm8oPPuSnKMpBkMjjNpEnpf0LESNgzPX582jMSF5m2QykPQsaWpauGaC1e3/joFyaeLM/kPse+YwY9g+P69qBFGozXECT8Febjy6z7saox6xs7TmtbjCI2d70tdRYCIuM/IwSeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088624; c=relaxed/simple;
	bh=RWcoO4XeX4VNqJvMo2VyCgTs7V7Dg0MyBNvS5Mm+a3g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t8c7PsZgQ2oh+R9Krsv5jwLl0UVzbUkLs7ZXQUdFqdvpiLiICdA+Snzuh7QVFqBwfSdD+F+J6IW5L353iXURemYrF/q5JFbzpMvzeSFarmwxeikEhqy1RCbfBxa6xts1aJhMTkCwZ8Guafs+NSxTUh6w4sR3JIpAksYuTXEzsv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcBpXCPc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcBpXCPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781088623; x=1812624623;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RWcoO4XeX4VNqJvMo2VyCgTs7V7Dg0MyBNvS5Mm+a3g=;
  b=HcBpXCPcWsXyrXPl/DH5gjbLY9mSyrhz76t2aLnrkDhi4PeCyK91etEG
   4bKLH2IgAIzRbkaxhWVLGWNj9RvXOE39Byy0Gy0eH4Schu38k+2AjBLn/
   DJ0Bp8ulnQ+u9nKvt3uBvtiG5YQxc8f9P+q2BD7qHcE3ug3/gUln8+H+f
   kg8ThTzYS3Ofs9YhPiq8JqyMka9U11gwVHkNHFYN31RrZNrF3Rh6tVu+F
   S1JAJdIE0EwKlB4RaEpt9hGSkEjYuaNo8BLz/J7ZKBqaNon+h8oLQWdgW
   NG0IV+0Xly0FLNsKkrKaHFuC9pfjlgsyAZU6BsfvIP9rPxngggQNpgG0W
   Q==;
X-CSE-ConnectionGUID: DrzkaCCWQ9SJy00aAUBokw==
X-CSE-MsgGUID: kGj0wjkaTW6PbGBfYtCW5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81726680"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81726680"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:50:22 -0700
X-CSE-ConnectionGUID: gqRPGTR/SPqxqZKmSp70Rg==
X-CSE-MsgGUID: C7+58cWaQKuLPP1ByLd2xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="248003099"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:50:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 13:50:16 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, wse@tuxedocomputers.com
Subject: Re: [PATCH 0/7] platform/x86: uniwill-laptop: Support additional
 features
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
Message-ID: <9c74fdcc-20c2-0722-7932-8fa09872d80b@linux.intel.com>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1620085302-1781088616=:1359"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1620085302-1781088616=:1359
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 30 May 2026, Armin Wolf wrote:

> This patch series adds support for various new features to the
> uniwill-laptop driver. The first patch adds support for the keyboard
> backlight available on some models, while the next three patches
> add support for additional WMI events, USB powershare and AC auto
> boot. The last four patches finally add support for additional devices.
>=20
> The patch series depends on commit b1a9b7a904af ("leds: Introduce the mul=
ti_max_intensity sysfs attribute")
> currently sitting inside the for-leds-next branch of the LED subsystem
> tree. Without said commit the first patch will apply but not build.
>=20
> All patches have been tested on my Tuxedo InfinityBook Pro 15 Gen 10
> AMD and most work flawlessly, only the AC auto boot feature seems to
> be broken on my device. I decided to still include the patch because
> it works on other devices.
>=20
> Armin Wolf (7):
>   platform/x86: uniwill-laptop: Add keyboard backlight support
>   platform/x86: uniwill-laptop: Handle screen-related events
>   platform/x86: uniwill-laptop: Add AC auto boot support
>   platform/x86: uniwill-laptop: Add support for USB powershare
>   platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pro
>   platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
>   platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
>=20
>  .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
>  .../admin-guide/laptops/uniwill-laptop.rst    |  27 +
>  drivers/platform/x86/uniwill/uniwill-acpi.c   | 609 +++++++++++++++++-
>  drivers/platform/x86/uniwill/uniwill-wmi.h    |   2 +
>  4 files changed, 650 insertions(+), 13 deletions(-)

Unfortunately, I got this error after applying this series on top of=20
review-ilpo-next:

drivers/platform/x86/uniwill/uniwill-acpi.c: In function =A1uniwill_kbd_led=
_init=A2:
drivers/platform/x86/uniwill/uniwill-acpi.c:1827:49: error: =A1struct mc_su=
bled=A2 has no member named =A1max_intensity=A2; did you mean =A1intensity=
=A2?
 1827 |                 data->kbd_led_mc_subled_info[i].max_intensity =3D K=
BD_LED_MAX_INTENSITY;


--=20
 i.

--8323328-1620085302-1781088616=:1359--
