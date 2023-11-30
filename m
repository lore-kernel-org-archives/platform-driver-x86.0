Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbPOrgNo"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0556410D4;
	Thu, 30 Nov 2023 03:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701343427; x=1732879427;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=S8giDAScfsMaHIxPvvA4qJXz/c0MrXpZlaY93EzUGkE=;
  b=dbPOrgNoxVVOoOYsEICp21e5rY49jSE9f83xSSLnRznlvQUa+uNGNOs0
   KwBVmr7p7xanvhGlNaLzifZdhuhY5XWAr2YlCdPLVe/XHSxw6uXq/CruF
   msdpnfnEANXNCY0v5CldjkHqU0K1+D+v5apP23i8O3XVNXQp4chl52HlV
   y7HCWBdFhQqkO+5dLRy4BdCxEGpT7ghvIi8D/Rhb1os3fG2SiPgIGLeKg
   dJ6WF1YUSUK9kMX3Wpx+Pog8lO2qVHNUOdRu5CADQyjGrZLf7Vfo38RdB
   Vnl4vKfdhihzNp2i2/2I1PjnmCpRnxo+7X5MV8bUeBMgAQAugv7io0MZU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397202688"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="397202688"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="773031864"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="773031864"
Received: from bergler-mobl.ger.corp.intel.com ([10.249.33.30])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:23:44 -0800
Date: Thu, 30 Nov 2023 13:23:42 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V6 07/20] platform/x86/intel/vsec: Add
 intel_vsec_register
In-Reply-To: <20231129222132.2331261-8-david.e.box@linux.intel.com>
Message-ID: <424fd873-fcae-1b3-94d-28656e9913f@linux.intel.com>
References: <20231129222132.2331261-1-david.e.box@linux.intel.com> <20231129222132.2331261-8-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1651999280-1701343425=:1808"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1651999280-1701343425=:1808
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 29 Nov 2023, David E. Box wrote:

> From: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> 
> Add and export intel_vsec_register() to allow the registration of Intel
> extended capabilities from other drivers. Add check to look for memory
> conflicts before registering a new capability. Since the vsec provider
> may not be a PCI device, add a parent field to
> intel_vsec_platform_info() to allow specifying the parent device for
> device managed cleanup.
> 
> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1651999280-1701343425=:1808--
