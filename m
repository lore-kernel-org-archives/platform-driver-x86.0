Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3F4582D6;
	Mon, 31 Aug 2026 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195815; cv=none; b=DmnCydw17PYGC8Sl55mUbgEys4ZcEJCevhPVnXF7J+k8kUFofF/iVixf5Mf4gPCZlZFlVujBRYpbG8e+OneQ0k/Gtk856vof0+m8gfHE4/WozNi82Ixj645r/9vL4JxcE3ySpCV97zfRaIR0R2SoFxdAu6zdnGLSQDIi5IbGKpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195815; c=relaxed/simple;
	bh=4611Z0VV+s7wWwSp7KHSOZRdPQarklxCoG6iDxC5sII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ACX+cWq7Qe1Tuftubfux+87VQ+OrPwKOTrKBHDdjFqa3dHIDxRX71EcfE80abo0imUigImq/rtJp0LeoEtYWcRPTkBSIUmFStm5N69l8PkOgqzjsN0970J4YxnouoANLKCmN8ngWFyqkIFxLfDXT9Nsuh4vn8yWU0dIIQnuGszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtDG40/C; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtDG40/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788195814; x=1819731814;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4611Z0VV+s7wWwSp7KHSOZRdPQarklxCoG6iDxC5sII=;
  b=mtDG40/Ce5opB5qRyDsBtiztcX573qauc1CalVStB6cnusMt2Pzo1+Hh
   8KPPOhoBfs+vnwF2KvQI1F6AYyYy+i0pibkXZd2eetQgPEtdqE/QAsZKI
   aEz6Gd/h9aN5QjQYppnuAjlY9LL951iFlDhLnnBAJNhNn5yGhWFU2CGFW
   Hgk4lnAfMfLrbFBBXcjOghAghUbbm+SYWNAaY54tLT/5XNZXx9glHW+FX
   QeXwbeasWzSR1AsyFuY69rciTWZJFy8Q4/k5foLrgFK3UsNM11hyZIIzR
   hLGhITCnSYtxwHMrsWP2x9kk6EOJABY1HKKsjHBnIb0kKjtzjo1Fyzkud
   g==;
X-CSE-ConnectionGUID: UDDvQJCWSjO7tABuDjTx5w==
X-CSE-MsgGUID: gVn6fhT4Sr2lCS0ErWUNrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88659161"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88659161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:03:33 -0700
X-CSE-ConnectionGUID: mvHnV464QfeM+7oB1Caorg==
X-CSE-MsgGUID: xPqmCP/GSnyEhF9bSAx1pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="265139161"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.121])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:03:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, Pedro Falcato <pfalcato@suse.de>
Cc: Sanket Goswami <Sanket.Goswami@amd.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Oleksandr Natalenko <oleksandr@natalenko.name>
In-Reply-To: <20260831114346.2041361-1-pfalcato@suse.de>
References: <20260831114346.2041361-1-pfalcato@suse.de>
Subject: Re: [PATCH] platform/x86/amd/pmf: fix build on
 !CONFIG_AMD_PMF_DEBUG
Message-Id: <178819580532.5778.14908306187055873003.b4-ty@b4>
Date: Mon, 31 Aug 2026 20:03:25 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 31 Aug 2026 12:43:46 +0100, Pedro Falcato wrote:

> amd_pmf_get_ta_custom_bios_inputs() is used by non-debug features.
> 
> Fix the build on !CONFIG_AMD_PMF_DEBUG by moving
> amd_pmf_get_ta_custom_bios_inputs() outside the ifdef CONFIG_AMD_PMF_DEBUG.


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: fix build on !CONFIG_AMD_PMF_DEBUG
      commit: 9048155855ce84065645c8db7823ab7e218e49cc

--
 i.

