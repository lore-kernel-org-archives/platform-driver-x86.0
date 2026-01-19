Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997F1EA7CB;
	Mon, 19 Jan 2026 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816836; cv=none; b=ehmhqqnXYQq65Ki5VvokZVgs+Q7duSkoL6jhPdse/uyc7E4pTsEwfidhQExDtK+MOJa7eTKOtoxu7pyKya9/V1C+cWcbyDujQhO0P98G7KC0F/tm9/NJTn3V4Si96Hfp6X1n79B80hAZj2ZJUn5aUKNFxgFyuYzhxTR3ck5CH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816836; c=relaxed/simple;
	bh=0+xpVOwZIo8JAB1LwLB4E0efHzT+Hvfj3ERtCN55cx0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YiLgkN4TwWG7Y1OM/MscRwsT+2NEQT4Xwex1JouyuIJpGIH8eEIJLueqYrtgsoEpbDtkXnk3qWbxI6WTwPfYdZNVNh5gJg3kzRpAtBz8/hwluaq2Fq1cu/gUbeMfhpKiVmpyR/Zj3K8+b+pXvUXYFv+q0Aebb1QnETlaBc/mfYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnOz8ti5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnOz8ti5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816836; x=1800352836;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0+xpVOwZIo8JAB1LwLB4E0efHzT+Hvfj3ERtCN55cx0=;
  b=QnOz8ti50D9K3MjH9RTqhYwkTepXnryqreAl82rtz+9/UPnwKq1mWDfl
   nlWbxm8jG4Rx6h3FrB66Umtdipdl6eIdslU/9D8aXZNB/MFzT/Y9XOgV/
   u/7yq5ivGM0DbMNkFjYnWRhAYu7t1ldics7S13vOUsWr7yiX+aKEXMXxE
   AcFJQLwXerKplyu4vxMO2mRAnLR+5cp4MN+6nLfwPXIrTj4qkvILxKkam
   2fUPLDSQ4Mml3l27d/6Uj1pq9DzB3mXH6llxpXuIrfIApBue85w6SD3Sd
   wvnX+0aG2BdQQ3u0Uss6Fhyts1b5VS1UwmkizFS5vSm55fKH7IQdQa2T9
   g==;
X-CSE-ConnectionGUID: y1XIO+GvTVWbLj45zPo5/w==
X-CSE-MsgGUID: +6sghra0Q/SUBhrJwBI7rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69921110"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69921110"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:00:35 -0800
X-CSE-ConnectionGUID: QlkPtDMlRqGOPyvgBNPjiw==
X-CSE-MsgGUID: IqT0ZoEyRRSvxRSNOva59A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206259490"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.93])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:00:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Jan 2026 12:00:29 +0200 (EET)
To: Alexey Zagorodnikov <xglooom@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] platform/x86/amd/pmf: Introduce option to disable
 Smart PC function in PMF
In-Reply-To: <20260117200819.12383-1-xglooom@gmail.com>
Message-ID: <d0533a23-250c-355f-da06-40262a120675@linux.intel.com>
References: <20260117200819.12383-1-xglooom@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 Jan 2026, Alexey Zagorodnikov wrote:

No need to repeat "in PMF" in the shortlog (in the Subject) because you 
already have the pmf prefix).

> This patch introduces an option to disable Smart PC function in amd_pmf driver.

This description should be mostly in the patch itself (with some changes, 
I'll explain here).

Also, please avoid phrases that start with "This patch", "This change" 
etc. but use imperative tone.

> Sometimes, the vendor firmware may contain bugs or other unwanted 
> behaviours in the power management domain. 

If there are any symptoms how an user could identify this feature is the 
culprit, please quote/mention them in the changelog so it can be more 
easily found by searches.

> This option allows the user to manually disable Smart PC power 

Don't use vague phrases like this but explicitly tell what "This option" 
option is (according to the patch, you're adding "a module parameter").

> management and fall back to another strategy.

--
 i.

> Alexey Zagorodnikov (1):
>   platform/x86/amd/pmf: Introduce option to disable Smart PC function in
>     PMF
> 
>  drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> 
