Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85647ACF9;
	Tue, 18 Aug 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062118; cv=none; b=kCGLsp+ETasJgVbLObIEFqm69yMa2QMHNP1FTqhtBFBGf91eLg72F9JgwL4oYxKDPZcYfjeVaVIhJMsF7moyRtNYxAC1w2aVqxFq8IPxhg3urIVGyhjC2BN/L4sQyT8wuHU1QeLN6WrBflqAhArrgQYuW5+0MOoPj+10GmK0Kxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062118; c=relaxed/simple;
	bh=6OSbR2Xldg8jZbLzVzh/fA+LJ73tq8pwaJRFalggPoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ONzl0vkSUPUgNk3IbP2bsEuvzBKL1GdNMYDu2wlrIPDPwMh3AxxpW7T1mbxIPgKF2xzVf7XTDijEflMwaQHb6Fs3gH3FzSzdCAK/I7Nb2ZDier4HAE6z10SpWiJSh0AjbjFDOCaWYga1YUNwxX6Ca0/XQkKaFY3QAGsaWQ4fgv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4RMzhVc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4RMzhVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062117; x=1818598117;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6OSbR2Xldg8jZbLzVzh/fA+LJ73tq8pwaJRFalggPoc=;
  b=E4RMzhVcaHR5cFpeTCf9K1i7UP5WDIGrp06Dh8Zzlkd74TeLaIeaDp1D
   YNbc6Qs4ucUiYhCgCPplvSxUXYWmihuiS/7Qca6vSaBVcEcPUfxVT+8cA
   u50LjXSkJPpWRge322WDBXSMAsdlL2B2hTw01LL7TIwldGmAIsqhLzcvq
   bna69Q7nt05YvW2StxfDabGsTa8BjVXWF/BVoAkgtNlENQF5EVH9l2gw4
   dhbO3JKrcoFo/h+20D0bwLTYaohfY5kIZgOP6DKxaI5JxDCfxFBXQHMTJ
   1VE0tqYHcUk8JUKrApB0e2ug6n4t3knNQu9LqqfDHV/8f6KHlbQWT+M71
   g==;
X-CSE-ConnectionGUID: c9+DdyW0QhGGQj5tuxVmcA==
X-CSE-MsgGUID: +EOjTxR5QuKHpn5dysiA+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105089208"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105089208"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:36 -0700
X-CSE-ConnectionGUID: VgapDa6GSmeaCLstzhYF3g==
X-CSE-MsgGUID: EpRiARUuRcKJ+sQ/puQT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267214090"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Jeff Hagadorn <jeff@aletheia.io>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260805183102.38408-1-jeff@aletheia.io>
References: <20260805183102.38408-1-jeff@aletheia.io>
Subject: Re: [PATCH] platform/x86: oxpec: Add support for OneXPlayer X2
 Mini Pro
Message-Id: <178706210945.20251.8349160620696169203.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:08:29 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 05 Aug 2026 11:31:02 -0700, Jeff Hagadorn wrote:

> OneXPlayer X2 Mini Pro is a new Strix Halo handheld. It ships the same
> system board as the OneXPlayer APEX and uses the same registers as the
> OneXPlayer Fly devices. Add a quirk for it to the oxpec driver.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: oxpec: Add support for OneXPlayer X2 Mini Pro
      commit: 01c5087a0c419bee90372091333c214fc08e90e3

--
 i.

