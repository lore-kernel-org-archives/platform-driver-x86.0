Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4A4C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Nov 2022 20:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiKXUVa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Nov 2022 15:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiKXUV3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Nov 2022 15:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD74897379
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 12:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669321235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y7SgGz8B6Itg0j9xWA1UexLrHBvcMI06ThigEcp9530=;
        b=LTCGPqszEay47BFlHsw7GqpG95M+1wp2GWl3NG6wNIpTlxhVn0LF7tZt/4i+omhP6XtxvE
        GN4htKYmafGuAJaz5cjIqPakkj+F5rHZfolRcpLJUAO3Z+8UbWbQhFyLELTFFgqGU+VZBl
        bCGtbhJgADs/jnqYPgxa8UPsacZxRl4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-IbxEW4SINpmfmErApxPKwQ-1; Thu, 24 Nov 2022 15:20:33 -0500
X-MC-Unique: IbxEW4SINpmfmErApxPKwQ-1
Received: by mail-ed1-f69.google.com with SMTP id r12-20020a05640251cc00b00463699c95aeso1389761edd.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 12:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7SgGz8B6Itg0j9xWA1UexLrHBvcMI06ThigEcp9530=;
        b=wN9xgNIJR/DAZTbzi9nKLd6X89WpIoafzCY7HyMrwucUhAqvLiokubNF7BrNzTT1ut
         oQBLe0Op1VIih85/7nL9iL5SpauMw7k/Cfe4RWmd+ybS86kOVY74mlM2xVYD48nAiQkj
         iFDtrXMlxU8NTUMbBX9ad3//ywM+iO/CErtEcgPUH7sqms5xIzeBet2jCYUhKkjlgJm/
         jDLSvoHGQgcWKx56uzn0TD3wo+NIgqNij0e2vsNR0yfFhixD6E1q//t8tqA1/90z9YjR
         N33/zuav9nDdwAFde4jQrsrnCIpK0Hdo/TT/jY6Is+hiUOmG8eo/7OXbAfgzUcS3xM6M
         RtyA==
X-Gm-Message-State: ANoB5pml9Ir75v4YremDVnfPXDAxFaGU1HUjwe8HnjtlIjMg9BVaOuB+
        S4nq7UxWJSAqWzJUdPCzcrpP7uL0KhJgnSTSqpdbq3YZlUmqWuZTB+VT81RG4Sh2AAiJSM9uusE
        vz6jyRbha6bgc91TgZM3fBQhTWQtnBN491w==
X-Received: by 2002:a17:906:b04c:b0:78d:9b0a:7b0b with SMTP id bj12-20020a170906b04c00b0078d9b0a7b0bmr29173945ejb.197.1669321232603;
        Thu, 24 Nov 2022 12:20:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7aYxRRn2N/AP15AOTenR50qeEFUz3yRXR9+Y57bevOqG6qDVO9U9yDbFFScm6v+dsE9ySLVQ==
X-Received: by 2002:a17:906:b04c:b0:78d:9b0a:7b0b with SMTP id bj12-20020a170906b04c00b0078d9b0a7b0bmr29173939ejb.197.1669321232424;
        Thu, 24 Nov 2022 12:20:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7d609000000b0046150ee13besm884315edr.65.2022.11.24.12.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 12:20:31 -0800 (PST)
Message-ID: <e82b11bf-a872-a83e-6b02-7acfedcaf24b@redhat.com>
Date:   Thu, 24 Nov 2022 21:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-2-hdegoede@redhat.com>
 <CAHp75VdWWXCvHnVaE3pYuntXyeP7zPOc6PpcQaXWFkEEPf+QxA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdWWXCvHnVaE3pYuntXyeP7zPOc6PpcQaXWFkEEPf+QxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Thank you for the reviews!

On 11/24/22 21:09, Andy Shevchenko wrote:
> On Thu, Nov 24, 2022 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Make the GPIO to sensor mapping more generic and fold the
>> INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN cases into
>> a single generic case.
>>
>> This is a preparation patch for further GPIO mapping changes.
> 
> ...
> 
>> +static const char *int3472_dsm_type_to_func(u8 type)
>> +{
>> +       switch (type) {
>> +       case INT3472_GPIO_TYPE_RESET:
>> +               return "reset";
>> +       case INT3472_GPIO_TYPE_POWERDOWN:
>> +               return "powerdown";
>> +       case INT3472_GPIO_TYPE_CLK_ENABLE:
>> +               return "clken";
>> +       case INT3472_GPIO_TYPE_PRIVACY_LED:
>> +               return "pled";
>> +       case INT3472_GPIO_TYPE_POWER_ENABLE:
>> +               return "power-enable";
> 
> default:
>   return "unknown";
> 
> ?
> 
>> +       }
>> +
>> +       return "unknown";
>> +}
> 

In the passed some compiler versions complained about the non-void
function not ending with a return statement.

I guess I can give your variant a try (I agree it is more readable)
and of we get compiler warnings we can switch back.

I'll fix this up in the next version or when merging this,
depending on further feedback on the series.

Regards,

Hans




