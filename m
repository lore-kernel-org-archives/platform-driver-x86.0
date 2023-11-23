Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSOaDJdd"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D231BD;
	Thu, 23 Nov 2023 06:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700748507; x=1732284507;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=umwDKZhXx2hLm7DW386Y1ZZ1CWEgbWF3n/PNhEesmmM=;
  b=BSOaDJddjAEfZsRpCzksWMDGyhD7fmQq9dUiJJ1X3m41aPXF9bi/SB/Y
   KGJl3YB2t6lC+H2aRsJ/fEEnafVqkiFovrKKMfHx/wadi6TVQnIxYjGTr
   PWSZ+ZwPZJAom7jTVNP9MrUOgvhg/A86jDOYu59LEMArQ5O2gZtiMZIik
   voKtMsgYeHN+xbXtx4a378boGf6nLc87/POR1W9V/X7E2UJzKGC9IHF15
   WFY/z9AJewMsrsvcAWCLqQbxK1czcyYk1DMfVk2t9dPcXZV9HjFApAAaU
   e94mgA5QNuYq4BK+95WZyPssGw56Z82s7g4+n8FjmZzZahKmQM6QsgwYr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377296321"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="377296321"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 06:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098833895"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="1098833895"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 06:08:25 -0800
Date: Thu, 23 Nov 2023 16:08:23 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V5 16/20] platform/x86/intel/pmc: Display LPM requirements
 for multiple PMCs
In-Reply-To: <20231123040355.82139-17-david.e.box@linux.intel.com>
Message-ID: <fe419f5-3ff3-3677-419-735dd7e66473@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com> <20231123040355.82139-17-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2093636943-1700748506=:1676"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2093636943-1700748506=:1676
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 22 Nov 2023, David E. Box wrote:

> From: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> 
> Update the substate_requirements attribute to display the requirements for
> all the PMCs on a package.
> 
> Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---

This change looked fine.

However, I spent considerable time in figuring out the addition of 
lpm_req_regs NULL check so it would be nice to mention it in the commit 
message that since the caller's primary_pmc->lpm_req_regs check no longer 
covers all pmcs, it has to checked within the loop. It's was far from 
obvious whether it was a bugfix accidently mixed together with this patch 
or required by this change itself but I managed to finally convince 
myself it's the latter.

With that noted down for the benefit of the next unfortunate victim who 
has to read this change from the git history, :-)

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-2093636943-1700748506=:1676--
