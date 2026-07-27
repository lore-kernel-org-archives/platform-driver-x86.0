Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC023FE35D;
	Mon, 27 Jul 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153976; cv=none; b=aty4om4FYNcfRcevadvVWlpemQjaMX/79B6OEsqZqCp0nkjlkwKsyP3ySZm3/KnJyGfG+EPKZsN7HYG5Rg01Z53ZPKKYY3hMMg89Xr9VB9LUW838FTgHd1triwxxeC1SqGJYZEzqPNQJW6NeXjx3DRG8577EJ5WfQADBM+7d1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153976; c=relaxed/simple;
	bh=1opZp3Swm8wR8UcpUL6AD+EHIjXfcvRjXrQlqefb0Ng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=itSdAvS37NAynN1DSX1hEbdSypfBTNQOa8KSsLYK9JsDb0W6//N3CMqboT/17mnDS7r0ohfVolIEPRkL4Cy/Rw9z4axQ1KPKN7P/e0Lj5iFiVyCRPmHNOghgD+N77CzLOxPkoSXx+e/AQnEXocKHmNGAhjDPpbqrsU9DllKOEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdUEChZt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdUEChZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785153975; x=1816689975;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=1opZp3Swm8wR8UcpUL6AD+EHIjXfcvRjXrQlqefb0Ng=;
  b=hdUEChZtq2vBq4X80sbRIeLHP9uqDiknieK7d9jI/g19/+jgwWeR/Z6X
   KsIgsl9qMPtWTkKZ/mYtxJ+zsE6y/jfC2DEcq0JXy98xbKsSDrqZtgWdn
   uwxmgxFAGZrxQY8NdRoz2FRIXo+OpkYbymYDVtetIXZPRAYMvJEmmr+ZK
   NMGIEU4JtjMlgVON1x2bczCRHPwaoUbQbTbFh0r2bV58qLx7NNTL8p+WI
   BokTPr+NZOMhWUnqnjwL8gXdCB9sAIqAv99fyNhpy46oWRft9fP3L2tvt
   zraYevFvGYg3AiMIq9mej1MDQIx+YQhTvdbgw1H0pb6CyCuLa85KuyxkL
   w==;
X-CSE-ConnectionGUID: V49rWDewQwuurdHCqWhWsA==
X-CSE-MsgGUID: yZk+fqCzTrGDl0NdarZjBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85589064"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85589064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:06:13 -0700
X-CSE-ConnectionGUID: 5Zgv0wU7R8SdZC8aDErMww==
X-CSE-MsgGUID: jf9RWGoaRNCJDJ6GDtAlzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="255081461"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.226])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:06:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suryansh Singh <technosfan14@gmail.com>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260724120255.49649-1-technosfan14@gmail.com>
References: <20260724120255.49649-1-technosfan14@gmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Add OMEN board 8BA9 thermal
 profile support
Message-Id: <178515396660.10740.16009111599177841662.b4-ty@b4>
Date: Mon, 27 Jul 2026 15:06:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 24 Jul 2026 17:32:55 +0530, Suryansh Singh wrote:

> The HP OMEN 16-wd0xxx (board ID: 8BA9) has the same WMI interface
> as other Victus S boards, but requires quirks for correctly
> switching thermal profile.
> 
> Add the DMI board name to hp_wmi_feature_boards[] table
> and map it to omen_v1_board_params.
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
[1/1] platform/x86: hp-wmi: Add OMEN board 8BA9 thermal profile support
      commit: 946000e1d594a9005e178f4166a09941ad5d454a

--
 i.

