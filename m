Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A173CEB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 15:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbjGNPtQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235841AbjGNPtP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 11:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E628E30F8
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689349711;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KuBI4Hxp72xNemjys3KmdMcpVgNEh08ilYSo+MrOi+I=;
        b=S3Knft1HuGMXnHXRtlSS2FApAyd+7p8e0zt9o1XTfuZqagH+HAQdsOQTQB20EmOLlhmhpT
        WbY9EdCccyDZTxCisOcY+EvTNgMVwtdN6xDkSZoyBuWWe0S1F3NjchhOYPzLW1185qmM1Y
        WzyReh7It1YBrMUQXKFVyWxaA3CRgkQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-SosW9DTOOrGizb41UwKFJQ-1; Fri, 14 Jul 2023 11:48:29 -0400
X-MC-Unique: SosW9DTOOrGizb41UwKFJQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b6fbef3087so20686601fa.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 08:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689349708; x=1691941708;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuBI4Hxp72xNemjys3KmdMcpVgNEh08ilYSo+MrOi+I=;
        b=I8MspQHJiY6V7H1bE6vLrNUgZbPAoHx4KCscA6wlPXC6DXoE/GnzwrqcCQewauwDC3
         izXqxW4l2iUHwBaqIKFajmWGP/6m7UNWtWVjCxM2vuPOZHTiKToe/DcZCnamVGeGcCt/
         o2AE5mvbflwbQcuUmtgcJi3kmCh+Yt7QKu+QWxez6CZHJeJsyI1dx0VujWbnnIYgEEhG
         mKhaMofeQBUbFsIUTKjm2Zkw9ZiV2JPcKb/jnLu8vErzpZXo6GPfOvJOSqCvdoUSXjgh
         aO9WGnqYMbSd9AjxQtgHaLjf4MS4ENDhyauK4X7v6I0FtPdCn/Klw9YDoKkgjU9U0qkj
         rCGQ==
X-Gm-Message-State: ABy/qLbSaAVfnPGbUgVsY04kmZIzmEj9VbKXFE8uIjNOMM4YReNZZM8h
        UjpSyqxSQIn8HBqY6UDEo+JcjGr7C3EUtu2JfTBw7KIO4y2QeE97lzWylHZ+dyOBaVLl8xKI1ab
        GPM7STxuHuO+QYqIbUo/c+Yla8dVyhUtoKyj4ICMURQ==
X-Received: by 2002:a05:651c:108:b0:2b6:daa3:f0af with SMTP id a8-20020a05651c010800b002b6daa3f0afmr4285692ljb.25.1689349707424;
        Fri, 14 Jul 2023 08:48:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0oL16cZ4AlkFf0taRz+08E99eQQfU1vZns5d2jsxIwcRfFmY+hUtOgm5B52tYfFyCMea3fA==
X-Received: by 2002:a17:906:3497:b0:970:1b2d:45cc with SMTP id g23-20020a170906349700b009701b2d45ccmr4300412ejb.57.1689349682066;
        Fri, 14 Jul 2023 08:48:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o26-20020a170906289a00b0098f99048053sm5611213ejd.148.2023.07.14.08.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 08:48:01 -0700 (PDT)
Message-ID: <7eb38e45-2c98-03ef-2d1d-b146657f7928@redhat.com>
Date:   Fri, 14 Jul 2023 17:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] touchscreen_dmi.c : small changes for Archos 101 Cesium
 Educ tablet
Content-Language: en-US, nl
To:     Thomas GENTY <tomlohave@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20230714105117.192938-1-tomlohave@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230714105117.192938-1-tomlohave@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/14/23 12:51, Thomas GENTY wrote:
> It fixes axes and adds home button support as suggested by Hans de Goede
> 
> Signed-off-by: Thomas GENTY <tomlohave@gmail.com>

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
>  drivers/platform/x86/touchscreen_dmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index a5b687eed8f3..f9301a9382e7 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -27,11 +27,12 @@ struct ts_dmi_data {
>  /* NOTE: Please keep all entries sorted alphabetically */
>  
>  static const struct property_entry archos_101_cesium_educ_props[] = {
> -	PROPERTY_ENTRY_U32("touchscreen-size-x", 1280),
> -	PROPERTY_ENTRY_U32("touchscreen-size-y", 1850),
> -	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1850),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
>  	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>  	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
>  	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
>  	{ }
>  };

