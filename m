Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB732ED4E;
	Thu,  7 May 2026 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194487; cv=none; b=WCd8+WiQPrHf5u9m16MJIQQ3YdWUUx7/sqjrJgQ3bvW8Mp3ftfsmE8eM98ueif2He+WvE7XRb2Ue/rFF2Rj9gcni6BEqNl3kvAB8A7u/xuO1vdWTm/TRa3ZUIwOhPGyV4uzVgnxNE1SvjCchJUV741dHcXDuTQR8I7U+VOvYG7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194487; c=relaxed/simple;
	bh=6jT5J+IoUbcu4NqL/AIDBkzjPruI/pmIiH4xcC9QN6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYFCTUgN4ZBaD9VHbAN+rlXy+pFQvR2H7lW3l4DR1lNSHvAdadHgeepcGdjoI0lmS0yazoWBSiN75+GntIaD9OHzdMiAiFnziqvCEef0r5UJ+y+fmtQnpwxJgjE8jz8Z9J9Y1dO2Eyg+J60O55PIEbF+IAGXglK9r9e42Le3WnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8Oclc6k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8Oclc6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B34C2BCB2;
	Thu,  7 May 2026 22:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778194487;
	bh=6jT5J+IoUbcu4NqL/AIDBkzjPruI/pmIiH4xcC9QN6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a8Oclc6k/VaZwXuOXBCnoRBeHjUrJjXRmW8WIrDB7gnIinE0QjXwWl9wHSI/3wDYB
	 zQwVHoptG1KJ2HfLEiZBTcoR74r1GD2w7ECQohw075Ep8rE8voElEvtwhQwgTenrqs
	 IgtT6PA4Vi43VLHAsTNTcQzc9hE4ldVEr+7zFi70Oe1D8YaM4f6K1jr01pTlrFfHHe
	 Od/2HbFFmoaP9Y1jK8RMSHv7XcQ+IJYikSo0mEUWiWGa10JB0ndgPpdr0svVqy/1IP
	 YAGWdo20RPKDmhmBKgosQYb+of3Plaz2lGaxBvMuMl5eBJwa990RMGEYuderql5SMq
	 EKtitEcXx5kYQ==
Message-ID: <887bf769-4c02-4d61-bfb1-127a710b670c@kernel.org>
Date: Thu, 7 May 2026 17:54:45 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo
 Laptops
Content-Language: en-US
To: Daniel Gibson <daniel@gibson.sh>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Sindre Henriksen <sindrehenriksen93@gmail.com>
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-2-daniel@gibson.sh>
 <ecd9767a-ea6d-8c1f-699e-e1ced0247f2e@linux.intel.com>
 <13165764-9660-4887-bc13-54f2b9fee3a1@gibson.sh>
 <dcdd32ff-b2eb-4cd9-b1e7-0cf3fd5ba3df@gibson.sh>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <dcdd32ff-b2eb-4cd9-b1e7-0cf3fd5ba3df@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/26 17:43, Daniel Gibson wrote:
