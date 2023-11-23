Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVf4/deQ"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51ABE1BE;
	Thu, 23 Nov 2023 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700749621; x=1732285621;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MtqW72oag4/4GZbQ7Er6KLeHtjui7ZsipvyNM7GDrQI=;
  b=JVf4/deQ13/9IiTimdEaRA1K5qu4ukORALzeNcf2t89xYSuyk3znDDep
   7gCjkkDrVuCCEMILPVYpkmDMs2+rX421p1VDMbuCwrGvQgn/07BCndY9k
   mxMmiLqFaCL4tKWv4I0uJzwnr1RMq1JLT3Kwu++4hpqzL9kW2efISsNtx
   HkMVrcpawWlhdbjZnDUZwi+JCCD/FiaGaXZdfROGokWq55cu/e10MZl8A
   frBIP1cPs8+zV/VtgfurCKFjifSb1CnoXUw6f5rMIG4uaZauJ7iUIxOAW
   dRu9UQ6Gy9lT1lwN4gy+KQGZDFXFoFjM4jL0tBVGyNysQAUPJ754DKa+t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="10950158"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="10950158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 06:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="15674834"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 06:26:59 -0800
Date: Thu, 23 Nov 2023 16:26:56 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V5 14/20] platform/x86/intel/pmc/mtl: Use return value
 from pmc_core_ssram_init()
In-Reply-To: <20231123040355.82139-15-david.e.box@linux.intel.com>
Message-ID: <2532647-c5ca-9276-6013-9e389d396cfe@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com> <20231123040355.82139-15-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-462658715-1700749620=:1676"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-462658715-1700749620=:1676
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 22 Nov 2023, David E. Box wrote:

> Instead of checking for a NULL regbase, use the return value from
> pmc_core_ssram_init() to check if PMC discovery was successful. If not, use
> the legacy enumeration method (which only works for the primary PMC).
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-462658715-1700749620=:1676--
