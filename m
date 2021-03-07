Return-Path: <SRS0=OtHb=IF=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D82C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Mar 2021 19:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BA0364F53
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Mar 2021 19:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbhCGTNy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 7 Mar 2021 14:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34071 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232160AbhCGTNQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Mar 2021 14:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615144396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=je7sr164Izpo6Fo1oymYQkhom9vxq8Rat0Oti+DbdM8=;
        b=If3LXY6urLThHY9KJgvBI45aho+o8H+ajr1dok44+afcvP/Uextd6bF35roSHrFKWQi+1M
        4dHzEyPo7cBUfdh6XAsRCIBE1SvA7gShQYl9jMLw6sRsSClzlyiza5Hdx1miDVIn4PRnMr
        AH+3NOFGp7RTAd/i3333f6S2O66yufQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-sxYO0DuWOGKVWUxaeB6xlw-1; Sun, 07 Mar 2021 14:13:14 -0500
X-MC-Unique: sxYO0DuWOGKVWUxaeB6xlw-1
Received: by mail-ed1-f72.google.com with SMTP id v27so4034100edx.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Mar 2021 11:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=je7sr164Izpo6Fo1oymYQkhom9vxq8Rat0Oti+DbdM8=;
        b=DcP0Og63MKe44tEWFVFJScNiwqQZBkeYiUgx9VMQKRloXek8UCl13VnpPsNrvyTwbn
         FoPqb34jcQQ46kaT9i6PZ34wdCzEJnEo8XeMK2xtcUQqkzvoFZKSq6BQSK9n+02lQvLb
         DNqLUyrOW8szgNlC3BZRUXg66NqGt6/rpoTrjESuM80Y7sPRr0TDsnrIDML09LpPFv45
         DuKkZQguO0wT932JZIz8TLonwOJ8x2riHRmSLWMkqm2HkYmDX9Cqw4sX0Eg4USCSgX73
         +r0BqoXmm+FYo19jelC6bYaQzn34sme1d9mhavT6Fyx920qi0s6A6kiuo2efr3E5seUU
         zffQ==
X-Gm-Message-State: AOAM5326vrOjSw4dzbRQP7ZcxPHP9pt7INAE/B3GiiIl8elaEzp0jUR8
        nos+RUNDJZtlpnKQ3UxDPwRKL24duwecsyjiIQrJ+TzInZMqdhclnxUtSwu0BVnCmxfz+lQ0xob
        jBkHyeH2tCiOl+qT/PfqE89Rpc+IXpqmLug==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr18908280edr.213.1615144393013;
        Sun, 07 Mar 2021 11:13:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUEUSe5HdGCBcDa+3JQ9Y9qVFxJH9C4XlCacigko0z2znz3WTf1JL5ZTd2VkpBhEbl1wnFGA==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr18908261edr.213.1615144392817;
        Sun, 07 Mar 2021 11:13:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w18sm5366857ejn.23.2021.03.07.11.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 11:13:12 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel_pmc: Ignore GBE LTR on Tiger Lake
 platforms
To:     "Neftin, Sasha" <sasha.neftin@intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
References: <20210305190608.1834164-1-david.e.box@linux.intel.com>
 <113b08b2-ead1-7f4c-1b09-4f3572d6134f@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3e339312-f265-ce7e-dc70-253d1c93256d@redhat.com>
Date:   Sun, 7 Mar 2021 20:13:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <113b08b2-ead1-7f4c-1b09-4f3572d6134f@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/21 9:39 AM, Neftin, Sasha wrote:
> On 3/5/2021 21:06, David E. Box wrote:
>> Due to a HW limitation, the Latency Tolerance Reporting (LTR) value
>> programmed in the Tiger Lake GBE controller is not large enough to allow
>> the platform to enter Package C10, which in turn prevents the platform from
>> achieving its low power target during suspend-to-idle.  Ignore the GBE LTR
>> value on Tiger Lake. LTR ignore functionality is currently performed solely
>> by a debugfs write call. Split out the LTR code into its own function that
>> can be called by both the debugfs writer and by this work around.
>>
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> Reviewed-by: Sasha Neftin <sasha.neftin@intel.com>
>> Cc: intel-wired-lan@lists.osuosl.org
>> ---
>>   drivers/platform/x86/intel_pmc_core.c | 55 ++++++++++++++++++++-------
>>   1 file changed, 42 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
>> index ee2f757515b0..ab31eb646a1a 100644
>> --- a/drivers/platform/x86/intel_pmc_core.c
>> +++ b/drivers/platform/x86/intel_pmc_core.c
>> @@ -863,34 +863,45 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
>>   -static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>> -                     const char __user *userbuf,
>> -                     size_t count, loff_t *ppos)
>> +static int pmc_core_write_ltr_ignore(u32 value)
>>   {
>>       struct pmc_dev *pmcdev = &pmc;
>>       const struct pmc_reg_map *map = pmcdev->map;
>> -    u32 val, buf_size, fd;
>> -    int err;
>> -
>> -    buf_size = count < 64 ? count : 64;
>> -
>> -    err = kstrtou32_from_user(userbuf, buf_size, 10, &val);
>> -    if (err)
>> -        return err;
>> +    u32 fd;
>> +    int err = 0;
>>         mutex_lock(&pmcdev->lock);
>>   -    if (val > map->ltr_ignore_max) {
>> +    if (fls(value) > map->ltr_ignore_max) {
>>           err = -EINVAL;
>>           goto out_unlock;
>>       }
>>         fd = pmc_core_reg_read(pmcdev, map->ltr_ignore_offset);
>> -    fd |= (1U << val);
>> +    fd |= value;
>>       pmc_core_reg_write(pmcdev, map->ltr_ignore_offset, fd);
>>     out_unlock:
>>       mutex_unlock(&pmcdev->lock);
>> +
>> +    return err;
>> +}
>> +
>> +static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>> +                     const char __user *userbuf,
>> +                     size_t count, loff_t *ppos)
>> +{
>> +    u32 buf_size, val;
>> +    int err;
>> +
>> +    buf_size = count < 64 ? count : 64;
>> +
>> +    err = kstrtou32_from_user(userbuf, buf_size, 10, &val);
>> +    if (err)
>> +        return err;
>> +
>> +    err = pmc_core_write_ltr_ignore(1U << val);
>> +
>>       return err == 0 ? count : err;
>>   }
>>   @@ -1189,6 +1200,15 @@ static int quirk_xtal_ignore(const struct dmi_system_id *id)
>>       return 0;
>>   }
>>   +static int quirk_ltr_ignore(u32 val)
>> +{
>> +    int err;
>> +
>> +    err = pmc_core_write_ltr_ignore(val);
>> +
>> +    return err;
>> +}
>> +
>>   static const struct dmi_system_id pmc_core_dmi_table[]  = {
>>       {
>>       .callback = quirk_xtal_ignore,
>> @@ -1244,6 +1264,15 @@ static int pmc_core_probe(struct platform_device *pdev)
>>       pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
>>       dmi_check_system(pmc_core_dmi_table);
>>   +    /*
>> +     * On TGL, due to a hardware limitation, the GBE LTR blocks PC10 when
>> +     * a cable is attached. Tell the PMC to ignore it.
>> +     */
>> +    if (pmcdev->map == &tgl_reg_map) {
> I would suggest: if (pmcdev->map >= &tgl_reg_map)

Erm, no just no. tgl_reg_map is a global variable you can absolutely NOT rely
on the ordering of global variables in memory like this. Moreover using ordered
comparisons on pointers generally is a very bad idea, please don't.

Regards,

Hans

