Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576251B161;
	Fri, 18 Sep 2026 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752930; cv=none; b=Mu8GpBViF59ydGn3p0HTmTaFJm8rDSZn6BZOFD1g4J3BatzV8SicmlJGnVWXftRn2l/cuP/JHu8GfFNpvdYzn1UYudbOPaKFxDQa2E7Oqda7XAioSrSBRqnxGWFLxvmC5yHOagQEb6CcO1QYRKtVnQ0oWGGRBEGK375unfq7jaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752930; c=relaxed/simple;
	bh=VPuSfA8wdKPO6eJHp+i37UT+Fqd1ri4UVn0vQRWA5rM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iHdI6MzJMp65as7lmB+4ej929CgzLwDZAPiM8/b9syIBT6UIEl5d3n2ygt95VdXxEfmIoDkkqundvE+da58N3znY1l31NjWqkhhAw3sTZm7mv9tN7h/vF5o52d4IwSYVcgeFX4oSLRTaAUTzmPo/iTLDElnxqGwYTuGiBG/8O3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTWOIWES; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTWOIWES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789752926; x=1821288926;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VPuSfA8wdKPO6eJHp+i37UT+Fqd1ri4UVn0vQRWA5rM=;
  b=cTWOIWESbBrAxAiczshfHVjdmZJtImGzPVsy0Gqe9sEhdC93ZFl1BRJq
   /B05dv2tOkdadVG6je0B5PsDoOTqUti3YQr1g8UcAc7VZjR9UI9hvM8/a
   yZ175L2bvx3UcUpME6h2DQPCk0YBEe7NfEIdGKC6HBv40PXGN7pfFnIhc
   hRWIPREmI3i5CzBT1DaANE1emE9cUIJTwAhYywVstGkJPKNU8DhEn6see
   jXKN08+lsMItIBjT+UBj8xTAxaSiUWegZ97T1mW8ooUoiQY/UuulwoKQK
   tmK7XFS4qeKAEh/fj8jL76VQbXBuo8GQZMzV6ni4d/99X2h1OhfjtahzS
   w==;
X-CSE-ConnectionGUID: FcsTXCmhSayRDLye8NeTVw==
X-CSE-MsgGUID: wVuaWBSHTZK1ZMxZhKVEPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100874436"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100874436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:35:23 -0700
X-CSE-ConnectionGUID: bae00GW5TayTjVXTuWnyaA==
X-CSE-MsgGUID: +LLSkHFFQ32G2lnqI1rIlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="279733547"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:35:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 20:35:17 +0300 (EEST)
To: Justin Vargas <justinyvar@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Krishna Chomal <krishna.chomal108@gmail.com>
cc: jlee@suse.com, W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: acer-wmi: Remove unused platform_profile_support
 variable
In-Reply-To: <20260902193039.21725-1-justinyvar@gmail.com>
Message-ID: <f76315ab-b16c-e4e3-c3c0-6d7963e9671d@linux.intel.com>
References: <20260902193039.21725-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Sep 2026, Justin Vargas wrote:

> The platform_profile_support variable is assigned during platform
> profile setup but is never read anywhere in the driver. Remove it.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Justin Vargas <justinyvar@gmail.com>
> ---
> Found while reading through the driver. Compile tested only, as this
> is a pure dead-code removal.
> 
> hp-wmi.c and asus-wmi.c appear to carry the same unused variable -
> declared and assigned once, never read. All three were converted to
> devm_platform_profile_register() in the same series, which may be where
> the last reader went, though my clone is too shallow to confirm that.
> Happy to send patches for the other two as well if that is useful; I
> left them out here to keep this patch focused on the driver I use.
> 
> If the intent was for this variable to be checked somewhere rather than
> removed, let me know and I will send that instead.

Now this is interesting, git grep finds 6 platform_profile_support words 
(3 variables in two drivers) and none of them are in use. :-/

I'm not convinced there's going to be any use for any of them, probably 
leftover from past. Can you make a series to remove them all, one patch 
per driver.

-- 
 i.
