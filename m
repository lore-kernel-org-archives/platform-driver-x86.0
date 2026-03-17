Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC23C73FF
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752495; cv=none; b=jQa1fV0lQdQ0ACpapGvjpj8LreiMtiFTc4Ruj2TmQHllfyNw7/2w0YiKxbRKZ1xmig9F8+vzSuu0tAiYUU6GbNDT5gT4iSu7aB3DAxFTqNNHyI+UNfM3oXUvzIpyflMA7qWx3E21m4fgTx/JDXr65nwOk7090JnxlCPIi3C0D70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752495; c=relaxed/simple;
	bh=Zr9c3guQ61jCfNxkYUJeDc0nIZfDW2qs/t1SfHcZJ+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DftRkOhlRVaciOuH1/bYz+CrayC/eX8tY893h48z53NoO8XnrnDdPcM4em8XoJdbxIkk/hbSe4bxcuEqikYmyVIRfV1+SFbB0TYT9dHn0rmXH2jWrmNU3oRKl8Oh0L1WUmU1CtJp0dz+FDKi8UuHD/w+tTa+koWrcRpvmARqSP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jk8rpnOj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jk8rpnOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752494; x=1805288494;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Zr9c3guQ61jCfNxkYUJeDc0nIZfDW2qs/t1SfHcZJ+o=;
  b=Jk8rpnOjCUP2fyKfRjINyuJ9fF6hq7bpe2jEzGMSOq8x/IoaPratF3m/
   BjctATcKorITtzP6ItL1ETUtP9fOumHj3ig+bOkJnTAp49uGibyTOpH7G
   vUH1FKV/PvozwaXKm09XHbM+GBw5VGrgbN/XCkwdDra0x9La5SEZvjTce
   LLWReBoqWdG6lacpGFYEIG7B7a/sKoxWMG2myENQsSzj9GuABl0PT5TA1
   HuAdguMgeoz+SEbHOPsyIAgOaYakcpyDm6hsFyzShu9luhgRoXb9FUMDT
   EyjzPRqJCVGTAsHvM245ConsLRwUuPxV15ZD+8daspst21Jc/oRNxqugJ
   A==;
X-CSE-ConnectionGUID: kNStPKbcTceCGuVxp4pIdA==
X-CSE-MsgGUID: KRdfYcW3R32njxzk+3dg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74815875"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74815875"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:34 -0700
X-CSE-ConnectionGUID: URkBxkvZRTGwLvpC5+5wAw==
X-CSE-MsgGUID: twaI9vVRTZO8n6gcum1tVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226951683"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:01:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, Alex Hung <alexhung@gmail.com>, 
 David McFarland <corngood@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20260205231629.1336348-1-corngood@gmail.com>
References: <20260205231629.1336348-1-corngood@gmail.com>
Subject: Re: [PATCH v3] platform/x86/intel: disable wakeup_mode during
 hibernation
Message-Id: <177375248210.9137.8974029776403723333.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:01:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 05 Feb 2026 19:16:24 -0400, David McFarland wrote:

> Add a freeze handler which clears wakeup_mode. This fixes aborted hibernation on
> Dell Precision 3880.
> 
>   Wakeup event detected during hibernation, rolling back
> 
> This system sends power button events during hibernation, even when triggered by
> software.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel: disable wakeup_mode during hibernation
      commit: 3dd92e37adc7052ba67926438012fe6f4a71ff37

--
 i.

