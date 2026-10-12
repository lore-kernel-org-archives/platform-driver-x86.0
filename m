Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5DA496D3D;
	Mon, 12 Oct 2026 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820507; cv=none; b=H/Dru0f/4KZsdoJGm0Bewd2+g7++gqv4tuO2zlHHtWfpUXhNc6i08Xb0kwwclk94nvtwLQPieUmuNMjhOgtBUuVqYZUxtLTWz2FGId1cUZ9IrRODKRgFEP/GZY1H5/Ot0d8mVUVyprrEqbxYORncZq01UhpYNg/EbvTx92T8nbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820507; c=relaxed/simple;
	bh=Zw+73HM5FF9e6fSh3reRRGA9awiEtCAEIudTaDqgK6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=klnapJeKujnrtzvUUO6IV7avxqECYjLIwbbQuRi/JI/e9jpdb230py6rgEqpJyyuvVI7HIlgN0xFzg9WiNNH15ufJ0NKLi8FD1lK9/6NSjRx4nIqWB0Pa3OilVk1e1SxQPENjwZo/D40PZqrYNOJAFjYp9yWgkdnizEu+GOA+AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKu6PB+L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKu6PB+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820506; x=1823356506;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Zw+73HM5FF9e6fSh3reRRGA9awiEtCAEIudTaDqgK6g=;
  b=PKu6PB+L/pppzk5uSHdFb+QUMC7VYxsx7FEpzfhpTtikZDC83wamhniA
   2QDr2a98vOyN30ltF2VOvn7mW5Jj50KFHToqcixO3jlYKU8FWDH6N+cVm
   mMEz9SnlxkfhR5MUzlzLIMPj38HyykhfUO5ndq17kCOoRa9Z1UlRlsA+1
   ovJJGSy4f7bqU9ZgbRaUD2jCLS22qCBeDFUGH57jMx3pzspVaPhXr8C5k
   O1gBBVrRlAEwRAOshYJsRGh/QpjEdaF++OdoqSX3vHMBnkhSTetXlqVxm
   9Qu+TB6RTFLF91SZkQ8FsmuuteyPOt4OHSPfEXwYocPmJGvJGnPAJT7vu
   Q==;
X-CSE-ConnectionGUID: AqHFkmKtSp+kOoPQwOmrgg==
X-CSE-MsgGUID: ADvFqoY5Rq+uZNdOJT58SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="522507"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:06 -0700
X-CSE-ConnectionGUID: ZlrPsrlAQC2iFntPoyC83Q==
X-CSE-MsgGUID: f8Cxt34OQQyMORtl2Up3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="843854"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Patryk Pilichowski <pat.pilichowski@gmail.com>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925213333.198058-1-pat.pilichowski@gmail.com>
References: <20260925213333.198058-1-pat.pilichowski@gmail.com>
Subject: Re: [PATCH] platform/x86: msi-wmi: Fix hotkeys dropped with vendor
 backlight
Message-Id: <179182049871.17897.11919911042851366032.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:54:58 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 25 Sep 2026 23:33:33 +0200, Patryk Pilichowski wrote:

> Commit dee82409a883 ("platform/x86: msi-wmi: Reformat
> msi_wmi_notify()") turned the condition for reporting a hotkey into
> an early return, but only negated the brightness key comparisons,
> not the backlight check. As a result, when the driver registers its
> own backlight device, all WMI hotkeys are now dropped, instead of all
> of them being reported as before.
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
[1/1] platform/x86: msi-wmi: Fix hotkeys dropped with vendor backlight
      commit: 48d84a375dca6c561fcaa4e697661cfee3e72fcb

--
 i.

