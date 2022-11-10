Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AFFC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 21:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiKJVJl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 16:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiKJVJk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 16:09:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F2920F7F
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668114528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rt4kniXmvDtyRf2XxhyuEkQ/wRffXIwXWkCIC4bhcac=;
        b=Livm4LllA7aW/GU/JrmWVPnQNs+ZGlKp87MqfZ+LHL3VAfhahcXoY/RBrSqb4AMOzwyJxW
        Zlw3n8qdRVf2HMBlSDT087NnBJPEUo/GMrvYth1bDFyZlUtZ75GvRhrj4bM3CPCOthZSAy
        z3QFN0ygCbevIAjMHk4AeNb+G5b7h4s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-354-tNsu4G5fPOiSZ2DmeagWaw-1; Thu, 10 Nov 2022 16:08:47 -0500
X-MC-Unique: tNsu4G5fPOiSZ2DmeagWaw-1
Received: by mail-ed1-f71.google.com with SMTP id v18-20020a056402349200b004622e273bbbso2287179edc.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rt4kniXmvDtyRf2XxhyuEkQ/wRffXIwXWkCIC4bhcac=;
        b=otBHkHQZ8nY5ePaWnR7loKlySBlkLFBR46gKDxeaDjzotViK6IW8Ec5ByUQ8THEVb9
         FeTbiWVwHXdoniof0WQqHbO7as/QQuvig2tCvS5iRNTNZn7IuuG9y3piFmQbmqyA8hO6
         /x2GsnxlOdEBgaH1CYYJd99LjsxV2kfFXAUY6vTu2Pi5cnupMpS3unbU/+HFNj348lJf
         wbqSGhBLC4hhVTgFi7tJeOFTMj+v3XDv0llJe9nnCUAE6dsjyAiU8IertWrR3RZCw+hV
         ailvfCsf883h5JCCVO1SqVeypAIj/L5+W1sEHLbc82sylxyBMteQvzcsTsOkuYhmgt7e
         vDTw==
X-Gm-Message-State: ACrzQf1NaVUmJiVWahTrVj3luUUN1aSZjVtByirx+KRDWn2LnALm2E3N
        SEPsFj6zcBvGG5KHu1QxFz5U9hcOVc9ieypMlBpEhpYJdT6DRCqLu46o/P4AXrP3QAX4aWf7n8S
        4bHwu6XOg8UffClvj0YoExzbb4iHxteUhwg==
X-Received: by 2002:a17:906:d7a5:b0:7ad:7e81:1409 with SMTP id pk5-20020a170906d7a500b007ad7e811409mr3872978ejb.326.1668114526143;
        Thu, 10 Nov 2022 13:08:46 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5R9MGIA6iINe9cVuByJdambLMksBfYDG46S2j2yR2NF9TYXZxTkjdIpN/wYA2angbORWct/g==
X-Received: by 2002:a17:906:d7a5:b0:7ad:7e81:1409 with SMTP id pk5-20020a170906d7a500b007ad7e811409mr3872954ejb.326.1668114525900;
        Thu, 10 Nov 2022 13:08:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i4-20020a170906698400b007ae9c7b3c45sm130639ejr.99.2022.11.10.13.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 13:08:45 -0800 (PST)
Message-ID: <64d4dd57-24b3-4397-8704-cc8f156b5012@redhat.com>
Date:   Thu, 10 Nov 2022 22:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 08/14] platform/x86/intel/ifs: Add metadata support
Content-Language: en-US, nl
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, ashok.raj@intel.com,
        tony.luck@intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        ravi.v.shankar@intel.com, thiago.macieira@intel.com,
        athenas.jimenez.gonzalez@intel.com, sohil.mehta@intel.com
References: <20221021203413.1220137-1-jithu.joseph@intel.com>
 <20221107225323.2733518-1-jithu.joseph@intel.com>
 <20221107225323.2733518-9-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221107225323.2733518-9-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/22 23:53, Jithu Joseph wrote:
> From: Ashok Raj <ashok.raj@intel.com>
> 
> One of the existing reserved fields in microcode header has been
> allocated to indicate the size for metadata structures.
> 
> The metadata section within microcode header is as shown below:
> 
>     Microcode Format
>    +----------------------+  Base
>    |Header Version        |
>    +----------------------+
>    |Update revision       |
>    +----------------------+
>    |Date DDMMYYYY         |
>    +----------------------+
>    |Sig                   |
>    +----------------------+
>    |Checksum              |
>    +----------------------+
>    |Loader Version        |
>    +----------------------+
>    |Processor Flags       |
>    +----------------------+
>    |Data Size             |
>    +----------------------+
>    |Total Size            |
>    +----------------------+
>    |Meta Size             |
>    +----------------------+
>    |Reserved              |
>    +----------------------+
>    |Reserved              |
>    +----------------------+  Base+48
>    |                      |
>    |                      |
>    |                      |
>    |                      |
>    |    Microcode         |
>    |                      |
>    |     Data             |
>    |                      |
>    |                      |
>    +----------------------+  Base+48+data_size-
>    |                      |     meta_size
>    |   Meta Data          |
>    |   structure(s)       |
>    |                      |
>    +----------------------+  Base+48+data_size
>    |   Extended Signature |
>    |        Table         |
>    |                      |
>    |                      |
>    |                      |
>    |                      |
>    |                      |
>    +----------------------+  Base+total_size
> 
> Add an accessor function which will return a pointer to the
> start of a specific meta_type being queried.
> 
> In subsequent patches, IFS test image file (which reuse microcode header
> format) will make use of metadata section.
> 
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/ifs/load.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
> index 89ce265887ea..60ba5a057f91 100644
> --- a/drivers/platform/x86/intel/ifs/load.c
> +++ b/drivers/platform/x86/intel/ifs/load.c
> @@ -44,6 +44,38 @@ static const char * const scan_authentication_status[] = {
>  	[2] = "Chunk authentication error. The hash of chunk did not match expected value"
>  };
>  
> +#define META_TYPE_END		(0)
> +
> +struct metadata_header {
> +	unsigned int		type;
> +	unsigned int		blk_size;
> +};
> +
> +static struct metadata_header *ifs_find_meta_data(void *ucode, unsigned int meta_type)
> +{
> +	struct metadata_header *meta_header;
> +	unsigned long data_size, total_meta;
> +	unsigned long meta_size = 0;
> +
> +	data_size = get_datasize(ucode);
> +	total_meta = ((struct microcode_intel *)ucode)->hdr.metasize;
> +
> +	if (!total_meta)
> +		return NULL;
> +
> +	meta_header = (ucode + MC_HEADER_SIZE + data_size) - total_meta;
> +
> +	while ((meta_header->type != META_TYPE_END) && meta_header->blk_size &&
> +	       meta_size < total_meta) {
> +		meta_size += meta_header->blk_size;
> +		if (meta_header->type == meta_type)
> +			return meta_header;
> +
> +		meta_header = (void *)meta_header + meta_header->blk_size;
> +	}
> +	return NULL;
> +}
> +
>  /*
>   * To copy scan hashes and authenticate test chunks, the initiating cpu must point
>   * to the EDX:EAX to the test image in linear address.

