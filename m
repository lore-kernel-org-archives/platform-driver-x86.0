Received: from vps-ovh.mhejs.net (vps-ovh.mhejs.net [145.239.82.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C1C147;
	Sun, 29 Dec 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.82.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735491796; cv=none; b=oCECZN9vICX0JAlfYp9O6bBpS4U5392DvIKHDNSwbTw2b7O06/BHZFK0In2bDZuKC3OxUhy8ToPmB/WspDV5T23sYd1ccAh8NKxW6yTMsJ8lPB7OCuyjIXFRkzhWutfTSf2YsAa6zLBFdIm87bujdHbWffIQT42AnNmVYTVAKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735491796; c=relaxed/simple;
	bh=92GYB+gxB+cbaT+4yhQFwaG04nkOyX74VK8gBLbdzwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIJLXyhpa/ZbANy51oP8UZTN0q8/TSt+U7LGeTgfxW49HSXHqxRazsKJkzbzmWf73Ev4wvC7NF88gAphKAjWGOlnyvk+RBDm2QplghyCfzNVoYb7ilMjV3+qvZNbbiE/zwGa6OGAIhN+0yZFgsDZZ7zyj6N5SSrb20vkz+vAC6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name; spf=pass smtp.mailfrom=vps-ovh.mhejs.net; arc=none smtp.client-ip=145.239.82.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vps-ovh.mhejs.net
Received: from MUA
	by vps-ovh.mhejs.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <mhej@vps-ovh.mhejs.net>)
	id 1tRwh3-00000004npe-2Swr;
	Sun, 29 Dec 2024 18:03:09 +0100
Message-ID: <3f0cdfa5-5aa5-4c17-b364-70383a6b6f31@maciej.szmigiero.name>
Date: Sun, 29 Dec 2024 18:03:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Only disable IRQ1 wakeup where
 i8042 actually enabled it
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <d5ed5ffc88fed17e1b1eb988c942e44fb540a68b.1735490591.git.mail@maciej.szmigiero.name>
 <a5781d0a-0a58-a708-1f8f-f9ade14ade52@linux.intel.com>
Content-Language: en-US, pl-PL
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Autocrypt: addr=mail@maciej.szmigiero.name; keydata=
 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
In-Reply-To: <a5781d0a-0a58-a708-1f8f-f9ade14ade52@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: mhej@vps-ovh.mhejs.net

On 29.12.2024 17:58, Ilpo Järvinen wrote:
> On Sun, 29 Dec 2024, Maciej S. Szmigiero wrote:
> 
>> Wakeup for IRQ1 should be disabled only in cases where i8042 had actually
>> enabled it, otherwise "wake_depth" for this IRQ will try do drop below zero
>> and there will be an unpleasant WARN() logged:
>> kernel: atkbd serio0: Disabling IRQ1 wakeup source to avoid platform firmware bug
>> kernel: ------------[ cut here ]------------
>> kernel: Unbalanced IRQ 1 wake disable
>> kernel: WARNING: CPU: 10 PID: 6431 at kernel/irq/manage.c:920 irq_set_irq_wake+0x147/0x1a0
>>
>> To fix this call the PMC suspend handler only from the same set of
>> dev_pm_ops handlers as i8042_pm_suspend() is called, which currently means
>> just the ".suspend" handler.
>> Previously, the code would use DEFINE_SIMPLE_DEV_PM_OPS() to define its
>> dev_pm_ops, which also called this handler on ".freeze" and ".poweroff".
>>
>> To reproduce this issue try hibernating (S4) the machine after a fresh boot
>> without putting it into s2idle first.
>>
>> Fixes: 8e60615e8932 ("platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN")
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> ---
>>   drivers/platform/x86/amd/pmc/pmc.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 26b878ee5191..a254debb9256 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -947,6 +947,10 @@ static int amd_pmc_suspend_handler(struct device *dev)
>>   {
>>   	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>>   
>> +	/*
>> +	 * Must be called only from the same set of dev_pm_ops handlers
>> +	 * as i8042_pm_suspend() is called: currently just from .suspend.
>> +	 */
>>   	if (pdev->disable_8042_wakeup && !disable_workarounds) {
>>   		int rc = amd_pmc_wa_irq1(pdev);
>>   
>> @@ -959,7 +963,9 @@ static int amd_pmc_suspend_handler(struct device *dev)
>>   	return 0;
>>   }
>>   
>> -static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmc_pm, amd_pmc_suspend_handler, NULL);
>> +static const struct dev_pm_ops amd_pmc_pm = {
>> +	.suspend = amd_pmc_suspend_handler,
>> +};
> 
> ???
> 
> I cannot see what this change is supposed to achieve.
> 
> #define _DEFINE_DEV_PM_OPS(name, \
>                             suspend_fn, resume_fn, \
>                             runtime_suspend_fn, runtime_resume_fn, idle_fn) \
> const struct dev_pm_ops name = { \
>          SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>          RUNTIME_PM_OPS(runtime_suspend_fn, runtime_resume_fn, idle_fn) \
> }
> 
> #define DEFINE_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
>          _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
> 
> #define SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>          .suspend = pm_sleep_ptr(suspend_fn), \
>          .resume = pm_sleep_ptr(resume_fn), \
>          .freeze = pm_sleep_ptr(suspend_fn), \
>          .thaw = pm_sleep_ptr(resume_fn), \
>          .poweroff = pm_sleep_ptr(suspend_fn), \
>          .restore = pm_sleep_ptr(resume_fn),
> 
> #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
> 
> Under what circumstances does this change result in some difference?
> 

.freeze and .poweroff are now both NULL, just like in the i8042 driver.

As I wrote in the commit message:
>> Previously, the code would use DEFINE_SIMPLE_DEV_PM_OPS() to define its
>> dev_pm_ops, *which also called this handler on ".freeze" and ".poweroff".*

Thanks,
Maciej

