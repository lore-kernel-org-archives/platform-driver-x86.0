Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D00C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 13:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237127AbiDKNFk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 09:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234731AbiDKNFj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 09:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7C1AA1101
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649682204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AJW+LYrszd4+XZ3+0CwEQPfkg+fT3jTVFmcuw381zRU=;
        b=Z4zan0v4OpYZia0c8gGH1B7c367+qDrR/Pq6RpFqzZevfAT3AlD/1SdgGjI9wa9o9Fm7dj
        1RALHTUgEjuIv1p5G3Qm3Itig047RziTflPh9DtceNrFpjK/yXqWq5iCyP8qnKwqWBfSQ/
        1XHhv/Vrt/2cd2o89nhN0OgWkxsMMmw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-UMn1844dOxuf8cHbcLrutw-1; Mon, 11 Apr 2022 09:03:23 -0400
X-MC-Unique: UMn1844dOxuf8cHbcLrutw-1
Received: by mail-ed1-f70.google.com with SMTP id cb11-20020a0564020b6b00b0041d870f7b3aso538068edb.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 06:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AJW+LYrszd4+XZ3+0CwEQPfkg+fT3jTVFmcuw381zRU=;
        b=i3n6g32NP7JdEykNWDXLtXOPDOrks3c+6/RwrlvtwRcKrZlVrG0Oy/KfLIRDaIsykh
         Tk4s/I/v+sxg2MgJ8EQYDYrcfRhegOlD7o8XP5BZaUSFQgmf7WRu73+FsHjbq4+zOVy4
         E8jblpnRDsfIC58uFg4FqmyT9Gl9v8Op5kQhdsnf4wuoNOxamO+bWfMEMRsggWcfh2JY
         t+NZqM/90kQ83FpNS+y2rEa/T7ATPoZNNg9UxrPckjzXG1DXUzVFYAD5An8OO/HKo320
         qdjlfPYdQWaJzNmZz2e6F5LHpUTLc4zjV/VvcI8kETYxoLQYQfN0JiKk3bKgDNmaTpfG
         xibg==
X-Gm-Message-State: AOAM530CAwq0HBIbORSAyr3j7I73AlHAY90gpyrUjsYGSEsRox7BQBpE
        3tLy52k96CXjbeBmGoSQ2jRzHLUTav+cL5fOvE78MmPp1fAYZW4RVaOtMyp9YVwmdWr8DmJD3B/
        u8JmfQsX6Jl3exhzrhL7c+rIjy0rBgwUhkQ==
X-Received: by 2002:a05:6402:d0e:b0:418:f011:275e with SMTP id eb14-20020a0564020d0e00b00418f011275emr32795218edb.323.1649682201856;
        Mon, 11 Apr 2022 06:03:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze7jjxbqcY4JlRxL2iwebfJ4ssaBV3cyfPgcfh/6KGto57OoSv7rtb415IwA26C8+dkoSodQ==
X-Received: by 2002:a05:6402:d0e:b0:418:f011:275e with SMTP id eb14-20020a0564020d0e00b00418f011275emr32795187edb.323.1649682201646;
        Mon, 11 Apr 2022 06:03:21 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm11974162ejd.133.2022.04.11.06.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:03:20 -0700 (PDT)
Message-ID: <fe7f1bc9-2b25-c01e-08b0-ec3e72546bcc@redhat.com>
Date:   Mon, 11 Apr 2022 15:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] platform/x86: amd-pmc: Move SMU logging setup out of
 init
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>, rrangel@chromium.org
References: <20220406202655.10710-1-mario.limonciello@amd.com>
 <20220406202655.10710-2-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220406202655.10710-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/6/22 22:26, Mario Limonciello wrote:
> SMU logging is setup when the device is probed currently.
> 
> In analyzing boot performance it was observed that amd_pmc_probe is
> taking ~116800us on startup on an OEM platform.  This is longer than
> expected, and is caused by enabling SMU logging at startup.
> 
> As the SMU logging is only needed for debugging, initialize it only upon
> use.  This decreases the time for amd_pmc_probe to ~28800us.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd-pmc.c | 54 ++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index e9d0dbbb2887..28e98e4649f1 100644
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
> @@ -346,6 +354,13 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  	struct smu_metrics table;
>  	int idx;
>  
> +	if (!dev->active_ips) {
> +		int ret = amd_pmc_setup_smu_logging(dev);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (get_metrics_table(dev, &table))
>  		return -EINVAL;
>  

This addition seems unnecessary, since it is immediately followed by get_metrics_table()
which will already call amd_pmc_setup_smu_logging() if not done already ?

Otherwise the series looks good to me, so
with this dropped you can add:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To v2 of the series.

Regards,

Hans


> @@ -447,25 +462,32 @@ static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
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
> @@ -634,8 +656,7 @@ static void amd_pmc_s2idle_prepare(void)
>  	u32 arg = 1;
>  
>  	/* Reset and Start SMU logging - to monitor the s0i3 stats */
> -	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> -	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
> +	amd_pmc_setup_smu_logging(pdev);
>  
>  	/* Activate CZN specific RTC functionality */
>  	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
> @@ -846,11 +867,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
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

