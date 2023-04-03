Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FBFC761A6
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Apr 2023 09:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjDCJpn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Apr 2023 05:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbjDCJp2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2023 05:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC6E12074
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Apr 2023 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680514978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wbgfORNhHrhwM8eHcoJrwIWuSveaLiQVkMK0P8wkdCs=;
        b=eYTH5gdrcVXfCy5DNRlAbp4JjQmp5wsqLjxyvbbal516IymYeXagLc5dlungfibBzwzStZ
        suM17A6B0NWDoOXTlcRiFFcmPD6LE3wz0AvmjcqohrF7z+xoTbEhl1zeEb74DahZfFRJsP
        6X0zLAV6z2Fvewi7IR+Pbzcct/0fQJA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-E3f5scyBOuiGf-8ie1aM6Q-1; Mon, 03 Apr 2023 05:42:56 -0400
X-MC-Unique: E3f5scyBOuiGf-8ie1aM6Q-1
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a05640242d600b004f5962985f4so40929350edc.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Apr 2023 02:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbgfORNhHrhwM8eHcoJrwIWuSveaLiQVkMK0P8wkdCs=;
        b=d8idO+h3L3WNXHrvFO7deBHyUH4O898Gt5zYn51ktX9Br883gGGafttyLjep8MFogG
         U5QSK5Yn4EaQQ4nwlzuXClHDFEEklZiXWhH+ghf5k2OQvQqkYNHP2k5YtSFL4NqPjbhs
         lwYBWrDf689BhfKJ8SQcu1T3yJ4lOXPIzHh5Pw7gUsoeemcEaFL2mvVrE8Xs8gPvkn7g
         HbF/QaLLeuko7oeuYRGmO2XgMqUBk3lbdk/4AHIAgG/SbHsDg96zP2+Yie5AOkgydPEI
         szzXuD9m0H6bN76BF+H0JmIp4CH7DeFopn/5vpkO/+OuonjVoKiWY/+y0H6AN4yvQm8N
         dDKw==
X-Gm-Message-State: AAQBX9eUGekRbh883EuFzXjPrOHYNIIUeyjyFHzLNobeRkbMHLjR6XYg
        dqPvrV12vFMpA5uvqG526QBkQ8Roj81OwWvQv3bqrxeciyzy58yJ4Nh+qOUR8hit4vvZmza7UCC
        a+5ckjsvLzkv/s18bu9AW46f794oNdd4VoA==
X-Received: by 2002:a17:906:184d:b0:8b1:e791:faef with SMTP id w13-20020a170906184d00b008b1e791faefmr33434955eje.67.1680514975103;
        Mon, 03 Apr 2023 02:42:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YiB+CyE2+PTiiwWDlEnWL0Ll3R5B0+Pm3CPW7Z9fTj+Cyu2Ukiug94IlhF6BNFJuyVrXr/Zg==
X-Received: by 2002:a17:906:184d:b0:8b1:e791:faef with SMTP id w13-20020a170906184d00b008b1e791faefmr33434939eje.67.1680514974863;
        Mon, 03 Apr 2023 02:42:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bv20-20020a170906b1d400b009447277c2aasm4301001ejb.39.2023.04.03.02.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:42:54 -0700 (PDT)
Message-ID: <bb977bc7-70bc-9e21-a376-76f1b863d866@redhat.com>
Date:   Mon, 3 Apr 2023 11:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] platform/x86: think-lmi: Fix memory leak when showing
 current settings
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markpearson@lenovo.com,
        mirsad.todorovac@alu.unizg.hr
Cc:     markgross@kernel.org, thomas@t-8ch.de, gregkh@linuxfoundation.org,
        rafael@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230331213319.41040-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230331213319.41040-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/31/23 23:33, Armin Wolf wrote:
> When retriving a item string with tlmi_setting(), the result has to be
> freed using kfree(). In current_value_show() however, malformed
> item strings are not freed, causing a memory leak.
> Fix this by eliminating the early return responsible for this.
> 
> Reported-by: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
> Link: https://lore.kernel.org/platform-driver-x86/01e920bc-5882-ba0c-dd15-868bf0eca0b8@alu.unizg.hr/T/#t
> Tested-by: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
> Fixes: 0fdf10e5fc96 ("platform/x86: think-lmi: Split current_value to reflect only the value")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

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
> Changes in v3:
> - Fix Fixes: tag
> - Add Tested-by: tag
> Changes in v2:
> - Add Reported-by: and Link: tags
> ---
>  drivers/platform/x86/think-lmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index cc66f7cbccf2..8cafb9d4016c 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -930,10 +930,12 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
>  	/* validate and split from `item,value` -> `value` */
>  	value = strpbrk(item, ",");
>  	if (!value || value == item || !strlen(value + 1))
> -		return -EINVAL;
> +		ret = -EINVAL;
> +	else
> +		ret = sysfs_emit(buf, "%s\n", value + 1);
> 
> -	ret = sysfs_emit(buf, "%s\n", value + 1);
>  	kfree(item);
> +
>  	return ret;
>  }
> 
> --
> 2.30.2
> 

