Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E73E6DFF;
	Thu, 28 May 2026 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970272; cv=none; b=Ia/WFaw7eHr0ZOjYgGuq2dZ6G9+WK9w9F5jMBXOzSF1mXHhSrEjw0SAotxrtvli1vnwv6c1cv1UQAkwZTedeGjBlV26qrdPEIHy6P6sa5W5DRrbicN6BzwTax2iAoObYXh3oKUxMWfv0YP06JWFov8MRlVIewSrd0Q24AxvIZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970272; c=relaxed/simple;
	bh=UBRiEPk5YtaZNE/nOnRnc1Q6HAOgOV7e8jw7+HzBif0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ILlILabOGkuExkV0+6cfSkKl2WbCrx4Rp9xJnaMg3kDaGab1FSNhpyLPtgl1n47aw5CAlWn4FUlXtFICoNhXOGo+E1c1dqDpqttw3YYNBGlJIZG5ID0kk7hWeC0MsW5kyHXF+uFfGQxmTU4UFEZtjXjellsClbDR7FNMo4e067w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6Z/Qwms; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6Z/Qwms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779970269; x=1811506269;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=UBRiEPk5YtaZNE/nOnRnc1Q6HAOgOV7e8jw7+HzBif0=;
  b=E6Z/Qwms0bIMerHSZT5ApiIhu2UGp6gp/R2Z9JJ7CPc0xCofORsNKFxh
   isHe/3HQJmN/ISoFXGZo75a1e/K0RjLqJUS+R86Uc3x1cOVxc11pGEQ3l
   vzbpk0P6x/ZiNI/NueTW2i/spR6te74mKOhNPuT4HYuNJcgmJlLgfOWZu
   IM978P8qVyB5DA1uesP5RPdnk15otSnWBT/y0RqgYbvVSOgrjlvkVtweN
   G/yVBeJXQan5M00iixA1B9MxwWxJgklQXjdzOrEnST5e3EN4mNATbDffa
   PoBCh3FLutAQ4REGQ7LJ6bmwid4B/3DLvY7rE67KX0rYpK/u3wfc/Y3yh
   w==;
X-CSE-ConnectionGUID: y1WOgWoXTGy7IrizCAsAnw==
X-CSE-MsgGUID: 23+J+mv8QDqhhqRxgtnWRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80925199"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80925199"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:08 -0700
X-CSE-ConnectionGUID: Aly7zLChR2+zzi5fxh4xdQ==
X-CSE-MsgGUID: OTyW3XOMQYOHx+/VNTXjKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239522159"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>, 
 Kurt Borja <kuurtb@gmail.com>, 
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260520060740.119554-1-derekjohn.clark@gmail.com>
References: <20260520060740.119554-1-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v14 0/7] lenovo-wmi: Add fixes and enhancement
Message-Id: <177997025953.9687.16610213909629217272.b4-ty@linux.intel.com>
Date: Thu, 28 May 2026 15:10:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 20 May 2026 06:07:33 +0000, Derek J. Clark wrote:

> This series adds many much needed features to the lenovo-wmi* drivers.
> This version is based off platform-driver-x86/review-ilpo-fixes branch,
> so patches 1-9 from v12 have been dropped.
> 
> Patch 1 adds the remaining CPU attributes that weren't previously
> exposed.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/7] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
      commit: a2a893d5757a0d43c0a2ed351eb1e34ab718f2fe
[2/7] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
      commit: b51fa3b00e0339bebeac7d0c1beb13f494f6fe41
[3/7] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
      commit: 891d43749445fed6725acf9ee1c37e052dba8288
[4/7] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
      commit: 9ca8fc065b88b327acbfdc33454efea391639716
[5/7] platform/x86: lenovo-wmi-other: Add force_load_psy_ext module parameter
      commit: fb8e9629efbab67135f801f5ec5e91307e7693c2
[6/7] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
      commit: 229e575451e4e65db47bb1873be0ccab764d9f3d
[7/7] platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
      commit: 18a166d29aa12d361907a3aa724c8892d834592b

--
 i.

