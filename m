Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9353314A62;
	Wed,  5 Nov 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762345495; cv=none; b=F9w9IHacopC3yCrV5LzPEdYawqHIGa45hsliZrrNRWte8KctH/2/j5zUaR7xIU+i8ndaiYe90X3uLVOGEq0LfTNIqZOZHkX8tT6eBpGjQlrGxC87Oh6ON+zp+zTNtKu3L8AT5xlywxD410CG2LGd0Jw/uz34eBJiDtbfnGDOtyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762345495; c=relaxed/simple;
	bh=FKFCO9REDvc4qdrHAWjM2S45BMi7OlPGh6Peucxlhzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JZnr7LWnp/ELmrZ+o41uSK6j1DkZdlMfz+QgeEnx0FXDuJ4RmqtPqG7P84tEhwF3AxAA8nk5vJnYL1jpcKNTEBLouXAGb8YO9cLYxMffs4+DvXNxo1ZQFJROXht3oSFzHG0XJPZ/oxalsFJAo0CxsCXKVYe4Tx9msaJnNVXF4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hH734Fyu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hH734Fyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762345493; x=1793881493;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FKFCO9REDvc4qdrHAWjM2S45BMi7OlPGh6Peucxlhzo=;
  b=hH734FyuCoYWrzfM4ReSK0YE8yt02bg9TCguFg16jGhpsfJmzSCgZoZH
   hR5YIH0jcFBEocoDze0tkybPpLgUDBlpZvynCE++sHiuUC5Kqm91BFGEH
   8Bsm6Q0WA/K/DbBnwurdEFvUu3UdzBoBIJxZpG5hBOA333m3geq4p1SOl
   BXpF0hvUXZ58adP3bW00jx/9Ifuy9NKUvn01X5VeKvVuxpg0WhyykpJ3c
   YQuNPN0EdnKxPeQwvImfiKSuS5HvaaFXWVaiVFN710jxIZfxA0SfqtWjj
   nBObvCGymeuMYf0LbiX1qP9/jGlaUsjZpY6HlFBpgMl0gZ6TLhVjHN6tu
   A==;
X-CSE-ConnectionGUID: F8MIST8+TVyKbOsLpsdE2w==
X-CSE-MsgGUID: whqHEojYTQ6qQ0a0XH1hFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63663189"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="63663189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 04:24:53 -0800
X-CSE-ConnectionGUID: D75+d1xyQcqguPdfkIKw1A==
X-CSE-MsgGUID: 7tIFXF4CTHmFbyMYzt+dLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="191542555"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.252])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 04:24:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com, 
 hansg@kernel.org, Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
In-Reply-To: <20251008135057.731928-1-lkml@antheas.dev>
References: <20251008135057.731928-1-lkml@antheas.dev>
Subject: Re: [PATCH v1] platform/x86/amd: pmc: Add Lenovo Legion Go 2 to
 pmc quirk list
Message-Id: <176234547810.15175.1595657174833282941.b4-ty@linux.intel.com>
Date: Wed, 05 Nov 2025 14:24:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 08 Oct 2025 15:50:57 +0200, Antheas Kapenekakis wrote:

> The Lenovo Legion Go 2 takes a long time to resume from suspend.
> This is due to it having an nvme resume handler that interferes
> with IOMMU mappings. It is a common issue with older Lenovo
> laptops. Adding it to that quirk list fixes this issue.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd: pmc: Add Lenovo Legion Go 2 to pmc quirk list
      commit: ad537973e63dbd8fa1342489c818ab26cf447649

--
 i.

