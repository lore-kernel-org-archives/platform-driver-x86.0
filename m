Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCFE399034;
	Fri, 27 Feb 2026 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192325; cv=none; b=Gg0tBZ9opOGgqb5Nm3HXwssdBkgkY1In826/Bwo5Qxmsifb+ZXIpg6GP7kZ9wNshpnOD/qfErcfA78gfsnJagA0l47vWRk/hsJ/dA1Qk4CFGic9qoejYrJNkobJPD0mlkspKJ5/vgPJ5o7efNBF66AUUWL/nGPvv/qhzdQ8QZ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192325; c=relaxed/simple;
	bh=lJheZKE13azngl6aKEbAav10lgA90AGUqeVV5aBf+FM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EADGE6CuVIhIIaZ6+NPHDGyworkHxHQLT1IBxXJQzKx/6vkx3Jf9ehNVl57hRFisjPoVP3UPHzRzlGB6DOsCd/hDq5eUFQ6ZECOwHjvxuFBPgbddh/a1r90Cx8iBJ0iK4sBlLDibS4ghkQgkhClWImkJIZ/cIE9L5QmFkNv8qRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAOzjftF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAOzjftF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772192324; x=1803728324;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=lJheZKE13azngl6aKEbAav10lgA90AGUqeVV5aBf+FM=;
  b=nAOzjftFiEAf2sXC8XNeNZBslwYJLP1nvPa58/ZrqdvuQSH8ENfGoKWw
   YgF51fnv4hmGYRiZb41zcJ80ZkOdGBDP+Tiu76/5kNfgC4bxiOGEIp81/
   xSc38ACD3Z7Jkut+JUxIp2y02ggQUqMSIOTraCYPEzPtIvaWE/VHq5u7N
   iUgYsuxsz/67Qt/+PSjLbq/cNpU7aQBEd0ro3n31EXzFMV6qw72vKxZf0
   XJ5MZmLJCZWyXDUUqDpIAAoViyhnqTE4OfRLtVlWjDhWw/1TaNKLiyKSv
   xLt6/TPLuGib236GBmv3p0J7zsa9jxnBwywGVCoDOspvwuCBfrydv6avH
   A==;
X-CSE-ConnectionGUID: PQ/AEn9wQ66Liqn6aRNyjg==
X-CSE-MsgGUID: ugzwzLtkSJqV+IC2lNx/LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72976814"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="72976814"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:44 -0800
X-CSE-ConnectionGUID: ipJXLQsVRZWvRbzmyAlS3w==
X-CSE-MsgGUID: ChQL9UH4R1q9eTB9sC4hzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="214736330"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260226051232.549537-1-rdunlap@infradead.org>
References: <20260226051232.549537-1-rdunlap@infradead.org>
Subject: Re: [PATCH] platform_data/mlxreg: mlxreg.h: fix all kernel-doc
 warnings
Message-Id: <177219231634.7567.8687956632443917408.b4-ty@linux.intel.com>
Date: Fri, 27 Feb 2026 13:38:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 25 Feb 2026 21:12:29 -0800, Randy Dunlap wrote:

> Use the correct kernel-doc format & notation to eliminate
> kernel-doc warnings:
> 
> Warning: include/linux/platform_data/mlxreg.h:24 Enum value
>  'MLX_WDT_TYPE1' not described in enum 'mlxreg_wdt_type'
> Warning: include/linux/platform_data/mlxreg.h:24 Enum value
>  'MLX_WDT_TYPE2' not described in enum 'mlxreg_wdt_type'
> Warning: include/linux/platform_data/mlxreg.h:24 Enum value
>  'MLX_WDT_TYPE3' not described in enum 'mlxreg_wdt_type'
> Warning: include/linux/platform_data/mlxreg.h:37 bad line:
>  PHYs ready / unready state;
> Warning: include/linux/platform_data/mlxreg.h:153 struct member 'np'
>  not described in 'mlxreg_core_data'
> Warning: include/linux/platform_data/mlxreg.h:153 struct member 'hpdev'
>  not described in 'mlxreg_core_data'
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform_data/mlxreg: mlxreg.h: fix all kernel-doc warnings
      commit: 3350c2b3f2b8a3b985a020a4ef4f2f050a4b6a1d

--
 i.

