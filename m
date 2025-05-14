Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3619341F
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 May 2025 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235104; cv=none; b=E+VPZB2DAxWTWUr04UUDLquw7GO+tjARsw/+sdLC2Kv3VK+99KZSx0NR+jF/sopPNyaJUrXtABiUgEazW2jIZEpdRn0xkmy98bNW9slFFOdbBbR4SenBTAk8aokWguRoXuY2n4yCBt+ceGybhdRXkisZR9oteYA16dQkNahWZrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235104; c=relaxed/simple;
	bh=mCjXyGPvPMw15YNiOC7o3YC+mfalJUfeZUzWoCE+dQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWnn9i3kNRDULFVJxvjBnrSgeKyx3q8cUU+86zyUul3TuYhDC9JyDcIeEEu6Ke3ZVDwp0OV7CMIUEGZ/9OWHVCeYLa6cxVqe7KHZm82iw42HB0JeBBsTae301aGNO6aySSP+5J1hxgf/l+GHyscxogOZDcxFO6fdZIuUbuvxsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ9Fhh3r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ9Fhh3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17274C4CEE3;
	Wed, 14 May 2025 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235103;
	bh=mCjXyGPvPMw15YNiOC7o3YC+mfalJUfeZUzWoCE+dQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dQ9Fhh3rikVsPAO/pJkJDhx0eqL/tuCNLrMMDn9x/zwPOrc011Wl56aZKmpITEzuH
	 5FGMFdsvaZsdc0y5OyKoHOvskIqSV+ad7IAgUrrcmNTPbJ7ygCSowILZ5jzpZF1HEC
	 Avgo+UDrIaUhsNJgHnERTxlcMqVkgto3vM2QM57EWj94MTuyro5zaJvTF397OineI/
	 NlKIR5i895enzpg7SQyuocarFFMywa7QjF6CbrTaoI6n1Q82zJhKtduVWmbOrabspL
	 cqLRiQzoaLX6wk8fN89jaOCt/cFB1tBi7tQDCw2g/EXmYJn9yEInKSLE8ErIrs9Y92
	 WpQuSqIW6Wliw==
Message-ID: <ecdac8e8-cebc-45bd-a232-1b8f6fc4e029@kernel.org>
Date: Wed, 14 May 2025 10:05:02 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] platform/x86/amd: pmf: Use device managed
 allocations
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250512211154.2510397-1-superm1@kernel.org>
 <20250512211154.2510397-2-superm1@kernel.org>
 <e344db1e-6978-3e99-2c4e-13d2df0a11e0@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <e344db1e-6978-3e99-2c4e-13d2df0a11e0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/2025 5:21 AM, Ilpo Järvinen wrote:
> On Mon, 12 May 2025, Mario Limonciello wrote:
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
>>   drivers/platform/x86/amd/pmf/core.c   |  3 +-
>>   drivers/platform/x86/amd/pmf/tee-if.c | 48 +++++++++------------------
>>   2 files changed, 16 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 96821101ec77..395c011e837f 100644
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
>> index d3bd12ad036a..513dbbe3f214 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -362,26 +362,20 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>>   	if (IS_ERR(new_policy_buf))
>>   		return PTR_ERR(new_policy_buf);
>>   
>> -	kfree(dev->policy_buf);
>> -	dev->policy_buf = new_policy_buf;
>> +	devm_kfree(dev->dev, dev->policy_buf);
>> +	dev->policy_buf = devm_kmemdup(dev->dev, new_policy_buf, dev->policy_sz, GFP_KERNEL);
> 
> So now there are two memdups?? 

Is there a safe way to do it without the double memdups that I'm missing?

I didn't see a helper for device managed memory to copy from user like 
memdup_user() does.

> And there's no error handling either?!

Whoops; will fix.

> 
>>   	dev->policy_sz = length;
>> +	kfree(new_policy_buf);
>>   
>> -	if (!amd_pmf_pb_valid(dev)) {
>> -		ret = -EINVAL;
>> -		goto cleanup;
>> -	}
>> +	if (!amd_pmf_pb_valid(dev))
> 
> Due to lack of error handling, this can deref NULL.
> 
>> +		return -EINVAL;
>>   
>>   	amd_pmf_hex_dump_pb(dev);
>>   	ret = amd_pmf_start_policy_engine(dev);
>>   	if (ret < 0)
>> -		goto cleanup;
>> +		return ret;
>>   
>>   	return length;
>> -
>> -cleanup:
>> -	kfree(dev->policy_buf);
>> -	dev->policy_buf = NULL;
>> -	return ret;
>>   }
>>   
>>   static const struct file_operations pb_fops = {
>> @@ -532,13 +526,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
>>   	if (IS_ERR(dev->policy_base)) {
>>   		ret = PTR_ERR(dev->policy_base);
>> -		goto err_free_dram_buf;
>> +		goto err_cancel_work;
>>   	}
>>   
>> -	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
>> +	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);
>>   	if (!dev->policy_buf) {
>>   		ret = -ENOMEM;
>> -		goto err_free_dram_buf;
>> +		goto err_cancel_work;
>>   	}
>>   
>>   	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
>> @@ -546,21 +540,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
>> @@ -575,7 +569,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   		default:
>>   			ret = -EINVAL;
>>   			amd_pmf_tee_deinit(dev);
>> -			goto err_free_prev_data;
>> +			goto err_cancel_work;
>>   		}
>>   
>>   		if (status)
>> @@ -584,7 +578,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>   
>>   	if (!status && !pb_side_load) {
>>   		ret = -EINVAL;
>> -		goto err_free_prev_data;
>> +		goto err_cancel_work;
>>   	}
>>   
>>   	if (pb_side_load)
>> @@ -600,12 +594,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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
>> @@ -621,11 +609,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
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

