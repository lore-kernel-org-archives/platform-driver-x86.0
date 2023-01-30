Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87155C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 14:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbjA3OnZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 09:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjA3OnZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 09:43:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3962F1E1F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675089755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7jE09tRI+k28UPWt2b/89CzFHPXIgcVbuGyDxqMeY0=;
        b=L2HQoYhbDshctf4OxY2+PyEF450jMKjaUDwAkPStG/AIelfIQGGOuBpFoeh/i/KJ+GHVxZ
        xWaKt2skScwpUfFj9TwM2v0ms++kwffn/hi+VyGiltWj2tkBvbMSOR9uS/y8UDlroV/Pjo
        F5QDMOVLwIcQAFwpgRcaHcwAcEEfaa8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-plEh7AV9NwC1xhgHFuLWNg-1; Mon, 30 Jan 2023 09:42:33 -0500
X-MC-Unique: plEh7AV9NwC1xhgHFuLWNg-1
Received: by mail-ed1-f71.google.com with SMTP id c12-20020a05640227cc00b0049e2c079aabso8271431ede.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7jE09tRI+k28UPWt2b/89CzFHPXIgcVbuGyDxqMeY0=;
        b=SR+5OLLvDw83dEHEwAj8Detnn4FuuHDHLgKeMi4AUoaKrDk6bdrDGICVk6ELNLTvHf
         eJ0AeoZLKO/xmW4JY0L4MUEkXMW9JiVsrzrElofDHqji2fF63sYLWIv2GpPwaL6iesTF
         LjTdKK10JwbB8gqJJqe4uTGMMhg05NVtX5Lw2H1gwdrQm1l1l7z4MuoJFCB5QUWbzh9n
         gnsf/VRs7yWImKY1695W/aq4qiLvz1P+RdHlGojWlVLngM22qMV41Yzt72TWS97W8vrh
         GhIIJxlHVJj9Uk0iqYPXCwIHrObEkjqpXBr36Kiee3fGaROpA5cBdAOZNpfN6JMKDdLy
         ikZA==
X-Gm-Message-State: AO0yUKWAEsM8UBcxvtlBRLcNAtOYR0/NBXte4W+kUtRlq6jNH1U5xVtP
        c7/2uAiRJlADhD/LFmwd6qmtUaSvSdvbizHFQY/Qh1DFlWa7bAZRcpstPdgFhI8jjSTWSusaNZk
        +g+MHISP+Qs4SJmK5h1jpszs2++WhoHSVVw==
X-Received: by 2002:a17:906:f1cb:b0:878:78bc:975c with SMTP id gx11-20020a170906f1cb00b0087878bc975cmr15308759ejb.36.1675089752705;
        Mon, 30 Jan 2023 06:42:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9nkEggBC5dyxKOkQN4M17ePETGOPFr13pwmiqYUAnACms+eEGVoq5EyIDXeexHglwe1FKrGw==
X-Received: by 2002:a17:906:f1cb:b0:878:78bc:975c with SMTP id gx11-20020a170906f1cb00b0087878bc975cmr15308745ejb.36.1675089752475;
        Mon, 30 Jan 2023 06:42:32 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gj2-20020a170906e10200b008806a3c22c5sm4398975ejb.25.2023.01.30.06.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 06:42:31 -0800 (PST)
Message-ID: <1957447c-ac4a-8684-708f-9f6f2aa3a92e@redhat.com>
Date:   Mon, 30 Jan 2023 15:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] platform/x86/amd: pmc: Add num_samples message id
 support to STB
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230125113127.3862898-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/23 12:31, Shyam Sundar S K wrote:
> Recent PMFWs have the support for S2D_NUM_SAMPLES message ID that
> can tell the current number of samples present within the STB DRAM.
> 
> num_samples returned would let the driver know the start of the read
> from the last push location. This way, the driver would emit the
> top most region of the STB DRAM.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 3cbb01ec10e3..01632e6b7820 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -114,6 +114,7 @@ enum s2d_arg {
>  	S2D_TELEMETRY_SIZE = 0x01,
>  	S2D_PHYS_ADDR_LOW,
>  	S2D_PHYS_ADDR_HIGH,
> +	S2D_NUM_SAMPLES,
>  };
>  
>  struct amd_pmc_bit_map {
> @@ -246,13 +247,38 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 *buf;
> +	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
> +	int ret;
>  
>  	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
> +	/* Spill to DRAM num_samples uses separate SMU message port */
> +	dev->msg_port = 1;
> +
> +	/* Get the num_samples to calculate the last push location */
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
> +	if (ret) {
> +		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Clear msg_port for other SMU operation */
> +	dev->msg_port = 0;
> +
> +	/* Start capturing data from the last push location */
> +	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> +		fsize  = S2D_TELEMETRY_BYTES_MAX;
> +		stb_rdptr_offset = num_samples - fsize;
> +	} else {
> +		fsize = num_samples;
> +		stb_rdptr_offset = 0;
> +	}
> +
> +	dev->stb_virt_addr += stb_rdptr_offset;
> +	memcpy_fromio(buf, dev->stb_virt_addr, fsize);

This looks wrong, you are moving the pointer stored in the amd_pmc_dev
struct and subsequent uses of stb_virt_addr will now all use the moved
pointer...

I think that instead of these 2 lines you actually want:

	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);

Regards,

Hans




> +
>  	filp->private_data = buf;
>  
>  	return 0;

