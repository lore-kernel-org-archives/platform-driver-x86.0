Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5B51DB14;
	Fri, 18 Sep 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756036; cv=none; b=k3v7lG9wq+oogymVQ56gw+hyG/dWPx5YnYyQYLy/MSwKxA9+69Z/nJrqOtHgjNQJwZlLvQ3mfhLzp7/I7KoMnqxJA6UHbJ7RhCKw6+W0pe39JE5X+i4X2E9FTYVvNsbH73c4zmAVtTMT3IxXlsrRNQPJRh2cxVoeU9wMB91mpGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756036; c=relaxed/simple;
	bh=isa4/aanmESCUJ9/BwfBY2bbaB78VAV8h8iWLe1alaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eOzRrV0u9TVrtM5YdcZk7mCOaoeOTgYpSChPnF0UKMhDr1fKHZ/VQh+SkAgJDb9ESGIC2fwF3UVEYQYbpJsH3NL6UIRGmLr1Y1ynGpsE7teO+S6q1P/Nv3UildNuRV966eL5rWcqP5ZoMUd3JAvrnfyn2wGKy0OZh3D0Ub918ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNbHIXH0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNbHIXH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756035; x=1821292035;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=isa4/aanmESCUJ9/BwfBY2bbaB78VAV8h8iWLe1alaY=;
  b=WNbHIXH0gsixszd/oizobsLlhxTnhps2p/sIEey2lf+EtV4pDigaOS9B
   MWut3OqDcqDEiJXOOF9T5vXgVi4O26adcyP9uI+UaYQklRhju5jPeShgy
   sQpdXZmHzVXLadH1naPGpcOdendgYwtEZ2zxcevVzAQUDgKfGaQpD+HZV
   69tveDlSl2hgBe3mcqYGvmgjUM43jhY/uIJ3SNhjWbhcH6X8JRTa1bThD
   3hwhwOMxpEheUdEOF8LLb/ocEVFRiYO5OtS+nCWuTZlvngoMWqofxsAjt
   4PMXota8Vt2CJDJ8Ofi3Q36TpwPW7CIFirVfr9O3sgPDouXkjEhFGwJnu
   w==;
X-CSE-ConnectionGUID: ADluup6uQV2+tlmTvWht/A==
X-CSE-MsgGUID: fFdBQuOYRtmVu7IBcQS9vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100881159"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100881159"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:14 -0700
X-CSE-ConnectionGUID: vVeRMT6uRDSkL89BU7Izhg==
X-CSE-MsgGUID: jxA2izzsStO+nW+T8aDahw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="276499528"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org, 
 patryk.dankow@protonmail.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
 hansg@kernel.org, perex@perex.cz, tiwai@suse.com, zhangheng@kylinos.cn, 
 dnaim@cachyos.org, damien.dagorn29@gmail.com, kailang@realtek.com, 
 habilerenturker@hotmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260915174110.67871-1-patryk.dankow@protonmail.com>
References: <20260915174110.67871-1-patryk.dankow@protonmail.com>
Subject: Re: [PATCH 0/2] Add ASUS ExpertBook mute LED support
Message-Id: <178975602496.29716.5435505954300657044.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:27:04 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 15 Sep 2026 17:41:20 +0000, patryk.dankow@protonmail.com wrote:

> This series adds speaker mute LED support for the ASUS ExpertBook
> PM3406CKA.
> 
> The first patch adds the ASUS WMI mute LED endpoint and registers it as
> the platform::mute LED using the audio-mute trigger.
> 
> The second patch enables vmaster mute LED handling for the PM3406CKA in
> the Realtek HDA codec driver. The existing CS35L41 I2C fixup is retained
> by chaining the new fixup to it.
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
[1/2] platform/x86: asus-wmi: Add mute LED support
      commit: d95982b2ea3453998466efe1e7e06fee7392e800
[2/2] ALSA: hda/realtek: Add mute LED support for ASUS PM3406CKA
      (no commit info)

--
 i.

