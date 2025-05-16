Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B5149DF0
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 May 2025 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747376447; cv=none; b=DELOXbZtHXDGjVYzsYr/BDTY+K3QzCGcJU/vG4EmVKWA/gZXsFthdJJSKFT9YMMAuK+awAM9DNyY4a2ao4K4oG4Cm5yPDi8rK7zY1KixbM74yZdKnGjocSs6pSjrlJy5Plgo4TmiH327U/9nkFo6qto41+vfZGcRT/Zz/NkBLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747376447; c=relaxed/simple;
	bh=9Od1q8t8qSu/zyjvrFlvhmzg7qU7gNiIFaZhmrwhxj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/qonzax/YJYnc1XldJsyGIZQL4HlE4QviXCsNJqdvix4z3hPyBFp+/iGVUoSDe09mX7WZe4UmE/iGAr1ArQKTZOPTW6JX2VcsRL9JvnrluOUJwGX4osOyfHfG9sUU5FBBCjNvSWItUy/dRcBBYUp5VEGZAG90SigVVIhWoY4Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxqwT9oL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxqwT9oL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3792C4CEE4;
	Fri, 16 May 2025 06:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747376446;
	bh=9Od1q8t8qSu/zyjvrFlvhmzg7qU7gNiIFaZhmrwhxj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WxqwT9oLwW9oRVgcK0W8nN/97T/rnb2wUFeJ96Hz1swejuBb0nb1PsYsdBy2dSSkp
	 sBqRCtgrAX7mpV2Pu3KDwgNdT6GSYPx03rapR7McMkBh36wWz256MFBWPSvWPliLwE
	 OzkWdrv9mQ4hF9B6ITX0fYeEVXWmc/Wex1gbXxfe9Fnhaj0fkQQQgdaqFTPdDIQ+2t
	 qhLmExQlXqFyUsdMkokCSi0OwO4Qy7JblRg8EqannJYzTcXmhQTY4JmjipBgFqkYUf
	 k6+HSuConFgIu6R4XiRoGqrLPDDFdczCDvn4E9+HE57PsYjDlb04esPGqr2IFjX+g/
	 lXZeDD7CoL1iA==
Message-ID: <45179f82-f423-4093-a748-9411b983b57f@kernel.org>
Date: Fri, 16 May 2025 01:20:44 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] platform/x86/amd: pmf: Use device managed
 allocations
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250515162351.2111468-1-superm1@kernel.org>
 <20250515162351.2111468-2-superm1@kernel.org>
 <4570e60a-c313-56ac-d85b-072aa3395ec2@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <4570e60a-c313-56ac-d85b-072aa3395ec2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/16/25 01:04, Ilpo Järvinen wrote:
> On Thu, 15 May 2025, Mario Limonciello wrote:
> 
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> If setting up smart PC fails for any reason then this can lead to
>> a double free when unloading amd-pmf.  This is because dev->buf was
>> freed but never set to NULL and is again freed in amd_pmf_remove().
>>
>> To avoid subtle allocation bugs in failures leading to a double free
>> change all allocations into device managed allocations.
>>
>> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
>> Link: https://lore.kernel.org/r/20250512211154.2510397-2-superm1@kernel.org
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v4:
>>   * Handle failures from memory allocation on sideload (Ilpo)
>>   * Allocate memory before copying from user (Ilpo)
>> ---
>>   drivers/platform/x86/amd/pmf/core.c   |  3 +-
>>   drivers/platform/x86/amd/pmf/tee-if.c | 58 +++++++++------------------
>>   2 files changed, 20 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 96821101ec773..395c011e837f1 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>>   			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
>>   		}
>>   
>> -		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
>> +		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
>>   		if (!dev->buf)
>>   			return -ENOMEM;
>>   	}
>> @@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
>>   	mutex_destroy(&dev->lock);
>>   	mutex_destroy(&dev->update_mutex);
>>   	mutex_destroy(&dev->cb_mutex);
>> -	kfree(dev->buf);
>>   }
>>   
>>   static const struct attribute_group *amd_pmf_driver_groups[] = {
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index d3bd12ad036ae..6d85601812225 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -350,38 +350,30 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>>   				   size_t length, loff_t *pos)
>>   {
>>   	struct amd_pmf_dev *dev = filp->private_data;
>> -	unsigned char *new_policy_buf;
>>   	int ret;
>>   
>>   	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
>>   	if (length > POLICY_BUF_MAX_SZ || length == 0)
>>   		return -EINVAL;
>>   
>> -	/* re-alloc to the new buffer length of the policy binary */
>> -	new_policy_buf = memdup_user(buf, length);
>> -	if (IS_ERR(new_policy_buf))
>> -		return PTR_ERR(new_policy_buf);
>> -
>> -	kfree(dev->policy_buf);
>> -	dev->policy_buf = new_policy_buf;
>> +	devm_kfree(dev->dev, dev->policy_buf);
>> +	dev->policy_buf = devm_kzalloc(dev->dev, length, GFP_KERNEL);
>> +	if (IS_ERR(dev->policy_buf))
>> +		return -ENOMEM;
>>   	dev->policy_sz = length;
>>   
>> -	if (!amd_pmf_pb_valid(dev)) {
>> -		ret = -EINVAL;
>> -		goto cleanup;
>> -	}
>> +	if (copy_from_user(dev->policy_buf, buf, length))
>> +		return -EFAULT;
> 
> Previously, if anything failed here, the old buffer was left in place.
> I always assumed it was intentional. But after your change, first thing
> that happens is freeing the old policy_buf.

Yeah; in order to do devm without a double malloc it needs to be cleared 
immediately.  But this is a debugfs sideloading interface.  If you send 
a bad binary you can just try again with a good one.

> 
> We're long past the point where I've started to lose confidence in this
> patch :-(. Could we like just make the minimal changes here to convert
> into devm_*() and nothing more? If you want to make any other changes, be
> it reordering logic, removal of the local variable, or whatever, please
> put those into own patch(es) and properly justify them.
> 

If we're aiming for a total minimal patch that just fixes the most 
immediate issue that's v1 of this series [1].

Through the course of the discussion obviously there were more things 
raised by Dan, and I feel that v4 is more robust.

Maybe the right answer is to just pick up v1 for 6.15-rc, and this 
series for 6.16?  Or if you want this to have more time in -next I can 
just resubmit it after 6.16-rc1 and we aim for 6.17 with it.

[1] 
https://lore.kernel.org/platform-driver-x86/20250506131130.1446262-1-superm1@kernel.org/#t

