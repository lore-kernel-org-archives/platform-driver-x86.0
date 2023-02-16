Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E840C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Feb 2023 09:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjBPJMN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Feb 2023 04:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjBPJML (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 04:12:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856A02311C
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 01:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676538682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/okeBeRsb4OotsLW2a18goWoRP3o4W4D8CZab0OhEhg=;
        b=Jo9tphMBHtXdt5gjWmaDLiKBQK+jhw7z8DDJkxDXXIswBxtjUuvtv5N7sUCx8fieqJxwal
        B1urZ2YDtfDuuwmB9qYqATKj+r4Bzlazk4TU5pI5xjwJh8EMgl+wM7sKA9wYXU4wDGkZmc
        ZTbk4Uy6n+pXA0TOhNGjG5sZF9EAmnc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-hIx_PszrOx2KQNTj8BG4pA-1; Thu, 16 Feb 2023 04:11:21 -0500
X-MC-Unique: hIx_PszrOx2KQNTj8BG4pA-1
Received: by mail-ed1-f71.google.com with SMTP id bo27-20020a0564020b3b00b004a6c2f6a226so1077216edb.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 01:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/okeBeRsb4OotsLW2a18goWoRP3o4W4D8CZab0OhEhg=;
        b=FD3G0y8T8oBm5MrxpSrBF34Ptpcp1n5F+F4iADgF8rasHmtdN9ws0vCKzOaUCxHBTq
         5KE/sqSTdKWjdzIfMo7X3CfpRHFcbdTXcEjBYFV4pS5zo8Oc98E8ZRohIQf7Yf/xpbfo
         tje2RyZIxkcvfBTkMq0xfvpQbFZUGBvtVv8Vz1TL+5GAcsvMxmFWhD+maEF43bQwIkik
         1nJbdlwZiGgzcx8pCBEQJHfwg79HEBgWc+Mixqo7NLBwt9nMZvIKyWrrDDmxQ8/xsr60
         80soT1mklkfWT99kvln7ZnjPz2IASKturusyblgBHHrXepL9lh0UrPAyOsG9PDL3Mwzu
         AJeg==
X-Gm-Message-State: AO0yUKVBXOkVLP/rK3vmYhM46LhhCrrB4NcFdga7NnQmSMEKPNhnu7uI
        jPQe/95uD01jd68+rIq6Ee5/m88U5jr6WsHxdYqOTIwCLtQQLKBWzkLBu+CqtAEcek88zTYlBUe
        AH7eKNjnU0s8e6suW3xwuLSZlFAffcExJkA==
X-Received: by 2002:aa7:d34e:0:b0:4ac:d2bc:32f9 with SMTP id m14-20020aa7d34e000000b004acd2bc32f9mr4605259edr.4.1676538680565;
        Thu, 16 Feb 2023 01:11:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+aC12lXhGWdqfz+x2ivny9MrkR9240xDnd1qIFSZpK6v8evidTu3DaP/z5Re+Jvc6Eaizy5g==
X-Received: by 2002:aa7:d34e:0:b0:4ac:d2bc:32f9 with SMTP id m14-20020aa7d34e000000b004acd2bc32f9mr4605247edr.4.1676538680334;
        Thu, 16 Feb 2023 01:11:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090657d500b007c11e5ac250sm543493ejr.91.2023.02.16.01.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:11:19 -0800 (PST)
Message-ID: <f80d506d-3292-bc03-c2e9-b167e1b5e71a@redhat.com>
Date:   Thu, 16 Feb 2023 10:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: acerhdf thermal question
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Peter Kaestle <peter@piie.net>,
        Mark Gross <markgross@kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <59c24c3d-eb1e-cdee-3d2e-aa1dda5a96fe@linaro.org>
 <ee826228-3fbb-bf66-b2a1-8e8be2776175@redhat.com>
In-Reply-To: <ee826228-3fbb-bf66-b2a1-8e8be2776175@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/16/23 10:08, Hans de Goede wrote:
> Hi Daniel,
> 
> On 2/16/23 09:57, Daniel Lezcano wrote:
>>
>> Hi,
>>
>> the polling interval is specified and modified via a kernel module parameter [1]
>>
>> The value is used to change the polling interval of the thermal zone, implying that is accessing the thermal zone device structure internals directly [2]
>>
>> In real use case, is the interval changed at runtime? Or just when the module is loaded? If the latter, the interval can be passed to the thermal zone at init time without doing a polling change rate after the thermal zone started. In this case, we can remove the polling_delay_jiffies change in the code and fix the structure leakage in this driver.
> 
> I believe this very likely only is used at module load-time.
> So the changes you suggest are fine with me.
> 
> I have added Paul Gortmaker to the Cc, Paul is the last person
> to have done any real (*) work on acerhfd AFAICT.
> 
> Paul any objections against making the acerhdf.interval parameter
> something which only works when set at boot / module load time
> and removing the ability to change it at runtime ?

p.s.

I see now that Peter Kaestle is also still active in acking / reviewing
acerhfd changes. So lets wait for Peter's input on this too.

Regards,

Hans


> *) Real as in not related to keeping it aligned with the thermal
> framework/core


