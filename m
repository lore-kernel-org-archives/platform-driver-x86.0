Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C396314A79
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762345444; cv=none; b=RyIYzdo9yvybKr707gkg5YRHOwFV69zksYj8kcGEqEyYZx8AwdVQCmxc+b1DwA5JCLFEee7pZ2eGUZ5Dm/d+rhj+BgpzilXQGbKcCK+F5rdDwfpTTa9CrUy+xc04+NepjwfpRhzS0m4rosFi51E+Ps8flpAEDI0Ei52epbODOjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762345444; c=relaxed/simple;
	bh=U10ap05z1ROUilWU1uD3lMuA8HWOa/BsvqP3p9/ITvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fF7JGvOvnJ26OqNbBrvKb3677WSz42eIQ4pF9rEVZzcPIssTfLCEcKKgOtKhdmefD08L0BKobeiJ81NJhT/pNLpKo8aBedXiqn5N35wAB53tqP/vxfUc7NSRL9NGwZ/QWC13Ajo/TGWHakho27xmc9b9yMr6+0kL+BEii+i5Hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEQ2Xtg/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEQ2Xtg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762345443; x=1793881443;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=U10ap05z1ROUilWU1uD3lMuA8HWOa/BsvqP3p9/ITvw=;
  b=JEQ2Xtg/qRRfJF6HMPek/umEm2rzg39Q4elyihn6++53yjFxjvJiq33T
   ff2xgj4s8Fb5SH3BKO0mjo3SLaA6VOksPM5+AEMXAaMpiBJPrXospYLFH
   dyHSvQfF+88Jolhk7o14cB/PxVPrwqXYyz70R5Edz1DT7iZZx3Eta4/OY
   nKD7dDfkKcLRaOs7HjdrK+C2nsNhl1wQBoDxI+P1DpPFCShzMPV1gKKdq
   fAxvKqKvswtbmbztC1D8Y7RzF9I9pdf8bpVCdNAiLWloKwTtxbDZD3NyI
   nA0BUaDr2oHUjmbU/Nz0YTEN//tP3cPESyDAwnXNJCuHuo5KotrdDObEj
   g==;
X-CSE-ConnectionGUID: 4HShoQvrS+CjOoB96CYF3Q==
X-CSE-MsgGUID: t+PnQKUJTKKhQvGuFrKc8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317590"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="68317590"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 04:24:02 -0800
X-CSE-ConnectionGUID: dAgX/t6LQjOTG2UAs22ptg==
X-CSE-MsgGUID: y1UHDzaQTimJVkGsPZD0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187132969"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.252])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 04:24:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20251018111001.56625-1-krishna.chomal108@gmail.com>
References: <20251018111001.56625-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support
Message-Id: <176234543601.15175.5876806195100302433.b4-ty@linux.intel.com>
Date: Wed, 05 Nov 2025 14:23:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 18 Oct 2025 16:40:01 +0530, Krishna Chomal wrote:

> The newer HP Omen laptops, such as Omen 16-wf1xxx, use the same
> WMI-based thermal profile interface as Victus 16-r1000 and 16-s1000
> models.
> 
> Add the DMI board name "8C78" to the victus_s_thermal_profile_boards
> list to enable proper fan and thermal mode control.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support
      commit: 0c40199bbce35242ad78247ea357ec94489f2e89

--
 i.

