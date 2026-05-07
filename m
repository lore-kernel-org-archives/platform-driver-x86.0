Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC5331F99E
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186260; cv=none; b=WOR/8fEept/HfDJCqhdwO37znXC8Fux4rbmPzHRFplIbcB7xp0DlOjdamtEse/8OTFNJF8TQcNV2WSjMaemRCK+GnfbniSKuiq4CVOa31Oii73bXjcpspstwG4Qk1QrY34mP8wC6fg2Ya1BVO0CeHQ4oJbWpI+5LC41elcz2gpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186260; c=relaxed/simple;
	bh=F/nLFp+MZM6s+cWIn5/WC8HxZqr6Z34Z3fPYWoK8IVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBSs02ITiEPniNMecdXVLJNl7W/ObakkHjkWDbOK4Drqonn4vQxsYRqgfVQORegMUfmwHghz5rq3IMbKCu7OFBAVpPWyqYSRXY6wxGj5X0z115wr2X7D8joAnwe7ZNq+lguPTPu9oCLXAPuF94gaPH/Rl8ea8E3tyiWBspus3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=YVh/rf1P; arc=none smtp.client-ip=185.125.25.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="YVh/rf1P"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBNs42xtfzCvB;
	Thu,  7 May 2026 22:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778185192;
	bh=V7wUCGgpZA5roK1tXswDDVaotGRyGCe2tWwDKS1U0Rg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YVh/rf1PtluCHaOBPvl8iLh/YXyqQMuZ8v/1TgXrHN6/kMAmKI0zJKzVppSp/GYWs
	 C9V16I5mChGSsiWaULEI2+V+sOnQooh37+gAevb3/2ldnDm9CfwhQapWavIV5YfgD1
	 l12TU5vKsHbPm5h8RLohT5ysL8tkyBz4ZvwV9AlqMjacLlyQhsxw1E4Wria5QJ6E1A
	 IVYnsijS2/sFW/EYtu0w1gno9JS9XAAlT6RL34rD+EKaT6fjSceh2u2y9z/zTXkrSd
	 2mjlHMkR0nWtAF5vXPIiH1/8fylJRMGE2lyg8Q5HxMMErVwlDaVbmFfTaz65qdUOl8
	 RRJJcEdGZaVdg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBNs33vXnzMBn;
	Thu,  7 May 2026 22:19:51 +0200 (CEST)
Message-ID: <13165764-9660-4887-bc13-54f2b9fee3a1@gibson.sh>
Date: Thu, 7 May 2026 22:19:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo
 Laptops
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>,
 Sindre Henriksen <sindrehenriksen93@gmail.com>
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-2-daniel@gibson.sh>
 <ecd9767a-ea6d-8c1f-699e-e1ced0247f2e@linux.intel.com>
From: Daniel Gibson <daniel@gibson.sh>
Content-Language: de-DE, en-GB
In-Reply-To: <ecd9767a-ea6d-8c1f-699e-e1ced0247f2e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Thanks for the review!

On 07.05.26 15:22, Ilpo Järvinen wrote:
> On Fri, 1 May 2026, Daniel Gibson wrote:
> 
>> Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
>> nonfunctional keyboard and lid switch after s2idle.
>> It helps to delay suspend by 2.5 seconds so the EC has some time
>> to do whatever it needs to get done before suspend.
>>
>> This issue has been reported for many different devices, this patch
>> has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
>> and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6), see
>> https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>
>> Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221383
>> Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>> Tested-by: Daniel Gibson <daniel@gibson.sh>
>> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 36 +++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmc/pmc.c        |  5 +++-
>>  drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>  3 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> index 24506e342943..cea30f68f8dc 100644
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
>> +	.need_suspend_delay = true
> 
> Please add comma to any non-terminating entry.

will do

> 
>> +};
>> +
>>  static const struct dmi_system_id fwbug_list[] = {
>>  	{
>>  		.ident = "L14 Gen2 AMD",
>> @@ -203,6 +208,32 @@ static const struct dmi_system_id fwbug_list[] = {
>>  			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>>  		}
>>  	},
>> +	/*
>> +	 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
>> +	 * me-time before sleeping or they get uncooperative after waking
>> +	 * up and don't send events for keyboard and lid switch anymore.
>> +	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
>> +	 */
>> +	{
>> +		.ident = "Zen3-based IdeaPad Slim and similar",
>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>> +			/*
>> +			 * Note: there are also some Zen2-based 82X* devices that
>> +			 * need different quirks, they're already handled above
>> +			 */
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "82X")
> 
> Ditto.
> 
>> +		}
>> +	},
>> +	{
>> +		.ident = "Zen3+-based IdeaPad Slim and similar",
>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "83K")
> 
> Ditto.
> 
>> +		}
>> +	},
>>  	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
>>  	{
>>  		.ident = "Thinkpad L14 Gen3",
>> @@ -356,6 +387,11 @@ void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
>>  		amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
>>  }
>>  
>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
>> +{
>> +	return dev->quirks->need_suspend_delay;
>> +}
>> +
>>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
>>  {
>>  	const struct dmi_system_id *dmi_id;
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index cae3fcafd4d7..c604dc7207ed 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -634,10 +634,13 @@ static void amd_pmc_s2idle_check(void)
>>  	struct amd_pmc_dev *pdev = &pmc;
>>  	struct smu_metrics table;
>>  	int rc;
>> +	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
> 
> Why isn't disable_workarounds inside amd_pmc_quirk_need_suspend_delay() ?

Because disable_workarounds is a static variable in pmc.c and
amd_pmc_quirk_need_suspend_delay() is implemented in pmc-quirks.c

> 
>>  
>>  	/* Avoid triggering OVP */
>> -	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
>> +	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
> 
> It would be clearer what's going on here if these two checks are clearly 
> separated.
> 
> As is, the comment confuses if it's only meant for the 2nd check.
> 
> One of the checks will be in amd_pmc_quirk_need_suspend_delay() and the 
> other (the existing one + the comment) should be moved in to own function 
> (perhaps in a patch preceeding this one) so it's clear the reasoning is 
> different(?). You can check the commit that introduced msleep(2500) here
> for details about the existing check.
> 

Ok, I'll move that check for the existing workaround into its own 
function to make it more clear what is happening

>> +		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>>  		msleep(2500);
>> +	}
>>  
>>  	/* Dump the IdleMask before we add to the STB */
>>  	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
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

