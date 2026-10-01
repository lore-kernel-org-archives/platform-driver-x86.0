Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B24746B1;
	Thu,  1 Oct 2026 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878748; cv=none; b=qnppXSHxgCxIplKpSgZ0odgUwlCfm6gpXjlj9X4Wi1I7t56ozTnUZSosiDx8uCdYfEj0qr0LrlTBycFB53jnIW315ghA9Xt5VHOyowCYiDMfry2s05PyMZT2J707xj/+8I0ysR+yCgr3Ll8tvmU3Fe5JN85B66UbjvSpz5rAW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878748; c=relaxed/simple;
	bh=kVZEZT9i2fpCtlgwV3LkpV6iMgWstIpk2hmyqSnOAuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUXevnDCIoPv0+6QdZ/2eixQE/svaADcHBXzHklr0MZOjRYxI+l6nH614OQKGHBjDgbzv2aVQmmV4fXsxD8fL1WzmPykLLkVe3pILcGUk/PiVlFIbWRLCnpU9jqoL5B6sqBfUk4+18Pp2qDgoU992c2IpNA6exZFm5xhxnfZkN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSwYoUui; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSwYoUui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790878741; x=1822414741;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kVZEZT9i2fpCtlgwV3LkpV6iMgWstIpk2hmyqSnOAuE=;
  b=WSwYoUuiLJqQsL+aW6vpshFACana1GyQV8srdQb7CJq9Zs7os3Cl5O1b
   o0vDhifiFq4Redoq8P67zCiG1I9S1ESEhW0/J8qpZ42JpI3w8WkPmShug
   d411m8IuYhD1BTO2IMc8CQ+kSH6BPPyiwRu37RkVxJbXFSu/lS5Ni3eiG
   6JpYMDy42IrRUM8Rkoh1LBBT39EbMxwFidhTiemd4vrbX4ga7/eIKaCiN
   IOEP9PR4l6UTFvZm7W2PXmkvH25J2dkGoCyMJU3/xm+3SX0Jnr2hxa70y
   h7GKBKPaGKY65xZbt1qSWR+bMHyOrVUG1SRDrTh9LjtEr2iJ6pX3Ha4Ig
   Q==;
X-CSE-ConnectionGUID: OuD3uqDcRIiEqYPXuFV0LQ==
X-CSE-MsgGUID: UhFA572qR6elibqqni0MOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90704379"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90704379"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:18:56 -0700
X-CSE-ConnectionGUID: +zJX6LNZRs2Mxt+Z74rl/A==
X-CSE-MsgGUID: mOzn9RtiQomCyd4cBwo8Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302298057"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.80.90]) ([10.24.80.90])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:18:55 -0700
Message-ID: <9b33dcee-6d4a-4062-b212-797ac56a5ce1@linux.intel.com>
Date: Thu, 1 Oct 2026 11:18:54 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] platform/x86/intel/tpmi: Use scope based cleanup
 in the memory dump
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 David E Box <david.e.box@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260930172918.743656-15-sathyanarayanan.kuppuswamy@linux.intel.com>
 <ar6hNf4_43MQGRtQ@ashevche-desk.local>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <ar6hNf4_43MQGRtQ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 10/1/2026 11:06 AM, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 10:29:11AM -0700, Kuppuswamy Sathyanarayanan wrote:
>> tpmi_mem_dump_show() frees its dump buffer and drops tpmi_dev_lock by
>> hand at the end of the function, so the ioremap() failure in the middle
>> of the loop cannot just return. It breaks out with an error stashed in
>> ret, which is the only reason ret exists.
>>
>> Attach the buffer to __free(kfree) at its allocation and take the mutex
>> with guard(), then return the error directly from the loop. mem_write()
>> in this file already does both, so this makes the two debugfs paths
>> consistent.
>>
>> No functional change intended.
> 
> I assume that file already includes cleanup.h? Otherwise needs to be added.

Yes, it does. tpmi_common.c already includes <linux/cleanup.h>. 


> With that in mind,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

Thanks for the review.


-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

