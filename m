Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B892F8E92
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 23:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196347; cv=none; b=LSm4GVf7DSGpIl2e9ir7mrU9PKLDmfbCE7NdICvLSbAPKmrEiZx+s+DItNIVyFga7/XfaWRkOrWK53c1vjJrYRH4KJBqntLn6FerUfldnFeikyeVEhgcw/pHYU3eM1pJsh977ZA1x0HI/ezFRXifksqYuXkzmJC7Ry7pBuDk3Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196347; c=relaxed/simple;
	bh=2QZ+/Ibx2OvIH2tOVAj1ksIcBcIMZIRsGCgBEWCfNIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZSjcKMqWEyJyeV1PEP9oDSfPykkNhX8OF9lb6aMNb7OSyklm+v/AgD3ki4/4UwUKkk4MDKfIk3uW0i62JVZVC8EYc8gL6lXolrXufnXs/0h+lovNFTUVP6ijBOTX8ykj0AT2KlnVtbiyom5ID5EsD2Yp5nDZbIAg06zZssXraI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=E5dRGM6D; arc=none smtp.client-ip=185.125.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="E5dRGM6D"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBSzP4sJMzyKG;
	Fri,  8 May 2026 01:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778196337;
	bh=k61X07yaZK4uEYwOFN4MXuaBYm3YDgt9KoZiouMbFUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E5dRGM6DL4lyWra8i+xbh/hM1tHregwkLw6iMwaCKzbyhjUTa2YifAjRoC0Ux4xzM
	 UXaBI7PDyT54vGt24ad8CBJbRjJOoJIdymzuymgEvHO+bd7ae4SvsOzhQc710riEW6
	 ANvKEuKgv5+TaBnQlnIsQCOCtqfhGoU6uqM3pSaBRWr3JCi+ZxQGop7AV7AlTJMGB5
	 wG1eO7cFuv+hk4dlwqmqdXoIpOs2ghRDweLOSsPSGg/82QJ17PmtFC8CYgIYK6+Ht5
	 mWBbCg/HVi0EDMqRRaso/ziIZk/rEVEyXICUVWut1PRspSy7efnBKnIo/dqDiHfg6s
	 4/MsyIO+bnOjg==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBSzN36Kfz91p;
	Fri,  8 May 2026 01:25:36 +0200 (CEST)
Message-ID: <36c3e7fa-f153-42d2-b1c2-8f5b9564ee77@gibson.sh>
Date: Fri, 8 May 2026 01:25:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo
 Laptops
To: Mario Limonciello <superm1@kernel.org>,
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
 <887bf769-4c02-4d61-bfb1-127a710b670c@kernel.org>
