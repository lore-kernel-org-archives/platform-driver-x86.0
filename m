Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCEF217704
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 00:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546715; cv=none; b=GS4HB2cqCJYcPeEgQs8FWqDt5oLC131mxMbYJ9/YgL7ecBchUwsgY4K6HxFNJEnPgU3tGQW3IWg2AIkoYFfXIT/VcF2E+DliiG9FAgpmNqRz+psInx9sVUxCApKY+1Ru0NRyrrH2swlIYP0BwgJ0wrFV06x4zfiLbfAQJPnML4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546715; c=relaxed/simple;
	bh=O5K7JhFmvQ7p4BOECWMRXTZuWHhFYTbESWD3CyaE+KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amb4ZcXc7fhTtUKPUtv1pInAhAW9qEmkpLP/ATCI6NPLYacLjVhLT0SRwgvjWzsX7e1EQmcf7yB7v0w6Fj+Ga3sKb5focaQmsiSatNYItvAWu05JTSDr2nHETMvHVMQtG0qGSVi+TkH+IGhtZGfWqD9SusBG1YxR6xwpPgOTyT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=KQkaxaza; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="KQkaxaza"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gDyYD375lzhcB;
	Tue, 12 May 2026 02:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778546704;
	bh=AAWcl1fcFbV1ZDMBPYzHzHVSibCMBFWjUAaEe4z9QPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KQkaxazaV5gHXbxhidq2cyaw4wxlQ5nrZaEVV1LDEyPIsmCyngaaYALMx3K4YPzRc
	 u79jUjAtMxPD+Huae/w/5DF4TRQowIvMw3jJHbjRJjLkWRQ/UrUlRXArwEpBNF9N8R
	 7ODfF+TcrqXbfZbc3f+u+TWV6aVNF2kwtpjuEASrQY83xe2cqrCUMdnjdhkKBMN+Wm
	 /uyzM4O0igGhHerIPBkZd1bp7JZyhMWw8DfzfNJj7V+drnV1k/kudH8/gHdS3hwFAU
	 aW213PCK3TjR24GsBdZTgHpyepHhuhOWHEHKstZsyA7pjTQ3rTEqoJROcSJ4LaqMVk
	 woB751OqBJT9A==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gDyYC2NCYzRLS;
	Tue, 12 May 2026 02:45:02 +0200 (CEST)
Message-ID: <397e5ce5-867c-4ff0-8de8-710c247f5125@gibson.sh>
Date: Tue, 12 May 2026 02:45:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] platform/x86/amd/pmc: Delay suspend for some
 Lenovo Laptops
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Sindre Henriksen <sindrehenriksen93@gmail.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
References: <20260509013105.816339-1-daniel@gibson.sh>
 <20260509013105.816339-3-daniel@gibson.sh>
 <2fd86d67-b9e6-57ab-775c-1297e34a2e7f@linux.intel.com>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <2fd86d67-b9e6-57ab-775c-1297e34a2e7f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 11.05.26 14:24, Ilpo Järvinen wrote:
> On Sat, 9 May 2026, Daniel Gibson wrote:
> 
>> Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
>> nonfunctional keyboard and lid switch after s2idle.
>> It helps to delay suspend by 2.5 seconds so the EC has some time
>> to do whatever it needs to get done before suspend - unfortunately
>> at least on my 16ABR8 waking it with a timer (wakealarm) still
>> triggers the issue, but at least normal resume via keypress or
>> lid works fine.
>>
>> This issue has been reported for many different devices, this patch
>> has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
>> and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6).
>>
>> Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221383
> 
> Cc: stable@vger.kernel.org
> 
> would be warranted for this.

Same for the next patch introducing the module parameter?

I already got one report from someone using the parameter that their
laptop is affected (will include it in the next version of patches).
I fear there are more - Lenovos naming schemes are wild...

So I think it would be quite useful to get it to people using stable
kernels as well


