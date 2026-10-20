Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533116;
	b=dFYfTGWc/V/4E0yIweYZP3cJhMMzKL4WA+rqA2V7NgMJrq2qmoX9OztGY2ELGvaq1K+Q
	 KlbAW7yt45ghd1Y5mSHiaHzi5ZR0JaaE0BVJFTJVeuebJzc/APd9jEQMofQWtK9jAzdwI
	 4Lq4YT8LnfXfFHYDX3t0ahp2ECdKNVWAyHJl92FnOXy0ATs4j2ZsmSaI3Lq6x9e4t+EUB
	 naM3HzBaQU12Ja79N9VCkVqevSpy7bwM8KFSZgTgU9CNmlcxj2WhfMxL4ln7s8Ft1kxoB
	 euv9PYCF/OH8XQDDExAOBs9ckkNENhFY6+L5+jA2tu7Hg/aADew1+ILxOzrPbKSBFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533116;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=qglwk6dFkSNdg/k8Dpe9sH14Nb2PFTakf2R0xb51/0k=;
	b=vyWtJZbhD59wqNjYVlfRwKQsaWeCtej5sCIlljLEFDTxCayuF4RWdv60gE5eCAufGT0n
	 3M/2nQZt8d1jd+H/Co5Ayl6Q9m8wpY6giJxW8cgkB89XAsSaGV1jWMnRrjQH4qqMmlzpP
	 qIGKb15ne47FKbmb2vdKe97C3dKPV4UnM2DmN+y2NB1m/sLBRHsdwwcJlnzIzJwEwhHPc
	 iiFaCC7RkVIYftdT0pg5xWQjWlBHTXM685M93X/5V+WXIO0A1r+u8acDfS/FgQIVU79kd
	 n9wNwA+n7rr8FL52sxDV5BcH1jT40MiF+BcQbNs/3FQ6ew3ll9VWLGmSObqrGiakhvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MjpidJv8;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A2606A31D;
	Tue, 20 Oct 2026 21:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 798A2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MjpidJv8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792533116; x=1824069116;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=XrnZfmWLLcNW0qyvpbZB+8VCU5W7i3RaXQo0eXEVf08=;
  b=MjpidJv8p6eCZL7CFU+amvv5k6Ev8q2PujRQmwmgOLYJnZI17lpwBwAj
   ZLUKhtGNsdFLSgqtYaF3Twdm7XbFNQsk57ff0tK9K3rZq7VQHV8Sr/s6n
   2kkmRLLe3U2kkWhyPQVWX3+bc8L+6NxFv4x5lHTTmUES8eJ/RXbkgOu4q
   aFGupTd81g/wy5gKKrfpSLpyUNsfSMMMtzsOHiWc6BcBA26fvpbcALinK
   LdR835P4SSnsU+lTb5SXd02XrT9/HfdRR53fZGoy9XJxLJJ+8X0/03PHQ
   SnWdhXL5XM9tte4XLA1uOSp//XjXyFY8nFnPzTmsOn/XnmsS4+Il+8Vtm
   Q==;
X-CSE-ConnectionGUID: KFCq09lMRWqVJnbtSjGD5A==
X-CSE-MsgGUID: WluAuzXIQQCmxkW8EsCTgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1126505"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1126505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:51:56 -0700
X-CSE-ConnectionGUID: gqWZ296mQJiAd8CInNXuqg==
X-CSE-MsgGUID: lGBjL1h8RaavRtaTpRMRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3262237"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:51:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Myeonghun Pak <mhun512@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <179229442299.3956787.17526066623947466315.gpd-pocket-fan@gmail.com>
References: <179229442299.3956787.17526066623947466315.gpd-pocket-fan@gmail.com>
Subject: Re: [PATCH] platform/x86: gpd pocket fan: Cancel work before
 releasing GPIOs
Message-Id: <179253310946.28707.6723283736516893991.b4-ty@b4>
Date: Wed, 21 Oct 2026 00:51:49 +0300
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

On Sat, 17 Oct 2026 23:33:53 -0400, Myeonghun Pak wrote:

> The fan worker changes the direction of both GPIOs and schedules its
> next run. Its managed cancellation action is registered before the GPIOs
> are acquired, so devres releases the GPIOs before cancelling the work. A
> running worker can therefore change a GPIO after the driver has released
> it.
> 
> Register the work cancellation action after both GPIO acquisitions. This
> makes devres cancel and drain the worker before releasing either GPIO.
> No work has been queued yet if GPIO acquisition or action registration
> fails.
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
[1/1] platform/x86: gpd pocket fan: Cancel work before releasing GPIOs
      commit: 9962770049c715fc30a7b3274d8f245167c0a410

--
 i.

