Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7633C9EF9
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752442; cv=none; b=oJyFk5Mzu/IeP/HnKh7T3evQXdZcmdHl7XwxLF7AEi9gzYPDvzh3wBnHSTCCK1e0vva1SYw4XqzkLDRTAWOKeqhQmcXbzyAM8jBFEN/q3D9mMyw8bRGe7+ztpl/MpK4/nzpi88ouiBBCa7ECNHZVdNF1KnIgjbqyAtpdR1zTn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752442; c=relaxed/simple;
	bh=uGAb+J6/6TMyBa5vF2jduJa86TgtVqzQZ/q1F02ROj8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rVwqiuumlDDYitXqQMf+YAqGPJp5eMSMh12e5239CME8X1bIfy7tBxyHagbGUbCDnIR8ooiPXvf3ve1hOB8WpxWNf3+mcH2xlXCZ4CtwQTvhW7Ko10gcjREQHiC68xLCz7TWXJ1g61oUPdztxs/9zNPKLH2qRsGMiMYBoTwSYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9tFuSkg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9tFuSkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752441; x=1805288441;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=uGAb+J6/6TMyBa5vF2jduJa86TgtVqzQZ/q1F02ROj8=;
  b=l9tFuSkgwuVaj4K0h6KqPPqkvqBQSZN+kLPbiK605nCyQDJJYzsYQguR
   mHVVQZgK31q1GVrDPIvR3TogZq/7l6kTOJ3iPh5QOsr9geV8Hj8gs4LTi
   hfvpimxfLpJwAjOB/XEiiNELg+Q6+PkjpnKBDLEB3JPBG+ecakjXPFbB+
   lj1LLoMqCqOppefDdeb5WJHo72gowb/a1ivohNF8/2xA20Nmmhm4hLXkd
   AlK3Kniy6KSuKVlgIKjpgKgcqWjSKiSP5QLARj0elTr7Q5WSSG27d8RbH
   LPNDgusuewhRy89eL58PUpW1cL00ityNy2EV3Q83kF1m+Phg3D1Cw5k6r
   g==;
X-CSE-ConnectionGUID: WRjrV+sySrmpWdrdiS3cQQ==
X-CSE-MsgGUID: 9rPxsttqSeWhrJvLw4Tm0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85481193"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85481193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:40 -0700
X-CSE-ConnectionGUID: 8+3sZbtHTsOTmbwqL5aKQA==
X-CSE-MsgGUID: epE+/+kvSEyUOZBEBxiK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="260166241"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 lirongqing <lirongqing@baidu.com>
In-Reply-To: <20260303074635.2218-1-lirongqing@baidu.com>
References: <20260303074635.2218-1-lirongqing@baidu.com>
Subject: Re: [PATCH][v2] platform/x86: ISST: Check HWP support before MSR
 access
Message-Id: <177375243346.9137.261856869764062277.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 03 Mar 2026 02:46:35 -0500, lirongqing wrote:

> On some systems, HWP can be explicitly disabled in the BIOS settings
> When HWP is disabled by firmware, the HWP CPUID bit is not set, and
> attempting to read MSR_PM_ENABLE will result in a General Protection
> (GP) fault.
> 
>   unchecked MSR access error: RDMSR from 0x770 at rIP: 0xffffffffc33db92e (disable_dynamic_sst_features+0xe/0x50 [isst_tpmi_core])
>   Call Trace:
>    <TASK>
>    ? ex_handler_msr+0xf6/0x150
>    ? fixup_exception+0x1ad/0x340
>    ? gp_try_fixup_and_notify+0x1e/0xb0
>    ? exc_general_protection+0xc9/0x390
>    ? terminate_walk+0x64/0x100
>    ? asm_exc_general_protection+0x22/0x30
>    ? disable_dynamic_sst_features+0xe/0x50 [isst_tpmi_core]
>    isst_if_def_ioctl+0xece/0x1050 [isst_tpmi_core]
>    ? ioctl_has_perm.constprop.42+0xe0/0x130
>    isst_if_def_ioctl+0x10d/0x1a0 [isst_if_common]
>    __se_sys_ioctl+0x86/0xc0
>    do_syscall_64+0x8a/0x100
>    entry_SYSCALL_64_after_hwframe+0x78/0xe2
>   RIP: 0033:0x7f36eaef54a7
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ISST: Check HWP support before MSR access
      commit: 5092ae33e4c14d84fab63e6fa6dce4d7648fd960

--
 i.

