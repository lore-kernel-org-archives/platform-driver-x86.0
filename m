Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EFBC38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjAWN5d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjAWN5c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0D112865
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674482209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DBb7gkwxhMra+qH6UM12B/Qa7l9O9Pp6yNrK0dvjqyo=;
        b=YZZvDXTouNZVe+q9MsC0FjfoT1hZzi608ZIk+7BdUV4LbBy+fqSb7rN2ALmXqzYNYJ17WQ
        VUuLtGi5TuBkT+AXtnTEaYfmxkaDCigBct3hMDL/wVGVOykk1RGfe25ZpxcLhFWcxtiXOf
        LFZxqlaDsaJ1Vn1r/c7HvXvxikuAZqM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-YvySGgF2MuGRZkFhKTJRCg-1; Mon, 23 Jan 2023 08:56:48 -0500
X-MC-Unique: YvySGgF2MuGRZkFhKTJRCg-1
Received: by mail-ed1-f69.google.com with SMTP id v8-20020a056402348800b0049e1913bd43so8641220edc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBb7gkwxhMra+qH6UM12B/Qa7l9O9Pp6yNrK0dvjqyo=;
        b=pjw4Y6W+zTCPv/daO8qBhXFt/emOsaZ3gg7SHCWco6Q2Gcs+enp1EZWCVQkWCf4Ou8
         b8oeah6aHLk1usydnf715LEwCluGeJWKKEUOklMHGAIo1VVVcQn9Ccln/MREG+keRuFH
         dK7rOi54YxTXx4Yxv0QSJHuNUpFQvIynxqz6+E+vQlDduVYYOqDD4ddxPR3O5ZdWbGXL
         NPGkhv6HwfsHuTeGVesbY4H+kKBDVQp8Jp6akWTcCKvrziNSe0MriWIoK/OjZPZAK6D9
         WRGfLMiwwGNbtXDUGw+YaQEdWjWtb/m8gdlzKNjigqozrrPZ/yUXZMRh27ej54Tc+GY5
         28+w==
X-Gm-Message-State: AFqh2krSClC3pih8WZB8qrY6at1+cFs9R5b4Wc3dxiAqDbIBTtC9X8ze
        dT5M9vCwNY4C60MM2jzk3hyjyB9+/UrcmAyRLoSF8KJ6UhabeqYJMRtdMAa7+GOxooq0frBr2DD
        GiZMdgW5UOU1SDNoVWdUcIj/IMXN2CLJbuA==
X-Received: by 2002:a17:907:d15:b0:862:e612:effe with SMTP id gn21-20020a1709070d1500b00862e612effemr37065644ejc.14.1674482206876;
        Mon, 23 Jan 2023 05:56:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvaSzyM/6fW8jqol4GOApRf22qTcncWFbpkn62cHuSmBphmWXRLkpoIJBNygP1nCMaCNZrj1g==
X-Received: by 2002:a17:907:d15:b0:862:e612:effe with SMTP id gn21-20020a1709070d1500b00862e612effemr37065630ejc.14.1674482206672;
        Mon, 23 Jan 2023 05:56:46 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090631c600b008779b5c7db6sm5250571ejf.107.2023.01.23.05.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:56:46 -0800 (PST)
Message-ID: <c15b8456-0c00-e27e-c768-f1cd504ed4e9@redhat.com>
Date:   Mon, 23 Jan 2023 14:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: hp-wmi: Fix cast to smaller integer type
 warning
Content-Language: en-US
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20230123132824.660062-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230123132824.660062-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/23/23 14:28, Hans de Goede wrote:
> Fix the following compiler warning:
> 
> drivers/platform/x86/hp/hp-wmi.c:551:24: warning: cast to smaller integer
>    type 'enum hp_wmi_radio' from 'void *' [-Wvoid-pointer-to-enum-cast]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I have added this to my review-hans branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/hp/hp-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 0a99058be813..9ac41950e4fc 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -548,7 +548,7 @@ static int __init hp_wmi_enable_hotkeys(void)
>  
>  static int hp_wmi_set_block(void *data, bool blocked)
>  {
> -	enum hp_wmi_radio r = (enum hp_wmi_radio) data;
> +	enum hp_wmi_radio r = (long)data;
>  	int query = BIT(r + 8) | ((!blocked) << r);
>  	int ret;
>  

