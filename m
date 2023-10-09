Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA2AE95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 09:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345708AbjJIJwx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345863AbjJIJww (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 05:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CDDAB
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696845122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fNJF76e2LYdX8PRiUAkdrMRJ40U6448BHVm28PSIX+c=;
        b=YJIwtrvit3MtOGBuDHlpgTfTyF1cA6OmatxGS77rAcqxKgaaCsL3tprIJz6Ntp9Rg+W2tX
        0uqoBdPM8Vx78CLjho4x1zPx0JW+l6vgcuOY2Rmk6x35OPbmxPt9ZtSgUN9AYimhLLY8T9
        7ua3f+R1ARALSSzLHwboHNFO6J/Zqyg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-26j2vuAjPz6AB-_ivxkOWA-1; Mon, 09 Oct 2023 05:52:00 -0400
X-MC-Unique: 26j2vuAjPz6AB-_ivxkOWA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51da39aa6dcso3477796a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 02:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845119; x=1697449919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNJF76e2LYdX8PRiUAkdrMRJ40U6448BHVm28PSIX+c=;
        b=AncM3XgSFDVmxhgHyg6sn5xalxybVM4voCBeTqqioweiERGm2OyfiYT7FbCRtyaQdU
         ZsB4/m/EuqoIDWI0Cbf5FIwy2EDkPx1n5nddLjNO5kh/WTurfa6WEFagO68V/hN87yhJ
         8lNToatAVhuyzOc17B4rVBdfGvE5sm4Pb3j4h4Ro7dm+ZjO9pbCihIyN9BAIE1/k2CCu
         hJF5iScnhhMGDqWAMQQgSZTW5Pt82VQENATjT2GQqJQasn1UAJeCWlZRPqs00acVcDnT
         SM2/OvZEAM8zE04CNqBvpxlu5udsusHH1d00ozesJVYQzzHapb+QkGLPqRqeiA6I6zmj
         077w==
X-Gm-Message-State: AOJu0Ywl99dVKWSPY/geK5ce0n83HrMtIHx/gTZ9dIBOf9ipidx8jwOV
        F/ze0dBBHLuSF2VIcMhG//LNtQ9Kc/bwjRXhVIXagt4MJhCy1nSA+kojdGMWRH6Pcos/3GUvwEf
        nb6H3Lr0AtEDP6FlSG9oxkpDosy/57AIg9Q==
X-Received: by 2002:a17:907:75e2:b0:9ba:14a3:7218 with SMTP id jz2-20020a17090775e200b009ba14a37218mr3230756ejc.25.1696845119512;
        Mon, 09 Oct 2023 02:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwN5PbYgS2E3N3Caewld2Y0dYhazrKwiGlS0Mgc+GBEE/Fe5FQTZIxX2ejV7hujCo1lTU+6g==
X-Received: by 2002:a17:907:75e2:b0:9ba:14a3:7218 with SMTP id jz2-20020a17090775e200b009ba14a37218mr3230739ejc.25.1696845119181;
        Mon, 09 Oct 2023 02:51:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g7-20020a1709067c4700b0099c53c4407dsm6583986ejp.78.2023.10.09.02.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 02:51:58 -0700 (PDT)
Message-ID: <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
Date:   Mon, 9 Oct 2023 11:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/4] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 10/9/23 11:45, Shyam Sundar S K wrote:
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
> ---
> v5:
>  - new patch based on comments in v4 from Hans.
>  - based on review-ilpo branch
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c92dd5077a16..e00d69801369 100644
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
> @@ -264,7 +266,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 0;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> -		kfree(buf);
>  		return ret;
>  	}
>  
> @@ -277,8 +278,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  		stb_rdptr_offset = 0;
>  	}
>  
> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> -	filp->private_data = buf;
> +	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
> +	if (!flex_arr)
> +		return -ENOMEM;
> +
> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +	flex_arr->size = fsize;
> +	filp->private_data = flex_arr->data;
>  
>  	return 0;
>  }


You are not adjusting amd_pmc_stb_debugfs_read_v2() to match it will still
return S2D_TELEMETRY_BYTES_MAX, likely overflowing the array!

And it will now return the contents of the size_t prefixing the buffer to
userspace.

So this is obviously broken, nack.

Regards,

Hans


