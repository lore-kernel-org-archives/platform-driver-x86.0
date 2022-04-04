Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C07C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 14:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345102AbiDDO2k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 10:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377252AbiDDO2i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 10:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8C31D3EF34
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649082399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nO4Vsb15oR17Yzv04L9f4VYMb25RsLfbcFYd1ahx3m0=;
        b=iRA4tlUBzq1cV6NndWMEoQdNtO8gtPJcsLv5MFMjNlRfTgPpVDwTv/zcBBPsIXKF76FpOd
        RYUqSvz247lIQxVNfUsXx82dJfO27w4RB2/f1ugvmdzAwr/ILqoTruJunuw8L/wUKxGN5g
        5NTbK8w99SvmqORqcYKbeEyXPqvlUxE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-GWtyBqS0Pzu_l0RmVNYPAg-1; Mon, 04 Apr 2022 10:26:38 -0400
X-MC-Unique: GWtyBqS0Pzu_l0RmVNYPAg-1
Received: by mail-ej1-f71.google.com with SMTP id sg13-20020a170907a40d00b006e7e8234ae2so1510255ejc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 07:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nO4Vsb15oR17Yzv04L9f4VYMb25RsLfbcFYd1ahx3m0=;
        b=fZtvY0QNnZGUf6c5UW7bbt8d7EVx9YcAM8+60w0kcaRTUu1KzyDQtxCybvf2DXnc/0
         korjvYhf2J/SXXqAaAwoXDYr4rhwUFfC7QIlMr2ejtbt63dT7X1VC/q5vYGPFmd5VRoV
         ZtKx/qC3mPxFMtK0yKVEL+LLHYobwKsOi6yR/5NlBO/JmOFjMckLL2uG42p+P2vmr9nw
         wOYf+dJHc2XZv02GhqN7om43fa4m+oDuSRT+cI46dUoFgLp4zYhNm0WHGy3OvC+Y6Sb+
         Y7qUU06PXiKsJ7Vs99UBZUdxqbvvf/L8qq9/DEJyXkHYstvOWk/FEkPINAhql2lJzXMj
         0Fkw==
X-Gm-Message-State: AOAM531II30rrOaAgJH8MJ23lVYn6CKu/XKv+w2i7CstCBkjk5+4nFxk
        WKNyEWOssVn5rPA5tod3q4e2hkV1+TQL4439KzOpcB8YyXwbWTXAfYaDE26guZbZniKqOChgUOs
        +f6L9Nvz5+T+VeCzSRO5n468p5GZtfMETNg==
X-Received: by 2002:a50:f106:0:b0:41c:d793:3ae5 with SMTP id w6-20020a50f106000000b0041cd7933ae5mr333808edl.390.1649082397267;
        Mon, 04 Apr 2022 07:26:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyljtq4pzygt4R3P59RgJ5828Mv7qeS1R3m1LHCn4LtDi/3+FrL6uXXUpPPYvl+mY5k3F+EcA==
X-Received: by 2002:a50:f106:0:b0:41c:d793:3ae5 with SMTP id w6-20020a50f106000000b0041cd7933ae5mr333787edl.390.1649082397042;
        Mon, 04 Apr 2022 07:26:37 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i11-20020a50fd0b000000b0041936bc0f7esm5425888eds.52.2022.04.04.07.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 07:26:36 -0700 (PDT)
Message-ID: <69d9995d-5a47-8ad5-82c6-945e2ed0e775@redhat.com>
Date:   Mon, 4 Apr 2022 16:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Fix compilation without
 CONFIG_SUSPEND
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20220402231122.3877-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220402231122.3877-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/3/22 01:11, Mario Limonciello wrote:
> Since commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the
> suspend process") amd-pmc doesn't use traditional suspend resume
> callback anymore but relies on functions only created declared when
> CONFIG_SUSPEND is set.
> 
> Check for CONFIG_SUSPEND and only use those functions in those
> circumstances.
> 
> Fixes: commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the suspend process")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> v1->v2:
>  * Fix warnings on unused stuff when no CONFIG_SUSPEND too.
> 
>  drivers/platform/x86/amd-pmc.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index e9d0dbbb2887..fa4123dbdf7f 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -160,8 +160,10 @@ MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>  
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> -static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> +#ifdef CONFIG_SUSPEND
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +#endif
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -325,6 +327,7 @@ static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SUSPEND
>  static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
>  {
>  	struct smu_metrics table;
> @@ -338,6 +341,7 @@ static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
>  		dev_dbg(pdev->dev, "Last suspend in deepest state for %lluus\n",
>  			 table.timein_s0i3_lastcapture);
>  }
> +#endif
>  
>  #ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
> @@ -569,6 +573,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>  	return rc;
>  }
>  
> +#ifdef CONFIG_SUSPEND
>  static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>  {
>  	switch (dev->cpu_id) {
> @@ -694,6 +699,7 @@ static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
>  	.prepare = amd_pmc_s2idle_prepare,
>  	.restore = amd_pmc_s2idle_restore,
>  };
> +#endif
>  
>  static const struct pci_device_id pmc_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
> @@ -733,6 +739,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SUSPEND
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  {
>  	int err;
> @@ -753,6 +760,7 @@ static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  
>  	return 0;
>  }
> +#endif
>  
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>  {
> @@ -859,9 +867,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	amd_pmc_get_smu_version(dev);
>  	platform_set_drvdata(pdev, dev);
> +#ifdef CONFIG_SUSPEND
>  	err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
>  	if (err)
>  		dev_warn(dev->dev, "failed to register LPS0 sleep handler, expect increased power consumption\n");
> +#endif
>  
>  	amd_pmc_dbgfs_register(dev);
>  	return 0;
> @@ -875,7 +885,9 @@ static int amd_pmc_remove(struct platform_device *pdev)
>  {
>  	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
>  
> +#ifdef CONFIG_SUSPEND
>  	acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
> +#endif
>  	amd_pmc_dbgfs_unregister(dev);
>  	pci_dev_put(dev->rdev);
>  	mutex_destroy(&dev->lock);

