Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1276C77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 09:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjDQJeQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 05:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjDQJeP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 05:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1255FD5
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 02:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681723890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UzymFEnA71rZ7IV+seXO8jBzXVpCenheDhAZHXvi2GI=;
        b=bcSLxfozxASMdlIU1VMlapuZ7iJ3MlPOBqJyCk1dWS0GA30Iz/FxSo0zAR62cph6nINvnt
        YVdtsBbwUkQ+aiSSxSrXP0FL6Rb7K0+tqU5WapgljHFFGIG96d/1mLsSyR/UtH+Uk7TyfE
        DkuquDYkxBu1NRqd8umaceFgD+LWmXY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-7K7Y5Uc2P2C-0Azf937kCw-1; Mon, 17 Apr 2023 05:31:28 -0400
X-MC-Unique: 7K7Y5Uc2P2C-0Azf937kCw-1
Received: by mail-ej1-f69.google.com with SMTP id vx12-20020a170907a78c00b0094a9009d99bso8077396ejc.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 02:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681723887; x=1684315887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzymFEnA71rZ7IV+seXO8jBzXVpCenheDhAZHXvi2GI=;
        b=ggpTzgr3ueYJv07P9ZirCgWEu8xVaESGJDYUsh4aYsub9RZWpP6PkKV0DUvn3kJB3f
         zDkgMsmbvyE2ACb4MASjKOIRZF5bdXiVeElJ2+sjGOaYLyt5+ZEzNKH8oN/fkByou8EL
         IgmEFCSK3C96CAbWDdegQJlYFOXDSOkdpz+bihGRrUEecix0PyE668tInh2ue2gF1q9V
         /PEjpjfNWQFprlmNAqKU8nxvT0cKVC7xsPwkfBhks5yyplaJS6YnTyDvaBJFFbuu4xVp
         lQWood+w9oY4nR5DH1YgGg8yTHd1LAF/F1ooh78SZ6dHKhoieOjZ164escT63BUtSUMo
         L/Nw==
X-Gm-Message-State: AAQBX9fWgQx7Fp37IpoTa63eN2+vwsk2mhzqPHrYoE95Bh/iwRcSeFc8
        hpiCENa5BLK7dcPPZPVNaYA6ReQGlHK5aB95L0PHmkJa2edrKIFAmoaVgkL2CgZyo9CYQ9As8Gu
        QnCvwgFER1jUESsmpi5HS48ze/oi3L6UI2g==
X-Received: by 2002:a17:907:971b:b0:94f:9f77:ec75 with SMTP id jg27-20020a170907971b00b0094f9f77ec75mr872614ejc.58.1681723887582;
        Mon, 17 Apr 2023 02:31:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQGfxnERlv9FHfxgjzgSpldCj4n6QeHKbvVGSD5vCDFxUx7cKxxWJOKgn5G+CBih2NcAkgEA==
X-Received: by 2002:a17:907:971b:b0:94f:9f77:ec75 with SMTP id jg27-20020a170907971b00b0094f9f77ec75mr872604ejc.58.1681723887318;
        Mon, 17 Apr 2023 02:31:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y15-20020a170906524f00b0094e1026bc66sm6457935ejm.140.2023.04.17.02.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 02:31:26 -0700 (PDT)
Message-ID: <bedeca01-2e1c-65a5-dc88-56ca678ef569@redhat.com>
Date:   Mon, 17 Apr 2023 11:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] platform/x86/amd: pmc: Get STB DRAM size from PMFW
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 4/12/23 12:21, Shyam Sundar S K wrote:
> Recent PMFW's have support for querying the STB DRAM size. Add this
> support to the driver.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Please prepare a new version of this series addressing
Ilpo's review remarks.

Regards,

Hans






> ---
> v2:
>  - Based on review-hans branch
>  - Add a switch for cpu-id check based on feedback from Mario.
> 
>  drivers/platform/x86/amd/pmc.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 877b629e5cae..9f8bc6711413 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -114,6 +114,7 @@ enum s2d_arg {
>  	S2D_PHYS_ADDR_LOW,
>  	S2D_PHYS_ADDR_HIGH,
>  	S2D_NUM_SAMPLES,
> +	S2D_DRAM_SIZE,
>  };
>  
>  struct amd_pmc_bit_map {
> @@ -146,6 +147,7 @@ struct amd_pmc_dev {
>  	u32 base_addr;
>  	u32 cpu_id;
>  	u32 active_ips;
> +	u32 dram_size;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> @@ -888,11 +890,34 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> +static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_YC:
> +		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39)))
> +			goto err_dram_size;
> +		break;
> +	default:
> +		goto err_dram_size;
> +	}
> +
> +	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, 1);
> +	if (!dev->dram_size)
> +		goto err_dram_size;
> +
> +	return 0;
> +
> +err_dram_size:
> +	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
> +	return -EINVAL;
> +}
> +
>  static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  {
>  	u32 phys_addr_low, phys_addr_hi;
>  	u64 stb_phys_addr;
>  	u32 size = 0;
> +	int ret;
>  
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;
> @@ -901,6 +926,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>  		return -EIO;
>  
> +	/* Get DRAM size */
> +	ret = amd_pmc_get_dram_size(dev);
> +	if (ret)
> +		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> +
>  	/* Get STB DRAM address */
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> @@ -910,7 +940,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	/* Clear msg_port for other SMU operation */
>  	dev->msg_port = 0;
>  
> -	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>  	if (!dev->stb_virt_addr)
>  		return -ENOMEM;
>  

