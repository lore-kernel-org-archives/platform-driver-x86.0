Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8121D581
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732836; cv=none; b=i7Gzo1uc0r7FwWlMSotcdw574E2CWVUX4UEpSXq2IR8ewAL/hiKjfQ+4uAk+nbJrwHp4nZVX2ewIliyanIHttriPPWDSmPutOM0X4df8s0PkGIvkAtPyaZ+8IrQm5TJYIe0qIv9C1XFrIrKc5pDpEXnkJkMMe10jzl9t5aIeIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732836; c=relaxed/simple;
	bh=TpCyQipDX0/JVdYpkyJWI5hN2Jr0ozB2HvXNka2x1QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axgMzShRHzNAmZRWFkRriqDLokYG47Akf9xXgVzseZLzOHZUNMEs2T0N/BLFkYbMd149bW/KmpusTherv3ub9w6M5/pIIUnlhx5yDRZGG9KTmFNum28tg7PyXS9jHazkRIr/JZzx+HeMRKdBRzApotD8sdKS7HzZV6N/40ewWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/o6kRog; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/o6kRog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CEFC4CEE7;
	Thu,  8 May 2025 19:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746732835;
	bh=TpCyQipDX0/JVdYpkyJWI5hN2Jr0ozB2HvXNka2x1QA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V/o6kRognIMVjciKIOKE0UWT6TJVPbBJoG5bd9h/fGxl8ZTdbw/mTAMjmhbBHZNpl
	 txuU+4AKgf5kg5C09eai5ySEwRNgyWww2P+R0Jn4g02AK6rNV7C9hQKijSqPB0rbso
	 RBFHZvCriIHWtjLJDI98O8tV4JHkikbUyFx87z22oPz4Lo/IiNWpEGJlPP7Gu1dkha
	 e+Qh1ac0kXiSYTTCwH7oO45QsJv9FvWNKb5lKzXi+ekjk1sCtMWFxYRrhPGW2ysJMT
	 7/Rr4AlwUahzPdjxdtAs3xXXAU7Ub2edRWZNTlm4ocnfOojpfoJifM+xgVQkxvZcGi
	 2vDKqGxRvTPUQ==
Message-ID: <08862428-d104-4255-bf91-4223abda10cd@kernel.org>
Date: Thu, 8 May 2025 14:33:54 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd: pmf: Use device managed allocations
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com,
 Hans de Goede <hdegoede@redhat.com>, dan.carpenter@linaro.org,
 platform-driver-x86@vger.kernel.org
References: <20250507020838.2962896-1-superm1@kernel.org>
 <b10d7dcd-4026-b06a-f278-b7d46b6a0fee@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <b10d7dcd-4026-b06a-f278-b7d46b6a0fee@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/2025 4:44 AM, Ilpo Järvinen wrote:
> On Tue, 6 May 2025, Mario Limonciello wrote:
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
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v1->v2:
>>   * Correct commit message with correct offending function root cause
>>   * Switch to device managed allocations.
>>
>>   drivers/platform/x86/amd/pmf/core.c   |  3 +--
>>   drivers/platform/x86/amd/pmf/tee-if.c | 30 ++++++++-------------------
>>   2 files changed, 10 insertions(+), 23 deletions(-)
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
>> index d3bd12ad036ae..50c082a78cd9e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -532,13 +532,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
>>   	if (IS_ERR(dev->policy_base)) {
>>   		ret = PTR_ERR(dev->policy_base);
>> -		goto err_free_dram_buf;
>> +		goto err_cancel_work;
>>   	}
>>   
>> -	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
>> +	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);
> 
> Hi Mario,
> 
> Isn't ->policy_buf freed and another allocated in amd_pmf_get_pb_data()
> and this patch lacks any changes around there?? That switch of the buffer
> has been the reason why I've not suggested using devm_*() for earlier for
> it.
> 
> Please check all related code to the pointers you're changing if there
> are other similar traps you have not taken into account.

Ah, thanks I thought I caught them all but missed that instance.

A few options that come to mind:
1) instead make the very first allocation POLICY_BUF_MAX_SZ, and then 
never reallocate for the life of the driver.
2) Don't allow sideloading a bigger policy than the original one in the 
firmware.
3) Don't switch all 3 to device managed like this patch, just switch the 
two that can and fix the one broken one causing a double free.
4) Switch the case you pointed out to use devm_kfree() and re-allocate 
at that time.

Anyone with a preference?  I lean upon option 4.

> 
>>   	if (!dev->policy_buf) {
>>   		ret = -ENOMEM;
>> -		goto err_free_dram_buf;
>> +		goto err_cancel_work;
>>   	}
>>   
>>   	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
>> @@ -546,21 +546,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   	if (!amd_pmf_pb_valid(dev)) {
>>   		dev_info(dev->dev, "No Smart PC policy present\n");
>>   		ret = -EINVAL;
>> -		goto err_free_policy;
>> +		goto err_cancel_work;
>>   	}
>>   
>>   	amd_pmf_hex_dump_pb(dev);
>>   
>> -	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>> +	dev->prev_data = devm_kzalloc(dev->dev, sizeof(*dev->prev_data), GFP_KERNEL);
>>   	if (!dev->prev_data) {
>>   		ret = -ENOMEM;
>> -		goto err_free_policy;
>> +		goto err_cancel_work;
>>   	}
>>   
>>   	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
>>   		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
>>   		if (ret)
>> -			goto err_free_prev_data;
>> +			goto err_cancel_work;
>>   
>>   		ret = amd_pmf_start_policy_engine(dev);
>>   		switch (ret) {
>> @@ -575,7 +575,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   		default:
>>   			ret = -EINVAL;
>>   			amd_pmf_tee_deinit(dev);
>> -			goto err_free_prev_data;
>> +			goto err_cancel_work;
>>   		}
>>   
>>   		if (status)
>> @@ -584,7 +584,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   
>>   	if (!status && !pb_side_load) {
>>   		ret = -EINVAL;
>> -		goto err_free_prev_data;
>> +		goto err_cancel_work;
>>   	}
>>   
>>   	if (pb_side_load)
>> @@ -600,12 +600,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   	if (pb_side_load && dev->esbin)
>>   		amd_pmf_remove_pb(dev);
>>   	amd_pmf_tee_deinit(dev);
>> -err_free_prev_data:
>> -	kfree(dev->prev_data);
>> -err_free_policy:
>> -	kfree(dev->policy_buf);
>> -err_free_dram_buf:
>> -	kfree(dev->buf);
>>   err_cancel_work:
>>   	cancel_delayed_work_sync(&dev->pb_work);
>>   
>> @@ -621,11 +615,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>>   		amd_pmf_remove_pb(dev);
>>   
>>   	cancel_delayed_work_sync(&dev->pb_work);
>> -	kfree(dev->prev_data);
>> -	dev->prev_data = NULL;
>> -	kfree(dev->policy_buf);
>> -	dev->policy_buf = NULL;
>> -	kfree(dev->buf);
>> -	dev->buf = NULL;
>>   	amd_pmf_tee_deinit(dev);
>>   }
>>
> 

