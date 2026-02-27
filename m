Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB263A1E62;
	Fri, 27 Feb 2026 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192309; cv=none; b=R8Yq3MiOyhGZzkW8hKMGTqROrEjkKvSIdk8/iSPvLwwcQNsTcVYkG/RGEHfiNi9z2tb/u+dcti3M+SUkebFT8D+jrX7xhQMupo7M9aDQWRnTAwljCgSRSziT9AGTej2xMhVGZS3nOzQvh304LzmI/apnP2uby5z9LwoXcpw67Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192309; c=relaxed/simple;
	bh=5nAyrVXDLA3cfcyJT0OcOGHYlGTmyKkYGk+hRZ5eTbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hxY5Gm4UcXFc+dbCgi7fnxCOT74crBPEdjA8iZEJW0KMGNt/HdfOKGlXofSzrMByKYlibH++T+joECRClTi89R84nGsUbA8C5HPN4qFmuDX2ZnWJoFq/xWEms5iekY0vCdgoOZdZdS8ef6jRQwxNcwzIkSu4Qpv8qc7gYZcN/mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kn76CplS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kn76CplS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772192309; x=1803728309;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5nAyrVXDLA3cfcyJT0OcOGHYlGTmyKkYGk+hRZ5eTbo=;
  b=kn76CplS/I5c4uocXU5P9n5F3oU3cnDoPjSlIw0YpXa6GKAKFNDpgdv4
   OQqcaleriVHFDIdyYqLPW1SabX2FO5yf9WA1U2K+uLr4/MMPQmqvNjyHj
   m8IO8A0kvXdgyY0K3pgppNJ5sI1VoewBcgT752UayKZA+7JKZT/j/OcLs
   5ai/sdW5MhcGqcv4AC8tSgn/HWzGaeAFas4V01eNKQ1ZeOBql6ydR99Rs
   BBqAOcC3dADEjKI4KseT1GzCdW3XzkQ7yEULmymDXcKud2WzsMiyGkJsf
   xynJhtD8vJ2mKHoYpnGDVNwGCXcPWc/NJU1uAcp7S0067UOhcPvuIjX9U
   Q==;
X-CSE-ConnectionGUID: qRllxh6JT7y9NjAhxKovmQ==
X-CSE-MsgGUID: Ogncqd8EQGGVqTnFTZU+SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="98739817"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="98739817"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:28 -0800
X-CSE-ConnectionGUID: jxf8tnGPSoen4w1tYH3S/Q==
X-CSE-MsgGUID: THuV4tpyTOy2bzl6jBX2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221498144"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.144])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:38:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jorge.lopez2@hp.com, hansg@kernel.org, linux@weissschuh.net, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: stable@vger.kernel.org, Paul Kerry <p.kerry@sheffield.ac.uk>, 
 Ben Hutchings <ben@decadent.org.uk>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260225210646.59381-1-mario.limonciello@amd.com>
References: <20260225210646.59381-1-mario.limonciello@amd.com>
Subject: Re: [PATCH v2] platform/x86: hp-bioscfg: Support allocations of
 larger data
Message-Id: <177219229996.7567.590641094456295508.b4-ty@linux.intel.com>
Date: Fri, 27 Feb 2026 13:38:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 25 Feb 2026 15:06:46 -0600, Mario Limonciello wrote:

> Some systems have much larger amounts of enumeration attributes
> than have been previously encountered. This can lead to page allocation
> failures when using kcalloc().  Switch over to using kvcalloc() to
> allow larger allocations.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-bioscfg: Support allocations of larger data
      commit: 916727cfdb72cd01fef3fa6746e648f8cb70e713

--
 i.

