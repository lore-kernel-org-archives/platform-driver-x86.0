Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5440AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 13:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbiBQNIh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 08:08:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237406AbiBQNIh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 08:08:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 779422AB52F
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645103300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TwJXYewjiTzKE1u7DcdnmI/jtQ5kcWqNciiL9ekFvNE=;
        b=Fl7r0My/RJDftl8p+tBw+ex7tvccCVzXEyV8rfGOTeLuC+J0b+WnTTTeVZvO6391RJKx6z
        yT11wPqwdLDXOya2rpREbQegnYgwOTPDjXpWQEBUjoexPvJfqI8eK3Ji+hYNGcFFx+50+e
        drNh0YcXVgG6J+WdsO7/VWXSs8VmWmI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-2v7uCq9LOCuvXH_7AHTVNg-1; Thu, 17 Feb 2022 08:08:19 -0500
X-MC-Unique: 2v7uCq9LOCuvXH_7AHTVNg-1
Received: by mail-ed1-f71.google.com with SMTP id m11-20020a056402430b00b00410678d119eso3452410edc.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 05:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TwJXYewjiTzKE1u7DcdnmI/jtQ5kcWqNciiL9ekFvNE=;
        b=mLP91FPTt91TWciE83yc8fuMQTmvxqh1NWDL3UOEXkDePm4eSe6RNp9xIQvfbLnHZV
         JgZvB9qjKbppupI1SYSQXwLyNNzvm537Exp6+19UYg6eobtUDmR96QnUPvKp/dHAy5qA
         MxcjPgTraZhmVJaKJCI1jD577PHxMzQ8eRLSpIMNYbdR2Zf2S+WKOZecTy4vTx7Sh7IS
         ch2gMEsXTduRKc/VyO+HAmGzlPGbo1Bx6DEPG6t677b6mi4j3KzwUTAB2TMFKd/DWnGS
         4Z3/JL2QtcN9UsdVt5X088ZQs8L16QZAXwctMvuZBnlzILk9Gh+gy4UntrZTSJzB4IX9
         TCPw==
X-Gm-Message-State: AOAM532eGU/b+i84vQGkq0H8lxOSlyBzCqx729ZHgguiC6uwiFklqVgm
        FbSYBS2r4sn1kQNZx8J7l7XJwMFXGg91Jar0YMqPYgdttil1QV3XxOB+ktlVbf3FhaTIKrEFLPq
        No3fg/0keVtGs1QUAk2y1p7/LAmYpvd4EtA==
X-Received: by 2002:aa7:da51:0:b0:410:84fd:613a with SMTP id w17-20020aa7da51000000b0041084fd613amr2437753eds.390.1645103297576;
        Thu, 17 Feb 2022 05:08:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvZZnOgB38oXHSm3kpdG6ZB8Ixo80bE6wWk35hgytNFTHmqBfUeb/B9Qjew6UOmYvCv7fgSQ==
X-Received: by 2002:aa7:da51:0:b0:410:84fd:613a with SMTP id w17-20020aa7da51000000b0041084fd613amr2437704eds.390.1645103297082;
        Thu, 17 Feb 2022 05:08:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id y21sm1136030ejq.185.2022.02.17.05.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 05:08:16 -0800 (PST)
Message-ID: <896494a9-7af7-f54f-d678-17203527c624@redhat.com>
Date:   Thu, 17 Feb 2022 14:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Add support for AMD Spill to
 DRAM STB feature
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220204122527.3873552-1-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220204122527.3873552-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/22 13:25, Sanket Goswami wrote:
> Spill to DRAM functionality is a feature that allows STB (Smart Trace
> Buffer) to spill data from SRAM into DRAM on some future AMD ASICs. The
> size allocated for STB is more than the earlier SoC's which helps to
> collect more tracing and telemetry data.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v2:
> - Create separate routine amd_pmc_s2d_init() and move the S2D initialization logic there.
> - Handle the msg_port flag accordingly so that OS_HINT goes to PMC message port.

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



