Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F53B05AF
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 23:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514528; cv=none; b=krjhDVN0L3cRUchIj4XLjLU0Ste8OPjlXsmQ1GzBqscch+O3VLz2Ls271fC31T5n4dzRbnzTaAQk+YS5mHW2i9hZ2RJyCMNme0EsbVpUomy3uUSeDozQvYxQxb0VFg2uNmRSSZ9cW3HxKsp2/N1/eceFN0vhJIMG1oUXdwla38Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514528; c=relaxed/simple;
	bh=lo7P6EQCzFCLepPFpGZ9w4qTLT10vzqqYogT/9s685w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AadGfLkw5F9Q1VXxBbRdIJVgZ6I9tWZZiktqYrub0T07ubcmgvyGoW91x4YjDhr5j1OSVCNVtoSC338sJakBAauexSXhObxZXiS2QYlu12dMjoo6IL/P/+Z4ABR1briOQpg+4N8QNOMzXWzDtEqVwQ1ejML7OZ5JH4IQIkPytTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgb2dOz9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgb2dOz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789514527; x=1821050527;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=lo7P6EQCzFCLepPFpGZ9w4qTLT10vzqqYogT/9s685w=;
  b=mgb2dOz9uW5D84Q2JdRsZrGaISfoA7O8g/KMuMOT4ZkdGxcjUtDgd7fX
   5A+zLsJv3lRaPtXe1slLVRTvSJpCwh9wryrCO/w1a4p8P5PmAc27bAs4K
   iJASeShRT+SI1wewegzlQ03clO/9RQ3FmdtfDzAgCzBAexT81zfk3b/sd
   mPn7qT8aSW8kyAq5kGMZG/rlEpGPSdaRYjEdaCoAPbGOTF6OKFqwHEPHy
   DF3fpJ1goVeKgdRb35GlNl159Ha5Lzam9bbrt8tou1lOeUHMU8IN6r1GW
   IVK1h8KHco5t4OnhMdmAEo9UZ9oNG/qXk/nwz7wBknC1rnGty6nAfFbt1
   Q==;
X-CSE-ConnectionGUID: EIdUYpQeTl+rPrPP07uPHQ==
X-CSE-MsgGUID: 2Ul6cH/9T1qPLZAug1nFwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101042895"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101042895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:22:06 -0700
X-CSE-ConnectionGUID: uQsDbYf8QzKuAot63Y4jbg==
X-CSE-MsgGUID: 6JXzKmMzSAufZ+qbKyGEQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273124263"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:22:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Jelle van der Waa <jelle@vdwaa.nl>
Cc: platform-driver-x86@vger.kernel.org, 
 Frederik Harwath <frederik@harwath.name>
In-Reply-To: <20260913143521.1190506-1-jelle@vdwaa.nl>
References: <20260913143521.1190506-1-jelle@vdwaa.nl>
Subject: Re: [PATCH v8 0/1] platform/x86: add Acer battery control driver
Message-Id: <178951451906.41627.4343443082329834615.b4-ty@b4>
Date: Wed, 16 Sep 2026 02:21:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 13 Sep 2026 16:35:16 +0200, Jelle van der Waa wrote:

> This patch upstreams a part of the out of tree acer wmi battery
> specifically the battery charge control and battery temperature. [1]
> On my Acer Aspire A315-510P battery calibration did not work as expected
> so for now this is left out.
> 
> Jelle van der Waa (1):
>   platform/x86: add Acer battery control driver
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
[1/1] platform/x86: add Acer battery control driver
      commit: b36ee17b40037845eb2f29c151a65c698f273d4e

--
 i.

