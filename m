Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D08AC54EE9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 13:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbiIVN5j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiIVN5i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 09:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA8CF1D65
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663855054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/F0qe1lhItT1A+QcYyxTHDycUT0wDP1KvrB5Oq141AY=;
        b=au2IURPOfN79jpFnVU/ONQKzllA9Wuv44K5DhhKzLSWf93aK88vPyLwqub3zB+xHcHna7A
        3R/SBxfoWMC7Si3Gwzj8rIWG1DpXHYq0YqRjUqh2KjAceWeKZXCHAFO8DpbkWFXS2OqeYO
        jZeqdvXrVNCX3BnpQ8IRk91eKdpWyWU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-wQg9ED7GMcmyikNfr8ilqA-1; Thu, 22 Sep 2022 09:57:33 -0400
X-MC-Unique: wQg9ED7GMcmyikNfr8ilqA-1
Received: by mail-ed1-f71.google.com with SMTP id x5-20020a05640226c500b00451ec193793so6764742edd.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 06:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/F0qe1lhItT1A+QcYyxTHDycUT0wDP1KvrB5Oq141AY=;
        b=ya7x9zvzNFJKznoSPHRSn3FmJ3UIRqupcZ4A7pQ4TW8CpyZxDBMVsKXa1W78hkCmcC
         1RnWWFPfL2+Us90wekQsPmA9DMDyNsuxIHm68EmqJEjMTkO03CF6EUZjGRrImJBo2baA
         PZ9hMgNTu9Ch2G6jIyCJ0jwsUAIBtUdvNafFsCyDXhSCoFrxSQ/l3ro3Oxx+FpTuwxX+
         QiayLqdEH9MrkZTyg8TsaE5CUchsONbNYw/Gh+6JygiiSC3PAve8aNOKA+GnAtYbwym1
         POnctHEj6dLLYFPqAveiR9Ug+xdd6DD2PgQnl38SkIyeYrh90/7BOHQv0FSKvSh1gLdH
         GwxQ==
X-Gm-Message-State: ACrzQf30Euh+vVXqcT8oaGVTnTWbix7Qy5+8IPUgEQyZfnmqBJVRiehW
        wTosL+cUdMweu9sXTOu7yiBnlhj5b2G28urq60Eh16f0c0y88v6G5Ha/yDXELRX5+aNXDg7yoF/
        7kVeXaL3HHUZPSR21XQ7rpFuWtBCB/H3NgQ==
X-Received: by 2002:aa7:cada:0:b0:452:5b04:efd9 with SMTP id l26-20020aa7cada000000b004525b04efd9mr3435385edt.84.1663855052305;
        Thu, 22 Sep 2022 06:57:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49qWeDZP8dA2XXuveEm+WIRAT3ogxF0rDK3RDs+SUl20U3xJvkUDVGlBizM+8GdCjgH0OlTg==
X-Received: by 2002:aa7:cada:0:b0:452:5b04:efd9 with SMTP id l26-20020aa7cada000000b004525b04efd9mr3435373edt.84.1663855052124;
        Thu, 22 Sep 2022 06:57:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b0044629b54b00sm3692048eds.46.2022.09.22.06.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 06:57:31 -0700 (PDT)
Message-ID: <98f0ba5f-d702-c45a-c95b-0ae2320fb769@redhat.com>
Date:   Thu, 22 Sep 2022 15:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86: hp-wmi: Support touchpad on/off
Content-Language: en-US
To:     Daniel Houldsworth <dhould3@gmail.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220922115459.6511-1-dhould3@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220922115459.6511-1-dhould3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/22/22 13:54, Daniel Houldsworth wrote:
> Add scancodes reported by the touchpad on/off button. The actual disabling
> and enabling is done in hardware, and this just reports that change to
> userspace.
> 
> Signed-off-by: Daniel Houldsworth <dhould3@gmail.com>

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
>  drivers/platform/x86/hp-wmi.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index bc7020e9d..496c137d3 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -206,15 +206,17 @@ struct bios_rfkill2_state {
>  };
>  
>  static const struct key_entry hp_wmi_keymap[] = {
> -	{ KE_KEY, 0x02,   { KEY_BRIGHTNESSUP } },
> -	{ KE_KEY, 0x03,   { KEY_BRIGHTNESSDOWN } },
> -	{ KE_KEY, 0x20e6, { KEY_PROG1 } },
> -	{ KE_KEY, 0x20e8, { KEY_MEDIA } },
> -	{ KE_KEY, 0x2142, { KEY_MEDIA } },
> -	{ KE_KEY, 0x213b, { KEY_INFO } },
> -	{ KE_KEY, 0x2169, { KEY_ROTATE_DISPLAY } },
> -	{ KE_KEY, 0x216a, { KEY_SETUP } },
> -	{ KE_KEY, 0x231b, { KEY_HELP } },
> +	{ KE_KEY, 0x02,    { KEY_BRIGHTNESSUP } },
> +	{ KE_KEY, 0x03,    { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY, 0x20e6,  { KEY_PROG1 } },
> +	{ KE_KEY, 0x20e8,  { KEY_MEDIA } },
> +	{ KE_KEY, 0x2142,  { KEY_MEDIA } },
> +	{ KE_KEY, 0x213b,  { KEY_INFO } },
> +	{ KE_KEY, 0x2169,  { KEY_ROTATE_DISPLAY } },
> +	{ KE_KEY, 0x216a,  { KEY_SETUP } },
> +	{ KE_KEY, 0x21a9,  { KEY_TOUCHPAD_OFF } },
> +	{ KE_KEY, 0x121a9, { KEY_TOUCHPAD_ON } },
> +	{ KE_KEY, 0x231b,  { KEY_HELP } },
>  	{ KE_END, 0 }
>  };
>  

