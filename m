Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523A3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 14:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbiDKO6Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243991AbiDKO6Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 10:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E132A17059
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649688968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/aome9AbohUqsmtceUId3+jJCrdUTtid3MVteevNcs=;
        b=FfdieGBm+0u9X41LG+eZF20kd7mbzD8kGUVhihU/6lKIkPxQyKkC17yhVYjQt1W+rBQ2/C
        oX/zdB574OgVNt3ew1LGnARZxQ0rMp5GUgx/plRTKn+irojdBHEpQ9KMAo1AkuIAOofTDN
        U5exKXtLaZUDRkUntarECgSaCOm61OE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-5JsaBugUOPa8SKgjh61QJA-1; Mon, 11 Apr 2022 10:56:07 -0400
X-MC-Unique: 5JsaBugUOPa8SKgjh61QJA-1
Received: by mail-ej1-f72.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so7157485eje.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T/aome9AbohUqsmtceUId3+jJCrdUTtid3MVteevNcs=;
        b=iwbpqWBqY4c7V4PqJA7k1nyotMGBf7dSU9fApQHDlQqgkHNk3tc+87wCQY8B995ENW
         X/gbEyPWr4yG8E/pvW+xOaJ3lfGbE72ShDMxo48GkZupXv+BGHLClErJ6dVrXSc6jT2R
         iXBzR0nWpV/gYp6moc10VVLc5OHnXaX/KYBibFYoSkg/j5cLzRSVMwxU71vmyO3uAz+I
         kTjm4Eh/R5ucq/zJsX93+PyqgWXtQoO4wHZht0loVt567M4qjTMzOhYUOX0daGoqrhtd
         OYyqvrWGHEDVLGaRbkYV45U0jC/svle9XcafVWby1XpYnSkWAM7nVpJ+c3YQcxII8Ac5
         7Fkg==
X-Gm-Message-State: AOAM533P+SkqOsx+yPnVXErRCa8u7/3GsC0rcms1NmA2jY8LlP7RvxbY
        gH3JUqF9vEna6OyqgRYSnCZ77ffHKIvK7xs2T7XjPpkw+WlvjxuawCRVxUOxF4nHHKa1/BJYLuS
        eEIsl5fyHvUITUbYiFsZJUVrRPiLq9EjoHQ==
X-Received: by 2002:a05:6402:2682:b0:41d:2f74:7269 with SMTP id w2-20020a056402268200b0041d2f747269mr16949598edd.255.1649688965933;
        Mon, 11 Apr 2022 07:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMd2mJ+YLLAhdjUeP8YqRiWIMxId4+0xkJfLsZHVU8WF+hboV09PAjtXozP2zYeF7OxfTB0A==
X-Received: by 2002:a05:6402:2682:b0:41d:2f74:7269 with SMTP id w2-20020a056402268200b0041d2f747269mr16949575edd.255.1649688965709;
        Mon, 11 Apr 2022 07:56:05 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q17-20020a17090622d100b006e87bcf7ae7sm2468449eja.208.2022.04.11.07.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 07:56:05 -0700 (PDT)
Message-ID: <3bb519ea-31db-d02a-cb39-d7e92e3f9a18@redhat.com>
Date:   Mon, 11 Apr 2022 16:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] platform/x86: amd-pmc: Move SMU logging setup out
 of init
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>, rrangel@chromium.org
References: <20220411143820.13971-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220411143820.13971-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 4/11/22 16:38, Mario Limonciello wrote:
> SMU logging is setup when the device is probed currently.
> 
> In analyzing boot performance it was observed that amd_pmc_probe is
> taking ~116800us on startup on an OEM platform.  This is longer than
> expected, and is caused by enabling SMU logging at startup.
> 
> As the SMU logging is only needed for debugging, initialize it only upon
> use.  This decreases the time for amd_pmc_probe to ~28800us.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * Drop extra check for dev->active_ips as already validated in get_metrics_table
>  * Add tag

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note I had to resolve some trivial conflicts manually because your
base did not include the "platform/x86: amd-pmc: Fix compilation
without CONFIG_SUSPEND" patch (1), please double check the results.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


1) To avoid this in the future please use the:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
branch as base in the future.






> 
>  drivers/platform/x86/amd-pmc.c | 47 ++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index e9d0dbbb2887..103ba0729b2a 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -162,6 +162,7 @@ static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> +static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev);
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -319,6 +320,13 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  
>  static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
>  {
> +	if (!pdev->smu_virt_addr) {
> +		int ret = amd_pmc_setup_smu_logging(pdev);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (pdev->cpu_id == AMD_CPU_ID_PCO)
>  		return -ENODEV;
>  	memcpy_fromio(table, pdev->smu_virt_addr, sizeof(struct smu_metrics));
> @@ -447,25 +455,32 @@ static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>  
>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>  {
> -	u32 phys_addr_low, phys_addr_hi;
> -	u64 smu_phys_addr;
> -
> -	if (dev->cpu_id == AMD_CPU_ID_PCO)
> +	if (dev->cpu_id == AMD_CPU_ID_PCO) {
> +		dev_warn_once(dev->dev, "SMU debugging info not supported on this platform\n");
>  		return -EINVAL;
> +	}
>  
>  	/* Get Active devices list from SMU */
> -	amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
> +	if (!dev->active_ips)
> +		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
>  
>  	/* Get dram address */
> -	amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
> -	amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
> -	smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> -
> -	dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr, sizeof(struct smu_metrics));
> -	if (!dev->smu_virt_addr)
> -		return -ENOMEM;
> +	if (!dev->smu_virt_addr) {
> +		u32 phys_addr_low, phys_addr_hi;
> +		u64 smu_phys_addr;
> +
> +		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
> +		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
> +		smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> +
> +		dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr,
> +						  sizeof(struct smu_metrics));
> +		if (!dev->smu_virt_addr)
> +			return -ENOMEM;
> +	}
>  
>  	/* Start the logging */
> +	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
>  	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
>  
>  	return 0;
> @@ -634,8 +649,7 @@ static void amd_pmc_s2idle_prepare(void)
>  	u32 arg = 1;
>  
>  	/* Reset and Start SMU logging - to monitor the s0i3 stats */
> -	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> -	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
> +	amd_pmc_setup_smu_logging(pdev);
>  
>  	/* Activate CZN specific RTC functionality */
>  	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
> @@ -846,11 +860,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  		goto err_pci_dev_put;
>  	}
>  
> -	/* Use SMU to get the s0i3 debug stats */
> -	err = amd_pmc_setup_smu_logging(dev);
> -	if (err)
> -		dev_err(dev->dev, "SMU debugging info not supported on this platform\n");
> -
>  	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
>  		err = amd_pmc_s2d_init(dev);
>  		if (err)

