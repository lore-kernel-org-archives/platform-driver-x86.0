Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D8B26AABE
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412194; cv=none; b=prvhnrI2EI0EL+PDf88nRoUCgfd49y7Dc4035vukBVqTffgt84hJuYpZduACY70QNrSkrfOYoIeVjFeAFrMw9SRrIS6HPE7ygTQkx6vIAUZizoPXyV65C0Dt61LRrTfPYIOb/7I6SUwUroNw6pv5I9lQBgs0qfZC3vGb3ONZTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412194; c=relaxed/simple;
	bh=Z6sgSQ4pKquqmGNpnzDbzmkV3LWbY765i0KVXI6GWko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2VkhPhRiAISDCyISuhA52UQW6ZKrCfpuxhB5gzwX6OHdmH3N8KWk1g+IIUuEW4g9LuLrglrY5YirOqNbk6ofkH8XJMrSNGdz4e0kQSUtHow98JzYAbkpPWywqhTSZ8Et7apipozop0+U7W25/ZV/MOgTXEkXbxuqCSFzsUs/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d37EOw0j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d37EOw0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60ABCC4CEE2;
	Wed, 23 Apr 2025 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745412193;
	bh=Z6sgSQ4pKquqmGNpnzDbzmkV3LWbY765i0KVXI6GWko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d37EOw0jD7d2fyew7i4TyBDNrSyJnxM1HhfXjkP2kihOovKb1KMSAgEyPeSCk5vr7
	 L3fxTSbm99a/CpdssqqbPrI1ZkvS1nZEKmio73I6gEmin9h54R/M3HEYfXWUDe4g6j
	 vkYpH8nYPoRS50m+6LPcDjxLCucDp1eOcHVNGoAUvBTgiciOCxANrbd0lMjoo8Zji2
	 2Ztxx/sBylV7V4N08QL1a237qY0fbboTMOnmHFDwgAHSfD+gVRBlTjouhHrQGq09EQ
	 eFT5IsCEztG8TVTkKg51U0myu/islOSGCwb2ykfDVb7Bfcb0XyjMCuDFgm4Qu6pZz6
	 V+KbdBl7+pDXg==
Message-ID: <8793ece5-46a5-41c3-a87d-c08896cf2605@kernel.org>
Date: Wed, 23 Apr 2025 07:43:11 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers/platform/x86/amd: pmf: Handle bad policies in
 amd_pmf_get_pb_data()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
References: <20250423121202.3736094-1-superm1@kernel.org>
 <20250423121202.3736094-3-superm1@kernel.org>
 <169663ff-6038-baf5-c872-2d485cf02ab5@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <169663ff-6038-baf5-c872-2d485cf02ab5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/23/25 07:19, Ilpo Järvinen wrote:
> On Wed, 23 Apr 2025, Mario Limonciello wrote:
> 
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> If a policy is passed into amd_pmf_get_pb_data() that causes the engine
>> to fail to start there is a memory leak. Check for invalid policies as
>> well as an error in amd_pmf_start_policy_engine() and free the memory in
>> the failure path.
>>
>> Fixes: 10817f28e5337 ("platform/x86/amd/pmf: Add capability to sideload of policy binary")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/tee-if.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 41ab9eca5ff13..3c399dc1bfcca 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -377,12 +377,23 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>>   	dev->policy_buf = new_policy_buf;
>>   	dev->policy_sz = length;
>>   
>> +	/* Check if the policy binary is valid */
>> +	if (!memchr_inv(dev->policy_buf, 0xff, dev->policy_sz)) {
> 
> Since you're adding an explaning comment into two places, it very much
> looks you want a reasonably named helper instead for this so there's no
> need for such comments.

OK; I was initially hesitant since it was a single call to memchr_inv() 
but I'll switch it to an inline helper instead.

> 
>> +		ret = -EINVAL;
>> +		goto cleanup;
>> +	}
>> +
>>   	amd_pmf_hex_dump_pb(dev);
>>   	ret = amd_pmf_start_policy_engine(dev);
>>   	if (ret < 0)
>> -		return ret;
>> +		goto cleanup;
> 
> Isn't this an independent fix that should be in its own patch?

Ack; will split into it's own patch.

> 
>>   
>>   	return length;
>> +
>> +cleanup:
>> +	kfree(dev->policy_buf);
>> +	dev->policy_buf = NULL;
>> +	return ret;
>>   }
>>   
>>   static const struct file_operations pb_fops = {
>>
> 

