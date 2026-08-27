Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95EA352F86;
	Thu, 27 Aug 2026 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814841; cv=none; b=n+Vh3T8446u0fpeI08aUmlkE0HUplocoGJOfsicNMZ0aTqgFBHIphUZBBJ3TZ7d4lq7PILLq64ANFCHwMbesR2upH6dxWZ/snJiPOEjQwhc0Tc4XiMp0B+9G61INP2ZR6Z6S5ryolQG3Wh0nlSTjPMDVo13LvAD/gIkq4XBwDrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814841; c=relaxed/simple;
	bh=TPN6JLky9xxCtPRlxyln7iu7yuY5PMUDMuigR75lduY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4v+PCvts3/tKPlxOuhQZh+2mhm/2o3PrRgHSpK90iWT/3k8/4iZuH/WuwZyxqeYrUXGts8cgH/Sp4e9zV4XEeP96IHsg83cTUTnKchAsH9XYw2uA10YdWTrA/CISBy8m2Xx9rV5DZl+7z+l2q6nsDTQRfISzEZXos1GR+fbwTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gry4e1Xl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gry4e1Xl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787814838; x=1819350838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TPN6JLky9xxCtPRlxyln7iu7yuY5PMUDMuigR75lduY=;
  b=gry4e1Xlwax4Un79AL3APBSVnCP16kvNPsc32AT07MHcb68jUtTAv25T
   E9ZW9S/+LhBGElXJravT0E0me8Xuvj8rrfiyNhmWin2Z0wDCmJ9qRAuPu
   9FJr7Ibs7WoyemzOy48ij7aqyXcShfxga88ofTk7nZrZahlSKOw9MZvRn
   jIGRRuFT07YYkV6f+fxwr7OqRNbl1Uv031B51R8WV/xs/yn8XEi4NKZnp
   lIC2qdJg8wi0XKmmKAjCCAnVK1ZtgKARqVwZR5goPodcnLeJ5YGLp5rVm
   /l6pYmrHtso2en5SEkt36eEiPRJMxps490ZS412srcuiWJidjFTEsKKMX
   Q==;
X-CSE-ConnectionGUID: mv4NiI0vT6KPsmscKKZ4Hg==
X-CSE-MsgGUID: Q0Z9z/10S3SakRFAdpvT3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92124786"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="92124786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:13:58 -0700
X-CSE-ConnectionGUID: jYpRzVsJSJak1bxzcRX1uQ==
X-CSE-MsgGUID: 0GbjsYz1SIKNjbQyH/PY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="272022052"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:13:54 -0700
Date: Thu, 27 Aug 2026 10:13:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v8 1/6] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
Message-ID: <ao_jsFUSa8GmgHnr@ashevche-desk.local>
References: <20260826112452.13539-1-tchatard@gmail.com>
 <20260826112452.13539-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112452.13539-2-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

Again, there is an in-thread new version, DO NOT DO this!
If you send a new version, start a *new* email thread.
With that, the v8 has no cover letter...

Note, using `b4` tool will help you in preparing patch series properly.

On Wed, Aug 26, 2026 at 01:24:46PM +0200, Thierry Chatard wrote:

> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Match the affected machine by DMI and the affected device by ACPI ID,
> carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
> applying it to the per-device info in probe. This follows the quirk
> organisation used by the PCI counterpart.

It's okay now,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


