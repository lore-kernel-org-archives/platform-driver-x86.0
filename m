Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569E19F464
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 May 2025 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996385; cv=none; b=R+sqpvV/WiV1gDdVgLVD+JMjfW8RNVRM0VKdj9MZ4grt8tlZhUeMXam7Po9Dv0zj8Rkx2okbSIVffGGuKWDY3edb4vV8VRlQu16NnfERQ4PKdn8VDIJ2q2KpPoEySQRz7q8Cz8KGhI2yU4FKmrHWyXDPkZ/0Rbd3HRWGXbFAl6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996385; c=relaxed/simple;
	bh=nLQhBvGxKE388cZAZOMBN37aaL7FEH086ud4qjXB8bs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IQa+BNw5YrPcShvnEYxUV0vo4q42kHXig0YeSQgIpEZHkc4Kp4/KLzBGOUVNAGBQiIxeq0nE5+NNxcgXL0OF09aXeIvCS5Z8JHu7ROSQETnEQYmZ8d58eQfbAyKSbQ70C8w/RoG2TESk80H8aelh9WgjxeYVVODzEDJJp8GokSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGu3Vn4D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGu3Vn4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746996384; x=1778532384;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nLQhBvGxKE388cZAZOMBN37aaL7FEH086ud4qjXB8bs=;
  b=nGu3Vn4DvBJAZikVRUgHannMM4MJfogSatn9KnmAzaJKIDomsqLI1pAD
   3B1MXA8zHEVcWS8ydRcJD4G8vi7nHcva+EWFG5N1S3WbjH6ysORwa9d4F
   A/HLuW994NnNL81O+419suADwTaa0d6fFxHadHcAb724rWWTjNu4n+cmu
   HOKfr3zqHKKk15Y0/+jHGFe6WKHXItsIS79WXGeVYQkXcu3oLwapIQUXQ
   q5grJpJzaALHO2xmBGrUGyCfNKFP7mfm8CYxajz9bnvJ0B2sY8Z47xzLz
   23SWCU+BbT2zXPsvNJKLE34Aoyiz5k6uIMIH2YtYKDxx/cUmghtWVK3Zw
   A==;
X-CSE-ConnectionGUID: meZeJwkGTkGTwzuMpHDd2w==
X-CSE-MsgGUID: AKJ+8Dz4TTWyEyolKbCGUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59444740"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="59444740"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 13:46:24 -0700
X-CSE-ConnectionGUID: vX1lJZzPSsmkdnAoOGLWTg==
X-CSE-MsgGUID: 5pNKmV6tRHy+BM9Tz93MAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137189080"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 13:46:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Vadim Pasternak <vadimp@nvidia.com>
Cc: michaelsh@nvidia.com, dan.carpenter@linaro.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250508203139.55171-1-vadimp@nvidia.com>
References: <20250508203139.55171-1-vadimp@nvidia.com>
Subject: Re: [PATCH platform-next v2 1/1] platform/mellanox: mlxreg-dpu:
 Fix smatch warnings
Message-Id: <174699637602.1989.15085679873619656088.b4-ty@linux.intel.com>
Date: Sun, 11 May 2025 23:46:16 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 08 May 2025 23:31:39 +0300, Vadim Pasternak wrote:

> Add missed call to release adapter.
> Remove wrong error pointer conversion.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: mlxreg-dpu: Fix smatch warnings
      commit: f94ffc3f0b90bf4880e0abf2c056fc465e2c3be8

--
 i.

