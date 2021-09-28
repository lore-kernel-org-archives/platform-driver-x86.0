Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BC1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B79C1611EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240962AbhI1OZn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 10:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39817 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240960AbhI1OZn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 10:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632839043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mXf0FgdvdHymJgZxajk+LeXYpnfJup/khq1CElDIb6s=;
        b=MwO5Exnehdera87+DAhtth6P3zurLBRt0H/jcrvYXFG0EyLlMXkfZpl29XX7z2MiHfX0DT
        yC00kE5VFNdJF+S8DAErcuZhwuiwOETawpw36+KpNEbDXDTG0Y8pf3mHVk56AnqUDftwCP
        ah5xinM41BtRS4r44eoagiOtyj48588=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-nsFo1gXEOpSwk6MVbucwkg-1; Tue, 28 Sep 2021 10:24:01 -0400
X-MC-Unique: nsFo1gXEOpSwk6MVbucwkg-1
Received: by mail-ed1-f70.google.com with SMTP id 14-20020a508e4e000000b003d84544f33eso22039280edx.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 07:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mXf0FgdvdHymJgZxajk+LeXYpnfJup/khq1CElDIb6s=;
        b=RIqrSR7oF9SbvupI51Z3xoMkrrDvKw95Wij9O7cXT8VU5HwVFeTERFWwyPj6+jauYF
         GVrZl8a4Bh9KYMS3zOndul7QHyyaUy9yOq30/sKbG9eVPIi6i9cWuZy821s7Jd6TiKAU
         fpW2irSKsLGEpvc8kWZGAR4gEfZ15+jg1SfoiN/Et+OqRRib82KC+LC3q0uGRiyKwOhm
         YhGui+tTU7KKOduNzIQ9NlFN+dEeURWgZ80CES2pZRkaLBDSGIxLZewpyWZGom4z00B0
         iU57PJw+Yzc4NrS8yP6Tl154Bt9KLb9e+XmuJouo2dXXxxgdGTRhogwV5/8e0Zo7AMhq
         zwDA==
X-Gm-Message-State: AOAM530QOIFy9GwXtcIjzFBAKDp0jpoM1/1T/DFYEQXkjWOoZ3Ii5/zU
        YuioGAr+KyAdFPxlR1yONP8H563DlxEWSBHIStWBfD9f1Mn4V6w5/MglTjFsNvAWNBzLy9CAII1
        3YfhMQPLhrv2tymeQZW4bqxho7gpFt5j8ig==
X-Received: by 2002:a17:906:234e:: with SMTP id m14mr3042642eja.383.1632839040777;
        Tue, 28 Sep 2021 07:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbUPNa193fUgp8YC4iS6zs8j+x6IbHMjkniMcowPSpw+9ERthNt0Hb5mdizdrdwyn82UD6ow==
X-Received: by 2002:a17:906:234e:: with SMTP id m14mr3042623eja.383.1632839040611;
        Tue, 28 Sep 2021 07:24:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u18sm5143440ejc.26.2021.09.28.07.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 07:24:00 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Fix compilation when
 CONFIG_DEBUGFS is disabled
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210928142122.58417-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fb2e58d0-e241-41f6-b6a5-539a521ddff2@redhat.com>
Date:   Tue, 28 Sep 2021 16:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210928142122.58417-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/28/21 4:21 PM, Hans de Goede wrote:
> The amd_pmc_get_smu_version() and amd_pmc_idlemask_read() functions are
> used in the probe / suspend/resume code, so they are also used when
> CONFIG_DEBUGFS is disabled, move them outside of the #ifdef CONFIG_DEBUGFS
> block.
> 
> Note this purely moves the code to above the #ifdef CONFIG_DEBUGFS,
> the code is completely unchanged.
> 
> Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Cc: Sanket Goswami <Sanket.Goswami@amd.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've forgotten to add a:

Fixes: f6045de1f532 ("platform/x86: amd-pmc: Export Idlemask values based on the APU")

I've done so now and added this to my pdx86/review-hans branch.

I will also add this to pdx86/fixes and include it in my
next 5.15 fixes pull-req to Linus.

Regards,

Hans


> ---
>  drivers/platform/x86/amd-pmc.c | 86 +++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 1303366c31af..f185c43bbaa4 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -155,6 +155,49 @@ struct smu_metrics {
>  	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
>  } __packed;
>  
> +static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
> +{
> +	int rc;
> +	u32 val;
> +
> +	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
> +	if (rc)
> +		return rc;
> +
> +	dev->major = (val >> 16) & GENMASK(15, 0);
> +	dev->minor = (val >> 8) & GENMASK(7, 0);
> +	dev->rev = (val >> 0) & GENMASK(7, 0);
> +
> +	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
> +				 struct seq_file *s)
> +{
> +	u32 val;
> +
> +	switch (pdev->cpu_id) {
> +	case AMD_CPU_ID_CZN:
> +		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
> +		break;
> +	case AMD_CPU_ID_YC:
> +		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (dev)
> +		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
> +
> +	if (s)
> +		seq_printf(s, "SMU idlemask : 0x%x\n", val);
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>  {
> @@ -210,49 +253,6 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
>  
> -static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
> -{
> -	int rc;
> -	u32 val;
> -
> -	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
> -	if (rc)
> -		return rc;
> -
> -	dev->major = (val >> 16) & GENMASK(15, 0);
> -	dev->minor = (val >> 8) & GENMASK(7, 0);
> -	dev->rev = (val >> 0) & GENMASK(7, 0);
> -
> -	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
> -
> -	return 0;
> -}
> -
> -static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
> -				 struct seq_file *s)
> -{
> -	u32 val;
> -
> -	switch (pdev->cpu_id) {
> -	case AMD_CPU_ID_CZN:
> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
> -		break;
> -	case AMD_CPU_ID_YC:
> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	if (dev)
> -		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
> -
> -	if (s)
> -		seq_printf(s, "SMU idlemask : 0x%x\n", val);
> -
> -	return 0;
> -}
> -
>  static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>  {
>  	struct amd_pmc_dev *dev = s->private;
> 

