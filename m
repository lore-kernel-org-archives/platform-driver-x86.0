Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44C8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 17:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240559AbhLURsL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 12:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46199 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230248AbhLURsK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 12:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640108889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Nv2TRgI6VbZpHNnxt7ZzotA1fjT0L9eP3J+wDXBSkw=;
        b=Q4iG3yGGSkXUIBNDdWYpuNxtWoOCZavrYK/m/BaSYVgj/Pneaf6r6JyYwLvIbsyRx5qOb1
        CYq1OetiwPMDrsTTJBsCGFyJ5HGl9Khs89jAEIaRmXNUTTikaNrIljZ8i4Ohwap60MM+UB
        4rmhvXY8QnkdKH5YO5KFQzG4DSHLGmQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-aW-poGH8OvO2HTuVnZ5tZw-1; Tue, 21 Dec 2021 12:48:08 -0500
X-MC-Unique: aW-poGH8OvO2HTuVnZ5tZw-1
Received: by mail-ed1-f72.google.com with SMTP id z8-20020a056402274800b003f8580bfb99so5656007edd.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 09:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Nv2TRgI6VbZpHNnxt7ZzotA1fjT0L9eP3J+wDXBSkw=;
        b=p5MgZKn9vWm2aDWKcmi743mNT8ocAwuUH0whcKWdIjQy7W6dRPwHWj45EzO2l+l9j8
         he8vndvybuqYi6j1/KEwUIAmVau5oASkKUDAY25Frx3co21l//HungzSvBOcKPh/j8xX
         abqBTYymnRzhmeFV/kEZsN7BoAQG/2UP9G3DjKkg6S4XyC0l+GK5fJKQzW7AOlJcEn2K
         ZKcX7KPTaf8/JznZCNWQvi4LAK31odW0A6Vr+s4ZM4vLTuo921fXxSypqtnevNfl8PFA
         Z4wY/TCOrMQjhLtLaVdG0f5aNofsQVslbX2qdyR9nf/1LKcJNPFnV6WRrM9uuzTLzVAi
         ySKg==
X-Gm-Message-State: AOAM532/b3aX6Y3vcVycfLOpzzdPyMvtrKnd3BJvJcG9O5e+cAqDg8wJ
        XnuE/9azOYjw2/kSUI3uc0ERrL6ZrHXKL8tnMlCFLenYN/nD+4FuDT/5sXv6pXPGJeRLfSRoByJ
        jCiiFPTPJvVq3dQ/Yem4jaSLNM0Lgnn2FSA==
X-Received: by 2002:a17:906:31c2:: with SMTP id f2mr3681628ejf.341.1640108886973;
        Tue, 21 Dec 2021 09:48:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrY9La1vq62AJUmBdf9tQy5YdYyHPA/VgUjvhk8gN4nXOOCnLHNmrywMP28m9oHxWoPZbidw==
X-Received: by 2002:a17:906:31c2:: with SMTP id f2mr3681612ejf.341.1640108886733;
        Tue, 21 Dec 2021 09:48:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id sb13sm3306297ejc.26.2021.12.21.09.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 09:48:06 -0800 (PST)
Message-ID: <a7328ea3-3e69-6fec-7dc5-7a2126485518@redhat.com>
Date:   Tue, 21 Dec 2021 18:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 2/2] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20211130112318.92850-1-Sanket.Goswami@amd.com>
 <20211130112318.92850-3-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211130112318.92850-3-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/21 12:23, Sanket Goswami wrote:
