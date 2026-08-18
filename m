Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8DC45FFB6;
	Tue, 18 Aug 2026 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052044; cv=none; b=ncWTbi3kHhyouryQrmQDEa9dQer5irKJxDjLLe+AEYGlvqj+xHWB1Dzd4kJBhUrZGvrSat6LnKitA3/fKK9GfVEE+bW1hI1TOQsjhVYlBPPmCJ2/2YctrI5MwT9YL5uskBAWeyhZja+oxE+mb3nej4J8E1QjvXkc/y17JBet5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052044; c=relaxed/simple;
	bh=WEQl4X7LGbZp+eoEDW/4S5e3f4aGarcshTRR9RCaPlo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NsoaCftC37Us+ItamFzY97LZQWHXe4WB3K+88E7eKwcL76KM3zVChGtD5wnjurDqSylZsai8HCrLDohaeITBwM7corTvOM2BQiBRiaEi9JRQfeGvmIjA1txgJi9infPyA5WowWuNCH8VXSICikymq95AN9rRJd6HQWiNl17nrlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsI1G0A2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsI1G0A2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052043; x=1818588043;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WEQl4X7LGbZp+eoEDW/4S5e3f4aGarcshTRR9RCaPlo=;
  b=KsI1G0A2lUfBkaxIsmZAtuqCyroNm+IlSefnUgj35/UoOpqgkMksNBPF
   8IcFO20zJ3juoVXnVcxDCFpMiRe+es3ifw4IEqPNhOrMpYYqjAZ5guDwV
   mAiCREuGFJfZ95RR4AOZmG8p9TFIJty+YqM1mLU4yddWRva7UKcjjDR4b
   e+auBN4bhY6DmfKsKsS2RvxEBhF2pCSmdgXlF8Wp9qXl7GlUMA11hcC/y
   bbhcvZRKLham1ejT4nl97nItj5aIsH3RZNp3CdOBX9qzafvsrJY7d07WP
   9AvH7myLdAoHhlATbvRcaUwfkVaJtgvDlC8zokDuwCSbpQbfYD9ipwSIF
   Q==;
X-CSE-ConnectionGUID: sR/F2rqZTyaiZmLV1E83Fg==
X-CSE-MsgGUID: 7oV2hGZoS/eueBpXygC0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75071465"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75071465"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:42 -0700
X-CSE-ConnectionGUID: jYrf6ZESR4Gs35xvYLOu6w==
X-CSE-MsgGUID: aCprMIn6R6a161UaGlXvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="303423668"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: denis.benato@linux.dev, hansg@kernel.org, 
 AbdElRahman Soliman <abdelrahman7987@gmail.com>
Cc: corentin.chary@gmail.com, luke@ljones.dev, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816174118.28012-1-abdelrahman7987@gmail.com>
References: <20260816174118.28012-1-abdelrahman7987@gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-armoury: add support for FX517ZR
Message-Id: <178705203478.11998.4975929416442591780.b4-ty@b4>
Date: Tue, 18 Aug 2026 14:20:34 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 16 Aug 2026 20:41:18 +0300, AbdElRahman Soliman wrote:

> Add DMI match and power-limit table entry for the ASUS TUF Dash F15
> (2022), board FX517ZR, an Alder Lake + RTX 3070 laptop.
> 
> AC and DC min/max values for ppt_pl1_spl, ppt_pl2_sppt,
> nv_dynamic_boost and nv_temp_target were referenced from ASUS Armoury
> Crate's manual performance-tuning mode on Windows for this exact model.
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
[1/1] platform/x86: asus-armoury: add support for FX517ZR
      commit: 28e5e682597abf1ef1422a93797c49c25cf0336b

--
 i.

