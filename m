Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B32AD3C;
	Fri, 25 Sep 2026 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358941; cv=none; b=M63SCsFcrYqggqY7J1oX/HKzkdBxFOc7r7GsKr/tgevYN8M0oXAs4VvQyLNJRUD6zjcphN3ANlJqXAeCQaTqdE/XXFGjM9Dg0sISGQ0fIpLxOnYTh46EXPbOrsw8QEv4MHJTYmj6bpl7PAhgBJ+i464JXA4n24kLBHjK64Bc1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358941; c=relaxed/simple;
	bh=/ckPthY3D710YICNP66mAF/TjGyxqnB9tLxG6LfmOgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTcg96N3nBMM8RNwF4KCARAqbzMD3iUNJdLiKRgX24iLd25J88HecINiZ0/mCtbIo+NmvS5dWDlfmqBOh/UcSWGAgJVRYc2G+wjANWI9PzRnr4EMStRlV4Q4+OL4EErEA9nuepNX7ORcFYpcZQFj1Mi4Zw3wzHPBQ5y/NZ4313Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjOr/5A0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjOr/5A0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790358935; x=1821894935;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/ckPthY3D710YICNP66mAF/TjGyxqnB9tLxG6LfmOgI=;
  b=VjOr/5A0k51KzR/VikoGBWlqcEPjn8BhMRPGyLgXgARnyrX3U+weq9Mz
   u+NalzPzWrRtAE54fsAXDxZh7uGIL1KIgb9CwEqLKRk0tnL1EjyB04+ca
   9H/+sPTBsEasHdeiIcWlvuWzImwB26haynGsTSZeE2cM8yBlJLqVoMJxP
   GRplq/ni+7wf1aUlPCS03jagc5LI7YWHJBiq4T7HNgtlcor0iIg5Ev9PY
   xpSCs3LG1VZbi9QIOPL2yjPdEhpQx+DrZvEgXowiC1ubkKifsGktqDeq0
   XUrMFz3VYuBXMc/K/hUAPnElGPcbqHi08soTFLIiVp9jqas1rzaEoWDED
   A==;
X-CSE-ConnectionGUID: JU9q+UN9Sce2E29S9ln2BA==
X-CSE-MsgGUID: GccIgqhZRBmWcGloumktbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91252821"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="91252821"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:55:33 -0700
X-CSE-ConnectionGUID: o+IQYnsPS9aEv6WtrlveSQ==
X-CSE-MsgGUID: MhXlTkTvRcyiVE2TosJI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="303901988"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.80.90]) ([10.24.80.90])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:55:33 -0700
Message-ID: <5ff2f36f-12c7-464e-a9f5-89e1819c66c9@linux.intel.com>
Date: Fri, 25 Sep 2026 10:55:33 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/19] platform/x86/intel/tpmi: Declare the loop
 counters in their loops
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 David E Box <david.e.box@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260924182342.212709-19-sathyanarayanan.kuppuswamy@linux.intel.com>
 <arWTaYKQzTpRaR1D@ashevche-desk.local>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <arWTaYKQzTpRaR1D@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/24/2026 2:17 PM, Andy Shevchenko wrote:
> On Thu, Sep 24, 2026 at 11:23:40AM -0700, Kuppuswamy Sathyanarayanan wrote:
>> Declare the loop counters in the for statements that use them, so that
>> they are scoped to their loops.
>>
>> In tpmi_create_device() this also replaces the tmp cursor, which moved
>> in step with the counter, with res[i].
>>
>> No functional change intended.
> 
> ...
> 
>> -	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
>> +	for (int i = 0; i < pfs->pfs_header.num_entries; i++) {
>>  		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
>>  
>> -		tmp->start = pfs->vsec_offset + entry_size_bytes * i;
>> -		tmp->end = tmp->start + entry_size_bytes - 1;
>> -		tmp->flags = IORESOURCE_MEM;
>> +		res[i].start = pfs->vsec_offset + entry_size_bytes * i;
>> +		res[i].end = res[i].start + entry_size_bytes - 1;
>> +		res[i].flags = IORESOURCE_MEM;
> 
> This should really use DEFINE_RES_MEM() instead.
> 
>>  	}
> 
> ...
> 
> The rest is fine. So, make a prerequisite patch and rebase this one on top.

Sure. will do it in v3.

> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

