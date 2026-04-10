Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD6CCA4E;
	Fri, 10 Apr 2026 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829155; cv=none; b=cfbOCv2Db/0h/9+umP1SWuGzVPxJrOaD3n5plNtblqO0HK94xPEurcFnTyXGwVs6sAZ2xSFLg9Jt69b05ciy2bYVyv/TxepaSNnM5Kyosv1s7fdQfjvRE5etLxrvOhwruIG2Ros+IVeWOFw2tPgdeunJ9KiCyuCn/7arX64wFLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829155; c=relaxed/simple;
	bh=0eYVP/OjUGQdkLf5BpSKiCoF5/VvNZ/rZQeEq2TrcWs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Pa/oUIfhi+Gqtam+bNzOcmFt2d0x7ltKy1fdk7hPOGkBFyvOZL88V7guUVZtjRjfes1DEj96mvhTeDUyeVsXkhpcm49ZcYxiaDMa/5jf2XStZ7pDX2tLFYuTPrjkAUEGYJb1TGORfPZTD+DEl/jsKGXMlVzTcAKMU3ZQvm+6POE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPd3YjjS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPd3YjjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775829154; x=1807365154;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0eYVP/OjUGQdkLf5BpSKiCoF5/VvNZ/rZQeEq2TrcWs=;
  b=MPd3YjjSSrsIP0pqg4kdDuaUx2aQJmzRPER11C99j/MiOagi2qDElj3E
   gfa0HWuTapApkoraVZ6LXRbUDzLSI6MIwHQhYl4H+hIgvBDG3AKqqPpys
   8WgvUXguXjW+3HSVrgZpLe6QVQCBu9pzSiYVn5ABUFsysftC+fGeVQIra
   F+oBMHvl1q9dJV00YKlWOOPwtb401QjaO6dxe7Z6VskweITH1nryoeBuB
   6EctddgNtkZ9i2XeOTByAh1PPWX7GtLQrgHGSr99HmVyvGW/6G5es/XPk
   R6+GAuRuW0oxbnnRAdleX2VszofLSvs1MheyhLiM58TamwX//eDrJXojq
   w==;
X-CSE-ConnectionGUID: DfUGUI8JSF6fVd1daSpykA==
X-CSE-MsgGUID: /8Xy0+NfRTOsOAfFFcbbIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99482242"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="99482242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:52:34 -0700
X-CSE-ConnectionGUID: PUwPhPq+Rv6ZJ8XIjQajIQ==
X-CSE-MsgGUID: ohVE2qU2SLStuEgI4LLsCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="229005367"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:52:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Apr 2026 16:52:25 +0300 (EEST)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jakie101@proton.me, 
    prasoon5050@outlook.com, absolute3d86@gmail.com
Subject: Re: [PATCH 0/4] platform/x86: hp-wmi: Improve support for some HP
 boards
In-Reply-To: <20260401111748.106970-1-krishna.chomal108@gmail.com>
Message-ID: <2e795162-af64-93a5-73a8-a6153ce6d396@linux.intel.com>
References: <20260401111748.106970-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Apr 2026, Krishna Chomal wrote:

> This series improves support for some HP boards.
> 
> The first patch fixes an incorrect assumption in the fan table header
> which leads to a parsing error and eventually failure to load the driver
> in some devices.
> 
> The second patch adds support for board 8D87 by adding it to Victus S
> list. Unlike other boards, here the EC does not expose platform profile
> value, so EC readback is disabled.
> 
> The third patch adds support for board 8A44 by adding to Victus S list.
> 
> The fourth patch adds support for board 8C77 by adding to Victus S list.
> 
> Krishna Chomal (4):
>   platform/x86: hp-wmi: fix fan table parsing
>   platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
>   platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
>   platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)
> 
>  drivers/platform/x86/hp/hp-wmi.c | 74 +++++++++++++++++++++++++++-----
>  1 file changed, 64 insertions(+), 10 deletions(-)

Hi Krishna,

Could you please respin this series.

I tried to apply it on top of review-ilpo-next but it got so messy I lost 
confidence in being able to  reproduce the changes correctly.

-- 
 i.

