Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D008B5226B5;
	Fri, 18 Sep 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756090; cv=none; b=CeaPx2Gm7e3PjT6nqyVA0+5SRXoLdK8R4/Qa43q85xwa4xmVOvVnbap7cj2w3rof2ivLvbVUQSGCKcVgn99kKH+at/MFgs0h7YecCjW5WiKIvnxAB2vCKzb615pFEpqDFvmGVXAsxO3ikcdsRdEj05lQvYwunArZTD1m7/6GXpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756090; c=relaxed/simple;
	bh=4lojWxo8rC9vVCTqGk7xvzH14JSENg0ZHxmFnmuVneo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q4Zcwjt9UrChAQMWgDoduNU964JTaZvoxoyf2Tut+bkk1Zo3qZs0KcGnkH8AYBD5g0rrWoyoOp6vapbaRAXdsmJZInWt8HJYfzyj3CtXURUu1aO2dORo/HxHDXhsGx6ikNzc4K3RJbZhVs8z910RL4AXUEsJeOcQZ7u2wcabT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKwr5g1w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKwr5g1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756088; x=1821292088;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4lojWxo8rC9vVCTqGk7xvzH14JSENg0ZHxmFnmuVneo=;
  b=mKwr5g1wXN9ul3jVvEosFsN8MUp3GuGL5i8Pns2yi8MnrDQ90Cb60Ppk
   lEs2ZBfBKorQXlrnF+9lXxK27L6arqxqhEWLQRThf/PwLbjF0ISKXitlW
   MSSmWwmFSdQbYZHd1a900Z6f9m1UDB0XhfktS2kBwh4/ViF/QWrGDmrN5
   vGvQesjkos0n2Gf8oiOoqxDF40PuHYEUErGReM5MVMoMXef+zS5xe2Oz8
   t6mX1IGyJxGmlkb0sbiJ8hL0G+YFvvHwMwaKCFDgpJfWVBHiJ2smhXRmQ
   dxyAFGSmOFAntrX3q7oSt8n7ctdwcq0++JodAN2qwj7P/YrBjgLa6XUs7
   A==;
X-CSE-ConnectionGUID: inPI4vx6RV+V6mte5EBvZw==
X-CSE-MsgGUID: qnz59nzWRvG+JsFRMPgWEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100947891"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100947891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:28:05 -0700
X-CSE-ConnectionGUID: 7oltIlv7RqacV42NsOx/Ug==
X-CSE-MsgGUID: XF6hHf4LS7uY3t6rL1QPaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271862667"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:28:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Dale Whinham <daleyo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
References: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
Subject: Re: [PATCH v2 0/3] SSAM registry fixes for Surface Pro 11
Message-Id: <178975607267.29716.17374385294631713506.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:27:52 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 18 Sep 2026 18:49:28 +0100, Dale Whinham wrote:

> This series brings a handful of important fixes to the Surface
> System Aggregator Module client device registry for the Surface Pro 11
> (Qualcomm X1):
> 
>  - An unneeded driver was removed, silencing a dmesg error.
>  - Tablet mode detection fixed by replacing KIP with POS driver.
>  - Performance profile and fan support added.
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
[1/3] platform/surface: aggregator_registry: Remove sensors device for Surface Pro 11
      commit: 4ade3ea4320003c209d36e6a1e0002762b0ffdb4
[2/3] platform/surface: aggregator_registry: Fix tablet-mode detection on Surface Pro 11
      commit: b318a0b79a8a865200738e9d9d09beaed459a93c
[3/3] platform/surface: aggregator_registry: Add performance profile and fan support for Surface Pro 11
      commit: f475845eaf3d749114a63270bf2efea459e14dd2

--
 i.

