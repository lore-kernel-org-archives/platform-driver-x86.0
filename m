Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BF283FFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547884; cv=none; b=WDkUSWOeyQcabPIQQnjE2nqfq/2egNAcGXcH2lGWEvRcc68LrX6fmwJahKnxbiLGRF0tI86dNno15XHJIqCjwO2En6LB0EUPVxZAjDq75Jjky24QwP73jR3ZeyDWn7xhRIesPPE78gG2BHO4mc4z9Bd513RrWO+VqS7Q4X5pooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547884; c=relaxed/simple;
	bh=6eauwcZ9BQ/XnViG2fbxz/0wJF4qhhM3owh4FhXARKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBwMHUvBTOFgaM2L+XrAlVoPELRSE1d9QOIGFQ18OOwh8PDoL7rjjJ0HTe0+a/ZPXh7/09VgSTS0KdV0MbYfsCeMzolOahuCr/d7TzSXQNYdYMfC90ZPSI2SRO2I7H5uPS7Tl2N9lj//80Ks74z+fyDbxnH417lQgLNrZ3cW54c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCd5NVok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCd5NVok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCCEC4CEEB;
	Tue,  6 May 2025 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746547883;
	bh=6eauwcZ9BQ/XnViG2fbxz/0wJF4qhhM3owh4FhXARKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kCd5NVokfeKJJ3NBjZcGXm++gum07jAiqm6Goccz1ljj+goCr8aTr6PrysNewDVLK
	 sqZtsjkEhrLcBALEWmVrQD7kYRmU0SIIMOUihTy02JdOmQbW/OaogLirCLgG3YmHUl
	 bQWuLDzkLzFEf5dAHPhNtzCMYZ5fYiY1NiVoDMz9GV4blVOOJeH+WhD9w2Qwst1b3V
	 hiQWXspGHaghF8Yy2Xg7h2nOfgw69JcdApLMS8jDUP4NC/aJGs4HBR1ZJDQQj71xsN
	 gM7IhT/mY9Ik6xYuafl7fmNN+g97cuCqVjxqN3RnMMwOiIX9DBu96U1sGVsi+csiwH
	 GyEkSpn3QXb/w==
Message-ID: <fce0ca00-3d0b-48a8-ad97-9125f4297f05@kernel.org>
Date: Tue, 6 May 2025 11:11:21 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/platform/x86/amd: pmf: Fix a double free on
 module unload
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20250506131130.1446262-1-superm1@kernel.org>
 <aBowhD4lwc017-NE@stanley.mountain>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aBowhD4lwc017-NE@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/2025 10:53 AM, Dan Carpenter wrote:
> On Tue, May 06, 2025 at 08:11:29AM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> If setting up smart PC fails for any reason then this can lead to
>> a double free when unloading amd-pmf.  This is because dev->buf was
>> freed but never set to NULL and is again freed in
>> amd_pmf_deinit_smart_pc().
>>
>> Explicitly set pointers to NULL after freeing them to avoid the
>> double free.
>>
>> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/tee-if.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index a1e43873a07b0..48902f1c767c6 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -579,10 +579,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   	amd_pmf_tee_deinit(dev);
>          ^^^^^^^^^^^^^^^^^^^^^^^
> 
>>   err_free_prev_data:
>>   	kfree(dev->prev_data);
>> +	dev->prev_data = NULL;
>>   err_free_policy:
>>   	kfree(dev->policy_buf);
>> +	dev->policy_buf = NULL;
>>   err_free_dram_buf:
>>   	kfree(dev->buf);
>> +	dev->buf = NULL;
>>   err_cancel_work:
>>   	cancel_delayed_work_sync(&dev->pb_work);
>>   
> 
> This is a real bug.  Did you find it from testing or reading the code?

I found it from testing.  I was testing some other unrelated changes and 
found that unloading/reloading the module eventually lead to problems. 
I tracked it down to your change.

> My reading of the code says that this bug can only occur if
> amd_pmf_register_input_device() fails, right?

No; it was happening from a failure where the system didn't have a 
policy or had a "bad" policy.

> 
> We can only call amd_pmf_deinit_smart_pc() if amd_pmf_start_policy_engine()
> succeeds because that's where we set:
> 
> 	dev->smart_pc_enabled = true;
> 
> This patch doesn't totally fix the problem because we would still call
> amd_pmf_tee_deinit().  That's why I suspect you found this by auditing
> the code because I think that remaining bug would trigger a stack trace.
> I also worry that there is a small race window where we could trigger
> amd_pmf_tee_deinit() before amd_pmf_init_smart_pc() has finished
> running.
> 
> Another bug is that we should cancel the work before freeing all the
> pointers.  This looks like the more serious bug.
> 
> What about if we only set dev->smart_pc_enabled = true if the whole
> amd_pmf_init_smart_pc() has succeeded?
> 
> regards,
> dan carpenter
> 

Right; it's only set when amd_pmf_start_policy_engine() succeeds which 
was not the case for me.  This makes me wonder how exactly this was 
happening [amd_pmf_deinit_smart_pc() would only be called from 
amd_pmf_deinit_features()].
