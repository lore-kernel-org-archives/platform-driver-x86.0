Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57F119F40B;
	Mon, 24 Nov 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991656; cv=none; b=kMLZSfpPokpOBu38UWeoDKdKBP4jN0g9l4vIx3Qm7EVriPs8WuDx95XPBLvZuwjFYqFJfK9M8PM+Kkco5I86GE6jtMoL7hJs71K7fnUCh1dpl+p6cjXF++syaqpYqGUvk0bo5mchNS8P/qa95rCPDj/PvnOdFOHX0QbX/w3Y0X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991656; c=relaxed/simple;
	bh=Ixut4vUhBM0gyokpJPZVHvreDnPje1HYFJj9lewZhEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZPtRL36TsubwUTewGuY+cikKp9b8D1UbV3z5rdpUcQQLByJW06s7kCSFyLxiFULnlh34PgjPVmZ2XUmQo42/OSXBjrYisDs/QPCGUMZdUGUW/oaEVn5NNfjqDypimu+96UFEWqrHyeiz3+O+BqjnAoaqidHFzB5rJi+B+eoGVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaEMX8St; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaEMX8St"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763991655; x=1795527655;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Ixut4vUhBM0gyokpJPZVHvreDnPje1HYFJj9lewZhEk=;
  b=YaEMX8StcnKWK5HgZLWY+rOhCGIISKEq8Hp1MW/YG9HWUqY82LcmXBZv
   gAAntFOe4KexTj+u8eRqfbXUui999n9t9ZOSf0qMltHiDb0TAkURY7G/D
   TviSMvEYctEDNDD618Tv8LOda4j14b8ncwA27F3lQ1cQtrNhcn3E/2II7
   E19kQDjrCs83rzdh+wlSu3wBNkKu8Nf/4hQnbnSxVOi9LNm3wWtLfo5n4
   oyi+QGPxOWwGzfp6m015xAyPWOw+oXjUIHscBOXE1zusBj+JF5OTX7F9W
   V9cqRuDZPuUprvb9RBATn5KLnYP0Vkm3RAeHRtm8Q5V4yx/nCb69j1Qtb
   g==;
X-CSE-ConnectionGUID: 4CfmcwZYS6a67KGJBSh1iQ==
X-CSE-MsgGUID: EKW7eIEXRqWgZIAlFJfBrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68580993"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="68580993"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:40:54 -0800
X-CSE-ConnectionGUID: hHhirfEnTf6XKIs9cafiaQ==
X-CSE-MsgGUID: g8bN9ZFtSE26rF8xQiqnNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191616339"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 05:40:52 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
References: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
Subject: Re: [PATCH v2 0/4] platform: arm64: thinkpad-t14s-ec: fixes and
 suspend support
Message-Id: <176399164702.1782.15212430992064438775.b4-ty@linux.intel.com>
Date: Mon, 24 Nov 2025 15:40:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 19 Nov 2025 01:41:39 +0100, Sebastian Reichel wrote:

> I have a two fixes for the T14s Gen6 Snapdragon EC driver as well as
> improved system suspend support. I've been using my Thinkpad with these
> patches for a few weeks as daily driver doing regular system suspend and
> things seem to run well.
> 
> If there is enough time after review the fixes are probably good
> material for the 6.18 release cycle.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform: arm64: thinkpad-t14s-ec: fix IRQ race condition
      commit: 29be646f75c4406bdd8322572a6054ebd22bf63b
[2/4] platform: arm64: thinkpad-t14s-ec: sleep after EC access
      commit: 752630cb8c62abca0407f96cc7baa2e13335cd15
[3/4] platform: arm64: thinkpad-t14s-ec: add system PM hooks
      (no commit info)
[4/4] platform: arm64: thinkpad-t14s-ec: add suspend handler for keyboard backlight
      (no commit info)

--
 i.

