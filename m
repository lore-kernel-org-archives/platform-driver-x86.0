Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E33B7B7A;
	Thu,  1 Oct 2026 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878014; cv=none; b=WlKPH7d3qoKth6Qr12+gXYk5jFRCqAHbwsWQx/70WWgJmqu3H4xnUTrojKuOBCpELtZzAh3YGI26d90Z9RIj+K5KwFfZcqegRtwVIFJ0Ku9o9odMYfswUbPAEODAjP2d6g7+1KIH7eYbdetpShpFhwak/EstFh7vJCpSdwOlLgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878014; c=relaxed/simple;
	bh=w2DpDBNzzgTG2+oJ/2U02y+FYPkm+fPQfVTKc069f2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhfrcGIFlNKODm/Qf8i1vX/fOa0zrRZ5HcNt5l27ree0kv45qHSS8ZmSxQ0YLaN/feAIxVF/rARfkiW/wzCdXC58XDzMy5KETAbXNXZL1myihH3XSlVnwTgzsxKknDSuT6aiL+FmK+Xel9JW5YQfdgO+HnFCDG+SooOgwOTOgTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agw3S/8y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agw3S/8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790878011; x=1822414011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w2DpDBNzzgTG2+oJ/2U02y+FYPkm+fPQfVTKc069f2w=;
  b=agw3S/8y3pk61VuWGYBdBKB6g/aJJc70tBYOYdzWToehF8Sq13qed7yB
   soPimeMDkQxJtJpqM7hJu85xxuODtkc1XSdK4A3QPScB7fJvcc/CC10k7
   tW1R4A5uiWWx7N3vVP/EsrbT6rQeR94tY7b2lPJCgMY1QZQJtx8exKdV8
   ZR9fm3mtedozpgIaQ4x77U8OnaICmLi5G/6R8GsNG7/LmxrHJ/QwYUs6X
   REDjhetv1HYzPZWizA8PMaWL1an1aEAuu00Ax+ge8anNn+/fO/QCLgJCl
   SskTVx6Pz2c2OeGuN5nDlLQWs77UaTirSlS+i48bVUHCzFc64M2dAH059
   Q==;
X-CSE-ConnectionGUID: B/dY83SxTX2HWpfQ/0NF4A==
X-CSE-MsgGUID: Gaa6+ci4TQ6pvlO2k2ZDbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91664524"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91664524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:06:49 -0700
X-CSE-ConnectionGUID: tPVqv4M5QYCIQp5GubiJVg==
X-CSE-MsgGUID: DtJ5kzLsRv2Tf0yZ09TsZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="305555473"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:06:48 -0700
Date: Thu, 1 Oct 2026 21:06:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/20] platform/x86/intel/tpmi: Use scope based
 cleanup in the memory dump
Message-ID: <ar6hNf4_43MQGRtQ@ashevche-desk.local>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260930172918.743656-15-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930172918.743656-15-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 10:29:11AM -0700, Kuppuswamy Sathyanarayanan wrote:
> tpmi_mem_dump_show() frees its dump buffer and drops tpmi_dev_lock by
> hand at the end of the function, so the ioremap() failure in the middle
> of the loop cannot just return. It breaks out with an error stashed in
> ret, which is the only reason ret exists.
> 
> Attach the buffer to __free(kfree) at its allocation and take the mutex
> with guard(), then return the error directly from the loop. mem_write()
> in this file already does both, so this makes the two debugfs paths
> consistent.
> 
> No functional change intended.

I assume that file already includes cleanup.h? Otherwise needs to be added.
With that in mind,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


