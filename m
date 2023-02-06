Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C04C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 12:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjBFMKv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjBFMKo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 07:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80797DA1
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675685345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RNssBosRYCGO4BAEKn380+4FcaMW75hDr7zMfIWFaW4=;
        b=Ov2CVW6bE98foAvInOttzcfuAvUECg+gXR2xR1XFH+ROaThAQA/T9EXqRAzSgquuNeF7oy
        DHv6y/whkdRA+3dVAj3jhzYzGdDSTsLora4LQI0lCPXzYULthIZJSBXxHRCDQB/KFnbLQp
        8Dm+OFLb15rJT2K0FRwSR656GRzvo2c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-vPboMGBUPdy2x5CsTx903g-1; Mon, 06 Feb 2023 07:09:04 -0500
X-MC-Unique: vPboMGBUPdy2x5CsTx903g-1
Received: by mail-ej1-f71.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso8517286ejb.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Feb 2023 04:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNssBosRYCGO4BAEKn380+4FcaMW75hDr7zMfIWFaW4=;
        b=5xBX1q/0Qh582kyX6DlOn+BAw4pA020iJqDL1KYRUFallT6rs2i4J6D/nbzEpEg/k3
         kRHQovsSPmoMKzvMKIwRNknmdJFBomj4cHn4y1PMWiWmEeTMMDY4t9xwFw388z8GNhOU
         RpGPxzpHQTfUk9LqsCQCeAWZVhGW4RkjPGDUdg6Bw6WV4JyZi8H4Vn/RFgDi26z4uecL
         iiq6t/a6XU5znpaaeHXXYRuxWqs0JICWM1NYJjtyxXzSotv1Cxw2E7pXf4rDB0flrmCG
         cz/z9DEXE2225rhMWsg1HnrjEjmQJP6bcyb36lvqbpjd5WNKlExk9reZc5tBVfFxNcqD
         0uAA==
X-Gm-Message-State: AO0yUKVaC+cMtjw349K1XNxiX34dffB6eIMIyXBnE3GLA+IWfww7Wmva
        hsl5crNdsSxWBatlu2C3wkV1A79VdsBG3Ub5gVldKmlpYGjEFhIPWnFUS7BHM7gvuaJHmYSMS5/
        am9R37ZwIX8YbDP2PKdRncNCot0qdt4+95g==
X-Received: by 2002:a17:906:8559:b0:884:fd73:8053 with SMTP id h25-20020a170906855900b00884fd738053mr18427254ejy.9.1675685342196;
        Mon, 06 Feb 2023 04:09:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9x/t6dx0zhHW1esd5BdKM363d8gQvuRhF/YzNRK79BTGTAXcZmpn6rXJqzX5OrMZB/WhNmRg==
X-Received: by 2002:a17:906:8559:b0:884:fd73:8053 with SMTP id h25-20020a170906855900b00884fd738053mr18427244ejy.9.1675685341995;
        Mon, 06 Feb 2023 04:09:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv21-20020a170906f11500b0086dd8f20a6asm5397562ejb.77.2023.02.06.04.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:09:01 -0800 (PST)
Message-ID: <9d743107-477a-7af9-153d-f27d2b1f994e@redhat.com>
Date:   Mon, 6 Feb 2023 13:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] platform/x86/amd: pmc: Add num_samples message id
 support to STB
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
 <20230130164855.168437-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230130164855.168437-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/30/23 17:48, Shyam Sundar S K wrote:
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
>  drivers/platform/x86/amd/pmc.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 3cbb01ec10e3..b0f98a201a81 100644
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
> @@ -246,13 +247,36 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
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

You are not clearing dev->msg_port on amd_pmc_send_cmd() errors here
which seems wrong ?  (sorry for not catching this before)  How about:

	/* Get the num_samples to calculate the last push location */
	dev->msg_port = 1;
	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
	dev->msg_port = 0;
	if (ret) {
		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
		return ret;
	}

?

Regards,

Hans





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
> +	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>  	filp->private_data = buf;
>  
>  	return 0;