Content-Language: de-DE, en-GB
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <887bf769-4c02-4d61-bfb1-127a710b670c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 08.05.26 00:54, Mario Limonciello wrote:
> On 5/7/26 17:43, Daniel Gibson wrote:
>> On 07.05.26 22:19, Daniel Gibson wrote:
>>> Thanks for the review!
>>>
>>> On 07.05.26 15:22, Ilpo Järvinen wrote:
>>>> On Fri, 1 May 2026, Daniel Gibson wrote:
>>>>
>>>>> Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
>>>>> nonfunctional keyboard and lid switch after s2idle.
>>>>> It helps to delay suspend by 2.5 seconds so the EC has some time
>>>>> to do whatever it needs to get done before suspend.
>>>>>
>>>>> This issue has been reported for many different devices, this patch
>>>>> has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
>>>>> and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6), see
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>>>
>>>>> Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>>> Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
>>>>> Tested-by: Daniel Gibson <daniel@gibson.sh>
>>>>> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>>> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
>>>>> ---
>>>>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 36 ++++++++++++++++++
>>>>> +++++
>>>>>   drivers/platform/x86/amd/pmc/pmc.c        |  5 +++-
>>>>>   drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>>>>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/
>>>>> platform/x86/amd/pmc/pmc-quirks.c
>>>>> index 24506e342943..cea30f68f8dc 100644
>>>>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>>>>> @@ -18,6 +18,7 @@
>>>>>   struct quirk_entry {
>>>>>       u32 s2idle_bug_mmio;
>>>>>       bool spurious_8042;
>>>>> +    bool need_suspend_delay;
>>>>>   };
>>>>>     static struct quirk_entry quirk_s2idle_bug = {
>>>>> @@ -33,6 +34,10 @@ static struct quirk_entry
>>>>> quirk_s2idle_spurious_8042 = {
>>>>>       .spurious_8042 = true,
>>>>>   };
>>>>>   +static struct quirk_entry quirk_s2idle_need_suspend_delay = {
>>>>> +    .need_suspend_delay = true
>>>>
>>>> Please add comma to any non-terminating entry.
>>>
>>> will do
>>>
>>>>
>>>>> +};
>>>>> +
>>>>>   static const struct dmi_system_id fwbug_list[] = {
>>>>>       {
>>>>>           .ident = "L14 Gen2 AMD",
>>>>> @@ -203,6 +208,32 @@ static const struct dmi_system_id fwbug_list[]
>>>>> = {
>>>>>               DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>>>>>           }
>>>>>       },
>>>>> +    /*
>>>>> +     * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
>>>>> +     * me-time before sleeping or they get uncooperative after waking
>>>>> +     * up and don't send events for keyboard and lid switch anymore.
>>>>> +     * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
>>>>> +     */
>>>>> +    {
>>>>> +        .ident = "Zen3-based IdeaPad Slim and similar",
>>>>> +        .driver_data = &quirk_s2idle_need_suspend_delay,
>>>>> +        .matches = {
>>>>> +            DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>>>> +            /*
>>>>> +             * Note: there are also some Zen2-based 82X* devices that
>>>>> +             * need different quirks, they're already handled above
>>>>> +             */
>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "82X")
>>>>
>>>> Ditto.
>>>>
>>>>> +        }
>>>>> +    },
>>>>> +    {
>>>>> +        .ident = "Zen3+-based IdeaPad Slim and similar",
>>>>> +        .driver_data = &quirk_s2idle_need_suspend_delay,
>>>>> +        .matches = {
>>>>> +            DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "83K")
>>>>
>>>> Ditto.
>>>>
>>>>> +        }
>>>>> +    },
>>>>>       /* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
>>>>>       {
>>>>>           .ident = "Thinkpad L14 Gen3",
>>>>> @@ -356,6 +387,11 @@ void amd_pmc_process_restore_quirks(struct
>>>>> amd_pmc_dev *dev)
>>>>>           amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
>>>>>   }
>>>>>   +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
>>>>> +{
>>>>> +    return dev->quirks->need_suspend_delay;
>>>>> +}
>>>>> +
>>>>>   void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
>>>>>   {
>>>>>       const struct dmi_system_id *dmi_id;
>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/
>>>>> x86/amd/pmc/pmc.c
>>>>> index cae3fcafd4d7..c604dc7207ed 100644
>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>>> @@ -634,10 +634,13 @@ static void amd_pmc_s2idle_check(void)
>>>>>       struct amd_pmc_dev *pdev = &pmc;
>>>>>       struct smu_metrics table;
>>>>>       int rc;
>>>>> +    bool ec_needs_sleep = !disable_workarounds &&
>>>>> amd_pmc_quirk_need_suspend_delay(pdev);
>>>>
>>>> Why isn't disable_workarounds inside
>>>> amd_pmc_quirk_need_suspend_delay() ?
>>>
>>> Because disable_workarounds is a static variable in pmc.c and
>>> amd_pmc_quirk_need_suspend_delay() is implemented in pmc-quirks.c
>>>
>>>>
>>>>>         /* Avoid triggering OVP */
>>>>> -    if (!get_metrics_table(pdev, &table) &&
>>>>> table.s0i3_last_entry_status)
>>>>> +    if (ec_needs_sleep || (!get_metrics_table(pdev, &table) &&
>>>>> table.s0i3_last_entry_status)) {
>>>>
>>>> It would be clearer what's going on here if these two checks are
>>>> clearly
>>>> separated.
>>>>
>>>> As is, the comment confuses if it's only meant for the 2nd check.
>>>>
>>>> One of the checks will be in amd_pmc_quirk_need_suspend_delay() and the
>>>> other (the existing one + the comment) should be moved in to own
>>>> function
>>>> (perhaps in a patch preceeding this one) so it's clear the reasoning is
>>>> different(?). You can check the commit that introduced msleep(2500)
>>>> here
>>>> for details about the existing check.
>>>>
>>>
>>> Ok, I'll move that check for the existing workaround into its own
>>> function to make it more clear what is happening
>>
>> While doing this and thinking learning more about this old patch I had a
>> realization:
>> The existing code does this 2.5s sleep before every suspend *except* for
>> the very first one after a (re)boot!
>>
>> (Except on CPUs that don't have this metrics table (AMD_CPU_ID_PCO) or
>> some edge case when pdev->smu_virt_addr is NULL and can't be set with
>> amd_pmc_setup_smu_logging())
>>
>> This by the way explains why in the rare cases suspend randomly worked
>> as intended on my machine (even without my patch) it kept on working in
>> subsequent suspends, until rebooting.
>>
>> Anyway, radical idea: What if we just ALWAYS SLEEP for 2.5 seconds here?
>>
>> I don't think the special case of the very first suspend after boot
>> justifies all the complexity of the existing checks *and* the conditions
>> I'm adding.
>>
> 
> That's not how it works - it only applies the 2.5s delay when it has
> reached HW sleep and needs to start a second HW sleep cycle.
> 
> That is something like this:
>  * close the lid
>  * suspend sequence starts
>  * (no extra sleep)
>  * enter HW sleep
>  * plug in ac adapter
>  * EC SCI fires
>  * exits HW sleep
>  * kernel decides to go back to HW sleep (no other interrupts active)
>  * (extra sleep here)
>  * enter HW sleep
>  * open lid
>  * exit HW sleep
>  * resume sequence
>  * back in OS
> 
> And that is how every cycle after a reboot works.  So this would be the
> second sequence if you tried to suspend again.
> 
>  * close the lid
>  * suspend sequence starts
>  * (no extra sleep)
>  * enter HW sleep
>  * open lid
>  * exit HW sleep
>  * resume sequence
>  * back in OS
> 
> The reason for that 2.5s delay on second HW sleep is described in that
> commit message.  It's specifically to mitigate a case that a voltage
> regulator gets too much voltage from the rapid swings in and out of HW
> sleep rapidly.
> 
> It should not be applied every single cycle unless it's needed (such as
> this bug you found with the EC race).

