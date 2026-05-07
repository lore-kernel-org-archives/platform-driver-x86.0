Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC1372B5A
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 22:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194356; cv=none; b=K8stFkGca/1A5gRpN2B48VW7qKCye46MnmJUBRMBnucV1SKGYGgQAKYr5kbZYm9sB/JKfUobcYcg/zE5z5IUbCRzLwCX7rtJpGo0IyzdSesHnr3zZ/57wRucKmynZbeKwljHcjxQYzafB5exguEPGRHNNovPDOG9Li5mXUDIegE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194356; c=relaxed/simple;
	bh=gwO0FwjkpISUQGWY9xYQzp+KVx8KwvXHNoLxI8Xd+Vk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FpeoP2NRN+koaHvD4u5Fj2BSofGfmcjW5UVnTOqbStnEhN79bs98qKnAESQyw0BObs14x51IHpTeBP/yTp7bSRiD9lg4iI1apmzCOdPLdVdy/E/y49WepCfsutsndw1++ohAJL4E+Ai6Ax8fbu6RriRgA0zCGhC0ZqI6SKgeBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=inlaL6i4; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="inlaL6i4"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBS2J0BSXzX9s;
	Fri,  8 May 2026 00:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778193783;
	bh=VJcjHqLXeiXRSxnrqAp5QY2j4wimX0CIz+H34y/neeE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=inlaL6i4ljX/EEIKcW4rTSsqoTLPXfO3V9YI2dgY4+f4vQxCOwEbwBPgDcyQr8ygH
	 nY+/eOoWgEGTec7av9D30Fncd96PIv3fEmYxmWwv0dFWGyc1HZCbee/Ui6sajm7E4j
	 ub34aggOtojdPZfaTY/jn3earmimfL+iQVDZQGe7bFyUMDfRGZmLw+//6JlqeNg7Td
	 uqMyH3ItdCgkws0zV7zqDy3pYdzDLXR6DHbqAyH/0hTPORuIi1cBT0wDFPgNqSOLoS
	 FshnpXzE41U9BiHsS4zBDwIeVEafBscumonEIUSKNy/xfTPRE0k0qSOWkVnnn9RJh8
	 x9JTpxQTxnFLg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBS2H135XzbPh;
	Fri,  8 May 2026 00:43:02 +0200 (CEST)
Message-ID: <dcdd32ff-b2eb-4cd9-b1e7-0cf3fd5ba3df@gibson.sh>
Date: Fri, 8 May 2026 00:43:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo
 Laptops
From: Daniel Gibson <daniel@gibson.sh>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>,
 Sindre Henriksen <sindrehenriksen93@gmail.com>
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-2-daniel@gibson.sh>
 <ecd9767a-ea6d-8c1f-699e-e1ced0247f2e@linux.intel.com>
 <13165764-9660-4887-bc13-54f2b9fee3a1@gibson.sh>
