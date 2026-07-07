Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B122C436BCA;
	Tue,  7 Jul 2026 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783445168; cv=none; b=IDyTj+OuBAK4saiaMlyB9jjeKp5DR2ndIXqBZ2o+Y2z2ATrv+pnkbXVzFD4rcsexsiGJh2XW3C2fHDCp2uLZZI6MH/gNhLgTPpsIjW0OWPIiR+DHfFYWjGxMK3VZOEUrXvWZR5fLmLmWFuCTgmAibd3ZF2dPbRNbcnMIChbhZiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783445168; c=relaxed/simple;
	bh=gocXnWO1ONbVowGu7A35DpkwICMX0I4XvaaVc10Vjrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dMSvFmt1SLKQS0dhD87Ev4+Hn0WW66PcD2hU89s+KH/zqC7D8v2lGCRiS/dybgld1H6MELms1RP7xKRf8axqO66Ob502UZrCWOicZEP5cXJUBzYlPOLz+U7NJx6CtaMt1GAfBdkWSGIyH0cBK8BG+YdmYrU1zYiY0gaEIi6fBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxiRJ7+4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxiRJ7+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783445167; x=1814981167;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gocXnWO1ONbVowGu7A35DpkwICMX0I4XvaaVc10Vjrw=;
  b=XxiRJ7+4M4dKMgCvmXwZTK9wOXLu5+g6/QTxAVBGzOp6jbsk9QYAg21D
   Tbki/k7tlQ2VlfGuD/WcBWmC5hbXbTJCvuduPHK/uLwkWmT0DlKSu0N15
   fMAFYYvHwHV+a8LxYho3UfwJlGklNznaA/0soJhFnBzChONDqo3lxTHzd
   bg7j6Fdl6NZXXOmjhV/s6c6AdarvIkwIC+PYAcxe1VGdrLo7nmb25mQdO
   bFZ6sHq75W5V0R4Aj8PZp+Kh+KaAUNKyYskziqEH3QYjf9tf03Yw8r50f
   rKGWeDwwcWij1ZIFky5PCjRhi4pIMl3wBGPpxhZMDmWtEdlZd3alKmJs9
   g==;
X-CSE-ConnectionGUID: TM4ddk0fTWuK5fnqi9dbTg==
X-CSE-MsgGUID: +fWnixOZR3+ZZE6tsyikpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84126434"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84126434"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:26:06 -0700
X-CSE-ConnectionGUID: mTY1YKkWTuCtwxXMcVJb7g==
X-CSE-MsgGUID: VUoMvRxRT52SnyGI7vHHWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250695468"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:26:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: corentin.chary@gmail.com, denis.benato@linux.dev, hansg@kernel.org, 
 linux-kernel@vger.kernel.org, luke@ljones.dev, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260630142957.7751-1-scardracs@disroot.org>
References: <20260630142957.7751-1-scardracs@disroot.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: update power limits for
 G614PR
Message-Id: <178344515812.23800.10882177413290846633.b4-ty@b4>
Date: Tue, 07 Jul 2026 20:25:58 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 30 Jun 2026 16:26:35 +0200, Marco Scardovi wrote:

> The previously integrated power limits for the ASUS ROG Strix G16 G614PR
> laptop model were incorrect and too low compared to the windows counterparts.
> 
> Update the power limits to the correct specifications based on the
> platform's hardware capabilities:
> - Increase AC PL1/SPL max limit from 90W to 120W.
> - Increase AC PL2/SPPT default/max from 110W/125W to 140W/145W.
> - Increase AC PL3/FPPT default/max from 110W/125W to 140W/145W.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: update power limits for G614PR
      commit: cdadb298b182d4615521380a520eb2c7cb762843

--
 i.

