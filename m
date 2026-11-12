Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489637;
	b=3oYEfbz6i/eT067LBxk2YVfFxxNdGU8R1kx2K5GxygWysZflrMN10ObAT1uja70hGlhb
	 KRcPa/z4+zICZwtNLSMExM8hyJz4coqyvhlvnuuH+BHaF4db3hWEp8hsJ7U8gClCMs7Lm
	 p/xcqQRUOMcWr6xDGOAIA/tVyn2YpJCi9RrpJ7lPIZpLIFNSBlSWEWaJHBwQo1z3siBWl
	 SvnMzB2vDgQnb35fJlTf5eiBF4eU5zlhrVRgMxwpU4Nr8wsCizZBKqq/dvZJKKUMWJKS1
	 pplv+a5FBytziR0HIR7NUz9Es5AQq7WGLbePBszwwhyrFVYVhR05OwcctLHiNLGXXgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489637;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=LnOpymN2PUdCIyhE6ulqm0hIqqcOech9XEGWpGFdj6E=;
	b=mKlrbQlMl3jBc+vgpGcG11ern4doo7cTo9woZrhH2uq8RbE4F6BqphKkYYzlnK7+rmHd
	 9EApOboJ+MgsWSrqUDdaEtpjSB9cxGRL769O4tytUWzhy1iUclJHWlevocCaSJi4qtg1Q
	 85vON6iD0ot+3kc+M+xKtuTFBTc51uks4Mj2HFBawxVqn5/XdFkksJ8qVncKf8mCK4JPZ
	 2mOV9ElP6xkzf0Avb/R+WQBzwsYN8ouKrPzk4Xroi2u1X56yyLbogpS/iJtu2/MbTkgDZ
	 tGtSphS4t9fzbr2atbkOW3kvyzvwJfFRz9oEYCAXRBz3BUb6iqL8kWGG0i661eZF14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JRABn9P6;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA2606A321;
	Thu, 12 Nov 2026 13:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JRABn9P6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794489637; x=1826025637;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nYVKwPbOwstvAbXjTDWTQXPqBvILoRTrFw2uCBDLCVw=;
  b=JRABn9P6oUfNE3OCLOskbQkMLYqbn1ZF9sMcgH0o016Ytao5A1KUY9ws
   PnHcyfW/gWM2q8Vzd2jLvXt/WumJRCx6Khky5j1NzGSmW+QaHQDcjPiv/
   fNm2o+bNawxHM8dlkgONk9QwqhKp5qCa1q5dxaDI2vQWYQx5Ir+d2xErr
   iXq1DT8lGXpqn7arZYbV7aNAOuIeeMiZ4ygqAXz9E53c/gbJfAJ63qc9R
   SRoaTGsDBmu0ovUI3eG3Wh39Nsog+Nk59yKdP4LCXJe3wh5kmchUe/yCE
   YcJRcE8e++ZfyDVjdYWzyQsQx4Tp4kDQuxu5Labj93iodtwudFdcyQdGa
   w==;
X-CSE-ConnectionGUID: +1YsCg+oQA6BT+k298F2Qg==
X-CSE-MsgGUID: ZIiQaiNqQPWcjlnblaI1RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3309399"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3309399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:36 -0800
X-CSE-ConnectionGUID: WTpQNAkoQpucidJ9jm8/zQ==
X-CSE-MsgGUID: 5GUHGt1LQV2CoRgOLKJLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8836709"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Chris Taraszka <chris@miget.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mingyou Chen <qby140326@gmail.com>, 
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, 
 KentoNion <kento@kekto.ru>, 
 Matias Civadda <matias.civadda2342001@gmail.com>, 
 Yun Wang <7z0423arsenova@proton.me>, 
 Oleg Rybalov <rybalov.oleg.dev@gmail.com>
In-Reply-To: <20261111170406.1634428-1-chris@miget.com>
References: <20261111170406.1634428-1-chris@miget.com>
Subject: Re: [PATCH v5 0/4] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro
 14 support
Message-Id: <179448962780.10339.12608011238537484987.b4-ty@b4>
Date: Thu, 12 Nov 2026 15:20:27 +0200
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

On Wed, 11 Nov 2026 18:04:02 +0100, Chris Taraszka wrote:

> Four patches on top of Mingyou Chen's v16 "Merge redmi-wmi into
> bitland-mifs-wmi" [1] for the Xiaomi Book Pro 14 (TM2424).
> 
> The firmware passes SystemPerMode to Intel DTT, and the DTT tables in
> its data vault name each mode and set its PL1 per power source.
> Low-power, balanced and performance map to 0x02, 0x09 and 0x04. On
> battery the firmware's performance mode is 0x03, so patch 2 lets a
> profile use a separate value on battery, re-applied when the power
> source changes, and patch 3 adds the quirk. Patch 1 keeps a failed
> profile read from aborting system suspend, and patch 4 makes Fn+K
> cycle the platform profile.
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
[1/4] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
      commit: c21efd01ba43e5c6ac1ce806a030beb6f2f70770
[2/4] platform/x86: bitland-mifs-wmi: Support a separate profile value on battery
      commit: a109ff72a4f322c17681cbe3ce9a9d614cbbd299
[3/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
      commit: b72407e25e82185aeeab6cd422cd83c242a68607
[4/4] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
      commit: d58bdc2080cee7b9e189374c9d366fc674273bba

--
 i.

