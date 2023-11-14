Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A85AC4167B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 14:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbjKNOJP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 09:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbjKNOJI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 09:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36105D5B
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 06:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699970943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nBPr2/qhlVXy/Hyc/g7DaWfZI781K10TZ78qXMh6iek=;
        b=IV2H61I1TN125dRkFa/oNSXUxGN9/rMjXXOO452bhBaS/WwGD/Xy3x94gFUDj0aokX3TnY
        9HRbJMdfvAPP1Ylw5dSsWcp/2IRyk5Kkr+E6shlSRPjcxhNXN4wGtppN58dslcY3Jrvz8F
        pH9yHxiW8kEzhw7VVpLd9QvwZzXJzNs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-OEyidHS0O3KKjABHuuwO0g-1; Tue, 14 Nov 2023 09:09:01 -0500
X-MC-Unique: OEyidHS0O3KKjABHuuwO0g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-540150414efso3870092a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 06:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970940; x=1700575740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBPr2/qhlVXy/Hyc/g7DaWfZI781K10TZ78qXMh6iek=;
        b=EmXQlgYYzignGkz+La8q7e1gSYvDCWrwZtBSBISU6NulEEdj/o9SU6o/X133/CgkfP
         byawA6WYoaQFAz8Al5o/RFTFlDA20g/x197K+i9cqrO7V9Lk6E3i2FjFuSVieiwKnTxj
         vN5sZ5g2QpAIyLuCBOxVrGzc50txpaU8IcvSXzgizSFC/0TBHTZf4yxv3hSHtXCQjNTw
         M7ckcB4muLov+ZpePovD7C9IZ6PwVcCHFuiMUTRqOMi3euMvzrlFLdLxNNt98NEkJYOu
         FIex17sjtkoMCx/9YUjTGkSnWujnEG9lErltC5Z88roMNc+4oBncaHm2dvyUVCNTfhKO
         K98Q==
X-Gm-Message-State: AOJu0YzbSvdJS+ks6dxXWh/T5YZFWu2DANjuVZZ7fzjrd5xTd7Zq5Qz1
        EfNQFpu4J9VwgFBFTUGsB/3HRp+2ge+rd6l612r7kat5bPD0DUghUdiJQvpCr9U2HQbzLdIJe+Y
        +dvOoBMuqYG/w+7dnxatLgNkhbaLA1/8rtg==
X-Received: by 2002:aa7:cd78:0:b0:544:a26b:dfa3 with SMTP id ca24-20020aa7cd78000000b00544a26bdfa3mr6474533edb.6.1699970940447;
        Tue, 14 Nov 2023 06:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTbfNeRRfGbes8c0XvK7c0uIL0u9sxP/QgJnnaVnOeP3LCEOzo5wP7J/yWyaceeceittbAaQ==
X-Received: by 2002:aa7:cd78:0:b0:544:a26b:dfa3 with SMTP id ca24-20020aa7cd78000000b00544a26bdfa3mr6474526edb.6.1699970940203;
        Tue, 14 Nov 2023 06:09:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r30-20020a50aade000000b005434e3d8e7bsm5276674edc.1.2023.11.14.06.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 06:08:58 -0800 (PST)
Message-ID: <d2cf4587-d6d3-4c77-a263-aefb01d93c5e@redhat.com>
Date:   Tue, 14 Nov 2023 15:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] hwmon: (dell-smm) Add support for WMI SMM
 interface
Content-Language: en-US, nl
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Armin Wolf <W_Armin@gmx.de>, pali@kernel.org, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231106064351.42347-1-W_Armin@gmx.de>
 <3ec0496d-3b89-46f5-9faf-9fcce78f6b38@gmx.de>
 <8c25dfec-b0ca-4e2f-964a-5ae62452e141@redhat.com>
 <149a31b1-f5b8-438c-8883-987cb4224944@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <149a31b1-f5b8-438c-8883-987cb4224944@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Guenter,

On 11/14/23 14:57, Guenter Roeck wrote:
> On Mon, Nov 13, 2023 at 09:17:48PM +0100, Hans de Goede wrote:
>>
>> I plan to review and hopefully merge this and your
>> other series sometime this week.
>>
> 
> What warrants merging this series through your tree(s) instead of
> through hwmon ?

My bad, I was not paying attention to what the patches were touching
(just a quick reply to Armin's status request), I agree that this
should be merged through the hwmon tree, sorry about the confusion.

Regards,

Hans



