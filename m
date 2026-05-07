Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AA036EAAE
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778185207; cv=none; b=XW9dHB4h3d+kZFsq8Qopku961eYMTAfkn0DHFs/P+KQH2/lBNWgE0Dvx1J7AC5RM88ZnIcrsa5Iig36xHGc5NCfgH1Co655LONJj2LyflEzbu28+TKOzr9PccZcs1gf/dN/jcLEvaNCe0iFKKpKVNopZnTjivj23r1+6UvkzwaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778185207; c=relaxed/simple;
	bh=lT7uhJVuAwQHbwgnicAXbNvYRe2qCx3WC2ZIWhomiDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0tTiYPzCzGEQQ+oAnuUTxzTLP3F5hXaBMoUVQwU5ilspk+k9I8KpE1TdSHLukIGZiRbaytl/irmdV++j5hgqon9uQl59xjtgBgh2uuPs7ZIHsf8Y649KaPNOiiqU7yOs0aVR85sV6s5ap6Ak/6bD71d/L8mMI+PYt+FyXDidwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=cj1vXYsM; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="cj1vXYsM"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBNs82pS6zDJf;
	Thu,  7 May 2026 22:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778185196;
	bh=EDPQGlyTW3vXzJXOUhVeyYRoL/WEfb6lWzzozVz3Ing=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cj1vXYsMhZmZhj7z+fAieln8HBwwisF5iH01xUvN/SlHo+HjiOFyYBXeul030GAwT
	 p1g6nRNgSnD1PvQLFcxzH5IboHpFfowhLHFaVWYK9hRIIaKAlMfBnI4N/u014VBtip
	 eEhS3v15aXWnqzgE4Po81RoIHigK9ogOTKHisgxtXmxZaIFyuJOPkK5tgiEtlJC0Cf
	 xMehmiiWufZ6xcqleA+2sIi0y8kJk1yy3fTwC/6itzZrXR6yn+uReczsgijX5QdoEN
	 r9WTKqLQtDNLlfO3PKn0H8ZrkdbPqu5ZQa8YLRVTlnR6jd72NTcyT+GBTSr8ibnl85
	 j3jKlYKsQuBpA==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBNs759sgzNl7;
	Thu,  7 May 2026 22:19:55 +0200 (CEST)
Message-ID: <703dfb4b-2909-4a9f-9607-f24d47075447@gibson.sh>
Date: Thu, 7 May 2026 22:19:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Add delay_suspend module
 argument
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-3-daniel@gibson.sh>
 <80f46c50-18eb-7f02-0bec-d124e3867839@linux.intel.com>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <80f46c50-18eb-7f02-0bec-d124e3867839@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 07.05.26 15:33, Ilpo Järvinen wrote:
> On Fri, 1 May 2026, Daniel Gibson wrote:
> 
>> Enabling it delays suspend for 2.5 seconds which is known to help for
> 
> Please don't link shortlog to longer description like this. Write them 
> such that either can be read entirely on its own.
> 

ok

>> some AMD-based Lenovo Laptops that otherwise failed to send/receive
>> events for key presses or the lid switch after s2idle.
>> Apparently the EC needs to do some things in the background before
>> suspend or it gets into a bad state.
>>
>> There are many reports of AMD-based laptops (mostly but not exclusively
>> IdeaPads) about similar issues on the web; this parameter gives
>> affected users an easy way to try out if their issues have the same
>> root cause and to work around them until their specific device is added
>> to the quirks list.
>> I added a note to the parameter description encouraging users to report
>> their device so it can be added to the quirks list, inspired by a
>> similar request in parameter descriptions of the ideapad-laptop module.
>>
>> The module parameter can be set to "1" to explicitly enable it,
>> "0" to disable it even on devices that are assumed to be affected,
>> or -1 (the default) to enable it if the device is assumed to be affected
>> (according to fwbug_list[])
>>
>> This is related to https://bugzilla.kernel.org/show_bug.cgi?id=221383
> 
> Link: ...
> 
>> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
>> Tested-by: Daniel Gibson <daniel@gibson.sh>
> 
> Normally, we don't tag our own testing. :-)

Ok, will change, I didn't know this - I thought at least in case of
hardware-specific changes it's not clear if the author of a patch even
has the hardware to test it, so it's not necessarily implied.

> 
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index c604dc7207ed..f76936036d1f 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -89,6 +89,11 @@ static bool disable_workarounds;
>>  module_param(disable_workarounds, bool, 0644);
>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>  
>> +static int delay_suspend = -1;
>> +module_param(delay_suspend, int, 0644);
>> +MODULE_PARM_DESC(delay_suspend,
>> +		 "Delays s2idle by 2.5 seconds to work around buggy ECs, often causing keyboard issues after suspend. 0: don't delay, 1: do delay, -1 (default): let amd_pmc decide. If you need this please report this to: platform-driver-x86@vger.kernel.org");
>> +
>>  static struct amd_pmc_dev pmc;
>>  
>>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>> @@ -634,11 +639,19 @@ static void amd_pmc_s2idle_check(void)
>>  	struct amd_pmc_dev *pdev = &pmc;
>>  	struct smu_metrics table;
>>  	int rc;
>> -	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
>> +	bool ec_needs_sleep;
>> +
>> +	if (delay_suspend < 0)
>> +		ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
>> +	else
>> +		ec_needs_sleep = delay_suspend != 0;
> 
> By doing this, you added overlap between disable_workarounds and 
> delay_suspend. It gets confusing.

I think this confusion primarily stems from having one variable
(disable_workarounds) that disables all quirks, instead of a way
to individually disable (or enable/enforce) them.

But disable_workarounds is already there so I try to behave consistently.

> 
>>  	/* Avoid triggering OVP */
>>  	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
>> -		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>> +		if (delay_suspend > 0)
>> +			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1\n");
>> +		else
>> +			dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
> 
> Overall, the end result looks pretty messy.
> 

I agree. I will try to clean this up together with the separating of the
checks you requested for the other patch.