Are you sure it behaves like this?
The check is basically "is the SMU table's s0i3_last_entry_status != 0".
And as far as I can tell this is the case after every successful suspend,
it only seems to be reset by rebooting or if a suspend fails.

See smu_fw_info_show() (for /sys/kern/debug/amd_pmc/smu_fw_info): 
seq_printf(s, "Last S0i3 Status: %s\n", table.s0i3_last_entry_status ? "Success" :
		   "Unknown/Fail");

When I read /sys/kern/debug/amd_pmc/smu_fw_info right after booting, it prints 
"Last S0i3 Status: Unknown/Fail"
After resuming, even minutes (and presumably hours) later, it prints
"Last S0i3 Status: Success"
indicating that s0i3_last_entry_status still is != 0.

> 
> Now you might have been confused by not looking at commit
> 4dbd11796f3a8eb95647507befc41995458a4023.  This fixes the behavior as
> it's supposed to be.
> 
>>>
>>>>> +        dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid
>>>>> platform bug\n");
>>>>>           msleep(2500);
>>>>> +    }
>>>>>         /* Dump the IdleMask before we add to the STB */
>>>>>       amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/
>>>>> x86/amd/pmc/pmc.h
>>>>> index fe3f53eb5955..f5257e47b8c4 100644
>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>>> @@ -147,6 +147,7 @@ enum amd_pmc_def {
>>>>>   };
>>>>>     void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>>>>> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev);
>>>>>   void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>>>>>   void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>>>>>   void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>>>
>>>>
>>>
>>
> 

