Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C812E92C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Jul 2025 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195284; cv=none; b=X1+MVKaf4XcSsAT63hmf9sBIMZy3h8hzmObU7HFKj8B008nGzzKH6/stRAwy77oSX5FknzKaEPX6JJPj70bPKWqkTPq1Gp46+tY7DTfozVsm52SLD7FCj5rJKfNQ4ciVc+2Uwzozw4ULqdD1Hf9gWM9wwlz5Ue0BNAGEgzvYASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195284; c=relaxed/simple;
	bh=6IwnMK5zt0qQdPGkJh4domBgOWIBq1SGpwLeXwbLFiA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ELFxSePQmOyrjJY7euDd3lqQlE+klpB3AdLWTt5fF2H/RS1VMf14KjnTAr3vnximmtxVwvAzRCGjESN66tbRrsYmPA+3R8Kk0v/o8/XDh3zBPPRDpxT7zVGXRB2OrR9xvQyr10Ccei/AdXIyb+kPIvY3e9kmvhEZSi198cwcAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6W37PKl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6W37PKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753195282; x=1784731282;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=6IwnMK5zt0qQdPGkJh4domBgOWIBq1SGpwLeXwbLFiA=;
  b=F6W37PKlLT3fsTorlnXZfpPlvG4I8u3qhDLLpfh7iNjfDgL7J1tBgw6M
   Rn5QPl6Kx3NHITa0DZnHkuOxSvzqnWOGz1HE9f3fGN5v0OD6PaXYL6rrb
   2yH1juQpNbuM/DmWqzrWmWYVOCV79p71TPV8+E6DER4uLNHmNCY81kB9a
   6VhSO27tdoiJm34Q/xRkXFxPE5wIeqEuj8zBqwu2u9kla08Czh549CWz4
   yCmDJMrzpF2L4/LRc3izGtRVeXWhyD068/5a9zVqTYRvNETjmIGW3Y2Xr
   FhtNi5L7LzOJWRy7Srz8vD8rKmTTgQKBjwS708Azx3NBb4ro7uOKu3SbI
   Q==;
X-CSE-ConnectionGUID: ltffi8g5QXuHvkWVrgqTlA==
X-CSE-MsgGUID: 4mNriE0GSNO8qGrQuD4B4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55539220"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55539220"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:41:22 -0700
X-CSE-ConnectionGUID: VIf8FzOoSdetx7NMoZBPsQ==
X-CSE-MsgGUID: HBXIzQIEQsmF+tmGIaBpPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159476256"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.254])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:41:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch, 
 david.e.box@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Subject: Re: [PATCH v8 00/13] Crashlog Type1 Version2 support
Message-Id: <175319527505.17685.1784853214111803495.b4-ty@linux.intel.com>
Date: Tue, 22 Jul 2025 17:41:15 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 13 Jul 2025 13:29:30 -0400, Michael J. Ruhl wrote:

> The Intel BMG GPU device supports the crashlog feature, which was
> exposed in an Xe driver patch (drm/xe/vsec: Support BMG devices),
> however the version of crashlog used by the BMG GPU does not have
> a supporing PMT driver.
> 
> Update the PMT crashlog driver to support the BMG crashlog feature.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[01/13] platform/x86/intel/pmt: fix a crashlog NULL pointer access
        commit: 54d5cd4719c5e87f33d271c9ac2e393147d934f8
[02/13] drm/xe: Correct the rev value for the DVSEC entries
        commit: 0ba9e9cf76f2487654bc9bca38218780fa53030e
[03/13] drm/xe: Correct BMG VSEC header sizing
        commit: 5b27388171a18cf6842c700520086ec50194e858
[04/13] platform/x86/intel/pmt: white space cleanup
        commit: ba22fe0cffedf5156731fbac729a638f18d17e6b
[05/13] platform/x86/intel/pmt: mutex clean up
        commit: 75a496aa054326d9ebf27b39e1af8b5b770311ba
[06/13] platform/x86/intel/pmt: use guard(mutex)
        commit: 4f8fa22d108006b8ec0b94bb67a1bd537a2bf141
[07/13] platform/x86/intel/pmt: re-order trigger logic
        commit: 147c18d8efaa1fa006fdd0b901d51092dc3b2189
[08/13] platform/x86/intel/pmt: correct types
        commit: 5c7bfa1088274bc3820eb2083f8091ff8ad397ec
[09/13] platform/x86/intel/pmt: decouple sysfs and namespace
        commit: 8ab4f88d46c70bade0633b56a0f03e20102bf10c
[10/13] platform/x86/intel/pmt: add register access helpers
        commit: f57b32cb4adb28b62f61c4729f7b85f55518cb2b
[11/13] platform/x86/intel/pmt: refactor base parameter
        commit: 66df9fa783aadc2a5ae8ca11ead0b13032d24e7e
[12/13] platform/x86/intel/pmt: use a version struct
        commit: 5623fa6859a6cd49366421317e3c5ab183583624
[13/13] platform/x86/intel/pmt: support BMG crashlog
        commit: 2c402a801c19568de97b86a77b25d13448dc080a

--
 i.

