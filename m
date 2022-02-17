Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C8CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 16:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239160AbiBQQ27 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:28:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242940AbiBQQ25 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 11:28:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A8F1B65E6
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645115316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OJgq/KDxxDOjnZUJexh0KDqV30PHIV148TQLzey+mso=;
        b=dEam0yCRoCsB7y58Z0FKG4PO3Vz6SMIWpTVWYScmXpV1TOXf4b+FL9m5b1kgf4GUrpcNIm
        WOVGpz1NSoOHyysIGG7+WO4B8iU28APiabSJR50jNsLT+elxnjyCQzsxxIq8KoRoQIR/Nj
        HSOcRGjWNPeC8qZw5ltnxgR4TXPim8M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-2jzOXh8DN1a-ljYd1HPlNg-1; Thu, 17 Feb 2022 11:28:34 -0500
X-MC-Unique: 2jzOXh8DN1a-ljYd1HPlNg-1
Received: by mail-ed1-f72.google.com with SMTP id e10-20020a056402190a00b00410f20467abso3829328edz.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OJgq/KDxxDOjnZUJexh0KDqV30PHIV148TQLzey+mso=;
        b=MKWCpnplKUw9mOmf1JJtn2B/wN7v9+rewIKRasVrA/JKsJQUID+uNs+0EWPC+6vBro
         GXx/MjEuTZOWTmV3rU4Z/ryZwquhZru8cIOCxSCOIp7Q35jm1E5LjQxA49G62wsZk2+o
         u/GuYlAzlmhgQgap0DlzmbxvGJyd1iA28INbCH0D8umUXZO44TVwsVjnMjKWVEboCLwc
         klzO5tDx9Xa38z/FjlHPNaAnuSvAHe69f5GVUOOgZk0tNA7pTPX+y4URhQrZIwhanWPB
         Ww6YhBha7HMyY4aZ6VvOVQ7Q1EaCLcV228yXyjvXN7AUMM0algKy2tvQyom2Va+Yq6mr
         K+tA==
X-Gm-Message-State: AOAM532ez3xAu5L2e3n/fm91vLXcyd+T5LZkl03ATKETCzZGKfd6oABV
        0hl2Lm2TkEkzoJlquv55GPcsdNOOXbi4xUAf1Yo9/aDJ1vEvWXLuOlDMz76Cr5Y3MjZ5u1DtZad
        OmhIiVOUUKTOMpwshJYJSEsUdsUZn28Qymg==
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id yk1-20020a17090770c100b006ce78ffbad4mr2958947ejb.68.1645115313580;
        Thu, 17 Feb 2022 08:28:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHk0mBIn5UH4jO+7vKeoLKOM8666LODusd64tZnougD4T+k/q3YUvhnxrSBAizbwwT0+edxw==
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id yk1-20020a17090770c100b006ce78ffbad4mr2958934ejb.68.1645115313445;
        Thu, 17 Feb 2022 08:28:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id ee30sm3403540edb.4.2022.02.17.08.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 08:28:32 -0800 (PST)
Message-ID: <84de2a98-3051-82ec-6686-ef4161535d23@redhat.com>
Date:   Thu, 17 Feb 2022 17:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: Add Steam Deck driver
Content-Language: en-US
To:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org
References: <20220206022023.376142-1-andrew.smirnov@gmail.com>
 <gfQUxZHzyr7uH4TwqJwXGsxCIYa-VvrN955036G3kKr6ligJYTAI3dqhf-FJddyHVBomp3JUUBNFMmmR8rwm7WzSxprlclT9Cbkrr2dknP0=@protonmail.com>
 <CAHQ1cqF5HCJVsmyMHMxU85Uwv_Yd8qoAUVMz7R_zo0S9_pFZfg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHQ1cqF5HCJVsmyMHMxU85Uwv_Yd8qoAUVMz7R_zo0S9_pFZfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/13/22 00:30, Andrey Smirnov wrote:

<snip>

>>> +static struct attribute *steamdeck_attributes[] = {
>>> +     &dev_attr_target_cpu_temp.attr,
>>> +     &dev_attr_gain.attr,
>>> +     &dev_attr_ramp_rate.attr,
>>> +     &dev_attr_hysteresis.attr,
>>> +     &dev_attr_maximum_battery_charge_rate.attr,
>>> +     &dev_attr_recalculate.attr,
>>> +     &dev_attr_power_cycle_display.attr,
>>> +
>>> +     &dev_attr_led_brightness.attr,
>>
>> Have you considered using a led class device instead? I think that should
>> work even without the ability to query the brightness.
>>
> 
> Not very seriously. Will take another look.
> 
>>
>>> +     &dev_attr_content_adaptive_brightness.attr,
>>> +     &dev_attr_gamma_set.attr,
>>> +     &dev_attr_display_brightness.attr,
>>
>> Have you considered using a backlight class device?
>>
> 
> Ditto.

Note that for both of these I would go a bit further then
"have you considered?". Since you are implementing standardized
userspace APIs here you *must* use the shared subsystem code
for registering a LED resp backlight class device here so that
everything is guaranteed to behave as expected by userspace.

Regards,

Hans

