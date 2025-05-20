Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF6B25F963
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 May 2025 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754765; cv=none; b=YbiKv26crJuRlN2kxlB9DOQOT7v3tGRm7Jc1yhNW5ozXa5xn7cpQexOR78YfYTaZYaacctOEnKx/qAa24cKBRcu+y+XM+bfbEVRimwUgwN881UkazELGuMILSW/TEVBwpfWXdYQaurUsidHKHqS0cjb+M0PaHGzM8eqbPpZ6dKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754765; c=relaxed/simple;
	bh=WRZHd6EOTJGO1pWMuTI8eNA20d4qOR8H/MvjRQTGxEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MH+WsEKakzodhn8r1+T/YCSPO0gMjVOYaVoklbxEuU9xX6ZpL+LjG9QNIZLwVghEZBZvvlps+JAbceKf96R+5SFkE8f04MSFLLXzbPbhaWAhn3d/HuKazEZRKBm4Pon0e/6jIqq+oy9bpVyngEYuGfqAMixfHJkyFPF057HxXyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JD7c2ONq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JD7c2ONq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EFBC4CEEF;
	Tue, 20 May 2025 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747754765;
	bh=WRZHd6EOTJGO1pWMuTI8eNA20d4qOR8H/MvjRQTGxEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JD7c2ONq8q9L/EOxnxQ0qMFqfjd85IbJtAjvS28YyViAujbwe5KhIzSkKwZazZ73R
	 UFd1qwRl+zi60SlKTmXiOWjcycsb5JEvGnpRVWzFehGdSG0Wc4//tPFOew+fZAN/qU
	 sG+AauZIJIOtr0K59TLdArAumtZeDizsjldkgMv7lDat+YlcxMYrHtaTKdPvGE6pPU
	 Q0dUOyWMxF7665lsAifEhFeyKEcBhjhgGkAzVyAlrGuYvdeIGuUyNpy3bbzv8yPRNN
	 htBdRRjxwnC3tgy2AUuWg5pja26DGfS2Xy5rGvkZgrRhubG28mvsnCWzQsi5DXl9qk
	 pnMjVzo2qJGZg==
Message-ID: <48a625cd-b599-4905-9f4a-41199e628fdb@kernel.org>
Date: Tue, 20 May 2025 10:26:04 -0500
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
 <45179f82-f423-4093-a748-9411b983b57f@kernel.org>
 <83097abc-0adb-f916-4d10-672f0ec3d41e@linux.intel.com>
 <82933030-59fe-436f-a43e-934f00c20bfa@kernel.org>
 <98c29162-be08-b1ee-4ab0-43c77b17bc1a@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <98c29162-be08-b1ee-4ab0-43c77b17bc1a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/2025 10:19 AM, Ilpo Järvinen wrote:
