Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D7DC64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjCAKp4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjCAKpq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648C12FCEA
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677667503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I7UDlRp7RsdKESc4lvRd6c9KE/54CpWxoPzvhO0sTSM=;
        b=WU0imSQ5GstT5i1p8nw1VmyIPIa4tqgPLN5cXZJj/SI/INlH1y8j+Md/d+A+CtxrIZeK+K
        xGpO+HjheiEE+euEbGnRW/ySbl4UQhq5MT4N7LUrKzLGLz3S8J/rfpEFu21hH4qocV2DxM
        KymVWmBFvx5gsfhHNBMSVhZ8zdyEjo8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-NkDwfaxJOSWeBqssJAVWnQ-1; Wed, 01 Mar 2023 05:45:02 -0500
X-MC-Unique: NkDwfaxJOSWeBqssJAVWnQ-1
Received: by mail-ed1-f69.google.com with SMTP id w11-20020a05640234cb00b004b3247589b3so15970028edc.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7UDlRp7RsdKESc4lvRd6c9KE/54CpWxoPzvhO0sTSM=;
        b=s86epfIdWL1IqRbW/HSSSx+WuV+xm6H3/wUCAUB5lvIFy81aWZNlUkVgnRYB2gS8bU
         XxrT6yGHBo8w5zx7Wp1xG+CO3FqVEIOE1TXTI0gT8/6W8k6MjEEPmXlbo7UpY1Tv39N5
         IaJCXV98WCBZVxUINF1YJcTfnFLU6r+YQQm90FFQwgtdTp1by7dIS3hRW7Tn2/VRB6kl
         j94FC/FFlmi4yc4s9Ecx+FmUrbi2yuU0MgECq8sSkg09fAcj/wtLzbNQTqhWe2s4ufQZ
         jfK+pllYMdGBmJFsMJu0adEcSNx5lixRIsxz8vDS6ZfyvBEj2E+1PcICPnaAVd0CgNvD
         c5dA==
X-Gm-Message-State: AO0yUKUEo1NswpESG5NOuOuimUORLw7Ri8sFx8odD/ri0jFooHFPvHFM
        3LKSnk1srKVv9ejtWmBmBfUhX5TLFq2pc+xezTvtIq5fqsQ1bXB/o1uAc1XdZSpxF+9A8ppCZSK
        E/JT9DAnXTH7dxKyeKfnPDdlG/Z2Btpdtlw==
X-Received: by 2002:a17:907:d13:b0:8e6:1726:df82 with SMTP id gn19-20020a1709070d1300b008e61726df82mr7460886ejc.30.1677667501598;
        Wed, 01 Mar 2023 02:45:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9eCTUdeYWC4JBWeQH3QT8Ukd4wKExEQtGmZjN3hwwqtgt9GPARmsHGvy4jk5/EJYdxcgBNqA==
X-Received: by 2002:a17:907:d13:b0:8e6:1726:df82 with SMTP id gn19-20020a1709070d1300b008e61726df82mr7460874ejc.30.1677667501321;
        Wed, 01 Mar 2023 02:45:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qh25-20020a170906ecb900b008dd76b67ae6sm5620095ejb.175.2023.03.01.02.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:45:00 -0800 (PST)
Message-ID: <f3c5f77c-9a12-0839-7410-bcca5157c8b9@redhat.com>
Date:   Wed, 1 Mar 2023 11:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/14] platform/x86: x86-android-tablets: Move Asus
 tablets to their own file
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230301092331.7038-1-hdegoede@redhat.com>
 <20230301092331.7038-7-hdegoede@redhat.com>
 <CAHp75VfGs65=CC++PAdJ88YqXbMxf+PFormuwq-N5govkPAmjw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfGs65=CC++PAdJ88YqXbMxf+PFormuwq-N5govkPAmjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 11:34, Andy Shevchenko wrote:
> On Wed, Mar 1, 2023 at 11:23 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Move the info for the Asus tablets to their own asus.c file.
> 
> ...
> 
>> +static int __init asus_me176c_tf103c_init(void)
>> +{
>> +       struct gpio_desc *gpiod;
>> +       int ret;
>> +
>> +       ret = x86_android_tablet_get_gpiod("INT33FC:02", 12, &gpiod);
>> +       if (ret < 0)
>> +               return ret;
>> +       asus_me176c_tf103c_lid.gpio = desc_to_gpio(gpiod);
> 
>> +
> 
> I would expect this blank line to be after return ret;, but it's not a big deal.

I think it was this way before moving it around and more importantly
the "platform/x86: x86-android-tablets: Add gpio_keys support to x86_android_tablet_init()"
patch completely removes this function.

Talking about "platform/x86: x86-android-tablets: Add gpio_keys support to x86_android_tablet_init()"

I did implement your suggestions to put all the info for a button into
a separate struct, but I forgot to add a Changes section to the commit
msg for this.

Regards,

Hans



> 
>> +       return 0;
>> +}
> 

