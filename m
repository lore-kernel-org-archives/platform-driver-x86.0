Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14732188596
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 23:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760486148; cv=none; b=jUFzHk+H5K5IXJHM2P4MzhfQbIegopIHI81STAYEVyDD6PyqWRCzqQSTcksBlvT9D7PSN46wrNljQX4ENJKh/ONVm6X+cGY67YOaIHnU2hbufUI8AETlCydR8B8VUdp6iGZ/5bzsL9NNWbjsS/F7svFR93uisaJo7LOaFw/r/a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760486148; c=relaxed/simple;
	bh=rs3BHRt4QqaqakQmurZBTZeMTAPLEe8u9uNfm8hfUEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkfE4CMYtNwClsowpPA9tHR/aAxcD79qtsQQaz9XsDumfitrER1BpNrrojND3nfPig1WDScp8qOY5fwnfCmIBqPN7c0FRVMEbbzJ5+8oLKn4HrVuTVU7WesFgLvPtcPRJf/tBCKCszVWioa7ejypjN0ttKN0Z2bOWTCAUuJ9SDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVOsjGZF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVOsjGZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760486146; x=1792022146;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rs3BHRt4QqaqakQmurZBTZeMTAPLEe8u9uNfm8hfUEI=;
  b=eVOsjGZFbw2Cz7FyMXEeCvrB5X4KuOPmw7CFozSiClbTJ/haJFWIDmWh
   Vz6TIMxgNwkQBLVk6e88QhqXFtFSEjfdlYggpmj/TDQtuctLD7nEu/q1X
   Y7LXDDXAV7e06p9PRMKyZQHWdsL6FUMGJCw8tpwWgojOf6rWx7KmqqpNI
   aZ3lIbGuPTQCFfR/ucKigumT8mZN8J6D+IupawYwIpVTIe5PuXuZ0NaBV
   7d+39R1KXcjlZXH0BKbzQZxJS0MW9XKzP4LTXUqwA8Vjue1t0PGh5gFU9
   QK+i144qKCznQUHzixX6hSI5dTnCqSindqu3Lvpt5Xh2/2cMM+KbMXUz+
   w==;
X-CSE-ConnectionGUID: z4UqB4VmQTO1sVArszzFHw==
X-CSE-MsgGUID: GoMniHNJTeqhYS8jfOO1jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="50218109"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="50218109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 16:55:45 -0700
X-CSE-ConnectionGUID: 3n1GFmuzQkaoYg+kweqxug==
X-CSE-MsgGUID: RJ/WIFLeTB2SC3wmtf8YLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="181156641"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.124.130.255]) ([10.124.130.255])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 16:55:45 -0700
Message-ID: <280be57c-5159-4e5b-9d8e-15cd67b84cc4@linux.intel.com>
Date: Tue, 14 Oct 2025 16:55:43 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/intel/pmc: Always dump LPM status regs
 on unsuccessful paths
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com, david.e.box@intel.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-4-gpiccoli@igalia.com>
 <dcd817d1-6ce5-4c09-a65b-21507424849b@linux.intel.com>
 <71fef5d2-15fe-27ce-4004-998aadc9a8cb@igalia.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <71fef5d2-15fe-27ce-4004-998aadc9a8cb@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/2025 12:58 PM, Guilherme G. Piccoli wrote:
> Thanks Xi! Response inline:
>
> On 14/10/2025 16:29, Xi Pardee wrote:
>> [...]
>>
>> Entering the S0ix state requires the system to reach the deepest package
>> C-state, PC10. If the system fails to achieve PC10 residency during
>> suspend, the slps0_dbg_maps data becomes irrelevant and may mislead
>> users. For this reason, the driver hides this information when PC10
>> residency is not attained.
>>
> Indeed, I agree - this is even mentioned in the spec.
>
> But the patch here doesn't change that (or shouldn't - except if I did
> something wrong heh).
>
> The idea of this patch is to dump the LPM registers in any failure path,
> the ones printed by pmc_core_lpm_display() - not related with the
> slps0_dbg_maps.
>
> Lemme know your thoughts on this.
> Cheers,
>
>
> Guilherme
When the system fails to enter the S0ix state during suspend, there are 
two scenarios to consider:
1. If the system achieves PC10 residency, debugging S0ix can focus on 
the information provided by slps0_dbg_maps or lpm_sts.
2. If the system does not achieve PC10 residency, the PMC core driver 
supplies package C-state residency information instead.
It is important to note that the data presented by 
pmc_core_lpm_display() is only relevant when PC10 residency has been 
attained.
This difference helps ensure that users are provided with accurate and 
meaningful information relevant to the power state achieved during suspend.
Thanks!
Xi
>
