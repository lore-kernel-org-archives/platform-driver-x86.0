Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3528D8FE
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jun 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964004; cv=none; b=fOb0i72zq7IcWF+el2LHgdO+vIi4JDHjbyDDjp/CcubIhMbbN9Y2fBRkmhavOBz3ZQYJ/gHzUQA36kZ0fMCeVbgtE0+iwkKqzlO2x01UQagH07aOWPayEkzip1RNNK85oP1zXx/nu11etcSm8nRpZRJ5ILAyINpIdcCk5dc4m/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964004; c=relaxed/simple;
	bh=Fq1uU6DDl50BFP0hn2MPafwdD3nkK14eQfM8u70/uvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRgE9wXRhH/btbUTpeYkuJjVP89yNteK2E9R8TmqKRCAR2zQUDa9/ACOZXTq2rTG2w70Ys1brJutNoHT++JjbtD2CoYlaX0eSPn91Bzt9JNLRaZLCmTtYLWR2VVSu7Y8CSEem8JxhRs/OZEuQRNQpwZWafueKfcMXslUBCkGKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkCC4rwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkCC4rwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65364C4CEEB;
	Thu, 26 Jun 2025 18:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750964003;
	bh=Fq1uU6DDl50BFP0hn2MPafwdD3nkK14eQfM8u70/uvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lkCC4rwow6mUDhVrTTH35jnN5wIsagtHR2pZqbNlr6xmuWtlf6NhrS9V9fs5jjbtn
	 iU+3YvgOupqF0LCOHrueUcPdJOg7ZZicdJhN43VVP+DzoEqlGIQ6MIos5NhUtiUALd
	 6K4wgOCykktYMUDTldMhFKfJ/SibVGZILgVMn/i1P9BhrRfrKqQcb85tq9tW/fAXB9
	 ieJFNYOYFW8HfUmnGRlHBYoEt9v6aS7EEx3PXZUGD/k/EYR6wNAuTsndkPRWRnR8a2
	 21U39VHwvS3OrVZ1VanWcgBhwy4jkZMqyAxp4YXTQ+AUbx/P97/wBTV5/bD/XtS41M
	 4+Oi/RLiHnlWw==
Message-ID: <4fc05197-688a-454f-aadb-7a297db7a594@kernel.org>
Date: Thu, 26 Jun 2025 20:53:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Use guard mutex to synchronize
 probe
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250625100216.1462594-1-suma.hegde@amd.com>
 <ada3eca0-4c86-c3ee-816c-a3635b4ad110@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <ada3eca0-4c86-c3ee-816c-a3635b4ad110@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 26-Jun-25 18:31, Ilpo Järvinen wrote:
> On Wed, 25 Jun 2025, Suma Hegde wrote:
> 
> In the shortlog, drop word "guard". This should also mention ACPI as the 
> legacy probe is not affected.
> 
>> When async probing is used, 2 hsmp_acpi_probe() calls can race and
>> make a mess of things.
> 
> Too vague wording.
> 
>> So, add guard mutex to synchronize them.
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>>  drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 2f1faa82d13e..ab2b65f16d1d 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -15,11 +15,13 @@
>>  #include <linux/array_size.h>
>>  #include <linux/bits.h>
>>  #include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/device.h>
>>  #include <linux/dev_printk.h>
>>  #include <linux/ioport.h>
>>  #include <linux/kstrtox.h>
>>  #include <linux/module.h>
>> +#include <linux/mutex.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/sysfs.h>
>>  #include <linux/uuid.h>
>> @@ -44,6 +46,8 @@ struct hsmp_sys_attr {
>>  	u32 msg_id;
>>  };
>>  
>> +static DEFINE_MUTEX(hsmp_lock);
>> +
>>  static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>>  			      u32 *value, bool write)
>>  {
>> @@ -585,6 +589,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>  	if (!hsmp_pdev)
>>  		return -ENOMEM;
>>  
>> +	guard(mutex)(&hsmp_lock);
>> +
>>  	if (!hsmp_pdev->is_probed) {
>>  		hsmp_pdev->num_sockets = amd_num_nodes();
>>  		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
> 
> So is it just the ->sock alloc and misc dev registration that require
> protection? (The latter doesn't even seem to require that if a local 
> variable carries that information over.)

Another review note:

hsmp_pdev->is_probed is also used in remove() so that needs a guard(mutex)(&hsmp_lock); too.

Regards,

Hans

