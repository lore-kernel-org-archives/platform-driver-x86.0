Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09E3FBA7
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190183; cv=none; b=sXyJFyLON42KOVdKeBtruaRPCj8yGcaIeTRddDXOPOz90knTIxmULLaTI7/x1FbTisEd8bhNX8r9AEGdrtlrf54769j5EacCtMWymcb9LSspRuRS6435NJol5K7d4f1v3Bwr4Q0k10CQfbB2hv7oLMHhHScfiBvTdNmfxF29dpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190183; c=relaxed/simple;
	bh=2KUQ9u5txuLb0IKOA9fpbXgp6JZ2lpTvlm/Gko6OMmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s4ubpOX/vCOudBhZGZkuyV09+V3yJSShfXoQh7M1Mk4NqkclPH5ZK+1+7bchW7vyNdA2x6svYpaOo4B4ED4DzdrVGADHiHviJowXUuKICifERO2UQ2FvAlERCMuOjF986AbNf+CefpQE1NVSjY78x9B8sBE+zTbKMOjmu4CGSxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emZuGZqp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emZuGZqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190183; x=1812726183;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2KUQ9u5txuLb0IKOA9fpbXgp6JZ2lpTvlm/Gko6OMmI=;
  b=emZuGZqpYKvlh3ifk8R13G55ba1SBFkRiSupoegISIt8hMyQCydK/Sxh
   W4vKKQeDstbM4s5AEHm6TiKtZMDLdJ0nmlnSNv8m6Tw2JRIJFjkMNiYuq
   pPoM+ZAayRW8gK/R1yID3NTjO3XVm8QMzrC6wTgaaaQVUm0RqqFT9fKSH
   EvfVlkRQvYxyKnPHxco3EpjIyMveJOKoU+0lf4K9tuVo81vCPbyzkXBfD
   YV76GE8rUk3aAiYhv7a2sUQ6fzwoSXulzSE/f1Et666XCImkAD36qdpSm
   0aJlMLELmSgKgaNCo42QaRLjPdDynXqLPQ24qdilzooctdw/UT8o2waUB
   A==;
X-CSE-ConnectionGUID: 8lfejPmuQXeauR2BHtW4Sg==
X-CSE-MsgGUID: 82sVo4NXRbOj3CBh4nC9MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85844453"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85844453"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:03:03 -0700
X-CSE-ConnectionGUID: jRwUZt4dSmWF1U2xFt/67w==
X-CSE-MsgGUID: D9mRYwI6QZ+WrOivO9wB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250786036"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:03:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260611001238.391045-1-enelsonmoore@gmail.com>
References: <20260611001238.391045-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-privacy: correct
 CONFIG_DELL_WMI_PRIVACY macro name in comments
Message-Id: <178119017550.12014.9884169009266468177.b4-ty@b4>
Date: Thu, 11 Jun 2026 18:02:55 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 10 Jun 2026 17:12:34 -0700, Ethan Nelson-Moore wrote:

> Comments in drivers/platform/x86/dell/dell-wmi-privacy.h incorrectly
> refer to CONFIG_DELL_PRIVACY instead of CONFIG_DELL_WMI_PRIVACY.
> Correct them.
> 
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-privacy: correct CONFIG_DELL_WMI_PRIVACY macro name in comments
      commit: 25fbff92dd485eb15eaf1aa7252a99fcaabfef5e

--
 i.

