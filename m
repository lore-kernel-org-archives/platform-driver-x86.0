Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B948C408;
	Thu, 24 Sep 2026 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284527; cv=none; b=eBJ9tC20jCa9EHh2UfuVB0kUGptB1eFRgy7uaWa6j5uTZ8MARjJDOucr0sQIk2XBJyiK9Mg1XhLv1C6h+rAhCyOrIPynS8+DH40Nfxqr6K/0UhF8JkDqPo6ZUSZT8k5CCSGAjsKaUiBtf1OsTBrsmlJtUSxWfzF3JNoAJMuP60Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284527; c=relaxed/simple;
	bh=mAdXsSL2o4O/bp/+MqNOl4Z1ky5mIHA0X1CKAXXNpl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzAdlOMK9xrGIjvQmCtC1DMygD/TWc4HjWlrA4pPXZLGlJhOimxuVLSadZiITOnHJf1u5rYj0acekztanKzd4iCa0NK7Rp8SthmH1oSeUS8bI/kU642jHu4+qrT4Aka4gZwYJVg/WPboGz/BnAnvpJTUWOjvC9QbkT/ca06wSMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMJg9a+X; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMJg9a+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790284525; x=1821820525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mAdXsSL2o4O/bp/+MqNOl4Z1ky5mIHA0X1CKAXXNpl4=;
  b=DMJg9a+XWO6vstVOlgVtyb45UwpkUNPtLEJuuDVywl1hePSd7/hQ5sdo
   RMuIxwLSzMiqsDtWNI3bTxs4P5DhmyA5xRIMhEi1JnpXVr0AD3UYn96Ls
   nC25eUEN54j9rAPmIGaOLS12YwvmfF5glCi9K705ce+a0T1MEe5Mb7dDK
   fbUXwKfuCF6zbSIzCTfqnPSuYab70VkpaxMBIOL27lhNNYU8SYb92SGJK
   +iViPX/CNB2hfqWopCoBMhfhMxD95UXUqpKoo2nFRN2bb67/GhIjo+aeE
   2oIYIYg4AQAn3QAnErs/PzrXW/RVpPOrFyEZ6XCbL16CniBE4Cq4faCiY
   w==;
X-CSE-ConnectionGUID: mbMs1MQ+RTKUCF++cMZn0g==
X-CSE-MsgGUID: g4UC4P7HR3WwmqUjDM8lPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90937775"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90937775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:15:22 -0700
X-CSE-ConnectionGUID: ZfNHq6VSQvWf44IzG/MkZw==
X-CSE-MsgGUID: YJKSN5fsQvmd2zdyMkPLwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="274250014"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:15:20 -0700
Date: Fri, 25 Sep 2026 00:15:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/19] platform/x86/intel/tpmi: Use guard() for
 tpmi_dev_lock in the status read
Message-ID: <arWS5qoJtjFpiBLj@ashevche-desk.local>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260924182342.212709-14-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924182342.212709-14-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 24, 2026 at 11:23:35AM -0700, Kuppuswamy Sathyanarayanan wrote:
> tpmi_read_feature_status() takes tpmi_dev_lock explicitly and unwinds
> through an err_unlock label, which is what forced the two error paths
> before the mailbox command is issued to be gotos rather than returns.
> 
> Take the mutex with guard() and return directly from those two paths.
> 
> The done_proc label stays, because the paths that reach it have already
> handed the mailbox to the hardware and still owe it the CPL write before
> dropping the lock. That is unchanged: the two early failures never wrote
> CPL before either.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


