Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562432;
	b=YLqRYoylB2ik/Wq15cllWO34Pt4MXW5pLwbucHOb4/PpmBheMmAOLCevdwDtutOJpPYj
	 CyqWizsTQ75WwLfKQ4x4JPgBc7TMYPD+eDNT+eYSJOtLc4DKfHdKU6Zp3+e5c85XB9FQe
	 uHP+yaPTO1VaWp3jOfF/bk7kc1ACb+aPdPZVRHh+6kxD/uJ5XbS3sys2dLI8+USOb6jDs
	 yTo/TFn9eCHIujDiGVMIF6nIHvUVcytbT0wbMc9qsdmZEJQAMDaQWZH+zYAKqRgnYvTKm
	 iHKhenhWIpRK2TrVYlVp2SWmGSRlyubY+SaqvCRVcJAaVZbflaSfhDYG59SbsINApxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562432;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=m5gamdFYUtI9GahDnoFw946XTKi/an2W70Sd/k4EobM=;
	b=5PtPC4VeiR39EbfHvoaPkU3ELBXH27kybxhkYdnLOoaz0oxwMdNF7/9iuJlcMPce4dT3
	 GmrcV0rwOSp9UjEWPG18fLjV7dvgxc9gRZ349zD2vi0hTr/9lvwrLk3LQiTPHffJNG/zn
	 +8jZS/5OebVib9YFXI0icFXArXIBuTcjQABR6YB35zhfLvtOs5SdE5NOjpo8QGy0WTImO
	 17lLowxbUrvcSlDJV35he1mvT2y1pOLrdBTpc7T9H2/abhYh7oXpPE9neUn4HYJK7nOvb
	 CSV0hRG1VI3pAFnLzrsFaNvTEl2TDCdWx1DeMqEW5JmOq/W9XjcAt2v9taLy+Ce16aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=E3EamOEC;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6196C606A31E;
	Tue, 24 Nov 2026 23:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6196C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=E3EamOEC
Received: from [192.168.0.32] (ip-095-090-245-146.vkd79.pools.vodafone-ip.de [95.90.245.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 91EB04C442F807;
	Wed, 25 Nov 2026 00:19:47 +0100 (CET)
Message-ID: <1834d646-431b-4422-9909-d24ac8ce57a3@molgen.mpg.de>
Date: Wed, 25 Nov 2026 00:19:45 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/intel/pmc: Do not decode the summary
 rows in ltr_show
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 Xi Pardee <xi.pardee@linux.intel.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261121090614.677144-1-pmenzel@molgen.mpg.de>
 <awP4y1W38Nd-atua@ashevche-desk.local>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <awP4y1W38Nd-atua@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795562388; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=m5gamdFYUtI9GahDnoFw946XTKi/an2W70Sd/k4EobM=; 
	b=E3EamOECKjgRIuLofH52cFnOuZ1xLmXQSkRdzh7I80rimh6Aq8FABuRNnJvGCSK5x750rZzsvBcx
	hnXzJaksq+V6x5N2seqhCQNeKXKP3Wm0tJSOHHGY0uIZIy0L5kzSTus/sCn80YsD4+rsxrHI5pYXzU
	o886fniIyEuSLTjGIZPK9chxJ+ixFBofN5ErwHZNKayMrqIFTLL2hBUUB5sWaMsmDoO9xuygyFAxEc
	CFftM9MkkMF57b4qaBccIDE0hoHzzYvgp2wa7pjdMEOtp6iFHbimSCk3vRT0x3uJ9mjarXqi7QY1wh
	SYxzXudhqvQa9tcWVBYioKGglVdMHR/A==

Dear Andy,


Thank you for your review.

Am 23.11.26 um 09:26 schrieb Andy Shevchenko:
> On Sat, Nov 21, 2026 at 10:06:11AM +0100, Paul Menzel wrote:
>> On an Intel Tiger Lake laptop Dell XPS 13 9310, the first read of
>> `/sys/kernel/debug/pmc_core/ltr_show` after loading the driver logs:
>>
>>      intel_pmc_core: Invalid LTR scale factor 7 (only 0-5 are valid per PCIe spec)
>>
>> The value comes from the last row, AGGREGATED_SYSTEM (CNP_PMC_LTR_CUR_ASLT,
>> 0x1b54). In 120 reads over 30 seconds, it read 0x7fffdff, 0x7fffc1f or
>> 0x7fffc23 (117 times), and 0x40201ff or 0x402001f (3 times); another read
>> gave 0x7ffffff. Decoded as an LTR message, the snoop half of the first
>> group has the reserved bits 14:13 set and scale 7, and the second group is
>> CURRENT_PLATFORM (0x40201) shifted left by eight with the low byte filled.
>> So these two PMC registers do not seem to hold the PCIe LTR payload the
>> per-IP rows carry, and decoding them only produces the warning (the decoded
>> value is 0 anyway).
>>
>> All ltr_show maps end with CURRENT_PLATFORM and AGGREGATED_SYSTEM, which
>> pmc_core_send_ltr_ignore() already relies on. Print only the raw value of
>> these two rows, as for rows without a requirement bit set, and keep the
>> warning for the per-IP rows.
> 
>> With the change, 200 reads with AGGREGATED_SYSTEM bit 15 set in 199 of them
>> log nothing, and the CNV row is still decoded (0x89fe89fe, 522240 ns).
> 
> This paragraph better to be in the comment block, after '---' line below.
> We will have this information being archived by lore.kernel.org.

Personally, I prefer it in the commit message, but will move it in v2.

>> Fixes: 8122e7cd806d ("platform/x86: intel_pmc_core: Decode Snoop / Non Snoop LTR")
>> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> ---
>>
>> Notes:
>>      Claude Code (claude-opus-5-5) helped analyse the register values, write
>>      the patch, and test it on the Dell XPS 13 9310.
> 
>>   drivers/platform/x86/intel/pmc/core.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> ...
> 
>> +/*
>> + * Every ltr_show map ends with CURRENT_PLATFORM and AGGREGATED_SYSTEM. Unlike
>> + * the per-IP rows, these PMC registers do not hold an LTR message payload as
>> + * defined by PCIe; on Tiger Lake, for example, AGGREGATED_SYSTEM has the
>> + * reserved bits 14:13 set and reads 0x7fffdff. Do not decode them.
>> + */
>> +static bool pmc_core_ltr_is_summary(const struct pmc_bit_map *map,
>> +				    unsigned int index)
>> +{
>> +	return !map[index + 1].name || !map[index + 2].name;
> 
> How do we know that the index is not out-of-boundary?

The maps end with a { } sentinel, and the caller runs only for an index 
with map[index].name set, so map[index + 1] is the sentinel at the 
latest. map[index + 2] is only read if map[index + 1].name is set, so it 
is the sentinel at the latest, too. But indeed, it is not obvious when 
reading the code, so v2 counts the rows of the map once before the loop 
and checks `index + 2 >= num_rows` instead; the helper is gone.

>> +}
> 
> ...
> 
>>   		for (index = 0; map[index].name; index++) {
>>   			bool ltr_ign_data;
>> +			bool summary = pmc_core_ltr_is_summary(map, index);
> 
> Same question and keep this to be in reversed xmas tree order.

Done in v2.


Kind regards,

Paul
