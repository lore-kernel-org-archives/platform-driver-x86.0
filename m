Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF60486B9B;
	Thu,  1 Oct 2026 07:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838386; cv=none; b=fSgdTy+wFBU4QotKP2FPPD3EevtsWudsO7tGR8pOAnoOWfEhRUmO0twMyA0ZlNdDkc9HRbl0xFgYWbVCOTAFswbghAMIdaD02Kc+YDpVY7EeuomyWLoLIfAxPRqZtGaKZDWja9kk2XBxCfqZjVoKQbfxwQWL/aGpKZ9RViRtCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838386; c=relaxed/simple;
	bh=PQfKJTZ8V3vYw/piNeNEHNJBHlPrSvUzsrOkibzs3VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCBQlPF0wD2NpwtrXgbSdGCvYf7FyGj1wSF23Ic5QTjdkSpY9vmOCcXgfDcp9RA9+yxBoSdgs9IOPbCWTIpMrhF9+hYKNQ6hz1BitQafCbWQbhhfDKPSt8NWcKYQ71hZtwWsmj1OU3iGfvPglbYZKlMAEM/sWw8j6UFuS/sVClI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXfFT2dv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXfFT2dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790838382; x=1822374382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQfKJTZ8V3vYw/piNeNEHNJBHlPrSvUzsrOkibzs3VU=;
  b=UXfFT2dvS9cPUvsAuMmPYUjmvX8WgPMh0VifAkHckek2al0ohiWR+S0B
   SfSIbtAbd6RDqBVVgSHNWWZJTFqPV6etDHTFzu+OhiHNSnNbDGRtvL8gw
   gGv505UtSWy9+Lb8td48jXNdT9ldOGDMcuDa8sN3VrmgDxIWpJ0dSGB5c
   Ca7XrsNiL89k7+pkQArQwi2juCdAX3oJFottbUDVmzG/vLFH5V3MIgl9L
   acAgdeknwXoJ4oA3Gr7RMSgD39yW/rN9c4UEgBjTnubrVCZNCfokpKH5c
   ZWcIa+yZ2nGOGngLSLIKIaamYfoXH/EI4cMd+gKtkMQ++Ds+Mm86Q1CvD
   A==;
X-CSE-ConnectionGUID: JHW3NagcQJSCpvMmeMwUDg==
X-CSE-MsgGUID: LZFXS1WpRrOp0mW2dd5Ovw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91686158"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91686158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:06:14 -0700
X-CSE-ConnectionGUID: 85MWQyWrS1Gn72/Lzl6XWQ==
X-CSE-MsgGUID: 5Fx6Znx2SNuZQuc8a0ZZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275457989"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:06:11 -0700
Date: Thu, 1 Oct 2026 10:06:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, v.vitovt@gmail.com, dmanresa@gmail.com,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the
 resource conflict quirk
Message-ID: <ar4GYJvy_w-ZMJb4@ashevche-desk.local>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930214321.600863-3-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 02:43:14PM -0700, Thierry Chatard wrote:

> The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
> the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
> variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
> same variable, so intel_lpss_acpi fails to bind the controller with
> -EBUSY and the front camera sensor (OV5670, INT3479) is never registered
> unless acpi_enforce_resources=lax is passed.
> 
> Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
> applied to INT3446 on it as well.

> Assisted-by: Claude Code:claude-fable-5-1

Assisted-by: LLM

With the above being corrected,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


