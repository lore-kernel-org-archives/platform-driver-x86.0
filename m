Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F97B3C09E5;
	Thu,  1 Oct 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879669; cv=none; b=NTb2Ws5HSQ91MhQyKyNF6TMdq09jJDcI8tnAvr6OUol6kzCIYi00Nn8oEeFXiXMocGQpLvfFxuv6WIoSdO2lPxaX+m/tNnj5evBIMKdGVHqtugFRBOP4UAOCYYguSYuwPALE0LhiN/Kd+Zl3e9xhjRv+vpZq6UI25zF9bJh79Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879669; c=relaxed/simple;
	bh=TL3i3xudEraGcY7ggiZASTQVHtZIS72OAyyv3WBq6/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMMybOVgPCL7BEr1Ww8k32F7JnIdEpZL/B0Z3SEYJ5F5tkkVFm1Hk4pZy47zwCifX8ypu4SuM1wQDXWCuGnzpDIBzOqMStPB+1qGz020TF46ynEUf9EwdyHkYIKzHU4ZGCPy1uSlYryu0jsAKCrENE1q5zkUxJ+pqdJS40KWS3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIQzNY7a; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIQzNY7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790879667; x=1822415667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TL3i3xudEraGcY7ggiZASTQVHtZIS72OAyyv3WBq6/Q=;
  b=GIQzNY7aIN+vMtBTbuEi0264KSYnvGshatECSmob70DHLINgoMnduxB3
   +0pzHSnBlCJl82E6E/sFZ68WIMwyLXeKAk4jtqme5bQDt8c+Ro3hB67kg
   4sH2eAjgFjlcZsp9Cfb3wPkX9YAKFnhzjL3x7BpqV8E4OuTiF1gnxOToW
   sIo5J3ewlBw3OaeJmfn/C+JSYS0Rq4jBHvl+zmZ/lbgt5JogxGxWQHNis
   GBBFNMUT5uCfv+7FAohPBGeHd+e4Whg1Vs5HdUbMRnavveJoT2/1v2Hpp
   hDWWmG4zTj1VlcmNnUNA6O+F2oJ2lKGFecTlXt3Lm/hnbptlkBJ78Ry1A
   g==;
X-CSE-ConnectionGUID: hRgNCbB1RZ2P9FqJF4p2JQ==
X-CSE-MsgGUID: alM4i0PSRKapB8gCRYi48g==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94135401"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94135401"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:34:27 -0700
X-CSE-ConnectionGUID: LuiiE+6+SdOBYvzhX8m4Ww==
X-CSE-MsgGUID: vjJ1OiTxQ+KLUHxWsOM6RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274694057"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:34:23 -0700
Date: Thu, 1 Oct 2026 21:34:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org,
	hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com, dmanresa@gmail.com
Subject: Re: [PATCH v11 1/9] mfd: intel-lpss: add resource conflict quirk for
 Dell Latitude 5285
Message-ID: <ar6nrcQfDYAg2L-M@ashevche-desk.local>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-2-tchatard@gmail.com>
 <ar4GIfvaxGiykYKX@ashevche-desk.local>
 <ar4KtbRTyJR0Bo-b@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar4KtbRTyJR0Bo-b@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 01, 2026 at 10:24:37AM +0300, Sakari Ailus wrote:
> On Thu, Oct 01, 2026 at 10:05:05AM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 30, 2026 at 02:43:13PM -0700, Thierry Chatard wrote:
> > > The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> > > and the I2C4 controller (INT3446) both claim the same MMIO region via the
> > > shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> > > with -EBUSY, preventing the front camera (OV5670) sensor from being
> > > registered.
> > > 
> > > Match the affected machine by DMI and the affected device by ACPI ID,
> > > carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
> > > applying it to the per-device info in probe. This follows the quirk
> > > organisation used by the PCI counterpart.
> > 
> > > Assisted-by: Claude Code:claude-opus-4-8
> > 
> > Assisted-by: LLM
> 
> While coding-assistants.rst does indeed suggest to just use "LLM", I think
> more specific information is worth having, too. Specifying this seems
> commonplace elsewhere. I have to admit I haven't followed the related
> discussions.

While 80 characters is recommended, you are strict about that rule,
I believe the same about Assisted-by. It *is* documented.

-- 
With Best Regards,
Andy Shevchenko


