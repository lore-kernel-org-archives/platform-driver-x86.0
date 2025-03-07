Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF619CC05
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Mar 2025 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741342032; cv=none; b=is5LgnYiYfDav/fn5zMTxSdskzRGOwdq5BKgbH/bnhgHgSg+Q+bbUsBoKSmqxi5miTd2iUXLZ2xC+Vu+j/j2YsNl2d2lSyb911rB9tx4CNdlwxadeyMEBjl/NDrG37Qnu3AGy9nVPuz72kV3eccXf5MRhdGuPB1BgT2NfoalCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741342032; c=relaxed/simple;
	bh=tyUaV1l0D54ZNMIx/leDwl/oQ0f2CW/d76wpxO4jZ/k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UtxKbAe8aMthVHgBShxL90SW2H0jVeMuKKL1/LpdrTj5GglMe4zrtCN2GBVdaQGNestWtxxULbpRXTnFMt8NYBG2JLBK6p0CWO59nmgUCDrJUy/XdMAHRdbkcZpJmGt3PD2DMwsOwLdcCj0M7cbi8dGV1JSxq/yQb9iN25MhOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NE3SJppv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NE3SJppv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741342031; x=1772878031;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tyUaV1l0D54ZNMIx/leDwl/oQ0f2CW/d76wpxO4jZ/k=;
  b=NE3SJppvxmvFI1QNANNtPYyhPmdf1u4jVZDwGZ5l+fkHEkH6IG1FcDAy
   5HXI7t5vkZysEJrlXRyBZ+rVFgYHnuSYwUBQKPBV1FCcYzW54N+1H2mQU
   uuCpTthZRdO1kKDEcBjj12/0ZGkrbI6u5NbDG984qm9g8Pix0/SE6HMlJ
   e2GiXdo8Mkx77zVZ5vK3ATaE1TPfR30dbnFiGwVbQSo9SbhAvENQ1lvWf
   rivEZPtbyOMLZAbfIXo9yig3Ra5xIrnLE6erphW7tkYztouIeCBPJdV5t
   fLAIItmSV6/uidyVBmx8JCX4TIha9nP4AsuJk7r1sq5VaPWmd8KcrIYyQ
   Q==;
X-CSE-ConnectionGUID: FXkDT92QSgWA/w5YnLOkSw==
X-CSE-MsgGUID: 3F2kilarTAqQYeWCQeS1pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59943625"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="59943625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:07:10 -0800
X-CSE-ConnectionGUID: jTZGmQDESeahNrjaHoxrKw==
X-CSE-MsgGUID: QDQAkJZsTuW7KVsVmnd7Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119971120"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:07:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 7 Mar 2025 12:07:04 +0200 (EET)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.15-rc1
In-Reply-To: <e884b4d403a650139080366b4b9f7c9d4be78efd.camel@intel.com>
Message-ID: <44a4b1e7-4c85-f17f-49de-db760de1bc5f@linux.intel.com>
References: <e884b4d403a650139080366b4b9f7c9d4be78efd.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Pandruvada, Srinivas wrote:

> Hi Hans and Ilpo,
> 
> This pull request is based on
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
> review-hans
> 
> This pull has fix for display of die IDs in a single/multi-die system
> after
> the changes for die_id sysfs from kernel version 6.9.
> 
> The following changes since commit
> e57eabe2fb044950e6ffdfe01803895043dec0b7:
> 
>   platform/x86: thinkpad_acpi: check the return value of
> devm_mutex_init() (2025-03-05 14:14:10 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 5cf237fc4645af0aabd054a16184c9ecd53db010:
> 
>   tools/power/x86/intel-speed-select: v1.22 release (2025-03-06
> 10:18:31 -0800)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (4):
>       tools/power/x86/intel-speed-select: Prevent increasing
> MAX_DIE_PER_PACKAGE
>       tools/power/x86/intel-speed-select: Fix the condition to check
> multi die system
>       tools/power/x86/intel-speed-select: Die ID for IO dies
>       tools/power/x86/intel-speed-select: v1.22 release

Hi Srinivas,

Did this end up falling through cracks or did you come into second 
thoughts about it:

https://patchwork.kernel.org/project/platform-driver-x86/patch/20250129033932.2576077-1-raj.khem@gmail.com/

?

-- 
 i.

