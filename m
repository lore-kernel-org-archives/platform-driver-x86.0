Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B3DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 21:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350120AbhLFVkN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 16:40:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34547 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236606AbhLFVkM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 16:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638826603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k/6fDDANuWcKn+YIo1FnaTqqM+rKxIWaBwLBFtoGU9I=;
        b=BxojRUu+qSs6DgYykaXLNBn22kLCLqG0Edt8oeYt/NkclOUgQUMF+3tVpG3x6cYUgZpkPs
        uPzb3XNft6LpArvGdlooxxtOZppdNMIJcSGx6bUk+puRgaTu5d6b/C0ZA90Hd2S1iTLVT2
        1hj+mOxWX0If1rsp7MKgzEIQmp9ZWA4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-0zdU9z4bPzm5bjCbyJfq0g-1; Mon, 06 Dec 2021 16:36:41 -0500
X-MC-Unique: 0zdU9z4bPzm5bjCbyJfq0g-1
Received: by mail-ed1-f71.google.com with SMTP id v1-20020aa7cd41000000b003e80973378aso9455813edw.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Dec 2021 13:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k/6fDDANuWcKn+YIo1FnaTqqM+rKxIWaBwLBFtoGU9I=;
        b=rvfKDbOHogNvpob8aTjqM1evlHtu9U2J0Df7xLjt++nZoMcZr2897anEs9tbFUC1YB
         SjWhsVRePeFt/7fVTamTOvYaXMPvH6b0yIOv5vi0OzqT0JNsAh8Gp6RuAyJ3ylkWg+vd
         rXFkhAllYmjEArJQ9hxgBN9yaA8JQMYnR1rpq/Uf9lex+RBMbf/HymR0MiQQzCJNO53f
         K/dnI2lkGLKQlXkSdRMr3YBVr1Mh25fRPcyxmSHQFCP8tnkNJ9d40m5iTtOr2i/kS+sr
         UrjSi4qj9dXpk8sBRvC7J9WVBUYEljrircdflLzapII6YFAMlK746aGiCBo1CNGcfogG
         HI4g==
X-Gm-Message-State: AOAM532f9Wis4x12CFEMoss9LbECgBIgdo4TQjfTrYJWRa/xLu0/D+JB
        Bvr07uCIf6lREuU9a4Lc09TTncpAUETvYdS4wP69vOvg9kL1hdSVlhjSy0eJst/DYSm02QQI3EI
        u15D6t2jFj2CM+HDY9RyUP5sr3CNmP6fNBQ==
X-Received: by 2002:a17:906:c109:: with SMTP id do9mr49907310ejc.111.1638826600439;
        Mon, 06 Dec 2021 13:36:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4mYrypOLoPRAoRRaEwrQ9B8WbLrw5QTx1oZ060uNEXxUwJ72m5Em7QllwdoprQUEE8QzAHQ==
X-Received: by 2002:a17:906:c109:: with SMTP id do9mr49907283ejc.111.1638826600218;
        Mon, 06 Dec 2021 13:36:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y22sm8572728edi.8.2021.12.06.13.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 13:36:39 -0800 (PST)
Message-ID: <395a4270-1985-6e15-a24c-4035a21bd61d@redhat.com>
Date:   Mon, 6 Dec 2021 22:36:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] platform/x86: wmi: Replace read_takes_no_args with a
 flags field
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20211128190031.405620-1-hdegoede@redhat.com>
 <CAHp75VeCy1_oGu-TTmdadzek69UFq=NbkEn_jXA9Ps0oWi33vg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeCy1_oGu-TTmdadzek69UFq=NbkEn_jXA9Ps0oWi33vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/21 15:52, Andy Shevchenko wrote:
> On Sun, Nov 28, 2021 at 9:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Replace the wmi_block.read_takes_no_args bool field with
>> an unsigned long flags field, used together with test_bit()
>> and friends.
>>
>> This is a preparation patch for fixing a driver->notify() vs ->probe()
>> race, which requires atomic flag handling.
> 
> For patches 1,2,3 and 5 (after addressing minor spelling issues) are fine to me,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you. I've added this series to my review-hans branch now, with
your Reviewed-by added and the spelling issues addressed.

Regards,

Hans



> 
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/wmi.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
>> index c34341f4da76..46178e03aeca 100644
>> --- a/drivers/platform/x86/wmi.c
>> +++ b/drivers/platform/x86/wmi.c
>> @@ -57,6 +57,10 @@ static_assert(sizeof(typeof_member(struct guid_block, guid)) == 16);
>>  static_assert(sizeof(struct guid_block) == 20);
>>  static_assert(__alignof__(struct guid_block) == 1);
>>
>> +enum { /* wmi_block flags */
>> +       WMI_READ_TAKES_NO_ARGS,
>> +};
>> +
>>  struct wmi_block {
>>         struct wmi_device dev;
>>         struct list_head list;
>> @@ -67,8 +71,7 @@ struct wmi_block {
>>         wmi_notify_handler handler;
>>         void *handler_data;
>>         u64 req_buf_size;
>> -
>> -       bool read_takes_no_args;
>> +       unsigned long flags;
>>  };
>>
>>
>> @@ -367,7 +370,7 @@ static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
>>         wq_params[0].type = ACPI_TYPE_INTEGER;
>>         wq_params[0].integer.value = instance;
>>
>> -       if (instance == 0 && wblock->read_takes_no_args)
>> +       if (instance == 0 && test_bit(WMI_READ_TAKES_NO_ARGS, &wblock->flags))
>>                 input.count = 0;
>>
>>         /*
>> @@ -1113,7 +1116,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
>>          * laptops, WQxx may not be a method at all.)
>>          */
>>         if (info->type != ACPI_TYPE_METHOD || info->param_count == 0)
>> -               wblock->read_takes_no_args = true;
>> +               set_bit(WMI_READ_TAKES_NO_ARGS, &wblock->flags);
>>
>>         kfree(info);
>>
>> --
>> 2.33.1
>>
> 
> 
> --
> With Best Regards,
> Andy Shevchenko
> 

