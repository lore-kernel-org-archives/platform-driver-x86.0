Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2D4C0015E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jun 2023 12:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjFOMkD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Jun 2023 08:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245029AbjFOMkC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jun 2023 08:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE442110
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jun 2023 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686832757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mmc8Ck1KZ4R9DlYnilDnSEU0pLAKRoigq9cruYYQA/o=;
        b=chp8fuFx9nTWzWOsOUHmbOAmZJoo/UpQoG78nHFaP/fwjpXz5QzH9U1i4RvhauZlPAY5Mn
        bppTU7jesFLqi3TRlQw2HymHr6oxO0O0gtllRJ6f0RKqmEMj5Lq8xDe/8wInkzvmIrkgNc
        xbCPR6Jjx+Gc0NmODxZJ8rw9IupBmOQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-7qmf_k2LOdmzmMhLV0L_Kg-1; Thu, 15 Jun 2023 08:39:15 -0400
X-MC-Unique: 7qmf_k2LOdmzmMhLV0L_Kg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98277fac2a1so143198266b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jun 2023 05:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686832754; x=1689424754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmc8Ck1KZ4R9DlYnilDnSEU0pLAKRoigq9cruYYQA/o=;
        b=bhWrAHjys8JlGsRBwiCSB5s7Umkob23/ngNQBePuTJqZfeSTre1Oee6v1wYKzf0ud9
         DoOXdfWZThzJnK2Lu2F22/fG6aFzXH4LSu7r/H7YgopxkPzAXEQMeysQfKd5exWCmit3
         FeGNDhDXHsuekVzzpd2QMkaH6ctOdDhzbP8cXVqFqCxCJY2+IZFpez7eZ44PBsaKEw+p
         SumgBy5fLOJPESj/wDLcrnpe0AzVUd4S9dLonnKYc6SVgipXV+6wVj3JrkwiQVe3Ceyk
         8Jhn5kf6iiRrvuQEFmI+Dp/aoMtC67R2+6mieAakWM5pI3Aq50jql7co+AoAN9+u1peG
         zQJw==
X-Gm-Message-State: AC+VfDyzXB2XaqyiJs47GBMz1DcLC+RMxdE6mMlQMpm0+i4pnvMm2E2o
        QWodMlxlHdPgabqRHWqD8N0LhN9u9r62uPFqwEvpIfKIt2oQrCV8ym1jCUqHfMFTQjDEZGGjMBM
        6G8Nxy7VO87lpOeIGNbfhb53EFqQ+aoKZIg==
X-Received: by 2002:a17:907:25c4:b0:94f:250b:2536 with SMTP id ae4-20020a17090725c400b0094f250b2536mr18895896ejc.28.1686832753883;
        Thu, 15 Jun 2023 05:39:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ODhxLRSqIoM4pF+MPEyxi7vHBGJThemb+HbIkSCbRLXTqcqPHXwd41AD7IWcDiDLk3Y/sag==
X-Received: by 2002:a17:907:25c4:b0:94f:250b:2536 with SMTP id ae4-20020a17090725c400b0094f250b2536mr18895889ejc.28.1686832753717;
        Thu, 15 Jun 2023 05:39:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a21-20020a1709066d5500b00978897577c6sm9253027ejt.44.2023.06.15.05.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:39:12 -0700 (PDT)
Message-ID: <aba1cfd5-e78c-ccbf-b8be-d4e668c5a589@redhat.com>
Date:   Thu, 15 Jun 2023 14:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] platform/x86: apple-gmux: don't use be32_to_cpu and
 cpu_to_be32
Content-Language: en-US, nl
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20230614064931.3263-2-orlandoch.dev@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230614064931.3263-2-orlandoch.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/14/23 08:49, Orlando Chamberlain wrote:
> Sparce doesn't seem to like using be32_to_cpu and cpu_to_be32 to convert
> values for the MMIO gmux to/from the host architecture.
> 
> Instead use iowrite32be and ioread32be to always convert, which should be
> fine because apple-gmux is only used on x86 with is always little endian.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305161712.5l3f4iI4-lkp@intel.com/
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>

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



> ---
>  drivers/platform/x86/apple-gmux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index e02b4aea4f1e..cadbb557a108 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -278,7 +278,7 @@ static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
>  	iowrite8(GMUX_MMIO_READ | sizeof(val),
>  		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>  	gmux_mmio_wait(gmux_data);
> -	val = be32_to_cpu(ioread32(gmux_data->iomem_base));
> +	val = ioread32be(gmux_data->iomem_base);
>  	mutex_unlock(&gmux_data->index_lock);
>  
>  	return val;
> @@ -288,7 +288,7 @@ static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
>  			       u32 val)
>  {
>  	mutex_lock(&gmux_data->index_lock);
> -	iowrite32(cpu_to_be32(val), gmux_data->iomem_base);
> +	iowrite32be(val, gmux_data->iomem_base);
>  	iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
>  	iowrite8(GMUX_MMIO_WRITE | sizeof(val),
>  		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);

