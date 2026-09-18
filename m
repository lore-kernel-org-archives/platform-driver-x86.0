Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75051DB0F;
	Fri, 18 Sep 2026 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755888; cv=none; b=h4rAu93G/ujcRRVKkg3X0p+Wx5Ds1CnG0kgG6sl+f7RH8aIw8IZZbj/uZYU2TqmSXS/bt8hAxZAFYO7TT99i5roAfu4tXQIgwRHWXqdpQLZR3bGFr8X6NpscMKthFTSVXTsiTQlTnvJ6nIEYeEc3Sd9ZwNYhGQrpgTsBuvaHsZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755888; c=relaxed/simple;
	bh=sE39a5EM1FLBaUkEz2cN8GgUlbjN3t/AGsmf2zRl+qQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KjWwDlGM68mG/3DGRkEGQaBBfCrpfb9jfCKKvMJBQekWqqFd6A0gyTqehIJQgHn/zkohzoMK73B4HDqc2qQ7YEARf2WZLzDcSbFpAutxMS2+MzaleHGDqNsVSmOAKW7WIqxWYMLe5piEeYtAmInuSdmgB3YsHZTer54Wv9K5PCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSit5WLP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSit5WLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755887; x=1821291887;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=sE39a5EM1FLBaUkEz2cN8GgUlbjN3t/AGsmf2zRl+qQ=;
  b=eSit5WLPdZ9lydAkY2ebCWLI347GelT9wd9pULFduA7vNIlnH4dk1poS
   Cko+SQWHWh490PAy9+vqU19xTuU2GzFZh778Y7bi/2leF1O13YoEgcq9h
   F57N9SnGNUSF79xo1RsLDs2Yv/eMoodKGD7EYV+DDLIKDzo5KFRpCqsHq
   tsSbF73+auzu8cmQotHfB7xrvInvRxuk38JeCI8gIFx0EvtqzhMkRbEAe
   ir3I98/BMm13n63GHU5GmEFZp31bjHX7Hw2FI9mnLxhv9rNemJdHS7Uyu
   F6LOLBNOZK4nlOxbmzCN+77QErNh9xDmrf946gj9k718lfQ8gFjOrJWGf
   w==;
X-CSE-ConnectionGUID: FMHOhE/pQwCkQV9x+b+Qkw==
X-CSE-MsgGUID: 8s6/6q+cRkqSCnPeligPfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107785002"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="107785002"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:46 -0700
X-CSE-ConnectionGUID: 5ryDDf1VTRaZhUMZgBz80Q==
X-CSE-MsgGUID: 7k+bpv0gQACtwOYl09/OwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2726897"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:24:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Suryansh Singh <technosfan14@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260823080946.103082-1-technosfan14@gmail.com>
References: <20260823080946.103082-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D42 thermal
 profile support
Message-Id: <178975587554.29716.8842442817222091749.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:24:35 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 23 Aug 2026 13:39:46 +0530, Suryansh Singh wrote:

> The HP OMEN MAX 16-ah0xxx (board ID: 8D42) uses the existing
> OMEN v1 WMI interface but does not use the standard EC thermal
> profile parameters.
> 
> Furthermore, it is the closest sibling of board 8D41, which is
> already included in the table with omen_v1_no_ec_board_params.
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
[1/1] platform/x86: hp-wmi: Add OMEN board 8D42 thermal profile support
      commit: 84192e252ebeffa973bb6900c60500bd88adf3fe

--
 i.

