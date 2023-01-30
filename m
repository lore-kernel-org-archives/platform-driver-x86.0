Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C823C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 14:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237816AbjA3OoE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 09:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjA3OoD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 09:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E0EC178
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675089796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FI4AbVViycfbursdUDVf47Vk3SUbFsC0GWnVaXYrHVg=;
        b=JxlRwgT02alnnxSqwIFA/RITP8PZ7hThj2lPf+RsVGbAefKV1MjW+MR2AfrH6CLnznK3zg
        JPHdso3qvV+GrC4Mk81RSp1ADRrIYHobx/a91Sqm5C5WQ1JXOsG7qef8xvlj6o1TqAkGZn
        Qg5PjfWBsGBfNzOUXBpCcIfK08DCge8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-WioYcFWcPiKJqvVOqp5Enw-1; Mon, 30 Jan 2023 09:43:14 -0500
X-MC-Unique: WioYcFWcPiKJqvVOqp5Enw-1
Received: by mail-ed1-f70.google.com with SMTP id m12-20020a056402430c00b0049e4ac58509so8367812edc.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FI4AbVViycfbursdUDVf47Vk3SUbFsC0GWnVaXYrHVg=;
        b=jlIBapljbMT0Lqw55lqrm8z7BX5lWG1YkdWpnkIws4swfHU1LxWJviSMaDeixYMw9H
         m7poAP+VXub+W0bz/kDXAM8il/OohDG3GJC46t82ImLi3pfkErWDUDK03FZFaYFCbZ3m
         fElL5BK6gjKBMUwHYnH7d5/Tjm/zIXqVo50v6UEen8orsNIhV0oeqiuAPsBaGR9lU7Cf
         2pFy3UHjIQypBwS4jkQ2bXk/FkMvkgKOJYlq3H7ugIBHRxLVIRlheZwBZpMhMXQZd0z5
         UxZsmOBz4vTMGRiTl4tT6iomliQE6lZNMDbHL4HxDeB9HYL/d/QNHO1l3Ei741/p2USA
         nWrw==
X-Gm-Message-State: AO0yUKUhAfH3n/qT9z/XrdImhF/dm90sw6lKz9i+/m/36trSw6Yh/p/h
        g16qOtDbklKgtHOyDrCRcwKpWtjcHzJchQvvUDi4YvY5PsOfBTQkiXxKAXVO8gKCYg+ByF254pM
        Nqs4O9iTAgoomOA8EBgkYaf7UIEJGjm+yUQ==
X-Received: by 2002:a05:6402:14d4:b0:4a2:1d3e:93c7 with SMTP id f20-20020a05640214d400b004a21d3e93c7mr10411272edx.13.1675089793076;
        Mon, 30 Jan 2023 06:43:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/RG2Q9TcIuQXlbro0QbWMI/SIebBloiOv7if0NAPblh43akYGmV4K2uWhcklEMJDEhFJqlzw==
X-Received: by 2002:a05:6402:14d4:b0:4a2:1d3e:93c7 with SMTP id f20-20020a05640214d400b004a21d3e93c7mr10411262edx.13.1675089792896;
        Mon, 30 Jan 2023 06:43:12 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bq21-20020a056402215500b0046c7c3755a7sm6865981edb.17.2023.01.30.06.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 06:43:12 -0800 (PST)
Message-ID: <b87bdfcd-8096-5590-0411-6d4c827ef8be@redhat.com>
Date:   Mon, 30 Jan 2023 15:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] platform/x86/amd: pmc: differentiate STB/SMU
 messaging prints
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-4-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230125113127.3862898-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/23 12:31, Shyam Sundar S K wrote:
> Modify the dynamic debug print to differentiate between the regular
> and spill to DRAM usage of the SMU message port.
> 
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 0dd9fb576f09..467b80ad01a1 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -592,13 +592,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  	}
>  
>  	value = amd_pmc_reg_read(dev, response);
> -	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
> +	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
>  
>  	value = amd_pmc_reg_read(dev, argument);
> -	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
> +	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", dev->msg_port ? "S2D" : "PMC", value);
>  
>  	value = amd_pmc_reg_read(dev, message);
> -	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
> +	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
>  }
>  
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)

