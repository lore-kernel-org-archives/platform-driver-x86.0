Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD61C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E03F56120D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241021AbhI1ObM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 10:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49217 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241016AbhI1ObL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 10:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632839371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fygzUBJRpxy1aYLfquLuU9tF3tU8t7U5iuELbZp5uiE=;
        b=ZSPXB4juXnOUkRZqW20DCPoY17tkWiSZ8rsSIP2Mc5s7VjklF25sVCcwCdcI8ANLeDDLKy
        kXrCC6EQy8yXzpfEH11B/rprB0/bwhDfSJzEO7w9YINB+JC49MRqDwqvlDr7rXIrR8XHAu
        fGhS6bW8UvXUDPCbmi7YkGR4OSeMhf0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-EaH-sxAqOhStV0u_BCMPdA-1; Tue, 28 Sep 2021 10:29:29 -0400
X-MC-Unique: EaH-sxAqOhStV0u_BCMPdA-1
Received: by mail-ed1-f71.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so21977121edy.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 07:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fygzUBJRpxy1aYLfquLuU9tF3tU8t7U5iuELbZp5uiE=;
        b=vHMkKAP4aWJbASlXxWTgzuIYeeCTKXET5hE0/aj60z7JyGK7aQ46vuFfMLXkSIeWFA
         FtLTFuReHRTpNjfRoWzLVvsx62NCOuuuPPQEXooILCMt5Qwx6+Gy0x6IixNzxoJ1z2K8
         F8jqQzYbxXO883b+X3J3BCwH2OOeJQQ7y3vsq6RUbogxAEwLHCgEeazkS4x2c06/uphU
         oA647K97J5h1DJhWwPU3wx/CTXVoEwuLNh84HflQXHblnOHjLh1pxvf+y7dR5f+wqkTb
         CXXuMR5vkfO7B0a/4KBO+8U52Ei4btLr7eDCFk6gO6yYoIv+Dvvx5j79fRL8WmCHslOZ
         XMXA==
X-Gm-Message-State: AOAM533r1cgYXz8vhGsDrGUgReddsRom8k7dKl2elZNLrGZ7HrTJRe9o
        wbbiXG91O/IxYtMr/tCngxwKlTI4f72sw9heI+ZSze+lVPwT+WuXFzCHsxaeJa4H7FIwqkcswYW
        lrVNGSax8MkXnzgaUUdwvHUVIXRwprk/tvw==
X-Received: by 2002:a17:906:4f82:: with SMTP id o2mr7231071eju.10.1632839368521;
        Tue, 28 Sep 2021 07:29:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNQB7zIOipG/VMitvIElwoor3HHMzfFQidD16cQnq0D0eWeyLjOCvDOiM+9XClGImGGW7E8Q==
X-Received: by 2002:a17:906:4f82:: with SMTP id o2mr7231051eju.10.1632839368308;
        Tue, 28 Sep 2021 07:29:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bw25sm10847599ejb.20.2021.09.28.07.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 07:29:27 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Fix compilation when
 CONFIG_DEBUGFS is disabled
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210928142122.58417-1-hdegoede@redhat.com>
 <fb2e58d0-e241-41f6-b6a5-539a521ddff2@redhat.com>
Message-ID: <fad187cb-e5d6-66fe-0b83-4712e01f750f@redhat.com>
Date:   Tue, 28 Sep 2021 16:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fb2e58d0-e241-41f6-b6a5-539a521ddff2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/28/21 4:23 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/28/21 4:21 PM, Hans de Goede wrote:
>> The amd_pmc_get_smu_version() and amd_pmc_idlemask_read() functions are
>> used in the probe / suspend/resume code, so they are also used when
>> CONFIG_DEBUGFS is disabled, move them outside of the #ifdef CONFIG_DEBUGFS
>> block.
>>
>> Note this purely moves the code to above the #ifdef CONFIG_DEBUGFS,
>> the code is completely unchanged.
>>
>> Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Cc: Sanket Goswami <Sanket.Goswami@amd.com>
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've forgotten to add a:
> 
> Fixes: f6045de1f532 ("platform/x86: amd-pmc: Export Idlemask values based on the APU")
> 
> I've done so now and added this to my pdx86/review-hans branch.
> 
> I will also add this to pdx86/fixes and include it in my
> next 5.15 fixes pull-req to Linus.

Scratch the part of also adding this also to pdx86/fixes, the
troublesome commit is only present in -next.

Regards,

Hans



>> ---
>>  drivers/platform/x86/amd-pmc.c | 86 +++++++++++++++++-----------------
>>  1 file changed, 43 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>> index 1303366c31af..f185c43bbaa4 100644
>> --- a/drivers/platform/x86/amd-pmc.c
>> +++ b/drivers/platform/x86/amd-pmc.c
>> @@ -155,6 +155,49 @@ struct smu_metrics {
>>  	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
>>  } __packed;
>>  
>> +static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>> +{
>> +	int rc;
>> +	u32 val;
>> +
>> +	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	dev->major = (val >> 16) & GENMASK(15, 0);
>> +	dev->minor = (val >> 8) & GENMASK(7, 0);
>> +	dev->rev = (val >> 0) & GENMASK(7, 0);
>> +
>> +	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>> +				 struct seq_file *s)
>> +{
>> +	u32 val;
>> +
>> +	switch (pdev->cpu_id) {
>> +	case AMD_CPU_ID_CZN:
>> +		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
>> +		break;
>> +	case AMD_CPU_ID_YC:
>> +		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (dev)
>> +		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
>> +
>> +	if (s)
>> +		seq_printf(s, "SMU idlemask : 0x%x\n", val);
>> +
>> +	return 0;
>> +}
>> +
>>  #ifdef CONFIG_DEBUG_FS
>>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>>  {
>> @@ -210,49 +253,6 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
>>  }
>>  DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
>>  
>> -static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>> -{
>> -	int rc;
>> -	u32 val;
>> -
>> -	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
>> -	if (rc)
>> -		return rc;
>> -
>> -	dev->major = (val >> 16) & GENMASK(15, 0);
>> -	dev->minor = (val >> 8) & GENMASK(7, 0);
>> -	dev->rev = (val >> 0) & GENMASK(7, 0);
>> -
>> -	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
>> -
>> -	return 0;
>> -}
>> -
>> -static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>> -				 struct seq_file *s)
>> -{
>> -	u32 val;
>> -
>> -	switch (pdev->cpu_id) {
>> -	case AMD_CPU_ID_CZN:
>> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
>> -		break;
>> -	case AMD_CPU_ID_YC:
>> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> -	}
>> -
>> -	if (dev)
>> -		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
>> -
>> -	if (s)
>> -		seq_printf(s, "SMU idlemask : 0x%x\n", val);
>> -
>> -	return 0;
>> -}
>> -
>>  static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>>  {
>>  	struct amd_pmc_dev *dev = s->private;
>>

