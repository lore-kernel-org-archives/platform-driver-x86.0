Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952BAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Mar 2022 15:24:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbiCHPZT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiCHPZS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 10:25:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08E92473B1
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646753061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NLK1TLy6cekXv585hOIZVnzIsZx+71BAsYDU2BfUhvM=;
        b=CjZOv1hrMTYzMRkEvuo8+rckKoI672xNuIEKYABG1CwdPvD2E6mxaul4sURvsmv5IJVR3n
        fyD5E7FEs4XmG8C04xnGU9OrQpQnqJAfdY+rLzJgytgsfJzCWYbTIiyBvEOjY9IKBk1myJ
        Sq+uAN4TkT/SDmJapCzhW5YpgmwTWOM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-vYdBCKAkNPemz-KqHuaoHw-1; Tue, 08 Mar 2022 10:24:19 -0500
X-MC-Unique: vYdBCKAkNPemz-KqHuaoHw-1
Received: by mail-ed1-f71.google.com with SMTP id u28-20020a50d51c000000b004159ffb8f24so10807661edi.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Mar 2022 07:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NLK1TLy6cekXv585hOIZVnzIsZx+71BAsYDU2BfUhvM=;
        b=SGUQc/CKC/XVoO2zT2W1jITDC2P3jr7zfzWBZWw+5t22Cye7VSUX3zD4WhhIIPdBhY
         dD0+IeKFsiRFxZYBeby3K3g/ayRR0oGEDE8PdiBnM/hqBKPztl+jWwRoQEzPp0f9+Pxw
         +kDFceFfgzLiE93c/rqXaNUXjM+4JdyeessQxCp8d1Cn3JQqioxolBpeINz6bogjFMEN
         vc+LiAv5CJSCjbns6Fb/HWFxIwJjSqot/A4Mwr21jRoLQSzo/Cj/+PUspbsaK0xliZcw
         qNQq1cV1CVHxaktI9lUtCKMlVCd5x0M6CnsOOMvjP61ufKvBvSwkNoO6G+sOQYt1NSWj
         hHYQ==
X-Gm-Message-State: AOAM532uNi8I03o6jEjzDhMcg5vv7HRiyGgr60gmKBYNP7kxm8h7obvP
        hhtatZ9LGMqEg6/79JjNIjoPKUpAG4/HxO0ZzALFFQqI5qBOkMfEn1vqrPWVg/JAziy7K4KgLsf
        XKGA0tfu2c+lj8mXJwE6MsRgdpJiRQ4BdHw==
X-Received: by 2002:a17:907:94c6:b0:6da:9561:ce0 with SMTP id dn6-20020a17090794c600b006da95610ce0mr13291514ejc.342.1646753058754;
        Tue, 08 Mar 2022 07:24:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUjdmgCBJrV6Nhjld2XTJ4wXc0rctI3JiXX0AyXuueBVvyLYJhWNOSri7JO+HDw4edSL21Qw==
X-Received: by 2002:a17:907:94c6:b0:6da:9561:ce0 with SMTP id dn6-20020a17090794c600b006da95610ce0mr13291486ejc.342.1646753058324;
        Tue, 08 Mar 2022 07:24:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id k19-20020a1709062a5300b006c75a94c587sm6090845eje.65.2022.03.08.07.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 07:24:17 -0800 (PST)
Message-ID: <4d997aff-38cc-f986-2b37-34e5429f40c9@redhat.com>
Date:   Tue, 8 Mar 2022 16:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: amd-pmc: uninitialized variable in
 amd_pmc_s2d_init()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220307141832.GA19660@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220307141832.GA19660@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/7/22 15:18, Dan Carpenter wrote:
> The "size" variable can be uninitialized if amd_pmc_send_cmd() fails.
> 
> Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/x86/amd-pmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 425a86108f75..fc0b4d628dec 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -708,8 +708,9 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  
>  static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  {
> -	u32 size, phys_addr_low, phys_addr_hi;
> +	u32 phys_addr_low, phys_addr_hi;
>  	u64 stb_phys_addr;
> +	u32 size = 0;
>  
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;

