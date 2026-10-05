Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B630675F;
	Mon,  5 Oct 2026 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222320; cv=none; b=Vg4SvCmdFvGXm8nlOiA4bsU3oqm/0i5+ISor5o4eTSDXrh5NZsECuaRAS0j1RkdM8awP8CbA9u+kIe5aAy/aUFJlEgiVkZbT0JafQs+rbHl9GMBIMGONlsUb2I6AI/t1xP3gSG5lb0f4IilmQMq6xxPojQvJpkLg8emaTtme3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222320; c=relaxed/simple;
	bh=TEI8sttHrvL+jB5QnjCfbxRGTQnn9nnGwT8+I9SnuKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TzAEtM8rpGWl58RF0YUnOSNdS+bLCGlZgf4PL7zGU3XHbB/PFM15nZFhkKKXm+I5DsCe8UNP9/Mkdtx3clhIr+dWIvIibnnaFkrrCw4Zy1vLhROAT/YOjv8oI3NSlacM2sHjwij6fM0kaiTgV4KxD+6jecjDmKyIJKfo1cw4IfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BB17SV8f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BB17SV8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791222319; x=1822758319;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=TEI8sttHrvL+jB5QnjCfbxRGTQnn9nnGwT8+I9SnuKU=;
  b=BB17SV8fQbhRlMrf2x9tFGD2HRBido1rIKkGyxiSOkbKXtcyn1FvaWcm
   53P9wSu3gpO0qpWxuB3vmGlKhWB3idTVjxqhmuoOMKzoe6oC5Hzk5/leq
   n8tHu+xoAXfKKDjwnwYoYu0sL6nsAUMntAwjG/HsJVdPcyB/mb5RiLCuN
   z/BC/sRuFVhiahmdLxnv30CmtkNd8f/PeqUHYRqNYTyhjro1+gtILHXzc
   mPu18suThxnaQD63CdcLL6p/MSWCXIByzlKtwIgyN3yjMJgNztSdW+0XM
   ENr9OuY1+AC0h1vsGTxA7Q4QOlNeiyzcjDiaFrapb1yny/35Zq2LOj0E9
   Q==;
X-CSE-ConnectionGUID: Mhl9DOF0T+Wzj+/R/kVX3w==
X-CSE-MsgGUID: BYWDepkUSR+2Xmx1Ru5b+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="92009855"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="92009855"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:45:18 -0700
X-CSE-ConnectionGUID: jvaoLy4sSLiFJMehmM1fTg==
X-CSE-MsgGUID: 4Q2mGfp6SravQTgQ5GMCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="281663906"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:45:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: corentin.chary@gmail.com, denis.benato@linux.dev, hansg@kernel.org, 
 linux-kernel@vger.kernel.org, luke@ljones.dev, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <cover.1789794282.git.scardracs@disroot.org>
References: <cover.1789794282.git.scardracs@disroot.org>
Subject: Re: [PATCH v2 0/1] platform/x86: asus-armoury: add power limits
 quirk for G614FM
Message-Id: <179122231233.27048.16458740997687691165.b4-ty@b4>
Date: Mon, 05 Oct 2026 20:45:12 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 19 Sep 2026 07:16:16 +0200, Marco Scardovi wrote:

> thanks for the review.
> 
> While working on some other models it gets tangled with the EXACT_MATCH
> in this one too and did not notice. Some models contains both the "base"
> version (like G614FM) and a minor upgraded version (like G614FM2 or
> G614FM4: it's not that the case but we'll use it as reference): these
> models have, sometimes, different Wattages on CPU/GPU so we can't use
> the DMI_MATCH for these, as the 2/4 models would end up inside the
> base model incorrectly.
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
[1/1] platform/x86: asus-armoury: add power limits quirk for G614FM
      commit: a589240afaecde24a01c07cfe5415f9ab97dd7ea

--
 i.

