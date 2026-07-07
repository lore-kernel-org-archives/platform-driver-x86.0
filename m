Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9918A379C32;
	Tue,  7 Jul 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437426; cv=none; b=IoJe2V5YgNoTiW/Ux4x1mDXvt2qX6xi1zdrjRowplD9ui0cc6FWeTOM6hSc2QDBSHzuQy98IPSctPXW/tBKbCUBD/bxhAOEHgBuUhdNxPqbfJ31eMbtHQuo1a2jy2+potFwbV1PxaUxVPTofMgns898bXjmw3y5nzltDNQFSb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437426; c=relaxed/simple;
	bh=Spk2Tn656ZElmMqK8zZZnKKWbRPJIrpq2y1v6mSg06E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYXQFoH2jQxIHQHklM6vpam+i0x6B4s1T1k8p4WDWbJxWcFQtHynghu8wYGQnui1p96N/GVRQszocWzQMoLHLi8GcsTLlB4fPyx4Ty07rsXYZquWY6/Y7m0eWmEy0tRknn9UOXV1EQX37isDoBrtrHz5uf0yZ4jlvJcp4yWTuG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSFv6TrV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSFv6TrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783437424; x=1814973424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Spk2Tn656ZElmMqK8zZZnKKWbRPJIrpq2y1v6mSg06E=;
  b=jSFv6TrVdIs4HbrHcGkXRckq4helkI4p/5ELrj5PpiSUnndfInnDQBBe
   FTRSgj63KpbYkkVO8tt8TuDrDfjPQ87kbSM0lpXd6OdybZecoNjulcc4n
   b0kKHVni1jyLmc7VgZIYSnSBfGLbb3bHLu3bPFyg7bCJjEMZW8G2lye1p
   XSacxtCCdy9/hNO1c5jRcaN0+HvxdfNEXAQ3EYL0knZ8NWXESHguGiKJE
   TN4/r3xQYbw6Jmo1eSyec7DeVK/0EiUPEbYcc3Pojgn9be3DT10myxrPj
   /tVJ/7Pw8aKrOw07X76wcs2akXsMBhaJ+RMX2r6+mnTvTVAjw29/+Os9N
   A==;
X-CSE-ConnectionGUID: feDbTGvCQdWq0j9f8T9/UQ==
X-CSE-MsgGUID: kEey53/YRLWwET32yddsCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71606497"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71606497"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 08:17:04 -0700
X-CSE-ConnectionGUID: x0LcIAFVT2Glanwt4KVFDg==
X-CSE-MsgGUID: spyZWcBpTjyhudrxxWVGhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254106239"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.36])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 08:17:02 -0700
Date: Tue, 7 Jul 2026 18:16:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: goutongchen@uniontech.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, hansg@kernel.org,
	ilpojarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, raoxu@uniontech.com,
	shaoyang@uniontech.com
Subject: Re: [PATCH] platform/x86: think-lmi: Fix "Call Trace" error warning
Message-ID: <ak0YaxtDFRs8iV7T@ashevche-desk.local>
References: <20260707091555.71007-1-goutongchen@uniontech.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707091555.71007-1-goutongchen@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 07, 2026 at 05:15:55PM +0800, goutongchen@uniontech.com wrote:
> From: goutongchen <goutongchen@uniontech.com>

Use your real name and not an alias.

> The maximum BIOS password length returned by the Lenovo platform BIOS/WMI

Which platform? We need more details about the BIOS/HW.

> exceeded the size assumed by the think_lmi driver's internal static
> buffer, causing the driver to trigger a WARN_ON() during self-checks.
> 
> Increase TLMI_PWD_BUFSIZE from 128 to 256 to eliminate the recurring
> Call Trace warnings.
> 
> Here is the kernel warning triggered by the bug:
> 
>   kernel: WARNING: CPU: 4 PID: 665 at drivers/platform/x86/think-lmi.c:326
>   kernel:        tlmi_get_pwd_settings.constprop.0+0xe6/0x130 [think_lmi]
>   kernel: Call Trace:
>   kernel:  tlmi_analyze+0x31c/0x640 [think_lmi]
>   ...

> Fixes: 651b57dd4087 ("platform/x86: Move Lenovo files into lenovo subdir")
> Signed-off-by: goutongchen <goutongchen@uniontech.com>

Ditto.

-- 
With Best Regards,
Andy Shevchenko


