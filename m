Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF00C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 14:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjCPOhM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 10:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbjCPOhL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 10:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11CFD514A
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678977384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gpcF/hcqSj5GjvLav9T+2zCuKxAs7PflO1KObok4Dec=;
        b=EAqvXryqa3m1mNbKjUdTbOhCrI8g1AkUbkxLQSYHkZoufUo3/9hBsbeW8HtXczixhCE9oi
        nt/haIKmmplWvsR1Ffgw0LP9vjiSaOCK+IUjDVWaCj6KohpcPPh87zPoDl2TDrBbhZKpoY
        ncI6OJ59/8WO4jqpFnj2lL2o6L3p7Gk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-1GoB_4-rMEyFSEVKITJleg-1; Thu, 16 Mar 2023 10:36:22 -0400
X-MC-Unique: 1GoB_4-rMEyFSEVKITJleg-1
Received: by mail-ed1-f70.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso3303286edu.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpcF/hcqSj5GjvLav9T+2zCuKxAs7PflO1KObok4Dec=;
        b=ilcZfq8afQekP7z4QNIjydnUXJCjbWgGCn+gU/a8cqVQx21adj1H70ygZwWVRb5alp
         P2u75JEHbpHFZPET4uLHNaWqJe8eXWdAZv8rW3FpJFCE2ODm2T2DHw7OjwO/Imr0UmAh
         9X+zmbqC6lJYRp6On9DAeiOSxF+ri34nuuHY+fMril3+Sd5qrAbWN+p9Fw8TC6avLnRA
         AZm1tG/Wkent1Pm0k4y6zsOPrSExWVcOEt/e0CuTs+zqBKrkSkAoe99u5NNtUb0ON0oU
         btqZi1UuajIEB5/+p0xRDvP+4VdeUGt4K2iyQ3RQxd8UI1V6Q9HA7xmqOxSyd9Qnac2R
         PPBQ==
X-Gm-Message-State: AO0yUKWFZLixZkEtgLcSg5wJviDTCxVV98wcwwtt/r/beZN+J19gE3XY
        4HGpM181R4oQYQ/JLRytJYeM7VRDhtrnJMIydUbK4ZNN89eHn5yfIg6rmKbsqH2j7ACKtCHJj+O
        82WlRJhPe2m8hN81VLPyuiKEwNLm1c5qvFg==
X-Received: by 2002:a17:906:a93:b0:931:102e:13a1 with SMTP id y19-20020a1709060a9300b00931102e13a1mr1014733ejf.40.1678977381827;
        Thu, 16 Mar 2023 07:36:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set+3sDtdZoj5OqJUkdJWg7pUDUuqy7otslopEM9hlTRgSN7UXX5iGSty6lF+5RmzNraTlnQ3fg==
X-Received: by 2002:a17:906:a93:b0:931:102e:13a1 with SMTP id y19-20020a1709060a9300b00931102e13a1mr1014710ejf.40.1678977381529;
        Thu, 16 Mar 2023 07:36:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gt16-20020a1709072d9000b008c327bef167sm3888641ejc.7.2023.03.16.07.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:36:21 -0700 (PDT)
Message-ID: <7b3aa5c3-493e-d765-29c4-9b28edd82ab3@redhat.com>
Date:   Thu, 16 Mar 2023 15:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] acerhdf: remove unneeded semicolon
Content-Language: en-US, nl
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, peter@piie.net
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230309061045.25256-1-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309061045.25256-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/23 07:10, Jiapeng Chong wrote:
> ./drivers/platform/x86/acerhdf.c:343:2-3: Unneeded semicolon.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2271
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

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
>  drivers/platform/x86/acerhdf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
> index a48638ad2a8a..ec8cc780b822 100644
> --- a/drivers/platform/x86/acerhdf.c
> +++ b/drivers/platform/x86/acerhdf.c
> @@ -341,7 +341,7 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
>  		pr_err("fanoff temperature (%d) is above fanon temperature (%d), clamping to %d\n",
>  		       fanoff, fanon, fanon);
>  		fanoff = fanon;
> -	};
> +	}
>  
>  	trips[0].temperature = fanon;
>  	trips[0].hysteresis  = fanon - fanoff;

