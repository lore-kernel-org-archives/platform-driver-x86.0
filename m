Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451C3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 15:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24B73610A0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 15:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237820AbhJ0Piv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 11:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45374 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232502AbhJ0Piv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 11:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635348985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VHcIhRKwULKvDv/DBM98fVgAjnOoi61ssh1fRKvqEc0=;
        b=J62A/lhZ4k9pPqLa5tUB8EHptep+e64SLhxgNNYoK0bkgpavyrp7TLrzj+vUsHE2rsnP7a
        u2VRsYYSnRaUHrX+OaREmGlHjO0B6ZU/d1sKVNF151DL1Ne+pi9+cYo9KTW9xeoLOJPdo/
        OlZmH63XFidy0e6Elu7+4Imz8LR3IY8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-qXQogPu5PBy6QJamwr2ZWg-1; Wed, 27 Oct 2021 11:36:23 -0400
X-MC-Unique: qXQogPu5PBy6QJamwr2ZWg-1
Received: by mail-ed1-f72.google.com with SMTP id m16-20020a056402431000b003dd2005af01so2706753edc.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 08:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VHcIhRKwULKvDv/DBM98fVgAjnOoi61ssh1fRKvqEc0=;
        b=zpADIfSgSZZaVM5XbNmym0mzc7Ajtg06m83sD2HpyT0Yza3Mq1Er2uvqa7UtCPKN9h
         ewbsILYul3xw5bnedJmeTUD9K1ujs8DqpdtPObUjgJsd912a29d07VuN7zD+coBx5rHo
         rz4wNmdjUe8H8s4waNlkBldHYwOgAuTIE5Z2NjJBomyLQUMnNMyTwrSHfYD2Ew9K2RvX
         bUXVLBcZ5S75We1oyPfknyshPLNHiMTUttIqCpJRKeZ4wCoXY0RO70rE5l+G/x32Z6hL
         yMwtYoyaF5Dv7KwnuspKMWp79QkD52dgHsfzXyF4Pc7DOxVY7czd1zNxsHPm1dSH4Dnn
         4VFA==
X-Gm-Message-State: AOAM533zPvqApmmSGaIUdesaFqkUC9nvK5UfZyoMlJdslhRKTcixEyh7
        rnXlo3t723GegNQqDbJGNH2m+7VDkkkgj05UuhMXEUlHHr4LvR5GLAxA/YqasvjR7w9NNSvIHhg
        JyNyLWdj1gZwAcXVq7Cd4cnuxEkqO9Hd2mw==
X-Received: by 2002:a17:907:94cb:: with SMTP id dn11mr19836704ejc.481.1635348981912;
        Wed, 27 Oct 2021 08:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUs2UQ1KSDN+kqRziYlCSSKKerly+AmuPpnZorDbDsNOgkeknEsNTmiKGlXBhRNyIuheL/RQ==
X-Received: by 2002:a17:907:94cb:: with SMTP id dn11mr19836665ejc.481.1635348981629;
        Wed, 27 Oct 2021 08:36:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o10sm227081edj.79.2021.10.27.08.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 08:36:20 -0700 (PDT)
Message-ID: <b0206df1-533c-057c-84c1-fb61eccf72e9@redhat.com>
Date:   Wed, 27 Oct 2021 17:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20211026184045.2201-1-Sanket.Goswami@amd.com>
 <20211026184045.2201-4-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211026184045.2201-4-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/21 20:40, Sanket Goswami wrote:
> STB (Smart Trace Buffer), is a debug trace buffer which is used to help
> isolate failures by analyzing the last feature that a system was running
> before hitting a failure. This nonintrusive way is always running in the
> background and trace is stored into the SoC.
> 
> This patch provides mechanism to access the STB buffer using the read
> and write routines.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v4:
> - Use kzalloc() for memory allocation.
> 
> Changes in v3:
> - Address review comments from Mark Gross.
> 
> Changes in v2:
> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
> - Address review comments from Hans.
> 
>  drivers/platform/x86/amd-pmc.c | 122 +++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 50cb65e38d11..e55c48f675e1 100644
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
> @@ -176,6 +189,53 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
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
> +	if (rc)
> +		goto out;

goto err? I believe you don't want to kfree the buffer
on success.

> +
> +	filp->private_data = buf;

And add a:

	return 0;

Here so that you don't fall-through to out and
free the buffer.

> +
> +out:
> +	kfree(buf);
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

With the changes suggested above this refferences already free-ed mem.

> +}
> +
> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);

And this is a double free !

> +	filp->private_data = NULL;
> +
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
> @@ -289,6 +349,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
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
> @@ -488,6 +552,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "suspend failed\n");
>  
> +	if (enable_stb)
> +		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> +
>  	return rc;
>  }
>  
> @@ -508,6 +575,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
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
> @@ -524,6 +595,57 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +	int rc;
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
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +{
> +	int i, err;
> +	u32 value;
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
> +		*buf++ = value;
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

