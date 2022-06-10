Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AD5C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 19:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348610AbiFJTlR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 15:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348613AbiFJTlL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 15:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3B1101D333
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 12:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654890067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vA8cR7nsnb+ckOtghC/qMaCu5I6d6RRsZCbAEBX5avU=;
        b=CU1aeYyWgVs+d5d5fgLMnc5DMwHZDQLwCAn+54vPHgAEcnauIxjLoyJlWKtApRXkUtRXCY
        OSoCt62OSpMcxuHzZedwye7to4oJa6S2Le2quxi7NGEftgYn4cs6LZg5lyh9TB56yCF6Vu
        zFUXBG7/+xPUIr7304A8JO1xDu2fCHE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-AGyM9wVKNge1r46fTwSJ9A-1; Fri, 10 Jun 2022 15:41:06 -0400
X-MC-Unique: AGyM9wVKNge1r46fTwSJ9A-1
Received: by mail-ed1-f69.google.com with SMTP id a4-20020a056402168400b0042dc5b94da6so103150edv.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 12:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vA8cR7nsnb+ckOtghC/qMaCu5I6d6RRsZCbAEBX5avU=;
        b=5OX7RmkO8oGPwtEna/TZWYjgZ3iIr8iUTSvZdhZY8mIg0I8EGCo7XfTjHJhNt9/g/z
         YuYo8mffndxya/mFB4K/+HxJ0nuhmFG6ffNFeU+OLSCIzQWYpxo2zacCp2FoJF0093FL
         dzRXzyKfXXA1lQt+zHCK37JKouhluu4oavfQqxQQcPZuFHSxmEsB5lf9RErb4ROuF2BO
         tlSsJ4uCH5nolAFpjXdUuGd6hw9OpWV6IIuyf/2M5z3dfyM3gXR361iSLjc+BGJCBSXh
         agmKIIDnx0aPc71mgyPlorFjtgIDCmzyqaTE42ceoi2sN4ajwWFQkCNE05d4hKwEpNvf
         6rZA==
X-Gm-Message-State: AOAM531FRTuqmue2xVqzlfYi040aM2LKkg6GPYrDcqvydnN0AKOeSfHQ
        nZAvcVJL30kSsuH404K6gPHFtcK3txHn8w2bcYkGXv0lbmmQWeReY53khZ+bc32HYanMX1S4AZV
        tQNLWTj2HsH1Uei2rzrvUm6DIRFNS4SBx3A==
X-Received: by 2002:a17:907:3e92:b0:711:d26c:f91 with SMTP id hs18-20020a1709073e9200b00711d26c0f91mr23855268ejc.283.1654890065524;
        Fri, 10 Jun 2022 12:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGX4hLS+b3viIU1ZsgAHa0L/s7twYfOCT9wz7ZO3rqUcu26HH2K5ctx58QbNPOJxcwO/9URw==
X-Received: by 2002:a17:907:3e92:b0:711:d26c:f91 with SMTP id hs18-20020a1709073e9200b00711d26c0f91mr23855251ejc.283.1654890065298;
        Fri, 10 Jun 2022 12:41:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id fg24-20020a1709069c5800b006fe9ec4ba9esm12374031ejc.52.2022.06.10.12.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 12:41:04 -0700 (PDT)
Message-ID: <60d1d287-c503-fcbc-20a8-06e78cf37c79@redhat.com>
Date:   Fri, 10 Jun 2022 21:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add Z690M AORUS ELITE AX DDR4
 support
Content-Language: en-US
To:     Piotr Chmura <chmooreck@gmail.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>
Cc:     platform-driver-x86@vger.kernel.org
References: <bd83567e-ebf5-0b31-074b-5f6dc7f7c147@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bd83567e-ebf5-0b31-074b-5f6dc7f7c147@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/6/22 19:15, Piotr Chmura wrote:
> Add dmi_system_id of Gigabyte Z690M AORUS ELITE AX DDR4 board. Tested on my PC.
> 
> Signed-off-by: Piotr Chmura <chmooreck@gmail.com>

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


> 
> ---
> 
> --- linux/drivers/platform/x86/gigabyte-wmi.c	2022-05-22 21:52:31.000000000 +0200
> +++ linux-wmi/drivers/platform/x86/gigabyte-wmi.c	2022-06-05 18:53:47.242238345 +0200
> @@ -156,6 +156,7 @@
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z690M AORUS ELITE AX DDR4"),
>  	{ }
>  };
>  
> 