> 
>  drivers/platform/x86/amd-pmc.c | 144 +++++++++++++++++++++++++++++----
>  1 file changed, 130 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 4c72ba68b315..69fdbb0d9f45 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -41,6 +41,16 @@
>  #define AMD_PMC_STB_PMI_0		0x03E30600
>  #define AMD_PMC_STB_PREDEF		0xC6000001
>  
> +/* STB S2D(Spill to DRAM) has different message port offset */
> +#define STB_SPILL_TO_DRAM		0xBE
> +#define AMD_S2D_REGISTER_MESSAGE	0xA20
> +#define AMD_S2D_REGISTER_RESPONSE	0xA80
> +#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> +
> +/* STB Spill to DRAM Parameters */
> +#define S2D_TELEMETRY_BYTES_MAX		0x100000
> +#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> +
>  /* Base address of SMU for mapping physical address to virtual address */
>  #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
>  #define AMD_PMC_SMU_INDEX_DATA		0xBC
> @@ -95,6 +105,12 @@ enum amd_pmc_def {
>  	MSG_OS_HINT_RN,
>  };
>  
> +enum s2d_arg {
> +	S2D_TELEMETRY_SIZE = 0x01,
> +	S2D_PHYS_ADDR_LOW,
> +	S2D_PHYS_ADDR_HIGH,
> +};
> +
>  struct amd_pmc_bit_map {
>  	const char *name;
>  	u32 bit_mask;
> @@ -119,7 +135,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  struct amd_pmc_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> +	void __iomem *stb_virt_addr;
>  	void __iomem *fch_virt_addr;
> +	bool msg_port;
>  	u32 base_addr;
>  	u32 cpu_id;
>  	u32 active_ips;
> @@ -236,6 +254,44 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  	.release = amd_pmc_stb_debugfs_release,
>  };
>  
> +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 *buf;
> +
> +	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
> +	filp->private_data = buf;
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> +					   loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> +					S2D_TELEMETRY_BYTES_MAX);
> +}
> +
> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open_v2,
> +	.read = amd_pmc_stb_debugfs_read_v2,
> +	.release = amd_pmc_stb_debugfs_release_v2,
> +};
> +
>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  				 struct seq_file *s)
>  {
> @@ -350,9 +406,14 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>  			    &amd_pmc_idlemask_fops);
>  	/* Enable STB only when the module_param is set */
> -	if (enable_stb)
> -		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -				    &amd_pmc_stb_debugfs_fops);
> +	if (enable_stb) {
> +		if (dev->cpu_id == AMD_CPU_ID_YC)
> +			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +					    &amd_pmc_stb_debugfs_fops_v2);
> +		else
> +			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +					    &amd_pmc_stb_debugfs_fops);
> +	}
>  }
>  #else
>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> @@ -392,26 +453,47 @@ static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>  
>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  {
> -	u32 value;
> +	u32 value, message, argument, response;
> +
> +	if (dev->msg_port) {
> +		message = AMD_S2D_REGISTER_MESSAGE;
> +		argument = AMD_S2D_REGISTER_ARGUMENT;
> +		response = AMD_S2D_REGISTER_RESPONSE;
> +	} else {
> +		message = AMD_PMC_REGISTER_MESSAGE;
> +		argument = AMD_PMC_REGISTER_ARGUMENT;
> +		response = AMD_PMC_REGISTER_RESPONSE;
> +	}
>  
> -	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
> +	value = amd_pmc_reg_read(dev, response);
>  	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
>  
> -	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +	value = amd_pmc_reg_read(dev, argument);
>  	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
>  
> -	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
> +	value = amd_pmc_reg_read(dev, message);
>  	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
>  }
>  
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
>  {
>  	int rc;
> -	u32 val;
> +	u32 val, message, argument, response;
>  
>  	mutex_lock(&dev->lock);
> +
> +	if (dev->msg_port) {
> +		message = AMD_S2D_REGISTER_MESSAGE;
> +		argument = AMD_S2D_REGISTER_ARGUMENT;
> +		response = AMD_S2D_REGISTER_RESPONSE;
> +	} else {
> +		message = AMD_PMC_REGISTER_MESSAGE;
> +		argument = AMD_PMC_REGISTER_ARGUMENT;
> +		response = AMD_PMC_REGISTER_RESPONSE;
> +	}
> +
>  	/* Wait until we get a valid response */
> -	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +	rc = readx_poll_timeout(ioread32, dev->regbase + response,
>  				val, val != 0, PMC_MSG_DELAY_MIN_US,
>  				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>  	if (rc) {
> @@ -420,16 +502,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>  	}
>  
>  	/* Write zero to response register */
> -	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
> +	amd_pmc_reg_write(dev, response, 0);
>  
>  	/* Write argument into response register */
> -	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
> +	amd_pmc_reg_write(dev, argument, arg);
>  
>  	/* Write message ID to message ID register */
> -	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> +	amd_pmc_reg_write(dev, message, msg);
>  
>  	/* Wait until we get a valid response */
> -	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +	rc = readx_poll_timeout(ioread32, dev->regbase + response,
>  				val, val != 0, PMC_MSG_DELAY_MIN_US,
>  				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>  	if (rc) {
> @@ -442,7 +524,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>  		if (ret) {
>  			/* PMFW may take longer time to return back the data */
>  			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
> -			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +			*data = amd_pmc_reg_read(dev, argument);
>  		}
>  		break;
>  	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
> @@ -601,6 +683,34 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> +static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> +{
> +	u32 size, phys_addr_low, phys_addr_hi;
> +	u64 stb_phys_addr;
> +
> +	/* Spill to DRAM feature uses separate SMU message port */
> +	dev->msg_port = 1;
> +
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
> +	if (size != S2D_TELEMETRY_BYTES_MAX)
> +		return -EIO;
> +
> +	/* Get STB DRAM address */
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> +
> +	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> +
> +	/* Clear msg_port for other SMU operation */
> +	dev->msg_port = 0;
> +
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
> +	if (!dev->stb_virt_addr)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  {
>  	int err;
> @@ -719,6 +829,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	if (err)
>  		dev_err(dev->dev, "SMU debugging info not supported on this platform\n");
>  
> +	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
> +		err = amd_pmc_s2d_init(dev);
> +		if (err)
> +			return err;
> +	}
> +
>  	amd_pmc_get_smu_version(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmc_dbgfs_register(dev);
> 