Content-Language: de-DE, en-GB
In-Reply-To: <13165764-9660-4887-bc13-54f2b9fee3a1@gibson.sh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 07.05.26 22:19, Daniel Gibson wrote:
> Thanks for the review!
> 
> On 07.05.26 15:22, Ilpo Järvinen wrote:
>> On Fri, 1 May 2026, Daniel Gibson wrote:
>>
>>> Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
>>> nonfunctional keyboard and lid switch after s2idle.
>>> It helps to delay suspend by 2.5 seconds so the EC has some time
>>> to do whatever it needs to get done before suspend.
>>>
>>> This issue has been reported for many different devices, this patch
>>> has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
>>> and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6), see
>>> https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>
>>> Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>> Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>>> Tested-by: Daniel Gibson <daniel@gibson.sh>
>>> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
>>> ---
>>>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 36 +++++++++++++++++++++++
>>>  drivers/platform/x86/amd/pmc/pmc.c        |  5 +++-
>>>  drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>>  3 files changed, 41 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>> index 24506e342943..cea30f68f8dc 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>> @@ -18,6 +18,7 @@
>>>  struct quirk_entry {
>>>  	u32 s2idle_bug_mmio;
>>>  	bool spurious_8042;
>>> +	bool need_suspend_delay;
>>>  };
>>>  
>>>  static struct quirk_entry quirk_s2idle_bug = {
>>> @@ -33,6 +34,10 @@ static struct quirk_entry quirk_s2idle_spurious_8042 = {
>>>  	.spurious_8042 = true,
>>>  };
>>>  
>>> +static struct quirk_entry quirk_s2idle_need_suspend_delay = {
>>> +	.need_suspend_delay = true
>>
>> Please add comma to any non-terminating entry.
> 
> will do
> 
>>
>>> +};
>>> +
>>>  static const struct dmi_system_id fwbug_list[] = {
>>>  	{
>>>  		.ident = "L14 Gen2 AMD",
>>> @@ -203,6 +208,32 @@ static const struct dmi_system_id fwbug_list[] = {
>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>>>  		}
>>>  	},
>>> +	/*
>>> +	 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
>>> +	 * me-time before sleeping or they get uncooperative after waking
>>> +	 * up and don't send events for keyboard and lid switch anymore.
>>> +	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>> +	 */
>>> +	{
>>> +		.ident = "Zen3-based IdeaPad Slim and similar",
>>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>> +			/*
>>> +			 * Note: there are also some Zen2-based 82X* devices that
>>> +			 * need different quirks, they're already handled above
>>> +			 */
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "82X")
>>
>> Ditto.
>>
>>> +		}
>>> +	},
>>> +	{
>>> +		.ident = "Zen3+-based IdeaPad Slim and similar",
>>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "83K")
>>
>> Ditto.
>>
>>> +		}
>>> +	},
>>>  	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
>>>  	{
>>>  		.ident = "Thinkpad L14 Gen3",
>>> @@ -356,6 +387,11 @@ void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
>>>  		amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
>>>  }
>>>  
>>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
>>> +{
>>> +	return dev->quirks->need_suspend_delay;
>>> +}
>>> +
>>>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
>>>  {
>>>  	const struct dmi_system_id *dmi_id;
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>> index cae3fcafd4d7..c604dc7207ed 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>> @@ -634,10 +634,13 @@ static void amd_pmc_s2idle_check(void)
>>>  	struct amd_pmc_dev *pdev = &pmc;
>>>  	struct smu_metrics table;
>>>  	int rc;
>>> +	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
>>
>> Why isn't disable_workarounds inside amd_pmc_quirk_need_suspend_delay() ?
> 
> Because disable_workarounds is a static variable in pmc.c and
> amd_pmc_quirk_need_suspend_delay() is implemented in pmc-quirks.c
> 
>>
>>>  
>>>  	/* Avoid triggering OVP */
>>> -	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
>>> +	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
>>
>> It would be clearer what's going on here if these two checks are clearly 
>> separated.
>>
>> As is, the comment confuses if it's only meant for the 2nd check.
>>
>> One of the checks will be in amd_pmc_quirk_need_suspend_delay() and the 
>> other (the existing one + the comment) should be moved in to own function 
>> (perhaps in a patch preceeding this one) so it's clear the reasoning is 
>> different(?). You can check the commit that introduced msleep(2500) here
>> for details about the existing check.
>>
> 
> Ok, I'll move that check for the existing workaround into its own 
> function to make it more clear what is happening

While doing this and thinking learning more about this old patch I had a
realization:
The existing code does this 2.5s sleep before every suspend *except* for
the very first one after a (re)boot!

(Except on CPUs that don't have this metrics table (AMD_CPU_ID_PCO) or
some edge case when pdev->smu_virt_addr is NULL and can't be set with
amd_pmc_setup_smu_logging())

This by the way explains why in the rare cases suspend randomly worked
as intended on my machine (even without my patch) it kept on working in
subsequent suspends, until rebooting.

Anyway, radical idea: What if we just ALWAYS SLEEP for 2.5 seconds here?

I don't think the special case of the very first suspend after boot
justifies all the complexity of the existing checks *and* the conditions
I'm adding.

> 
>>> +		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>>>  		msleep(2500);
>>> +	}
>>>  
>>>  	/* Dump the IdleMask before we add to the STB */
>>>  	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>>> index fe3f53eb5955..f5257e47b8c4 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>> @@ -147,6 +147,7 @@ enum amd_pmc_def {
>>>  };
>>>  
>>>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev);
>>>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>>>  void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>>>  void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>
>>
> 

