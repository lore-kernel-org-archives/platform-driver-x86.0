Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0547DF89;
	Wed,  1 Jul 2026 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905429; cv=none; b=V5AoZy96TK25BLEp70PGtYQCyvQBMj7cyXK9oGkdr4v0y2KZzSM+czm481v2xSCCAay+Qd/uAGunwCcTmnWYCqvTzKt2rJ73Lc2shjIEiyAdv3eXCR2xZYaoN6rws6g6jZGk7UyOIMyBO5ZnvLZrVXxsRInKLbEQRCr44d9OHp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905429; c=relaxed/simple;
	bh=yIe/LyQoR1BA4pK0tg6i7YFWP2z1TINyLDS0D2v1x6M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tcielnYo21pcoGkpW9CRt3AEJn2KphPFn/MZ1zz241A2DJQnlsY4uF+GdOs5a+AbSC4c8pdRwlh/iBiDqvHaeDLDfEnG2uaKEbP7YIGk2c+cT7o8KJh/QSly0GB2sb9MdUJnLnai2WnjeKnOdRF5GKwLsodGNHPPN+MyHTPQKE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMc0nWsD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMc0nWsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905427; x=1814441427;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=yIe/LyQoR1BA4pK0tg6i7YFWP2z1TINyLDS0D2v1x6M=;
  b=hMc0nWsDYMX+4m6xEr/afv3+C2LcSX957v4oXSGnSFQnsWPDyDt1LDxz
   +PgjLAJY3HxZKZIH5/eab+rFMHZWr/TB2i84TqKGg+juht1cWKuAxhFEY
   I/zQqkmWvpB6MltOQlysSAIVQyDF2gLFH8DTaOT2OTSimh9IDErE/xfge
   6Kqt9rOzy0bvPwdcTl6gUfgU2S4R+621FxaXpmpPZwSp0OqO8MhiG+xxy
   8WXHrM1N3vFGtBeDzgZeRod3IZ0RkgAlbvGkkoHHNJyVozjfBBXZtM08x
   Vi8FRpBlBHOhz94MRQ8qfZLnCqk7IfLAkiqdMgCnDNtTDdlPMN5u0J0oQ
   Q==;
X-CSE-ConnectionGUID: JGHiKVgJQ2W1B8t8A+n4vA==
X-CSE-MsgGUID: I4052jbHTtSM5yvsPxR+Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87548626"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="87548626"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:27 -0700
X-CSE-ConnectionGUID: a3Am//IMT7GbE8haf5GF4Q==
X-CSE-MsgGUID: kQoLbpfeSFiFXRELdEg3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="248568143"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Radhey Kalra <radheykalra901@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, 
 krishna.chomal108@gmail.com
In-Reply-To: <20260615091034.987029-1-radheykalra901@gmail.com>
References: <20260615091034.987029-1-radheykalra901@gmail.com>
Subject: Re: [PATCH v10 0/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx
 support
Message-Id: <178290542048.22449.4054894208907975949.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:30:20 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 15 Jun 2026 14:40:31 +0530, Radhey Kalra wrote:

> This is a split version of the Victus 15-fb0xxx support change. Patches
> 1 and 2 are no-functional-changes-intended refactors which move the
> existing thermal-profile and fan-control decisions into board-specific
> .driver_data. Patch 3 adds support for Victus 15-fb0xxx board 8A3D.
> 
> v10 rebases the series on platform-drivers-x86/for-next as requested,
> now that the recent hp-wmi DMI ID additions are in that branch. It
> preserves the newer 8B2F, 8D26, and 8E35 board entries while converting
> the table to board-specific feature data.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/3] platform/x86: hp-wmi: Introduce board-specific feature data
      commit: 385bf4f87b059d9a2bd9663c7a5f1a8fec6f724e
[2/3] platform/x86: hp-wmi: Drive fan control from board data
      commit: 9ed0f2562f9a6060955954f0d0ca72f12ed1a705
[3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
      commit: 5417f92a1d460bf10e3f316863ba059cc7c845eb

--
 i.

