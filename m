Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458023;
	b=4zcpatZD/B/Sfbdo50/wdpGW1JF46gBk16G1s7IlS4npvo9hY14DqizpkntDuA2Woyei
	 3rqbLwmELcQwOETlU/7fS9772HOHGvB/jYmWknQo0oXXW4II0kUB7Aq+r6gmOxq3N4mYt
	 0KkoXSn4bF4V7AMeVz1TVIXLOHZIE9MpQcVbEAYbGer3C76vcObl9UaaCA4m5ppkW1bnf
	 PEveXzL9lxOD6u8wDYMGmEZP4NFkTAABgIbl2bhoCLOvLv1ye8AKmxOvaKRD+qSA/3Px5
	 Uttzg2YVhSudVE8NMCNyHNdc5aioBPdyIKfb3FHgw/10S3p0BZTcZs/RQOI+vyL0PgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458023;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=CF0IjgLYYO+6TVIKb86d1jMcV6KdE/vjQX3CmUX0R4g=;
	b=JKmPi0UttU1GOQXg9bbtA2hcp+uiWS3rDm9rsTO30rZLGfv7+c3ueu3ZUks9PLuDeG5U
	 bNPRC1hmGBNS7TOd4/74nnqfMl6QdXpg6jeqHVSZxEjO5nw8nr27+fDRxtT6iUftEZjOK
	 mHyA7+TO6E6n/s2alVvtmx+9A0BoL9KSxjh/ukyO6haEqOopCOTDZu0e8glIzOF+tbQfk
	 z4YMUN7C2Utjd+d1OpEa5j7aQf2PUqnLMIuAwSfbgVium6KsO0/iXZllebZP2wp+pxr9H
	 /PV/K5s6flHI1QiLnK7cB3CRYCalmkfTWPtdZyXn4M46EFKx/1JjttfGdF5VsmSKQSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rp3b05mu;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDA2606A31A;
	Mon, 23 Nov 2026 18:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDA2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rp3b05mu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458023; x=1826994023;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MaqplnJrVO6nvVMYTwimrE2I2rLmiHilhiVxtq+Tta0=;
  b=Rp3b05mu1LJ1+cDVvjgw0ROSw8MOSLNkgRRcTYbE01oqd/ghokHMLcEK
   IWRcHauzSJnO4KJ2UDqUi11QvPXf34nLBrSZwhCOtg7lg7VSG1hkUD1Km
   YBIQqbBWJYmFQlEeUJ2ZshMgU+Wjb0ZncPebu0Axh/riOoS5pL8HFuhAa
   +mGOHAY/RCmYSN/rNIHalE27KRo2j4Ce1kkbI+0w+XIPUNwHZTeQXYVMi
   77wJtPiVs8/a6iAVcirCT01Ykm3Np53XztIAz81Oa8194JAkyK6okcN7h
   wdF07qqL3yzgiQ6RdSS9S9GGL24k3cripM7ZwzxZv1d3uTxa6C4mAjlpI
   g==;
X-CSE-ConnectionGUID: 9/AsLH0mRreuN6JrKFQ3RQ==
X-CSE-MsgGUID: EbmZ44+EQ4C4On6DbDpf2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4165859"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4165859"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:23 -0800
X-CSE-ConnectionGUID: CxXIFeVFSXW/lI0JFwEEoA==
X-CSE-MsgGUID: uVmWXxasQYqUxcOYAHRH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11442768"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Vovan Nikolaevich <vov4ik533@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261003220653.123909-1-vov4ik533@gmail.com>
References: <20261003220653.123909-1-vov4ik533@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Add user-status LED support
Message-Id: <179545801001.12968.18383102153884196284.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:20:10 +0200
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

On Sun, 04 Oct 2026 01:06:53 +0300, Vovan Nikolaevich wrote:

> Some ASUS laptops expose a user-status LED through WMI DEVID 0x00040019.
> On the tested ExpertBook B5402 this is the orange user-status indicator
> used, among other things, as an "in a meeting" signal. DSTS reports
> presence and the current state, and DEVS 0/1 switches the LED off and on.
> The official ASUS userspace controls the same binary WMI capability and
> applies any Auto/Busy/Off policy in userspace; this driver exports only
> the physical LED.
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
[1/1] platform/x86: asus-wmi: Add user-status LED support
      commit: e08e78e812446c28b33c2633e93f082938e415f0

--
 i.