> On 07.05.26 22:19, Daniel Gibson wrote:
>> Thanks for the review!
>>
>> On 07.05.26 15:22, Ilpo Järvinen wrote:
>>> On Fri, 1 May 2026, Daniel Gibson wrote:
>>>
>>>> Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
>>>> nonfunctional keyboard and lid switch after s2idle.
>>>> It helps to delay suspend by 2.5 seconds so the EC has some time
>>>> to do whatever it needs to get done before suspend.
>>>>
>>>> This issue has been reported for many different devices, this patch
>>>> has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
>>>> and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6), see
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>>
>>>> Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>> Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>>>> Tested-by: Daniel Gibson <daniel@gibson.sh>
>>>> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
>>>> ---
>>>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 36 +++++++++++++++++++++++
>>>>   drivers/platform/x86/amd/pmc/pmc.c        |  5 +++-
>>>>   drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>>> index 24506e342943..cea30f68f8dc 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>>> @@ -18,6 +18,7 @@
>>>>   struct quirk_entry {
>>>>   	u32 s2idle_bug_mmio;
>>>>   	bool spurious_8042;
>>>> +	bool need_suspend_delay;
>>>>   };
>>>>   
>>>>   static struct quirk_entry quirk_s2idle_bug = {
>>>> @@ -33,6 +34,10 @@ static struct quirk_entry quirk_s2idle_spurious_8042 = {
>>>>   	.spurious_8042 = true,
>>>>   };
>>>>   
>>>> +static struct quirk_entry quirk_s2idle_need_suspend_delay = {
>>>> +	.need_suspend_delay = true
>>>
>>> Please add comma to any non-terminating entry.
>>
>> will do
>>
>>>
>>>> +};
>>>> +
>>>>   static const struct dmi_system_id fwbug_list[] = {
>>>>   	{
>>>>   		.ident = "L14 Gen2 AMD",
>>>> @@ -203,6 +208,32 @@ static const struct dmi_system_id fwbug_list[] = {
>>>>   			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>>>>   		}
>>>>   	},
>>>> +	/*
>>>> +	 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
>>>> +	 * me-time before sleeping or they get uncooperative after waking
>>>> +	 * up and don't send events for keyboard and lid switch anymore.
>>>> +	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>> +	 */
>>>> +	{
>>>> +		.ident = "Zen3-based IdeaPad Slim and similar",
>>>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>>> +			/*
>>>> +			 * Note: there are also some Zen2-based 82X* devices that
>>>> +			 * need different quirks, they're already handled above
>>>> +			 */
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "82X")
>>>
>>> Ditto.
>>>
>>>> +		}
>>>> +	},
>>>> +	{
>>>> +		.ident = "Zen3+-based IdeaPad Slim and similar",
>>>> +		.driver_data = &quirk_s2idle_need_suspend_delay,
>>>> +		.matches = {
>>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "83K")
>>>
>>> Ditto.
>>>
>>>> +		}
>>>> +	},
>>>>   	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
>>>>   	{
>>>>   		.ident = "Thinkpad L14 Gen3",
>>>> @@ -356,6 +387,11 @@ void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
>>>>   		amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
>>>>   }
>>>>   
>>>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
>>>> +{
>>>> +	return dev->quirks->need_suspend_delay;
>>>> +}
>>>> +
>>>>   void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
>>>>   {
>>>>   	const struct dmi_system_id *dmi_id;
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>>> index cae3fcafd4d7..c604dc7207ed 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>> @@ -634,10 +634,13 @@ static void amd_pmc_s2idle_check(void)
>>>>   	struct amd_pmc_dev *pdev = &pmc;
>>>>   	struct smu_metrics table;
>>>>   	int rc;
>>>> +	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
>>>
>>> Why isn't disable_workarounds inside amd_pmc_quirk_need_suspend_delay() ?
>>
>> Because disable_workarounds is a static variable in pmc.c and
>> amd_pmc_quirk_need_suspend_delay() is implemented in pmc-quirks.c
>>
>>>
>>>>   
>>>>   	/* Avoid triggering OVP */
>>>> -	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
>>>> +	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
>>>
>>> It would be clearer what's going on here if these two checks are clearly
>>> separated.
>>>
>>> As is, the comment confuses if it's only meant for the 2nd check.
>>>
>>> One of the checks will be in amd_pmc_quirk_need_suspend_delay() and the
>>> other (the existing one + the comment) should be moved in to own function
>>> (perhaps in a patch preceeding this one) so it's clear the reasoning is
>>> different(?). You can check the commit that introduced msleep(2500) here
>>> for details about the existing check.
>>>
>>
>> Ok, I'll move that check for the existing workaround into its own
>> function to make it more clear what is happening
> 
> While doing this and thinking learning more about this old patch I had a
> realization:
> The existing code does this 2.5s sleep before every suspend *except* for
> the very first one after a (re)boot!
> 
> (Except on CPUs that don't have this metrics table (AMD_CPU_ID_PCO) or
> some edge case when pdev->smu_virt_addr is NULL and can't be set with
> amd_pmc_setup_smu_logging())
> 
> This by the way explains why in the rare cases suspend randomly worked
> as intended on my machine (even without my patch) it kept on working in
> subsequent suspends, until rebooting.
> 
> Anyway, radical idea: What if we just ALWAYS SLEEP for 2.5 seconds here?
> 
> I don't think the special case of the very first suspend after boot
> justifies all the complexity of the existing checks *and* the conditions
> I'm adding.
> 

That's not how it works - it only applies the 2.5s delay when it has 
reached HW sleep and needs to start a second HW sleep cycle.

That is something like this:
  * close the lid
  * suspend sequence starts
  * (no extra sleep)
  * enter HW sleep
  * plug in ac adapter
  * EC SCI fires
  * exits HW sleep
  * kernel decides to go back to HW sleep (no other interrupts active)
  * (extra sleep here)
  * enter HW sleep
  * open lid
  * exit HW sleep
  * resume sequence
  * back in OS

And that is how every cycle after a reboot works.  So this would be the 
second sequence if you tried to suspend again.

  * close the lid
  * suspend sequence starts
  * (no extra sleep)
  * enter HW sleep
  * open lid
  * exit HW sleep
  * resume sequence
  * back in OS

The reason for that 2.5s delay on second HW sleep is described in that 
commit message.  It's specifically to mitigate a case that a voltage 
regulator gets too much voltage from the rapid swings in and out of HW 
sleep rapidly.

It should not be applied every single cycle unless it's needed (such as 
this bug you found with the EC race).

Now you might have been confused by not looking at commit 
4dbd11796f3a8eb95647507befc41995458a4023.  This fixes the behavior as 
it's supposed to be.

>>
>>>> +		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>>>>   		msleep(2500);
>>>> +	}
>>>>   
>>>>   	/* Dump the IdleMask before we add to the STB */
>>>>   	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>>>> index fe3f53eb5955..f5257e47b8c4 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>> @@ -147,6 +147,7 @@ enum amd_pmc_def {
>>>>   };
>>>>   
>>>>   void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>>>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev);
>>>>   void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>>>>   void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>>>>   void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>>
>>>
>>
> 

