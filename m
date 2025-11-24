Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15132C1581;
	Mon, 24 Nov 2025 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004107; cv=none; b=e9LWRWmy2VvocFbE7E9SweLYuvtzAzrY3nUR0AieIoY1oYTYEA3R/N30/gx6Jt/dXiiIfeyjD9/rUrDzXabxVQfpcb7RgkXvesejGLe4xudVAWPzVuLi0o+EljlHpGI142RaKV5eMKJ7ABzkRfAEmzzeXRBRpn3/tC0HqiCLd/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004107; c=relaxed/simple;
	bh=7H700fNV5B6PyHwN571vl3Jb4LK5f36Nwg7MrWFuT/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XemBkX/JxSoukivSXrmpDNUuIFdVkqrSMK2X9GTottW076YkstPcTyEFZ3AFaAfBCWmdlfhadfZDDDIMU6jYv3hXkFhwWZSYjWOZC2BwutEay9eNgUbd5kK80CXd+QM6/HTz7i9sMu5iV8nUA8uYTLmYCdfI4zfD64LhumJsZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2NcE9Qk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2NcE9Qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764004106; x=1795540106;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7H700fNV5B6PyHwN571vl3Jb4LK5f36Nwg7MrWFuT/o=;
  b=D2NcE9QkvdKIHP6UxonyFQYXLHdBxQHCUhhdXWHIlLISLa2x6qzTdBtw
   xlFlcDml5Va3/1pPJjMxMEEz5kKgwnQFwPLzhddXTeWtomn+Wj4Eb+vVo
   xqSh7RPBJV1KWJWMV890Wnz8vB8HeuzkR9i3YYHwuTGpcqunpFr884Xo3
   BR5OkaJBiOxyeIPRELvSqG+VqdGPA8QOYEPelezOxiS5EEseDbKmsXntP
   qHbisZWXKvjRarKfHIh88KnjGzkPoSyRF0uc4XEOWMmzTmZBgScmRYHAJ
   Xxz4lrvxWHvykUTs6gmh65rYBCs5eELCmnMV1wVEgiyzmodK06VN2lViZ
   A==;
X-CSE-ConnectionGUID: lq1ql7IrSh2P/G3WiBHIdw==
X-CSE-MsgGUID: QsPeuN/kTDmW6U6QIbTmTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69625723"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="69625723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:08:25 -0800
X-CSE-ConnectionGUID: IWIOQM2hSCuKX9oxzGps+w==
X-CSE-MsgGUID: MJne5u1hTLO/xnsICdmyhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="197310632"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:08:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: W_Armin@gmx.de, hansg@kernel.org, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251120215240.436835-1-wse@tuxedocomputers.com>
References: <20251120215240.436835-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH v3 0/2] Start of upstream support for TUXEDO NB02
 devices
Message-Id: <176400409806.3169.10782832011290481091.b4-ty@linux.intel.com>
Date: Mon, 24 Nov 2025 19:08:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 20 Nov 2025 22:49:40 +0100, Werner Sembach wrote:

> With the Uniwill driver from Armin now accepted I want to push the first
> big addon to it that I worked on in parallel.
> 
> First this adds all current Tuxedo devices to use at least the input part
> of the new driver.
> 
> V1-V2: - Drop the cTGP implementation to push that in an own patchset
>        - Reorder patches
> V2-V3: - Fix comment style
>        - Be more verbose in commit messages
>        - Add upcomming TUXEDO InfinityBook Max Gen10
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/uniwill: Handle more WMI events required for TUXEDO devices
      commit: 3330367128f54142e5cfd568fc44c48da2036536
[2/2] platform/x86/uniwill: Add TUXEDO devices
      commit: 5c14bff570dc5a756d90f7a5bc665cbbe604db8b

--
 i.