> STB (Smart Trace Buffer), is a debug trace buffer that isolates the
> failures by analyzing the last running feature of a system. This
> non-intrusive way always runs in the background and stores the trace
> into the SoC.
> 
> This patch enables the STB feature by passing module param
> "enable_stb=1" while loading the driver and provides mechanism to
> access the STB buffer using the read and write routines.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v6:
> - Capture the read data directly into buf in amd_pmc_read_stb().
> 
> Changes in v5:
> - Use kfree() only once in .open as suggested by Hans.
> 
> Changes in v4:
> - Use kzalloc() for memory allocation.
> 
> Changes in v3:
> - Use sizeof(u32) with multiplier as suggested by Mark Gross.
> 
> Changes in v2:
> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
> - Address review comments from Hans.
> 
>  drivers/platform/x86/amd-pmc.c | 132 +++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b3b8a5daa02e..581cfd702082 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -35,6 +35,12 @@
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
> @@ -82,6 +88,7 @@
>  #define SOC_SUBSYSTEM_IP_MAX	12
>  #define DELAY_MIN_US		2000
>  #define DELAY_MAX_US		3000
> +#define FIFO_SIZE		4096
>  enum amd_pmc_def {
>  	MSG_TEST = 0x01,
>  	MSG_OS_HINT_PCO,
> @@ -128,8 +135,14 @@ struct amd_pmc_dev {
>  #endif /* CONFIG_DEBUG_FS */
>  };
>  
> +static bool enable_stb;
> +module_param(enable_stb, bool, 0644);
> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> +
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -176,6 +189,50 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>  	return 0;
>  }
>  
> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 size = FIFO_SIZE * sizeof(u32);
> +	u32 *buf;
> +	int rc;
> +
> +	buf = kzalloc(size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	rc = amd_pmc_read_stb(dev, buf);
> +	if (rc) {
> +		kfree(buf);
> +		return rc;
> +	}
> +
> +	filp->private_data = buf;
> +	return rc;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +					loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> +				       FIFO_SIZE * sizeof(u32));
> +}
> +
> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +const struct file_operations amd_pmc_stb_debugfs_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open,
> +	.read = amd_pmc_stb_debugfs_read,
> +	.release = amd_pmc_stb_debugfs_release,
> +};
> +
>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  				 struct seq_file *s)
>  {
> @@ -289,6 +346,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &s0ix_stats_fops);
>  	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>  			    &amd_pmc_idlemask_fops);
> +	/* Enable STB only when the module_param is set */
> +	if (enable_stb)
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops);
>  }
>  #else
>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> @@ -485,6 +546,13 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "suspend failed\n");
>  
> +	if (enable_stb)
> +		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> +	if (rc)	{
> +		dev_err(pdev->dev, "error writing to STB\n");
> +		return rc;
> +	}
> +
>  	return rc;
>  }
>  
> @@ -505,6 +573,14 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  	/* Dump the IdleMask to see the blockers */
>  	amd_pmc_idlemask_read(pdev, dev, NULL);
>  
> +	/* Write data incremented by 1 to distinguish in stb_read */
> +	if (enable_stb)
> +		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
> +	if (rc)	{
> +		dev_err(pdev->dev, "error writing to STB\n");
> +		return rc;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -521,6 +597,62 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +	int err;
> +
> +	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +	if (err) {
> +		dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_ADDRESS);
> +		err = pcibios_err_to_errno(err);
> +		goto err_pci_dev_put;

Since the code now no longer gets the rdev on-demand here, but instead uses
the rdev reference storied in dev->rdev, it should not call pci_put_dev here,
instead it should do:

		return pcibios_err_to_errno(err)

I've fixed this; and the 3 similar cases below (2 in amd_pmc_read_stb(); while
merging this series:


Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> +	}
> +
> +	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
> +	if (err) {
> +		dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_DATA);
> +		err = pcibios_err_to_errno(err);
> +		goto err_pci_dev_put;
> +	}
> +
> +	return 0;
> +
> +err_pci_dev_put:
> +	pci_dev_put(dev->rdev);
> +	return err;
> +}
> +
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +{
> +	int i, err;
> +
> +	err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +	if (err) {
> +		dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
> +			AMD_PMC_STB_INDEX_ADDRESS);
> +		err = pcibios_err_to_errno(err);
> +		goto err_pci_dev_put;
> +	}
> +
> +	for (i = 0; i < FIFO_SIZE; i++) {
> +		err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, buf++);
> +		if (err) {
> +			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
> +				AMD_PMC_STB_INDEX_DATA);
> +			err = pcibios_err_to_errno(err);
> +			goto err_pci_dev_put;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_pci_dev_put:
> +	pci_dev_put(dev->rdev);
> +	return err;
> +}
> +
>  static int amd_pmc_probe(struct platform_device *pdev)
>  {
>  	struct amd_pmc_dev *dev = &pmc;
> 

