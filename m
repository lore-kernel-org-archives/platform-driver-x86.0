Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F943054FE
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325519; cv=none; b=qc7DUZoFKCW4Qgy7XDdkQMwdSJ8SmTzzixRfMgsi/4zSvXITFrlho39b4JBUBK9V8VE238yuDfzrSA+DW9mirOMquT5ZZfl2wYEptAAxpLjZraIO5KJZkOrfpEypyZ5c/Ira+Dz2//OyWN4eMiy1XClKTnbEyuUvmS2JKXGIctI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325519; c=relaxed/simple;
	bh=a0Zro89m16AU2Mp8jHcIOn3SEdspUAjRNcdbf3eCjk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kgdS+yn3LaE2/IAG9TTsSTZOw08em+2A4IvDZdnUBvbtC2lHpt+r57Ukj5HdZQ73kZeNN3QAZ1e6rzMvCnr3eAMrra1lg8JBaNtaHclDXUnolCEJge+9EsYHiQtxNsfmbL3wzHhC6IPQ/jdP+StXRlpQIJwMzhoMQcWoVHkQ+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIOcZmro; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIOcZmro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764325518; x=1795861518;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=a0Zro89m16AU2Mp8jHcIOn3SEdspUAjRNcdbf3eCjk4=;
  b=fIOcZmrohJGgigpZWENmk6RU9f/a+lr2jEl6Zt7gYNh2weLnp7m/IJAv
   dLvnZ4pnKphLxbfZiLtVu1Hi67ZPQlUlyX4IwVrV8KLUORiSgUu1k2diV
   BEH7adAnvAHoK0rCJJZunxIxGhQhs7IexxoHq2wOqIDF04UjcFeKVutTc
   CUdLVYOksJwDVeWWFUJW1VDusAfgi2qZQPUZ2QGyJzBGvfzLSVtkEsvZH
   lFaRkhZhVqEmxrJKdbdaba/SJO1h+lply1xnErpTATqtCAaljulVTpTSa
   nJbmbUKAa33mn7/vw0jKQi1gGm2HhNbi7HjyoLT8Q+t1sIUlqE0pANvrt
   A==;
X-CSE-ConnectionGUID: LXO0jLDIS6mgem8OKVI13w==
X-CSE-MsgGUID: mdwJ8JJLQUui/sPSI5jbPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66255983"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66255983"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:25:16 -0800
X-CSE-ConnectionGUID: q/LrtyxOShqjpPWWP9nbQA==
X-CSE-MsgGUID: mBhvsZ39SWqEnoiG1+BvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197905471"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.229])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:25:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com
In-Reply-To: <20251127091038.2088387-1-Shyam-sundar.S-k@amd.com>
References: <20251127091038.2088387-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3] platform/x86/amd/pmf: Refactor repetitive BIOS
 output handling
Message-Id: <176432550890.7427.18321085335210604149.b4-ty@linux.intel.com>
Date: Fri, 28 Nov 2025 12:25:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 27 Nov 2025 14:40:38 +0530, Shyam Sundar S K wrote:

> Replace repetitive switch-case statements for PMF_POLICY_BIOS_OUTPUT_*
> with a helper function and consolidated case handling. This reduces code
> duplication and improves maintainability.
> 
> The 10 BIOS output policies (PMF_POLICY_BIOS_OUTPUT_1 through
> PMF_POLICY_BIOS_OUTPUT_10) previously each had individual case statements
> with identical logic. This patch introduces
> amd_pmf_get_bios_output_idx() to map policy values to array indices,
> consolidating the handling into a single case block with fallthrough.
> Also, add a new function amd_pmf_update_bios_output() to simplify the code
> handling.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Refactor repetitive BIOS output handling
      commit: 278ff7048466349e32d85afd62a4fcaf398ac23e

--
 i.

