Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E51397AA0;
	Thu, 15 Jan 2026 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487239; cv=none; b=BFiXLAJEVvSuI6sut8J3tULd9tGP6jHZSDni99p95NUwZ5unyBH4xJm/dYM2rt5chS1DXfRFS0FT6eTOR4WF1pk8do65h2hbHLhh63KU1d3ZFvjg8F9zDDGWAuS0EswKptt4azGmNdl2kVJUlUh/Sglc3ezxBM5SHHFztozmNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487239; c=relaxed/simple;
	bh=P7u9MzcbLtoIzSEkBW21ag4V86EvYjQGcyKKjyUY444=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rNQuDcJz0TR73ilHMNRaJY1xq58Ze1+2uKlyynZh/WYkr3ap6CEb/oqduwGe7WGneWmusgxkEbTBu+xA+tBCmJ8IRcNoA+nsg6oWH0A9o6dGjSzOfJq3gks5TmOHIGIHA/UF5JNUJGQ6c3+0imzZu1RZBp1+kRZDs6zT3j8Vbns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwCbqahV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwCbqahV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768487239; x=1800023239;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=P7u9MzcbLtoIzSEkBW21ag4V86EvYjQGcyKKjyUY444=;
  b=LwCbqahVp0QuFXPexlkRMcxUMJK8cvkANrthDsYlhl1um5mUHA6l+fKP
   0IoH+BgmngDC/cM/jzzES6Rn/yK43el7kL2FdvuOB6YRSnk8tNCGACErb
   ouZ5jltg9jexiCaYpLj3RbGojJQoPjACiTn5qGCdjN3nqNqb3PN/weXXX
   yGDpqy+cZ6HJhVrbmVck/6AzJUQkG2v4NG4PSYi3KZD3Zkfcg/ebMoAad
   RGP+YxuA+xXO9tpH6oMQdrqWUMeHK3Ilfxa93jzEy3u6dlHWlk9Z8NT8i
   c01G4gC1v3t4ijpp35oPdge0v4T0WxnieC+cpEhwHOhTQJO4uYVKsWW36
   A==;
X-CSE-ConnectionGUID: muJbMES4RvWUZp62vlSw3g==
X-CSE-MsgGUID: 0UpExTIwRLimSat+WY+IGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80095754"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80095754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:18 -0800
X-CSE-ConnectionGUID: a4939zLISP+sXUstWnntbw==
X-CSE-MsgGUID: ddGSJjevSzqTtU2KuL/6Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205244737"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Zilin Guan <zilin@seu.edu.cn>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jianhao Xu <jianhao.xu@seu.edu.cn>
In-Reply-To: <20260106091318.747019-1-zilin@seu.edu.cn>
References: <20260106091318.747019-1-zilin@seu.edu.cn>
Subject: Re: [PATCH v3 1/2] platform/x86/amd: Fix memory leak in
 wbrf_record()
Message-Id: <176848723129.21830.12668606788089756281.b4-ty@linux.intel.com>
Date: Thu, 15 Jan 2026 16:27:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 Jan 2026 09:13:17 +0000, Zilin Guan wrote:

> The tmp buffer is allocated using kcalloc() but is not freed if
> acpi_evaluate_dsm() fails. This causes a memory leak in the error path.
> 
> Fix this by explicitly freeing the tmp buffer in the error handling
> path of acpi_evaluate_dsm().
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd: Fix memory leak in wbrf_record()
      commit: 2bf1877b7094c684e1d652cac6912cfbc507ad3e
[2/2] platform/x86/amd: Use scope-based cleanup for wbrf_record()
      (no commit info)

--
 i.

