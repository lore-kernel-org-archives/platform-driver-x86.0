Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA9B2E62B3;
	Mon,  5 Oct 2026 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222313; cv=none; b=rnF0smH5UUgb1SZkIU3DGCyqSa+XUot1MhbcdeGDt3KGX4ltXfIXBNASPUS1vGqLJk+UaKwrrnHzZsp93A+Tm1JrY1D6LdTOq0Pl6CeXMJGjWkNrYQ7bMk5+uTHTSx5l7Fg0gwqC2vEAhTy6pbRLmu5Zcgk0pXLO+dWYKC4sCIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222313; c=relaxed/simple;
	bh=8WaIA6iboPc4IMJWRyUiFZoNvpxg4UDIxTE+Lsk7RMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LQDhy020v+H2UdAXdPT6uFAeR/oaFW5kgMszUVW4r8hJRvHj9w5/gnpN5AUnkQmkMbD39G4Gn2hmyYly9nXW+HZvXeSimdDR/2z1vLxCNJk6vPgxa987M3csp7kbaQ2+ifgVSTz6+lgokvLVd8BnIOhCZNFyz/Zd/it5Pp0pQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5aZI362; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5aZI362"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791222312; x=1822758312;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8WaIA6iboPc4IMJWRyUiFZoNvpxg4UDIxTE+Lsk7RMc=;
  b=Y5aZI362eOCdGT/kGOHoX99262eldp093SS9kP07gdwEoukWaGvxH2wn
   RsV6BZjjOwsKNoT4CXpaZ/QRAME5nJ4njqvAxuzatu50+u0sZTA2gqSf6
   eEYhjw+VVUdt7dsw0tN4wsQYs1mAYxBox6x3gx+4810npYZY5ksvkDvFZ
   ZQArz1lwBb+LtkU4x+1j2kh9F0KCGksuYy9VAT/4pHJaDfjmfmvHAqvRS
   d7vsiSQkMv//Eiv00lTVQfhQP9FEPLyzXQJlB944QJ7GXKf5M8ZD5BrHM
   nHNYYvbsCAdIxtbfQH+iHpSuxOBFlg15rDjMteBU/hg+7egW0DebMb/jb
   w==;
X-CSE-ConnectionGUID: XRLreusoQ4yybnyWNjr5Cg==
X-CSE-MsgGUID: mGSlAMf2RlmxI2egL9bLLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="92009836"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="92009836"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:45:12 -0700
X-CSE-ConnectionGUID: a8bkmyrsSJWtbjIx6w9mIA==
X-CSE-MsgGUID: Y6Bbkw9MTlWBvz5nvLRfHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="281663896"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:45:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Shuwen Bao <baoshuwen2013@outlook.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>, 
 Emre Cecanpunar <emreleno@gmail.com>, 
 Suryansh Singh <technosfan14@gmail.com>, 
 Radhey Kalra <radheykalra901@gmail.com>, 
 =?utf-8?q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
References: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for OMEN
 16-am2xxx boards
Message-Id: <179122230394.27048.9839062081057759183.b4-ty@b4>
Date: Mon, 05 Oct 2026 20:45:03 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 19 Sep 2026 09:24:25 +0800, Shuwen Bao wrote:

> The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
> Arrow Lake-HXR) is listed in the OMEN Command Center device
> capability table with DisplayName "HyperX OMEN 16" and the
> "PerformanceControl" feature, but is missing from the kernel's
> omen_thermal_profile_boards whitelist. The thermal profile path is
> therefore not enabled and the embedded controller keeps the CPU
> pinned at the default frequency cap while running Linux.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
      commit: b631ab75e946ba7a4adf95ba8b2fb42e72f14e0e

--
 i.

