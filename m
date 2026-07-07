Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636E42CAF8;
	Tue,  7 Jul 2026 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444098; cv=none; b=oHcfcIbjxfhGQE0mltk4dtD6QubHSMC6pLo9nTgQ5v0ajgK+LbhphQ2vjZ4wkBY4G+Wf7jQRDOZIyEDvAgFBrWphQrpSlND4d+Qrb2qN77rNA3FjBshUv5hicYMkPixiHL+0V4BYXvAyjntONwr5ptC6s14UnAEfjowx/Sbgonk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444098; c=relaxed/simple;
	bh=Q2jQ3cT49tLXxo5V2A56SpKnmWUGrKE6u0Tjywgl8XI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pHIx4QUTbtXgaFrgZiGGclLY6bvbwrhte0cpn8KaRe618j0ziK5HhX8+pW5KBh2Oe/ULxGtvY30Jhj+rV4iM7KYPIIpG4TK00UlrbszIBWk34a0WgmRR5WEQ6ukzTynX0dbTXlFNrafJ6l0+bIKsZsnyjYxH4ksRtXvBhUNlst8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLjv39uU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLjv39uU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783444097; x=1814980097;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Q2jQ3cT49tLXxo5V2A56SpKnmWUGrKE6u0Tjywgl8XI=;
  b=iLjv39uUQAtkxXNNQEPg7v2ILR7op0ja5RYfdu3gVjw9spWQXXa+CRlK
   UX5z/aO6rXrjAttmXTHvR+FC8qa37LJ+ydBr/DYy2B2DsAmclXa7vmwGF
   IRLxiQJ1MOWIE2Ela2hacc3WKMAFW8Ar+mafhpF1aY7e4tuqRX1DNEw78
   9WSMyeAHlWMhX6qWLdB1ZycIjod7GHkjiwnXI574mLY+5odc+YwtAWja3
   JRH6PwC4e6dC0XtyHQeriaM2fGY7RF0TYvX5w5R7oGWJMWbwOvAHglMcE
   5aUkp5ktPKJHRjmkppi51TpcwA3YyL3FRHq7MaZSc6706jiytnZB+yTsP
   A==;
X-CSE-ConnectionGUID: KSVktsmFSuKEQgodWEaKnA==
X-CSE-MsgGUID: VYhUNjlnRxSFkzc1HEIp4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83075236"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83075236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:08:16 -0700
X-CSE-ConnectionGUID: MGrsmnB2QfmHoT9TzdwAoA==
X-CSE-MsgGUID: ueededJ5Rl+DJ+S1eQNApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253565171"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:08:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Shaposhnikov Daniil <2minesweeper2@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525130058.7408-1-2minesweeper2@gmail.com>
References: <20260525130058.7408-1-2minesweeper2@gmail.com>
Subject: Re: [PATCH v3 0/1] platform/x86: huawei-wmi: add ACPI fallback for
 Fn-lock on newer models
Message-Id: <178344406945.17784.8885689347208426505.b4-ty@b4>
Date: Tue, 07 Jul 2026 20:07:49 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 25 May 2026 18:00:56 +0500, Shaposhnikov Daniil wrote:

> Changes in v3:
> 
> Fixed and improved error handling in huawei_acpi_fn_lock_set
> Added FN_LOCK_ACPI_STAT_OK macro to describe successful STAT byte value
> 
> Shaposhnikov Daniil (1):
>   platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer
>     models
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
[1/1] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer models
      commit: 9628a53a77adf1e2e84615eb16f7d564855b77dc

--
 i.

