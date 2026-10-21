Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577223;
	b=UUkNLW2VkRmR1SyXDZS4bGfvglNlrV/U6m9DqveCPvENDPSybH6JjqgrixxAIQgWG9gc
	 yVdb2JOVv8lQB86srunhD46r2ftSmQyxwAurU7Q84v9pOtXEgkP1aUHXYzfZnViUIjruS
	 WXe8Fp1JgpTZJOL91qm8n7E4WmIpLCVSvzMeuSj3qCqND/v0NSqHk1ewADeA4tM+jfWp4
	 XIq+izEj7Wkz0v48kGAvZ9I6U37WMgAdLJXCbhABzuMlQHW2BkaiCM6myF64OsIdVXqaB
	 N1h1TwgJMqjpjFyNN6IZgTPdAtHiH01IdvtgDZCoL9o2fFKHDpc+uNBe2+dxsu7Fp4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577223;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=QvPThFQs7CPNFPQ+vkGx4arKK/k402cnRQc1S826sqI=;
	b=vmJuANQIXcAdFqYDv7A6YL0PGSNzkGfjOP9q7aEa1Oqw2ieEDCt3FzduCwoTCRB1qFgb
	 b4Lx9xAxZkU3akP6SFT40YZGxyVZ00OpRz85OBfCT1cTQv7WBgw6ECxl1E3fLxw4jn5yl
	 xmTl7fgdZvFbgCdAQRnrmm2CCqoSWBiiPAQpnMgHQocDwnAQw/QDW6Mx4xYNNSVXH7BNp
	 i3CtuEuaxbk73yEF6zzxnTItAihnLFl4IzHgK9cR+tndZWLH1DCVtZyR5d00P8+UdmeSP
	 Xv2c5euMLVikUaCfPcN9S01fgfD4pPzpvdlLnOISKEFgMdNfqScJgvDx+xWtv2DqYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lRuA7Ht1;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A2606A319;
	Wed, 21 Oct 2026 10:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518A2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lRuA7Ht1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792577223; x=1824113223;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=NL0lYY9NdoNlkvR0pbijV4vrZONetomEaQ/12rrA3+A=;
  b=lRuA7Ht1QM8eJLT/O0+R9QKc7IA3JosZ2O1mFINlIAZf08Mkkt+QlurF
   34xcTeduMXYSl/phY9FVVo5F1zHvYctIwnAveKjcbAadaswTaZuXXeYf9
   8BBasjihGOKLut4K6/0Grg3TavWOt8hDWT00S8jt75uHtu2LWjs+yEqsM
   qVZ5xPO0CRElMlr0sHKgo8QuaJBY2duJw46Idw66q+Gn2xYXoW4qGTKnc
   oRogkdEB0SbcY1AFoGctRB2m1hmNOoHLV1/RZ/T9SQtmfPF3hmtHoyrV3
   zBqwjpHmn90mdnOCbVB6jglpnWzLKHOFh2zlHLsuwxddvsHViycTTGeyx
   A==;
X-CSE-ConnectionGUID: wrUdAa5wR0OWsPDc4ERrGA==
X-CSE-MsgGUID: n129C2gLR3GdBhiNuZtTKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1185900"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1185900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:07:02 -0700
X-CSE-ConnectionGUID: F+zXWec0Q4WsP2rH6Z+pjQ==
X-CSE-MsgGUID: PiqTdiP/SbScuA9fo7BX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3373794"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:06:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 Junrui Luo <moonafterrain@outlook.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261021064012.457870-1-tiwai@suse.de>
References: <20261021064012.457870-1-tiwai@suse.de>
Subject: Re: [PATCH v2] platform/x86: ibm_rtl: Fix potential OOB read at
 signature search
Message-Id: <179257721467.10359.5031455063414547974.b4-ty@b4>
Date: Wed, 21 Oct 2026 13:06:54 +0300
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 21 Oct 2026 08:39:55 +0200, Takashi Iwai wrote:

> The loop for signature search fetches 22 bytes of struct ibm_rtl_table
> at each check, while the loop count is calculated in 4 bytes unit,
> which means that, at the last entry, it fetches over the limit.
> 
> Rewrite the loop to use the byte offset and correct the boundary
> condition check for avoiding the potential OOB access.
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
[1/1] platform/x86: ibm_rtl: Fix potential OOB read at signature search
      commit: f1d81af2521ad504a20481fef12c358d26e6c3a6

--
 i.

