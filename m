Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391D3D1A99;
	Tue, 26 May 2026 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816780; cv=none; b=MfyftEt05VeQsJc587E1zm9Cgm1qm3tAYp4kq6gNIGNPuBX1cbv1sl7SXaQbQHKe1+/yQ2IqPAzSDqgoRJUo/8QFEIe5H4233VC9tSCPYDsUS8ddNZEaac5mMJQ6JX4rRI3N+ThTENAx5jfdex3Dr8kZLaWhxb/h4faJvFTU7kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816780; c=relaxed/simple;
	bh=zBMrhCV2NHqxpgeed49/u+GkiO/lnfwEkEJB/GpI5bw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m3I6AKMyvo3vrje1vRTlfzgo2Na88OvwnOOBR96/CWkySuCZsd4pXK/hRg2m3bXlWVk+Rk2MRilKvPuVXvTDLtnluiK0sjJ4iwvXRah1BThVtvJve9ZiFz+sPH1LEOp+HKlEpywbp+iafvMdxB8UIY4d0C0HAYI0XV4JKcv2RM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOOQLOfC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOOQLOfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779816779; x=1811352779;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=zBMrhCV2NHqxpgeed49/u+GkiO/lnfwEkEJB/GpI5bw=;
  b=JOOQLOfC4BOphYfv40iJ5gspUelawUVQKaDC58ti5efjAsyLB3MpmU5t
   DGGeOi6UkqwZ44jgPUdbu26jqmpE3vyi0fDucu+AqwfoOROKwn9FJ4PoP
   rnirMwyJmtWgFduF/LJpSilqOEvpuQPO1sHiwZN16Aplb3djQ8eFfVaUz
   zLFawO1gT86t1kxrK5tRAnnvtRP+w19VkfNhvR0Od6zak7VU2x+wXgrI5
   94eGydS3NWopTROuz063Tf2kwRusJnerRcmpCJCe9Yj0+Hfnnj1AEqZiT
   HXg1lkpJvZZ1vztw9F753JTKGeoFqXr0G4pse3SNzJSJFb1se7J1yK3Sd
   w==;
X-CSE-ConnectionGUID: dQJd5nnlS52Vr4v6anaSWw==
X-CSE-MsgGUID: FdTGrTPZTSaRmFNkGiinCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80751303"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80751303"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:32:58 -0700
X-CSE-ConnectionGUID: +0PFlTtmR9SEzXrtnrnPJg==
X-CSE-MsgGUID: 7doHN7ZTQzO+m8HmF8pdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="246954511"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:32:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
 David E Box <david.e.box@intel.com>, 
 Mike Bommarito <michael.bommarito@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260523114517.101305-1-michael.bommarito@gmail.com>
References: <20260523114517.101305-1-michael.bommarito@gmail.com>
Subject: Re: [PATCH] platform/x86/intel/pmc: rate-limit LTR scale-factor
 warning
Message-Id: <177981677064.9008.528681678444219870.b4-ty@linux.intel.com>
Date: Tue, 26 May 2026 20:32:50 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 23 May 2026 07:45:17 -0400, Mike Bommarito wrote:

> convert_ltr_scale() emits an unconditional pr_warn() whenever an LTR row
> encoded by hardware has a scale-factor field of 6 or 7 (reserved values
> per the PCIe LTR ECN).  The function is called twice per LTR row (snoop
> + non-snoop) by pmc_core_ltr_show(), which is invoked on every read of
> /sys/kernel/debug/pmc_core/ltr_show as well as during certain platform
> driver activity.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/pmc: rate-limit LTR scale-factor warning
      commit: 4c7f5762cc5baf2819e8868da6571fb40bfea969

--
 i.

