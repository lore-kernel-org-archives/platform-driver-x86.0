Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E21DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  3 Apr 2022 03:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbiDCDVr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Apr 2022 23:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbiDCDVp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Apr 2022 23:21:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41BA2CE3D
        for <platform-driver-x86@vger.kernel.org>; Sat,  2 Apr 2022 20:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=CW/xUtGjIUCQTV+ry77E3dQokqRTFDANq7tcPx4TYYQ=; b=ZY2mxTE6a2F/RqdBJhax/vhtTr
        k+w/AJXkoRTPn6bSikDr3957SINhqs3YuPTYJcmnZSnoa9u1c0FU4bLriF8z+TX9Xf9UY4dX0xHIK
        QTQTs+B61Osp/VSL9FyU4BLNltVyQrKqAp6P1a0tYQt0Xn99qz2EmcbAnNuIsKwu1waRnUfgBCKo1
        xLKM9KPFOEp9YvHk5G0gwY8Sk27vbsQBeepDR0omRIbbMol3Xp4ZR+70klfJELLYdneiBPuvFRrnW
        yp6pBrW9kLD3gh06a2Uhq04yASdG0mymLLput2qO1l40v6z1kUQECoqJaibIsBtOhjXUtUf6IVvfY
        qhCg6kyw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1naqmI-004c2u-5a; Sun, 03 Apr 2022 03:19:46 +0000
Message-ID: <2f0d1997-57a8-af17-df26-deef36a35c10@infradead.org>
Date:   Sat, 2 Apr 2022 20:19:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Fix compilation without
 CONFIG_SUSPEND
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>
References: <20220402231122.3877-1-mario.limonciello@amd.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220402231122.3877-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 4/2/22 16:11, Mario Limonciello wrote:
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

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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

-- 
~Randy
