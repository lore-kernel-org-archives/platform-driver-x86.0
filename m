Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B352BE29;
	Thu,  1 Oct 2026 18:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878388; cv=none; b=CeR1Aqa/75UmjV8FDLGGvD9TAbG358uBFlavG0Fz6lhEUWWm/Nib3BFx8tk/C/3EYnNvwNKEhJtZ26em1svyWNEiyc7Zq+22hZDVgXlK+KldiLzWsLEHch9onLGua/4U3lSJ05gjD41epDtwFQu3AMDCyreLoLNNaWjAIEe+yVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878388; c=relaxed/simple;
	bh=2GhyhvZKPw3VjnvpjmDdBrYHsIMKFo9AyBq4sUmUA70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC2BzADKs8PRtsUUdz70Vl9ZXI9aPtD+cQM+3XTrVn83gT4d7YntqBtZzLse6TnP4NZIncU/PgdPl907SL5SCEvDMOlc0GG1p/N+X4cBc0EQuWu28qGJJgvYm5C4MrOQGYK8xPgi8wOI5SCpFr+FAhz9f+6mXRmJOyztwm2SEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BairUJaY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BairUJaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790878384; x=1822414384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2GhyhvZKPw3VjnvpjmDdBrYHsIMKFo9AyBq4sUmUA70=;
  b=BairUJaYa2EOjuzDZVzDyZjA3wrnsdDTcbdv1QE3Ez4Bfk2R6AIejdRF
   bi9vTHapMmJ+BrB9j1NlD85t+D9ypqQ6+oOkjPSQRdUfPQ5eTjyQdCQP4
   e4YRjxAdVKRZSnZZXd36329wFkZJDHcRgPB70Pq+gBj3LBwtAUdABftxK
   wZY9Y1kQyexN9w6y8gCDb2DB/jDrEwsB3C2FbADyseapm9bFiTOFe/IZH
   PMAJiNitNd6gltqShPxxhuO09xisBrNWio6sNnX5fgg8/1GSwRTkpHFuu
   896dDzS5szJ2HhmwyWKq+3jmVhmSMcDps7VhoZVF1c8d+ZtugLJiKP8yY
   w==;
X-CSE-ConnectionGUID: l5xlsmukT1eR5FET8Imkqg==
X-CSE-MsgGUID: SEgeynvhSoCh9YTasVpDvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="95456595"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="95456595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:13:02 -0700
X-CSE-ConnectionGUID: skrK7cNQQy2Q0plDc6zw9g==
X-CSE-MsgGUID: zfR0XCoCTrigFDX9Pi+v9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276120236"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:13:01 -0700
Date: Thu, 1 Oct 2026 21:12:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 19/20] platform/x86/intel/tpmi: Declare the loop
 counters in their loops
Message-ID: <ar6iqgYsCZG7oTnL@ashevche-desk.local>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260930172918.743656-20-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930172918.743656-20-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 10:29:16AM -0700, Kuppuswamy Sathyanarayanan wrote:
> Declare the loop counters in the for statements that use them, so that
> they are scoped to their loops.
> 
> In tpmi_create_device() this also replaces the tmp cursor, which moved
> in step with the counter, with res[i].
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> -	for (i = 0; i < tpmi_info->feature_count; ++i) {
> +	for (int i = 0; i < tpmi_info->feature_count; ++i) {

While at it, I would also move to post-increment. The pre-increment is not so
usual in the kernel and might rise additional question "why?".

...

> -	for (i = 0; i < tpmi_info->feature_count; i++) {
> +	for (int i = 0; i < tpmi_info->feature_count; i++) {

Ah, we have even inconsistency in the style used for the loop iterator
advancing.

-- 
With Best Regards,
Andy Shevchenko


