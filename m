Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B4AE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346526AbjJIOBG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346585AbjJIOBF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054BF91
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696860022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LDBSTWa+mJU5UiubbU+HvR/HKYvFWz38Y0DdV64uBm8=;
        b=KG/6eNL519Hf1AcSY5rAavEeZ56aLK8K9xbFUQ4/lYhaacSd1w+uJcTiCbJW+l7IQbN7CY
        1oH6CpG13Qu5HPAHEMGgDQdoinqPRc6jS0liQSq1PAYM9FSQxqTNbghE2OvXWm4XiiJnnN
        HbddfV8HGfFJrGf0Zk+MZUBOD1noYJM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-q9xS8QUTNsqi_NE_ek_GNQ-1; Mon, 09 Oct 2023 10:00:20 -0400
X-MC-Unique: q9xS8QUTNsqi_NE_ek_GNQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99388334de6so386233966b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 07:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860018; x=1697464818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDBSTWa+mJU5UiubbU+HvR/HKYvFWz38Y0DdV64uBm8=;
        b=xJEcnfX7eSkk9jyZkBMn409hsN9CkFbdVmcGfCZaUhLAYVbYCLl2IpKQM92wQ9AkSW
         4CX5PixaBzcLkGPIFGrVV6qOWX9gJnbXMm9nOtwipTXqzTa4RJb6YZVqs3SGBD+tW/kP
         70N5noaItfL06iOVqN5ZyBV3dhnfi3eOCeGOa74bcyqfiS65itUGDGWres89rHQbUp1v
         Iw0716zvxpkyCs4+rGgy3zifz6k+js6pp61CDNF3MjfGPg62j5ny2Kq65/fkJqbIDyY0
         ZAlm9jWCUI1kxeN9bdd5Db4d0dNP4Q0BUxScs4QAiTb7W7RZyRgDdx6S4sJeBNymR/rm
         BTnA==
X-Gm-Message-State: AOJu0YwTQYhqhFUcL5CVLVI6YTS3QR96HOaP5oRFGWZYjOkqRo3mTb09
        Ubdt5N6cv3glh/qzLacwq1mflEGHBzLRjfqLtnnAH+KGxEDqDKwOlk8ChrSeCBEWnoyEpdkv3yB
        PhIMMT/1F1oEUqG7oTPQTGlSiFhY+D/FraA==
X-Received: by 2002:a17:906:30cd:b0:9ad:e20f:142f with SMTP id b13-20020a17090630cd00b009ade20f142fmr13288572ejb.22.1696860018315;
        Mon, 09 Oct 2023 07:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF79+T17Lemf7ZpPzQdfcbtx9mZ4tseYcMIZsDW1tIJWZpSWfINjzqghlDvr5Fhc4TTsTmrqA==
X-Received: by 2002:a17:906:30cd:b0:9ad:e20f:142f with SMTP id b13-20020a17090630cd00b009ade20f142fmr13288556ejb.22.1696860017947;
        Mon, 09 Oct 2023 07:00:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h24-20020a1709063b5800b009b285351817sm6823277ejf.116.2023.10.09.07.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:00:17 -0700 (PDT)
Message-ID: <c0cfa05c-83f0-33fe-daa7-0486dd231616@redhat.com>
Date:   Mon, 9 Oct 2023 16:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/3] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009134307.21001-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231009134307.21001-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/23 15:43, Shyam Sundar S K wrote:
> Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
> be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
> a process holding open another fd. This could change "fsize" to a
> bigger size causing an out of bounds read.
> 
> Instead create a struct with a flexarray to solve this.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me now:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans






> ---
> v6:
> - Handle release buffer case as per Hans remarks
> - based on review-ilpo branch
> 
> v5:
> - new patch based on comments in v4 from Hans.
> - based on review-ilpo branch
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c92dd5077a16..fdc1e104c437 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -122,6 +122,11 @@ enum s2d_arg {
>  	S2D_DRAM_SIZE,
>  };
>  
> +struct amd_pmc_stb_v2_data {
> +	size_t size;
> +	u8 data[] __counted_by(size);
> +};
> +
>  struct amd_pmc_bit_map {
>  	const char *name;
>  	u32 bit_mask;
> @@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> +	struct amd_pmc_stb_v2_data *flex_arr;
>  	int ret;
>  
>  	/* Write dummy postcode while reading the STB buffer */
> @@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	if (ret)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
>  	/* Spill to DRAM num_samples uses separate SMU message port */
>  	dev->msg_port = 1;
>  
> @@ -264,10 +266,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 0;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> -		kfree(buf);
>  		return ret;
>  	}
>  
> +	fsize = (num_samples > S2D_TELEMETRY_BYTES_MAX) ? S2D_TELEMETRY_BYTES_MAX : num_samples;
> +	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
> +	if (!flex_arr)
> +		return -ENOMEM;
> +
> +	flex_arr->size = fsize;
> +
>  	/* Start capturing data from the last push location */
>  	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>  		fsize  = S2D_TELEMETRY_BYTES_MAX;
> @@ -277,8 +285,8 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  		stb_rdptr_offset = 0;
>  	}
>  
> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> -	filp->private_data = buf;
> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +	filp->private_data = flex_arr;
>  
>  	return 0;
>  }
> @@ -286,11 +294,9 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>  					   loff_t *pos)
>  {
> -	if (!filp->private_data)
> -		return -EINVAL;
> +	struct amd_pmc_stb_v2_data *data = filp->private_data;
>  
> -	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> -					S2D_TELEMETRY_BYTES_MAX);
> +	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
>  }
>  
>  static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)

