Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06511C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 13:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbiI0NFD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiI0NFC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 09:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BB5AD9AE
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664283900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kquHkI2w4A5K9/c91glk5Z1gSYykco9F3dyKF8GU0Q0=;
        b=P2qFW6RXDWhsOD73qaJ3XrXxFZiQpNpch7615slb3Q+t+90Jv0u/ciMTPIuseBhv/hIsEf
        24JpBP9ljoSrfRfjWdpl7i/YJP5j7uh/pQR6dHB9ilejQ6z6kTxuq4n41Z/2lh01t3v2hH
        98rvRY4XDVj9VtNVSAXF1V+WZJwvTm0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-80_GajOdMQ-09bBw8xkuUg-1; Tue, 27 Sep 2022 09:04:53 -0400
X-MC-Unique: 80_GajOdMQ-09bBw8xkuUg-1
Received: by mail-ed1-f70.google.com with SMTP id w17-20020a056402269100b0045249bc17a9so7692515edd.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kquHkI2w4A5K9/c91glk5Z1gSYykco9F3dyKF8GU0Q0=;
        b=Val8Egb2Rtvd3MzhdiPXRwntki2jtmcXHFZ+zHHayzG4XVf5KcifKFinvnxWs8gn/d
         YDJdoNjDf5cr+NBap2SM77qC6TQ5sQqkszaio7TBl+Wh2dRsQ0/8Gm0vaQ2OI5SHLyFD
         wIZicocI/Pin8Hg3e7WCrBsTyyw/scw/8fLgjii/atyqX4doe/Bo5txL4KM5QE6ib7mV
         NQVFAopzD+6D8TFA5QuSHyKx+97W2ifx3LT1nM4lHzxASPNOSDCFHktYvuAkzGzPrP3o
         iU9D/lqJxxq8N9SWU6mjw9o6fkWe8NiyZ26HFu3XfBCiIb1kpXrlfMKROSOEO36L+BaB
         ooVQ==
X-Gm-Message-State: ACrzQf0TMr9m84k8VJS6m/HQ6aBvBhG3oI3CAgRLTzYV3MPFzP33VT3c
        J6ghG/ics6dx/aKNi0wOd6MHRRHI0lDkNZTk9cPlFxlqqfZGRSHTYkMsdefZl2quSFW6bamlqby
        r0Njb1vb0Z0+nKD/Cnco9/Tj9UUvpDg0saA==
X-Received: by 2002:a17:906:cc58:b0:76f:c119:acb5 with SMTP id mm24-20020a170906cc5800b0076fc119acb5mr22144460ejb.651.1664283892468;
        Tue, 27 Sep 2022 06:04:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gVV4Z2M+oNSaOA06trCpTieD7J2Evmuo2kvhBG2O7xpvkb8P1hXDUP9I+ha6Rjvky5yNbMw==
X-Received: by 2002:a17:906:cc58:b0:76f:c119:acb5 with SMTP id mm24-20020a170906cc5800b0076fc119acb5mr22144415ejb.651.1664283891899;
        Tue, 27 Sep 2022 06:04:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id rl24-20020a170907217800b00782539a02absm747977ejb.194.2022.09.27.06.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:04:41 -0700 (PDT)
Message-ID: <525218fc-d70e-1de5-2495-13fe3e942a9a@redhat.com>
Date:   Tue, 27 Sep 2022 15:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH linux-next] platform/x86: use sysfs_emit() and add the
 '\n'
Content-Language: en-US
To:     cgel.zte@gmail.com
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>
References: <20220923063233.239091-1-ye.xingchen@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220923063233.239091-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/22 08:32, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with sysfs_emit() to simplify the code.
> And also add '\n' because it need a new line.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Thanks, I have merged this minus the addition of the '\n',
this is exposed to userspace and some userspace apps may rely
on the current behavior where the '\n' is omitted.

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
>  drivers/platform/x86/dell/dell-smbios-base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
> index fc086b66f70b..e5b61ecdae8c 100644
> --- a/drivers/platform/x86/dell/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell/dell-smbios-base.c
> @@ -441,7 +441,7 @@ static ssize_t location_show(struct device *dev,
>  
>  	i = match_attribute(dev, attr);
>  	if (i > 0)
> -		return scnprintf(buf, PAGE_SIZE, "%08x", da_tokens[i].location);
> +		return sysfs_emit(buf, "%08x\n", da_tokens[i].location);
>  	return 0;
>  }
>  
> @@ -455,7 +455,7 @@ static ssize_t value_show(struct device *dev,
>  
>  	i = match_attribute(dev, attr);
>  	if (i > 0)
> -		return scnprintf(buf, PAGE_SIZE, "%08x", da_tokens[i].value);
> +		return sysfs_emit(buf, "%08x\n", da_tokens[i].value);
>  	return 0;
>  }
>  

