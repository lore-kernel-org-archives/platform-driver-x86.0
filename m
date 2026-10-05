Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3F4CEE65;
	Mon,  5 Oct 2026 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226345; cv=none; b=PrkuqTrlC7MMzv6wXM8ft8IpGJjFXMICaV8z/4eQS/6R86wUBwnJAXzeRB3VMUbP5IwiIeEUF3cEYouuW+ZSanrrSawzYz6AFMGwoCM+Z0+mGnfuSrPH2CASrSB9YBInZr0lwd/f+5rYhrzZOrPH2fIEW7sC9Asy2VsiooVl6LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226345; c=relaxed/simple;
	bh=E8dq1RyIuDPo9A0gojgAvGqFNLxdczVQ3s5wHbPBsfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=umfKFpB9oWmjmI0f4o6g+zLy2M4F6YfjYiIY60wKAN76CWpRv2TzbYpcVsIyvgkYtfagozcP6E8/FoC2NnJxYr49Wfgvz283u1Gy91wfKGofvxo3VvpQAhqlwJagv+ZoFP55dNPPUMF2MSW1HXJPjVo79/Xi9xI367SW24UGMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fu6Rux+S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fu6Rux+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226344; x=1822762344;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=E8dq1RyIuDPo9A0gojgAvGqFNLxdczVQ3s5wHbPBsfg=;
  b=fu6Rux+SxGsqrBUY028d19icKy/vSQMNNxHAZ8nyAB2ycjAw2Y9jCLpI
   kaMeIz190aH1NO/vv7AjrB60OqhNx8YaKfu9LGMhvT1cnHs7ACIltMmK9
   0qGg6ylJGZDfgE2uMdJ1ulI8jUFPlwEUiU5HT2wzZCFms96zHoWz0K2E8
   DsdkiHJzmxKasqGbBBlVksdIIMcwg0TzPlIHrawqb/Y4FMXCx8HmBMWE/
   jP0DFs7AXHpdvdG1fP6o9NKlJWVj4IKSTWYChY4CosR+fYA14v5hc25B6
   Qpcabqa4yYDJqqHMS2OAcp+S5HRnCpqbP6ZHBdrMXZNx4U0LGo9C7T7oM
   w==;
X-CSE-ConnectionGUID: V3z7uitGQAW+MJyc6lNrGQ==
X-CSE-MsgGUID: fnE0oFiXSCmXvq/VISXilw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91116596"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91116596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:23 -0700
X-CSE-ConnectionGUID: cpfW6+y8SQeotZ2q4tauHw==
X-CSE-MsgGUID: yecFCT16QEml6+Cx+pOkGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280185944"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:52:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Kristen Carlson Accardi <kristen.c.accardi@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924193625.1830526-1-kristen.c.accardi@intel.com>
References: <20260924193625.1830526-1-kristen.c.accardi@intel.com>
Subject: Re: [PATCH 0/2] platform/x86/intel: power-domains: Handle failed
 tpmi_init()
Message-Id: <179122633525.41716.8931006501190632649.b4-ty@b4>
Date: Mon, 05 Oct 2026 21:52:15 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 24 Sep 2026 12:36:23 -0700, Kristen Carlson Accardi wrote:

> tpmi_init() can fail before domain_die_map and tpmi_power_domain_mask
> are usable. It returns -ENODEV on CPU models that are not in
> tpmi_cpu_ids, before allocating them, and if cpuhp_setup_state() fails
> it frees them but leaves the pointers set. When the driver is built in,
> its exported helpers stay callable after either failure.
> 
> Patch 1 fixes tpmi_get_linux_die_id(), which dereferences the NULL map.
> uncore-frequency-tpmi calls it when the world-readable die_id sysfs
> attribute is read, so on a multi-die CPU missing from tpmi_cpu_ids that
> read oopses.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/2] platform/x86/intel: power-domains: Handle failed init in tpmi_get_linux_die_id()
      commit: 14a9e1f5d57b3a9e6284d337c88d75ffb17f5869
[2/2] platform/x86/intel: power-domains: Handle failed init in tpmi_get_power_domain_mask()
      commit: 371c7d7b4ed414c22744d5e275dd9b0c8f7052c4

--
 i.

