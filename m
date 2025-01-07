Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D83190052
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jan 2025 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736275052; cv=none; b=EUMwsQDu9eCkYCAgAbRTP+o7sBv7d1TRc7pU4kA5p6ZjHfp2wBttkhvfRpNgnUvVMYTy82M0P55gJ2xq3EMjzBHjsMwh6aZHCE29Y+/CRasgexwBmp1TL4/+m4wBUO48oTTP2NFeGEnW/Jw/pqqKmfQ5QcqRdcWBNu0kMNtQMg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736275052; c=relaxed/simple;
	bh=JyLEDBkLKqEKIbLx+cWnTb3lEgkx2cchr+XQHgRI/P8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q+SM9VJqISUkOcALFDaWAUrET7zJpZarG+XM6M0HBYeER7Lzrzx8kr+7phioGJF35sUUty+xC/8F8AUAWmM+4JIlPDEl5WCQPm6TECRaz98cyibGWjJjH8vn6Alk3rVqAY4nV1h2i2iMppt8NgbP/MQHr9xDyxh/Nq2TfGF+ZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TisPC03y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TisPC03y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736275051; x=1767811051;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JyLEDBkLKqEKIbLx+cWnTb3lEgkx2cchr+XQHgRI/P8=;
  b=TisPC03y7HTRObhjrlajCGfeGyUQD0kXCXO/oErS+e1FsMcgAX9kiY6W
   0Z4ZRszx9BCSe14jcQT+4S6AD4QxYNaLX6ZRDd81l24T/rTp2LZHsja5W
   VTOjaQivLkiKPpd1+DYi3rxLU7ba2Cj2F9oP4TUpD38MMZiw4JEROIAZq
   2lTVPFBAb3qGPwL0YlpFuP4UQackkgo9tCmZDtzQftIOnln6gwGaJWrf3
   EmNGQegcCAwlq/BVZphF+JcHSPCJG4RdqLC/3l0eJwFP16041YrLDZWeV
   nmAa2oKVX5zWbT73df6Uetz4MiwWKiGLNxTSBNkDUC64ClQiVMxn4Xquf
   g==;
X-CSE-ConnectionGUID: x4HKkGJOQ/Kc6dfnnqWvbA==
X-CSE-MsgGUID: FGiqPq7lQhGwTcQUlEXFZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47890931"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47890931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:37:31 -0800
X-CSE-ConnectionGUID: kDlmcdx0R3e4LNXh4Z5cWQ==
X-CSE-MsgGUID: D+9/fXeFRpyDC8CvXgTdrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103704299"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:37:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jan 2025 20:37:26 +0200 (EET)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.14-rc1
In-Reply-To: <da3e36cd68264cb0c3362206a587c94492948472.camel@intel.com>
Message-ID: <26123d25-164e-cb35-faef-90b6c45ac0b7@linux.intel.com>
References: <da3e36cd68264cb0c3362206a587c94492948472.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Jan 2025, Pandruvada, Srinivas wrote:

> Hi Hans/Ilpo,
> 
> Pull request for Intel Speed Select version v1.21
> Summary of change:
> - Fix restoring TRL after SST-TF disable to current config level
> instead for level 0
> 
> The base branch for these changes
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> branch: for-next
> 
> The following changes since commit
> c416a3fed78b9b1d93755d2c5d8104769559c4cb:
> 
>   Merge branch 'platform-drivers-x86-platform-profile' into for-next
> (2024-12-30 20:21:09 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 600c8f24319cebe671a70722df99b8006daebe21:
> 
>   tools/power/x86/intel-speed-select: v1.21 release (2025-01-03
> 06:29:03 -0800)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (2):
>       tools/power/x86/intel-speed-select: Fix TRL restore after SST-TF
> disable
>       tools/power/x86/intel-speed-select: v1.21 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c    | 2 +-
>  tools/power/x86/intel-speed-select/isst-core-tpmi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Hi Srinivas,

Pulled into review-ilpo-next where it propagate into the for-next branch.

-- 
 i.