> 
>> Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 31 +++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmc/pmc.c        | 24 +++++++++++++++++-
>>  drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>  3 files changed, 55 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> index 24506e342943..842a8f442fb5 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> @@ -18,6 +18,7 @@
>>  struct quirk_entry {
>>  	u32 s2idle_bug_mmio;
>>  	bool spurious_8042;
>> +	bool need_suspend_delay;
>>  };
>>  
>>  static struct quirk_entry quirk_s2idle_bug = {
>> @@ -33,6 +34,10 @@ static struct quirk_entry quirk_s2idle_spurious_8042 = {
>>  	.spurious_8042 = true,
>>  };
>>  
>> +static struct quirk_entry quirk_s2idle_need_suspend_delay = {
>> +	.need_suspend_delay = true,
>> +};
>> +
>>  static const struct dmi_system_id fwbug_list[] = {
>>  	{
>>  		.ident = "L14 Gen2 AMD",
>> @@ -203,6 +208,27 @@ static const struct dmi_system_id fwbug_list[] = {
>>  			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>>  		}
>>  	},
>> +	/* https://bugzilla.kernel.org/show_bug.cgi?id=221383 */
>> +	{
>> +		.ident = "Zen3-based IdeaPad Slim and similar",
>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>> +			/*
>> +			 * Note: there are also some Zen2-based 82X* devices that
>> +			 * need different quirks, they're already handled above
>> +			 */
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "82X"),
>> +		}
>> +	},
>> +	{
>> +		.ident = "Zen3+-based IdeaPad Slim and similar",
>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "83K"),
>> +		}
>> +	},
>>  	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
>>  	{
>>  		.ident = "Thinkpad L14 Gen3",
>> @@ -356,6 +382,11 @@ void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
>>  		amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
>>  }
>>  
>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
>> +{
>> +	return dev->quirks && dev->quirks->need_suspend_delay;
>> +}
>> +
>>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
>>  {
>>  	const struct dmi_system_id *dmi_id;
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 2b9e5730170a..6bafd8661d68 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -611,6 +611,27 @@ static bool amd_pmc_intermediate_wakeup_need_delay(struct amd_pmc_dev *pdev)
>>  	return get_metrics_table(pdev, &table) == 0 && table.s0i3_last_entry_status;
>>  }
>>  
>> +static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
>> +{
>> +	/*
>> +	 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
>> +	 * me-time before sleeping or they get uncooperative after waking
>> +	 * up and don't send events for keyboard and lid switch anymore.
>> +	 *
>> +	 * Unfortunately this doesn't entirely fix the problem: It can still
>> +	 * happen when resuming with a timer (wakealarm), but at least the
>> +	 * more common usecases (wakeup by opening lid or pressing a key)
>> +	 * work fine with this workaround.
>> +	 *
>> +	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
>> +	 */
>> +	if (!disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev)) {
>> +		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>> +		return true;
>> +	}
>> +	return false;
>> +}
>> +
>>  static void amd_pmc_s2idle_prepare(void)
>>  {
>>  	struct amd_pmc_dev *pdev = &pmc;
>> @@ -647,7 +668,8 @@ static void amd_pmc_s2idle_check(void)
>>  	struct amd_pmc_dev *pdev = &pmc;
>>  	int rc;
>>  
>> -	if (amd_pmc_intermediate_wakeup_need_delay(pdev))
>> +	if (amd_pmc_intermediate_wakeup_need_delay(pdev) ||
>> +	    amd_pmc_want_suspend_delay(pdev))
> 
> Thanks, this looks much cleaner. :-)
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

> 
>>  		msleep(2500);
>>  
>>  	/* Dump the IdleMask before we add to the STB */
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index fe3f53eb5955..f5257e47b8c4 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -147,6 +147,7 @@ enum amd_pmc_def {
>>  };
>>  
>>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev);
>>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>>  void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>>  void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>
> 

