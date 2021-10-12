Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD59AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 20:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 972C261074
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 20:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhJLUGl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Oct 2021 16:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28175 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232145AbhJLUGl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Oct 2021 16:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634069078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0dpSGRDww9ricx9bES3jW6uVXByxPHjl5ILX4/10Jbs=;
        b=IGj0hHLjxc4TKdGLtHIp0Hm626hvbRhM2cN0pURGeVW/W/+VtjFDxhbjRnv0Ocmf9i7hON
        +eObYG2st+gK7Px9IaKg1NnmAScLyoOl+DK+kiaRd7qyYedgYRzGWWZMIzghy17U5RWC8C
        1YPEqnycWdqxg/SHhfNMdlAlIyi+av8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-As4well7Oi6hqICwQP-rCg-1; Tue, 12 Oct 2021 16:04:37 -0400
X-MC-Unique: As4well7Oi6hqICwQP-rCg-1
Received: by mail-ed1-f72.google.com with SMTP id 14-20020a508e4e000000b003d84544f33eso233630edx.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Oct 2021 13:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0dpSGRDww9ricx9bES3jW6uVXByxPHjl5ILX4/10Jbs=;
        b=CAiBcNlA9rwHYlWNZq6TTMPBI585kW6obamR3kq87+cXHKkNxLw4C+k/WtzMPPCDpu
         nb62mfKMbnUNtA8WCoS0tqDcEHdMMXWAal1poMQLmGBtXgbi2mFxg2A+gTjlApMg3HbX
         Z3/5XntYiUT/1ISV9dx7G9kCH0v2vuhUGENzI0Hq82XFwqb4x4sTP2eY+I0RVfvo+IOj
         IXTvuj0YaYc00S7RZGmBPU2reze4kyrSP9titjw6rqjgDSurl2igjgJRErfwROxUVvVf
         59laqQogX3cwKgri+B6l/N3hsI9nGKNTiWR1HpkFOVnkZ44E3qOXsfp//1JY+Qy20Og7
         Cdqw==
