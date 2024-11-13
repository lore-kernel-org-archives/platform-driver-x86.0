Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6E1FB89A
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731494317; cv=none; b=M7kEoG8THhotJWPG/GwiHsuSYxbg/O/3a9TSMYBluRPQj1AiNwopMe22fdurYPWZPouE1tYj8xgtzLVAKhLlrzNIFdzoIdFkDoJSR51MgrsDTaJX3M1oIF+uBYM27r/OKRnolAoYcJOaWFepmHZWbJtVazLngwa0UhGYCILkpdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731494317; c=relaxed/simple;
	bh=9InPAZ7ZEE5QzclMGXadVr602DxqKAFdX3igDXMCGT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giM9fPpZSxSBkFMENI5VLd+0tbe9UB8opShIkzft7T4CR5E4Go4qTW3UiZ8RDhryCXJhoIANwpC3GQooievmNUrSjsLkherAFA+StipX0TxFrcTcQu760br7+jdYQ6DcuWdUpDGRzGcQKWeD/pMqilhr6JiJUXhj5ebL/iRisjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTSfemHr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTSfemHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731494316; x=1763030316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9InPAZ7ZEE5QzclMGXadVr602DxqKAFdX3igDXMCGT4=;
  b=aTSfemHrXGd7I9RqR1iWaa+XSYI4AML1nXLDe0v5Fs47C4HWMRyL6eNA
   We+uXt5CA8aq4ljWyD1xPgP5kMUq/ov1rOSLhmTR+vktcWWxfK58Pr4cz
   Y8dQH4iIBKGB3HeRDQThE6WFwi1CQIh+gCDXJwun1AufiGsYdOe1lEcP5
   Wn0P3xjF+XGd0/P+ih4owvKm4eZVTVEE+B3qM9Suc7kdgDqlWOKqbAQAw
   c8THLXO6J4Icdzn5pjLmC0MZhMVLt7OilSvIJerU4Z2V3h2jTIf6DSn6b
   KTlRQs06N4fb0HzbtJK68Ut7mZ6Dq8W3hrPMhTw5FM3ll+ybm+Dhxm1YS
   Q==;
X-CSE-ConnectionGUID: O4UTp4o8TC6X4Aw4iv6u5Q==
X-CSE-MsgGUID: SF83GsF/TKuiP29LD2mUVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30773935"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30773935"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:38:35 -0800
X-CSE-ConnectionGUID: 1L/hGWH/Q8iJ6d9UmTPmFg==
X-CSE-MsgGUID: nQFtzCJFSwGSyC0lqQgu5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="88252228"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:38:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tBAla-0000000EJ6l-2R5u;
	Wed, 13 Nov 2024 12:38:30 +0200
Date: Wed, 13 Nov 2024 12:38:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
Message-ID: <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> Updates for PMT to support user offsets from the sysfs API.
> 
> Addressed review comments for the Xe driver udpates.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

If you have wish and time, there are problems with the drivers of different
severities (from "fine as is" to "good to be fixed, but okay as is") I have
noticed so far:
- it uses s*printf() instead of sysfs_emit*()
- it most likely never tested the corner cases. e.g.,

	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
	    (disc_res->start <= pci_resource_end(pci_dev, i))) {

  what is this supposed to mean? Probably someone wanted resource_contains() or
  alike to be called here.
- slightly above the above piece the for-loop

	for (i = 0; i < 6; i++)

  which probably want to use PCI_STD_RESOURCE_END)

-- 
With Best Regards,
Andy Shevchenko