> On Fri, 16 May 2025, Mario Limonciello wrote:
> 
>> On 5/16/2025 1:36 AM, Ilpo Järvinen wrote:
>>> On Fri, 16 May 2025, Mario Limonciello wrote:
>>>> On 5/16/25 01:04, Ilpo Järvinen wrote:
>>>>> On Thu, 15 May 2025, Mario Limonciello wrote:
>>>>>
>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>
>>>>>> If setting up smart PC fails for any reason then this can lead to
>>>>>> a double free when unloading amd-pmf.  This is because dev->buf was
>>>>>> freed but never set to NULL and is again freed in amd_pmf_remove().
>>>>>>
>>>>>> To avoid subtle allocation bugs in failures leading to a double free
>>>>>> change all allocations into device managed allocations.
>>>>>>
>>>>>> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in
>>>>>> amd_pmf_init_smart_pc()")
>>>>>> Link:
>>>>>> https://lore.kernel.org/r/20250512211154.2510397-2-superm1@kernel.org
>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> ---
>>>>>> v4:
>>>>>>     * Handle failures from memory allocation on sideload (Ilpo)
>>>>>>     * Allocate memory before copying from user (Ilpo)
>>>>>> ---
>>>>>>     drivers/platform/x86/amd/pmf/core.c   |  3 +-
>>>>>>     drivers/platform/x86/amd/pmf/tee-if.c | 58
>>>>>> +++++++++------------------
>>>>>>     2 files changed, 20 insertions(+), 41 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>>>>>> b/drivers/platform/x86/amd/pmf/core.c
>>>>>> index 96821101ec773..395c011e837f1 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>>>> @@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev,
>>>>>> bool alloc_buffer)
>>>>>>     			dev_err(dev->dev, "Invalid CPU id: 0x%x",
>>>>>> dev->cpu_id);
>>>>>>     		}
>>>>>>     -		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
>>>>>> +		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size,
>>>>>> GFP_KERNEL);
>>>>>>     		if (!dev->buf)
>>>>>>     			return -ENOMEM;
>>>>>>     	}
>>>>>> @@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device
>>>>>> *pdev)
>>>>>>     	mutex_destroy(&dev->lock);
>>>>>>     	mutex_destroy(&dev->update_mutex);
>>>>>>     	mutex_destroy(&dev->cb_mutex);
>>>>>> -	kfree(dev->buf);
>>>>>>     }
>>>>>>       static const struct attribute_group *amd_pmf_driver_groups[] = {
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> index d3bd12ad036ae..6d85601812225 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> @@ -350,38 +350,30 @@ static ssize_t amd_pmf_get_pb_data(struct file
>>>>>> *filp, const char __user *buf,
>>>>>>     				   size_t length, loff_t *pos)
>>>>>>     {
>>>>>>     	struct amd_pmf_dev *dev = filp->private_data;
>>>>>> -	unsigned char *new_policy_buf;
>>>>>>     	int ret;
>>>>>>       	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
>>>>>>     	if (length > POLICY_BUF_MAX_SZ || length == 0)
>>>>>>     		return -EINVAL;
>>>>>>     -	/* re-alloc to the new buffer length of the policy binary */
>>>>>> -	new_policy_buf = memdup_user(buf, length);
>>>>>> -	if (IS_ERR(new_policy_buf))
>>>>>> -		return PTR_ERR(new_policy_buf);
>>>>>> -
>>>>>> -	kfree(dev->policy_buf);
>>>>>> -	dev->policy_buf = new_policy_buf;
>>>>>> +	devm_kfree(dev->dev, dev->policy_buf);
>>>>>> +	dev->policy_buf = devm_kzalloc(dev->dev, length, GFP_KERNEL);
>>>>>> +	if (IS_ERR(dev->policy_buf))
>>>>>> +		return -ENOMEM;
>>>>>>     	dev->policy_sz = length;
>>>>>>     -	if (!amd_pmf_pb_valid(dev)) {
>>>>>> -		ret = -EINVAL;
>>>>>> -		goto cleanup;
>>>>>> -	}
>>>>>> +	if (copy_from_user(dev->policy_buf, buf, length))
>>>>>> +		return -EFAULT;
>>>>>
>>>>> Previously, if anything failed here, the old buffer was left in place.
>>>>> I always assumed it was intentional. But after your change, first thing
>>>>> that happens is freeing the old policy_buf.
>>>>
>>>> Yeah; in order to do devm without a double malloc it needs to be cleared
>>>> immediately.
>>>
>>> I'm feeling like I must be missing something here, but I just fail to see
>>> why the order _has to be_ changed when changing kfree() -> devm_kfree().
>>
>> Because the policy is coming in from userspace and you need to have somewhere
>> that is the right size to copy it to.
>>
>> As you mentioned wanting to remove the double malloc in the earlier version
>> this is the way to do it.
>>
>> IE when using copy_from_user() instead of memdup_user() the memory must
>> "already" be allocated.  That's what is done now with devm_kzalloc().
> 
> Hi Mario,
> 
> Why can't you do:
> 
> 	/* re-alloc to the new buffer length of the policy binary */
> 	new_policy_buf = devm_kzalloc(dev->dev, length, GFP_KERNEL);
> 	if (!new_policy_buf)
> 		return -ENOMEM;
> 
> 	if (copy_from_user(new_policy_buf, buf, length)) {
> 		devm_kfree(new_policy_buf);
> 		return -EFAULT;
> 	}
> 
> 	devm_kfree(dev->policy_buf);
> 	ev->policy_buf = new_policy_buf;
> 
> ?
> 
> That follows pretty much what the old code did with new_policy_buf
> variable, but allocation related calls are now devm_*().

Thanks for the suggestion!  I hadn't thought about using a second 
pointer like that.

Technically the devm_kfree(new_policy_buf) under the copy_from_user() 
failure shouldn't be needed though, right?  Because it will still be 
freed when the device is freed.

> 
>> Are you suggesting some sort of way to keep it in the same order and subvert
>> device managed allocations and "steal" the pointer?  Glib has a concept like
>> this, but I wasn't aware of a way to do in the kernel.
>>
>>>
>>>> But this is a debugfs sideloading interface.  If you send a bad
>>>> binary you can just try again with a good one.
>>>>
>>>>>
>>>>> We're long past the point where I've started to lose confidence in this
>>>>> patch :-(. Could we like just make the minimal changes here to convert
>>>>> into devm_*() and nothing more? If you want to make any other changes,
>>>>> be
>>>>> it reordering logic, removal of the local variable, or whatever, please
>>>>> put those into own patch(es) and properly justify them.
>>>>>
>>>>
>>>> If we're aiming for a total minimal patch that just fixes the most
>>>> immediate
>>>> issue that's v1 of this series [1].
>>>
>>> As spelled out very clearly in the above comment, I'm aiming to a patch
>>> which converts this to devm_*() without other changes. If you want to do
>>> other changes, they should be in their own patch.
>>
>> I guess if there's a way to do this without changing the order I will do it,
>> but I don't see one RN.
> 
> 