X-Gm-Message-State: AOAM532rVp8L1uOrt1hUV4SJ2lAm9OcUaPP4KjPhbINONH7RT0H4LhCp
        d+Mn30eiUaAsTOjwuiIgdnEs7kwoxutn2R2MrPWtEyJnwFBcWfIF82Hsju6OWMQa991cjqrSZGZ
        aR0wRhk2IdyUri+7KJ4KrqBBmkczJIaCyIg==
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr2687396edd.190.1634069075904;
        Tue, 12 Oct 2021 13:04:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGf7mY578KTT5/9okw9Q+ZCLs0F8YMHtDVIThmIfqWN0PPknQuEduaMs/n6kJMmpEG/1VEyw==
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr2687361edd.190.1634069075695;
        Tue, 12 Oct 2021 13:04:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ck9sm5349569ejb.56.2021.10.12.13.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 13:04:35 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Add support for AMD Smart Trace
 Buffer
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211005155641.2308-1-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c3b14cec-63df-1fa6-cf6d-493a0ee716de@redhat.com>
Date:   Tue, 12 Oct 2021 22:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211005155641.2308-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/5/21 5:56 PM, Sanket Goswami wrote:
> STB (Smart Trace Buffer), is a debug trace buffer which is used to help
> isolate failures by analyzing the last feature that a system was running
> before hitting a failure. This nonintrusive way is always running in the
> background and trace is stored into the SoC.
> 
> This patch provides mechanism to access the STB buffer using the read and
> write routines.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
>  drivers/platform/x86/amd-pmc.c | 110 +++++++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 7b44833290df..c853b22cad6a 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -33,6 +33,12 @@
>  #define AMD_PMC_SCRATCH_REG_CZN		0x94
>  #define AMD_PMC_SCRATCH_REG_YC		0xD14
>  
> +/* STB Registers */
> +#define AMD_PMC_STB_INDEX_ADDRESS	0xF8
> +#define AMD_PMC_STB_INDEX_DATA		0xFC
> +#define AMD_PMC_STB_PMI_0		0x03E30600
> +#define AMD_PMC_STB_PREDEF		0xC6000001
> +
>  /* Base address of SMU for mapping physical address to virtual address */
>  #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
>  #define AMD_PMC_SMU_INDEX_DATA		0xBC
> @@ -80,6 +86,7 @@
>  #define SOC_SUBSYSTEM_IP_MAX	12
>  #define DELAY_MIN_US		2000
>  #define DELAY_MAX_US		3000
> +#define FIFO_SIZE		4096
>  enum amd_pmc_def {
>  	MSG_TEST = 0x01,
>  	MSG_OS_HINT_PCO,
> @@ -119,13 +126,21 @@ struct amd_pmc_dev {
>  	u16 minor;
>  	u16 rev;
>  	struct device *dev;
> +	struct pci_dev *rdev;
>  	struct mutex lock; /* generic mutex lock */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
>  #endif /* CONFIG_DEBUG_FS */
>  };
>  
> +static u32 stb_data[FIFO_SIZE];

Having a global buffer for this is a problem, see below.

> +static bool enable_stb;
> +module_param(enable_stb, bool, 0644);
> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> +
>  static struct amd_pmc_dev pmc;
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev);
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg, bool ret);
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
> @@ -254,6 +269,20 @@ static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(amd_pmc_idlemask);
>  
> +static int stb_read_show(struct seq_file *seq, void *unused)
> +{
> +	struct amd_pmc_dev *pdev = seq->private;
> +	int i;
> +
> +	amd_pmc_read_stb(pdev);
> +
> +	for (i = 0; i < FIFO_SIZE; i += 4)
> +		seq_hex_dump(seq, "", DUMP_PREFIX_NONE, 16, 1, &stb_data[i], 16, true);

This is racy if 2 different processes call stb_read_show() at the same time, then
the first reader may end up seq-hex-dumping stb_data from the second amd_pmc_read_stb()
call done by the second reader.

Please kmalloc a local FIFO_SIZE buffer here and pass that into amd_pmc_read_stb().

> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(stb_read);
> +
>  static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>  {
>  	debugfs_remove_recursive(dev->dbgfs_dir);
> @@ -268,6 +297,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &s0ix_stats_fops);
>  	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>  			    &amd_pmc_idlemask_fops);
> +	/* Enable STB only when the module_param is set */
> +	if (enable_stb)
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &stb_read_fops);
>  }
>  #else
>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> @@ -429,6 +462,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "suspend failed\n");
>  
> +	if (enable_stb)
> +		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> +
>  	return rc;
>  }
>  
> @@ -449,6 +485,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  	/* Dump the IdleMask to see the blockers */
>  	amd_pmc_idlemask_read(pdev, dev, NULL);
>  
> +	/* Write data incremented by 1 to distinguish in stb_read */
> +	if (enable_stb)
> +		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
> +
>  	return 0;
>  }
>  
> @@ -465,6 +505,76 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> +static int amd_pmc_get_root_port(struct amd_pmc_dev *dev)
> +{
> +	dev->rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +	if (!dev->rdev || !pci_match_id(pmc_pci_ids, dev->rdev)) {
> +		pci_dev_put(dev->rdev);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}

The exact same code already is part of amd_pmc_probe() please
replace this with:

1. Store the rdev gotten in amd_pmc_probe() inside struct amd_pmc_dev
2. Drop the pci_dev_put() call from this bit of amd_pmc_probe()
        base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
        pci_dev_put(rdev);
        base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
3. Add a "pci_dev_put(dev->rdev);" to amd_pmc_remove()

Note 3. should already have been done by this patch since
amd_pmc_get_root_port() stores a reference which is never
released in this patch.

> +
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +	int rc;
> +
> +	rc = amd_pmc_get_root_port(dev);
> +	if (rc)
> +		return rc;
> +
> +	rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +	if (rc) {
> +		dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_ADDRESS);
> +		pci_dev_put(dev->rdev);
> +		return pcibios_err_to_errno(rc);
> +	}
> +
> +	rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
> +	if (rc) {
> +		dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_DATA);
> +		pci_dev_put(dev->rdev);
> +		return pcibios_err_to_errno(rc);
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev)
> +{
> +	u32 cnt = 0, value;
> +	int i, err;
> +
> +	err = amd_pmc_get_root_port(dev);
> +	if (err)
> +		return err;
> +
> +	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +	if (err) {
> +		dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_ADDRESS);
> +		pci_dev_put(dev->rdev);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	for (i = 0; i < FIFO_SIZE; i++) {
> +		err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
> +		if (err) {
> +			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
> +				AMD_PMC_STB_INDEX_DATA);
> +			pci_dev_put(dev->rdev);
> +			return pcibios_err_to_errno(err);
> +		}
> +
> +		stb_data[cnt++] = value;
> +	}
> +
> +	return 0;
> +}
> +
>  static int amd_pmc_probe(struct platform_device *pdev)
>  {
>  	struct amd_pmc_dev *dev = &pmc;
> 

Regards,

Hans

