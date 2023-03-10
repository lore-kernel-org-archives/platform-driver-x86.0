Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2340EC64EC4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 10:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjCJK2X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 05:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjCJK2W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 05:28:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C623A11053A
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 02:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678444055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jk9Ck+4BKQvY6fhI8v3CiIAM338T6KrWsRn8JyKBf58=;
        b=P/yBGCH/sWrAT+QVTPnsdp0iqsmpa/fLRW5gSgTDzDwb6/ZcrLxS9nYp6vy1ifbPqT9o0P
        y0BrNu/2t1OcYKcM7+DX6KsYiqF6LW/E9FkY97QNH8nV7Nxi5vfGrn+1k+cN9c/8d/YYnA
        ZH2h/Z5lZhNaFHFtUZQ17JyWMLGN6nU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ggsKNOe8PGq1UhNkvYjQ8Q-1; Fri, 10 Mar 2023 05:27:33 -0500
X-MC-Unique: ggsKNOe8PGq1UhNkvYjQ8Q-1
Received: by mail-ed1-f70.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso7116491edb.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 02:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678444052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk9Ck+4BKQvY6fhI8v3CiIAM338T6KrWsRn8JyKBf58=;
        b=4pQPrtequGE3NOz9bCAZVRB1mDfg4gg0RVh0It4JTt0ijXF7JDfhBkuNSvWxoCB/z8
         oEzO1wJQjtjYBTk6sSzv7lGleC1w82VjV4nvxRKQkbuSUSlUPgfO4Fhn/qgjW69rxNG0
         dcoeU4EYQ0VPAaVsJ/ZYrM57Bj2A3m/bQcgs0xRI1Ke21okx0JxEjDqr1g5X84k6zEGr
         a5cxKoXsCnAtuYCMP8TKUAUkkUoHu3XQkaHqiTtVu8j18h1WOBQQSlgTZP5RG+XkHwn9
         iNOsgf9LmBwL1s4v10qkgIU4QZJAjBTKHZJDSlqfwjtUqMVOyf8UW8tVl+5ILxwSwd7Q
         g3Dg==
X-Gm-Message-State: AO0yUKUzin2IZqfineOuZfxr01ov2ZGkl+zfNi1qQ8pnN3cIpvx2AoYB
        ra2Uq9FSNEwtjcODDemTJ2U+5frTZgSaoCQOsuqJdX6BVlfAltLxfyDDqPK/mhqDZ+xBFfFXcUC
        DLTlQ1J9nVA2DOsTsnALe1okX5Qt0JTdgLX1HV6tLDg==
X-Received: by 2002:a17:907:980b:b0:88c:4f0d:85af with SMTP id ji11-20020a170907980b00b0088c4f0d85afmr32161569ejc.75.1678444052409;
        Fri, 10 Mar 2023 02:27:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9eVz7NGxNw6QtIP8d7uTI0mrXfytL3b4U5B3fzyYy0crylIu7bmdP1GL0SWF3N/diy8t07tg==
X-Received: by 2002:a17:907:980b:b0:88c:4f0d:85af with SMTP id ji11-20020a170907980b00b0088c4f0d85afmr32161555ejc.75.1678444052166;
        Fri, 10 Mar 2023 02:27:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dt22-20020a170906b79600b008d47cd2edfbsm793046ejb.60.2023.03.10.02.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 02:27:31 -0800 (PST)
Message-ID: <543000de-7aae-3670-e7d5-2243bab01115@redhat.com>
Date:   Fri, 10 Mar 2023 11:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86/amd: pmc: decouple CONFIG_SUSPEND from AMD
 STB API usage
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org,
        Robert Swiecki <robert@swiecki.net>,
        Steven Rostedt <rostedt@goodmis.org>
References: <20230310095301.1596369-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230310095301.1596369-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 3/10/23 10:53, Shyam Sundar S K wrote:
> The initial introduction of AMD STB was limited to only suspend/resume
> use cases, but the need for STB APIs like amd_pmc_write_stb() have grown
> overtime and guarding it with CONFIG_SUSPEND seems to be incorrect.
> 
> Also, with the recent commit, it seems to create a build failure where
> CONFIG_SUSPEND is not enabled. Remove the association of CONFIG_SUSPEND
> with STB APIs altogether.
> 
> Cc: Sanket Goswami <Sanket.Goswami@amd.com>
> Fixes: b0d4bb973539 ("platform/x86/amd: pmc: Write dummy postcode into the STB DRAM")
> Reported-by: Robert Swiecki <robert@swiecki.net>
> Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t
> Reported-by: Steven Rostedt <rostedt@goodmis.org>
> Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

This is already fixed (in a nicer way) by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24efcdf03d85bb73df0ba99f69c8d238e7ada0e5

Regards,

Hans




> ---
>  drivers/platform/x86/amd/pmc.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index ab05b9ee6655..8db608e2c1ea 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -171,9 +171,7 @@ MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> -#ifdef CONFIG_SUSPEND
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> -#endif
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -905,7 +903,6 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_SUSPEND
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  {
>  	int err;
> @@ -926,7 +923,6 @@ static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  
>  	return 0;
>  }
> -#endif
>  
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>  {

