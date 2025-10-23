Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333772BF3C5
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761255896; cv=none; b=Epm2ErfE8gnDcc0YpAKYYJs5AsFE1W3ji5Ur1ae4vvnZY1aG7jHIXCbgd5YRngoLjsKRjsHCPuy66kSBEgzZTxkEHTEEjqB4+xJiphCO+lQWI9oH2HCb3QHsqJu0whEqfOuGfp2OnXfp9Lb/TysrBf5i3tRMeKFrPmvuWyk6xKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761255896; c=relaxed/simple;
	bh=j7EEIH6J28ZdPHdaiuvj54ZXAZaU50Vpbp8oJSV9drI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKBSHIYhH8ajlPVbOOodAE4/202tNGxyYGmjrDQyVgHUtiDXOWAZBrNh87JWVxJYdgai8pe3l72tatzklyfTH2vCD6CUDjAAu65emi6H6wJKzL3L5EnRwcVyy1Y9xY3yHkJ962IZ8yES3p5Ur8ucr+lDqEQajbLSa59hlVZrqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvrlvQQz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvrlvQQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761255894; x=1792791894;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=j7EEIH6J28ZdPHdaiuvj54ZXAZaU50Vpbp8oJSV9drI=;
  b=DvrlvQQzyXlycor2BAJlBGlPafjm/APC8gHsPsglKdWSDPlDRiPC6SWG
   1M0ExgDyT2kdEaQJ7QIW0wXXI3fEkZuEtV29qLkIjzSeAEFKGtHMywdPM
   cMWXfzRWZ7rz3LPsF/iR2akK2U7nKW0d0+ZyFvcxcV5+n2bODmG2QMsjJ
   WshWPvGZl5b1MN3NzchpT34iX9H8fCgKONkKsY9xwBZpVihTpwRLy/f1O
   rVgwIzpl9EiIyyBZb31ai0Rfq59LdSOdpj3PTV1f0R9MFZJ7oQcVTfVcn
   agHREYCIofyAGk5fXbnrRnqsPJD0r+IuztbSwB7f/3JlvhWGRWTqKNXXb
   Q==;
X-CSE-ConnectionGUID: uZrQeSktRo21EKo8wdD2Yg==
X-CSE-MsgGUID: BnkVKX2sTUyPYeWPnfeUbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74108960"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="74108960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 14:44:54 -0700
X-CSE-ConnectionGUID: sDd3rIbTTuWcAf49Pys2+w==
X-CSE-MsgGUID: /BI/ItGPTKCL9KwT1KwHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183872594"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.125.1.123]) ([10.125.1.123])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 14:44:52 -0700
Message-ID: <4f2863e3-23ac-4d88-bd1d-f83e59851da4@linux.intel.com>
Date: Thu, 23 Oct 2025 14:44:51 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers
 and distinguish between them
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 david.e.box@intel.com
Cc: platform-driver-x86@vger.kernel.org, irenic.rajneesh@gmail.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-3-gpiccoli@igalia.com>
 <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
 <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
 <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
 <232ab4da-42ea-4d17-96c8-ca0d93f04f33@linux.intel.com>
 <bbd83ee1-4a6d-ee6a-9bb9-cc5aba2ebd21@igalia.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <bbd83ee1-4a6d-ee6a-9bb9-cc5aba2ebd21@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/2025 11:05 AM, Guilherme G. Piccoli wrote:
> Hi Xi, thanks for you feedback. Comments inline:
>
> On 13/10/2025 14:39, Xi Pardee wrote:
>> [...]
>> I am still uncertain about the added value of this patch. Could you
>> please elaborate on how displaying the register name would assist with
>> debugging?
>>
>> The registers in slps0_dbg_maps are intended for diagnosing slps0
>> related issues, and the register names should follow the format
>> SLP_S0_DBG_(1,2,3).
>>
> The names do not help with debugging issues, definitely. It's just a
> detail, an improvement - or at least, I consider the output a bit better
> with this patch. But that part is superfluous, if you prefer not to
> change it, I'm totally OK. And ofc you / Ilpo are right, I changed the
> naming in a wrong way, I'd fix that in next iteration (thanks for noticing).
>
>
>> Additionally, the full 32-bit register data should not be displayed
>> here, as some of the bits are reserved and must not be exposed to users.
>>
> Now, this one I respectfully disagree - these raw values have absolutely
> no meaning for the end-user, exactly due to the reason you said: there
> are many reserved bits. So, for a normal user, a piece of hex values,
> junk...
>
> But for Intel, it might be the case you do have internal specs detailing
> these reserved bits, this could be meaningful. That's exactly the
> purpose of this patch: when debugging rare to reproduce failures, having
> this raw register could help Intel to determine the cause of odd
> failures and eventually fix it. No harm (or meaning) for end-users though.
>
> Of course the driver is from Intel, and as maintainers you could decide
> to not show the raw debug data from these registers - fine as well, let
> me know what you prefer.
>
> Thanks,
>
>
> Guilherme

Hi,

We would prefer not to show reserved bits as they don't provide values 
to the users.

Thanks!

Xi

