Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3E4014A0;
	Thu,  7 May 2026 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163955; cv=none; b=BVYvDbu8IlRpTW0FavcztW80E+J+6mbciLT+COJUI4yZUQzj9bs7TvjknyCEzQprbAdS7r4TdXihWOpNLbDRqLpjjofee1fdRJ+L1w92zxhbLyvtSMS3j3z/8l2jmFsUxVZNzVclUbrN+S1hTeQ47e2jIbDO6pKjwAQqO0z9LQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163955; c=relaxed/simple;
	bh=ZauGlwVw+fqGQ17Sq35u9FUDD8ngiSrf88vBL8KnvCY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C/+y2Wrjf0VmAJh1vUZjLeTOXNQU307LXfsm0ejGwhoKLkqmjhkYdHNKLvxsNWwUFJG5FDXO6Knj4hXsmQplHGJQdtfyShCJfQ3hXNOt+J9wQyJaJ2BN2IXBRPlxCC7wsLqEWg3JMfSZqz+Alc2n3Wwa6CGMl9eGFgj0R4LuZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jD3vjxbb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jD3vjxbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778163953; x=1809699953;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ZauGlwVw+fqGQ17Sq35u9FUDD8ngiSrf88vBL8KnvCY=;
  b=jD3vjxbbA2HRPCmSz25JYP6pkVhunX7A6exBs4bwFc/bBUaqarqs/WeB
   8gxM4bi5bOvy+Q5rkNltky7lO/aciA9VjGR5OduYE61qI35Hdo4cQBSk7
   Bi74vD7Po/HFBg1YJOk2Hug2OiYr+ovgBheh2KOu/sb3bNLAiPHhmYQ1X
   GYXaw05TMvdl9W295oYzJ0uKdwtga2CYlna7AGmlfgB3R3HwtwF5hyzBu
   unXBtOqm2J6a4ZgCrUS5RgT323/TPK4kx2FAP1nOjOPIDA3Z4B/NjsfgG
   6hMBF5jqU8iqZaY13y1fyujGjMSXMDIeVimSzfPaNAeW4Yv/1vDDFkyhC
   A==;
X-CSE-ConnectionGUID: FgEyG2YsSJ+VheBmWZ5eeg==
X-CSE-MsgGUID: RGUzTZ9JT+mPFM0bleU/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90574479"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90574479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:25:52 -0700
X-CSE-ConnectionGUID: eUpZaRSkRV2xZLFz5Ud7ag==
X-CSE-MsgGUID: nHYvFK2CQQiBrgB3kCMNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="232122319"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:25:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Haichen Feng <2806891994@qq.com>
Cc: hansg@kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <tencent_8E29805D8DC7B6005244C3433C62DD9DF606@qq.com>
References: <tencent_8E29805D8DC7B6005244C3433C62DD9DF606@qq.com>
Subject: Re: [PATCH v4] platform/x86: hp-wmi: Add support for Victus
 16-r0xxx (8BC2)
Message-Id: <177816394509.9113.8391401686122529760.b4-ty@linux.intel.com>
Date: Thu, 07 May 2026 17:25:45 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 07 May 2026 22:02:42 +0800, Haichen Feng wrote:

> The HP Victus 16-r0xxx (board ID: 8BC2) has the same WMI as other Victus
> S boards, but requires quirks for correctly switching thermal profile.
> 
> Add the DMI board name to victus_s_thermal_profile_boards[] table and
> map it to omen_v1_thermal_params.
> 
> Testing on board 8BC2 confirmed that platform profile is registered
> successfully and fan RPMs are readable and controllable.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)
      commit: a59e45221df82e8a6246c617615c1ccc12e3545d

--
 i.

