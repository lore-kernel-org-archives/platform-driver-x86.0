Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA54321D596
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 17:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760377182; cv=none; b=YqXNHv3SiJCwkxMsNOiBGvlpcPeMjdGrii+HDVzokWyRXe4CEucnXXOQna5SF+wzXAsqoU4o6LW3/QRVAoAFMZqZ0D6ziL0BiPqaCwE9Lwi2ZczfkIBzz30iIyBOnokQKDI4lUD7a4mc3DyRNPn51gt6cSDacPitHMUYlU7QzGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760377182; c=relaxed/simple;
	bh=bsXsPPOZd1gUYimK8l4kHFHKjmmhqb79ECgYmEzqlAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKC6TJz7QIKkRPYOvI0+kTeL/I4+TgApXLjsENDbDMqm6uHcX4tWsBqNsWibldaux3JAAfFrB0EYxWGtefDaCp7b9sgKszgEg60E81C33DsnTRid9I3fZ/H6cmJpd1npFebDbJo1IU+jTw6u/JoaonS6D8CFPjrfdsS2S5bMLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDyix+qM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDyix+qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760377180; x=1791913180;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bsXsPPOZd1gUYimK8l4kHFHKjmmhqb79ECgYmEzqlAM=;
  b=jDyix+qMPbOijBMVTjEalQ6y8ooaP/tFW93gFRY5AfDk0GC2OlITdAqh
   aos5OI7RwjBeakolXB8nXTH4vp9AWmZB9qw57kRZwe0oZghWXmfAGsnIN
   j+u2C4P4bbLVEFGz0jyLGywNJ62inx45gu4OoH8ercFcFoCKL2FJS2o2h
   WP6WAIIPtBkwBD13mvX/AOEW+urVxA1Za/pC24UBVf4XaXOYADA16KniS
   ISBDYOrTovOgTG4UGw2kTunRtfCc4v+4YkckSTawZ2xoqQbJSLPd2h6Sf
   FUFsr0iFET+oiMV/NFJnj7t54wQCCBw5ZUGhypIGIA2KvD20qCJJo5Mt3
   A==;
X-CSE-ConnectionGUID: AmpRyoN/RkKYjteyQOMurw==
X-CSE-MsgGUID: qHFM68IzSQ+7Lu4lD8Gdmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73972364"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="73972364"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 10:39:39 -0700
X-CSE-ConnectionGUID: E3oVuApaR0SeTgNVQ3R2GA==
X-CSE-MsgGUID: rFzGLRkBRLed8wm8CLqXVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="185666257"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.124.130.255]) ([10.124.130.255])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 10:39:38 -0700
Message-ID: <232ab4da-42ea-4d17-96c8-ca0d93f04f33@linux.intel.com>
Date: Mon, 13 Oct 2025 10:39:37 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers
 and distinguish between them
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, david.e.box@intel.com
Cc: platform-driver-x86@vger.kernel.org, irenic.rajneesh@gmail.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-3-gpiccoli@igalia.com>
 <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
 <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
 <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Sorry for the late response. My response is inline.

Xi

On 9/24/2025 2:57 AM, Ilpo Järvinen wrote:
> On Tue, 23 Sep 2025, Guilherme G. Piccoli wrote:
>
>> Hi Ilpo, thanks a lot for your review, very nice points! Comments below:
>>
>>
>> On 23/09/2025 04:59, Ilpo Järvinen wrote:
>>> [...]
>>>> This should bring no functional change, the goal is only to improve
>>>> reading and allow full comparison between raw register values.
>>> Hi,
>>>
>>> I don't think that's exactly the definition of "no function change" if you
>>> intentionally make a change to the reading. :-)
>> Hehe yeah, you're right - it changes the output, so that's a functional
>> change indeed (imagine a userspace script parsing it...). I was thinking
>> in functional change as in "no extra register reads are performed", but
>> I agree with you and will drop this text from next version, thanks for
>> pointing!
>>
>>
>>> [...]
>>>> +
>>>> +		if (dev)
>>>> +			dev_info(dev, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
>>>> +		if (s)
>>>> +			seq_printf(s, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
>>>>   		while (map->name) {
>>>>   			if (dev)
>>>> -				dev_info(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
>>>> -					map->name,
>>>> +				dev_info(dev, "SLP_S%u_DBG: %-32s\tState: %s\n",
>>> I'm not sure about this change. To me it looks the naming is "SLP S0 DEBUG
>>> REGx (SLP_S0_DBG_x)" according to this:
>>>
>>> https://edc.intel.com/content/www/tw/zh/design/publications/14th-generation-core-processors-ioe-p-registers/slp-s0-debug-reg2-slp-s0-dbg-2-offset-10bc/
>>>
>>> ...So changing from S0 to S1 or S2 does not seem correct here?
>>>
>>> I wonder if this really a problem to begin with as the names should be
>>> unique, no?
>> Totally right again! Nice catch, it should be as you pointed, the
>> different ID is at the end of the string.
>> And no, it's definitely not a problem / big deal - I just took the
>> opportunity to improve the output, but I messed up heh
>>
>> Lemme know if you prefer that I keep the old naming or fix it properly,
>> like SLP_S0_DBG_2, etc.
> I'd prefer Xi or David comment on this whether to add the number there or
> not. This will end up being after the merge window material anyway so lets
> give them a few days.

I am still uncertain about the added value of this patch. Could you 
please elaborate on how displaying the register name would assist with 
debugging?

The registers in slps0_dbg_maps are intended for diagnosing slps0 
related issues, and the register names should follow the format 
SLP_S0_DBG_(1,2,3).

Additionally, the full 32-bit register data should not be displayed 
here, as some of the bits are reserved and must not be exposed to users.

>>> [...]
>>> This assumption seems somewhat fragile but maybe it's not worth
>>> engineering it beyond this at this point.
>> Sorry, I couldn't understand this sentence. Can you clarify it for me?
>> What assumption and what do you think we should do?
> I was just referring to the ++ line that you for some reason snipped.
> It assumed certain order of things in the input array which arms a
> trap. But then, we know all the current inputs are okay with this simple
> approach and I'm not sure if this code is getting much changes in the
> future so it might be over-engineering to store the number into the
> input array within the struct.
>
>>> [...]
>>> Also, please remember to add all maintainers as receipients when posting.
>> My apologies - I checked MAINTAINERS directly and added everyone from
>> INTEL PMC + Xi Pardee (many patches in the driver); but I should have
>> used get_maintainers instead, which brings your name. Thanks for
>> reviewing even when I forgot to add your email!!
