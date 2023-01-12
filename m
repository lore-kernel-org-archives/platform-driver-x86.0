Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C94C61DB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjALTRM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240252AbjALTQn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 14:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA7558337
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 11:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673550306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x9oBega5Sph1st/mXi3WO8B1H9BUTQ8Ui3g3n+U1VVY=;
        b=YItJofMiLF1828G2xUT34Zm4U4fWxaTmnwB5TNB/zEnqq3wt8A57ny8kqmXmySbc4CKGQW
        PzgH4z5Qb4PDj8w7MC1QCujkvz3/PSl/3ezY8HIkl4uLeCYdGbLU44Cm2yYfyh7/UaIDiZ
        rnvdB+fIk7rwdsRPON3TOKCXiZ7BAtg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-qrM6zrBRMlqQZSktM-4n6g-1; Thu, 12 Jan 2023 14:05:05 -0500
X-MC-Unique: qrM6zrBRMlqQZSktM-4n6g-1
Received: by mail-ed1-f71.google.com with SMTP id z3-20020a05640235c300b0048ed61c1394so12950409edc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 11:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9oBega5Sph1st/mXi3WO8B1H9BUTQ8Ui3g3n+U1VVY=;
        b=VUs9YDGuy9BoVKlbmWkcwyw1O3RTrdyEB6PBSM65hsjnRcCC4uV0whP1CQRSzxExyn
         XAARi3LpFZFZ9HhoOMLt73jQxtrZc34DgKQ4IOPy8fvsAE64ablgEb78P+k51hzJW/aj
         +g/pleEDwJYAOJCWCeIcWhEPVg9Xdnr7Z4AcLNvJAeoOgABEVbTIBHEim0MsRgllQwWJ
         QDbDeVIGqGHF2ZPFgLy0bOniLwS+c+3nVMx9rQBNRzGxozzUAoM+nNQTZL31u1qWC4eH
         aQzsMWkq890Sol8jlYDPLrlDZ2C5pu/w1oU0FxdaUqsS5B67idg0w8qCmOY+3GDYq1O6
         4QsQ==
X-Gm-Message-State: AFqh2kr35QSrfr150ydZ23DxxXVtCcaV7wtPPpKfLNwI0ZazD8alsTb/
        Bql0ERRulcbygx4jRx4/EEcFyqF9nSVrTn8amOzCnVxNXFCs6kwgZ1zx7kdTUoDbXXQzp1gOGF/
        Hs9ONLSNUHo8Rqf0jNhN5WwPdwru6MHTCNQ==
X-Received: by 2002:a17:907:a802:b0:84d:430a:5e5c with SMTP id vo2-20020a170907a80200b0084d430a5e5cmr18298876ejc.32.1673550304606;
        Thu, 12 Jan 2023 11:05:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXulu9RP740rsg0+nbBN9s2zM92cTC0wGiIRVMtxxayqDWIEPBPLkKHUBX5ueeGSu7SPvXC1ng==
X-Received: by 2002:a17:907:a802:b0:84d:430a:5e5c with SMTP id vo2-20020a170907a80200b0084d430a5e5cmr18298858ejc.32.1673550304428;
        Thu, 12 Jan 2023 11:05:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p5-20020a17090653c500b007ae32daf4b9sm7752623ejo.106.2023.01.12.11.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 11:05:03 -0800 (PST)
Message-ID: <c4842482-7be0-0042-b476-0f21125c79c2@redhat.com>
Date:   Thu, 12 Jan 2023 20:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86/amd: Fix refcount leak in amd_pmc_probe
Content-Language: en-US, nl
To:     Miaoqian Lin <linmq006@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Gross <markgross@kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221229072534.1381432-1-linmq006@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221229072534.1381432-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/29/22 08:25, Miaoqian Lin wrote:
> pci_get_domain_bus_and_slot() takes reference, the caller should release
> the reference by calling pci_dev_put() after use. Call pci_dev_put() in
> the error path to fix this.
> 
> Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 439d282aafd1..8d924986381b 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -932,7 +932,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
>  		err = amd_pmc_s2d_init(dev);
>  		if (err)
> -			return err;
> +			goto err_pci_dev_put;
>  	}
>  
>  	platform_set_drvdata(pdev, dev);

