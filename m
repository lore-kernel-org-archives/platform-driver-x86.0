Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4052ED3B;
	Thu,  1 Oct 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888564; cv=none; b=DITy98o15ldoUWE3Y2fVUbbrbIHl1USWv1jJXZ66FDp1WcUIBwKNveE0SYY4NpeZT149ofVZmOcYIf/Cj8iYVmvu31g9gaZbLzjn48kk80XKdi3No1kSzdz5SVesv8cSworlYsZ6177fwaoqjjKJNmzrW2EswRC0p0c+LJiygKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888564; c=relaxed/simple;
	bh=DtYisai9+Bf47pVvSLNTI4cMptPMeWjcc4WBJ6DBuEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuhj5hqf5n6iF+bK2IqTXCV9BjomI3JDkezKUs0WBPTwDl4jf7mOD1uYXJneiGSOBaZy9sHED5lcdpMMtUVra+5/Hyg7l6PpYaz12Os15MpJUIlDPdLr2ZSD4WsfhLrI5Iit3sR3GqBGPVWpIA/tlqiHIAeZNqPunJ8iaxislEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9uRir3+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9uRir3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790888562; x=1822424562;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DtYisai9+Bf47pVvSLNTI4cMptPMeWjcc4WBJ6DBuEU=;
  b=F9uRir3+OWqFWSAztFOeDdSr8c5LS7VJW09vLY0HmQLewuh3MzrJXOiG
   w5J67KTdyqq5J8FBrJvCQTUm7c8ynYp/+j3h3UTXdEpIhgcWmcHaJ6YTR
   hgFIOH8k/ZvT1cPSPYLRDVOwExKnpHI/BGPPppWRfvewr8lI/XspddVxH
   rdvY09K7/I/g/M9HclXBWxrkJcZ1E1X0vTlEfSfhpKdMc4mKvx+FkYU8R
   oaGtY//92FOwA8PrwQGvH0FELmHENYwG8RPFK+TTKo3d+Jyjtr9xMkZBU
   90ikhDnc1Dx0yKhmqEQkmBwNDinQ4TcPV5bnCswDHcX7J/7ibSsHNu2qC
   w==;
X-CSE-ConnectionGUID: 7jVq1ltHRvSHPHbNocFwyQ==
X-CSE-MsgGUID: BAOrSJNfRuaKXR8bxMpUfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90717355"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90717355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:02:41 -0700
X-CSE-ConnectionGUID: yLe01Mr2Tn+jcrX/q+5MRw==
X-CSE-MsgGUID: m0N3FDksQi2gfAGmrnIdbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="304035200"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.80.90]) ([10.24.80.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:02:40 -0700
Message-ID: <f94db4f6-78e8-43c2-ad0b-b2854a51d115@linux.intel.com>
Date: Thu, 1 Oct 2026 14:02:40 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] platform/x86/intel/tpmi: Declare the loop
 counters in their loops
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 David E Box <david.e.box@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260930172918.743656-20-sathyanarayanan.kuppuswamy@linux.intel.com>
 <ar6iqgYsCZG7oTnL@ashevche-desk.local>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <ar6iqgYsCZG7oTnL@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 10/1/2026 11:12 AM, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 10:29:16AM -0700, Kuppuswamy Sathyanarayanan wrote:
>> Declare the loop counters in the for statements that use them, so that
>> they are scoped to their loops.
>>
>> In tpmi_create_device() this also replaces the tmp cursor, which moved
>> in step with the counter, with res[i].
>>
>> No functional change intended.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> ...
> 
>> -	for (i = 0; i < tpmi_info->feature_count; ++i) {
>> +	for (int i = 0; i < tpmi_info->feature_count; ++i) {
> 
> While at it, I would also move to post-increment. The pre-increment is not so
> usual in the kernel and might rise additional question "why?".
> 
> ...
> 
>> -	for (i = 0; i < tpmi_info->feature_count; i++) {
>> +	for (int i = 0; i < tpmi_info->feature_count; i++) {
> 
> Ah, we have even inconsistency in the style used for the loop iterator
> advancing.
> 

Agreed. Three of the loops use pre-increment and the rest use
post-increment. I will switch them all to post-increment in this patch
in the next version.

Thanks for the review.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

