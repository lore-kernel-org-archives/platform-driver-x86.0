Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4174BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Nov 2021 09:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346850AbhK2JxY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Nov 2021 04:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47362 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245345AbhK2JvJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Nov 2021 04:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638179272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ptl5QS3NTkUjIKOmUM6gOv8Uuo0iS8PV3bZIARkbYzY=;
        b=W0fbBxbiDzoi5rfzmcmy+Jb6zlh88IfTUoYH0V7Zv8sS9sFHYLYmlK4YlqJfdHgvS7x5WT
        Ei3vldKqCIhSmPWYRX52EdZgTJpvGmu7EGzUyO/50B/CWOn65mDbKFkVVuJ0hAQSVBDcHO
        H794L45WTL6N/qAeHDICw9ndJl22urQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-Vg0tZrgGP7u6yzGH-Kx85Q-1; Mon, 29 Nov 2021 04:47:50 -0500
X-MC-Unique: Vg0tZrgGP7u6yzGH-Kx85Q-1
Received: by mail-ed1-f70.google.com with SMTP id q17-20020aa7da91000000b003e7c0641b9cso13215583eds.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2021 01:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ptl5QS3NTkUjIKOmUM6gOv8Uuo0iS8PV3bZIARkbYzY=;
        b=Tj9BHb9DWx5ijCVhbrnpKSCyaQKqUF4JYn/YmbUvKwF9L5T6Dy+2GGk0iPpnO5+lhc
         EpwbIt+eUyrSULHCSX7gpvbwoidGktdF1DCyQjdeMRBhItNnJgAU7BilS0Mfk6zpBNhF
         eMMfnW0IagBqqKBRSovUwwCYpXuSQuw30eQKMH5oS855vQctWfvWqTl2KFHHXZKifMvQ
         t4hY4pPdB3wQDujMO+fxzWo+rBvBjE6fBYBGWvNboVWUOX23eG/lEbyOPci7bsXYYFMT
         nslrhdezkAo1Qd/iacS4RrOMgkMelbO09fWoXIc+FkRF4NQyPhdh/PgA6v+flQlvNvdQ
         sJVA==
X-Gm-Message-State: AOAM531X3IpEgfnT19Ey9R5LNRrhgZ54+T1DeP2xi37RVkxvb5kKCs9R
        jlz9Kcn6z66Z392M1UFD1hX5I4fIDCIAUO/TjuSWQm5MVK493is37YBC3TACgNAvL0/KZF+9/8D
        2oXC3VTjIKkt/xnmY8a0gJdquDwuWubNalA==
X-Received: by 2002:aa7:c719:: with SMTP id i25mr72270132edq.157.1638179269692;
        Mon, 29 Nov 2021 01:47:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCoabYeQVINtUa1Ak4h1w3HtEGcPFdP1bDTsoWqm5RRUAQ/qaS6WQRT/JYhX0AXOpoM2evaQ==
X-Received: by 2002:aa7:c719:: with SMTP id i25mr72270108edq.157.1638179269572;
        Mon, 29 Nov 2021 01:47:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w24sm7063708ejk.0.2021.11.29.01.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 01:47:49 -0800 (PST)
Message-ID: <0e93f3c5-e8da-3412-1c2c-ec95347f0777@redhat.com>
Date:   Mon, 29 Nov 2021 10:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] platform/x86: lenovo-yogabook-wmi: Add support for
 hall sensor on the back
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20211128190031.405620-1-hdegoede@redhat.com>
 <20211128190031.405620-5-hdegoede@redhat.com>
 <CAHp75Veuaoq9htGpUPCgFzr1Ysc+6d-Li-OBqiE-ZqUbXzqMrA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Veuaoq9htGpUPCgFzr1Ysc+6d-Li-OBqiE-ZqUbXzqMrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/29/21 10:28, Andy Shevchenko wrote:
> On Sun, Nov 28, 2021 at 9:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On the back of the device there is a hall sensor connected to the
> 
> Hall (it's name)

Ack, will fix.

> 
>> "INT33FF:02" GPIO controller pin 18, which gets triggered when the
>> device is fully folded into tablet-mode (when the back of the display
>> touched the back of the keyboard).
> 
> touches?

Ack, will fix.

> 
>> Use this to disable both the touch-keyboard and the digitizer when
>> the tablet is fully folded into tablet-mode.
> 
> ...
> 
>> +static irqreturn_t yogabook_backside_hall_irq(int irq, void *_data)
>> +{
>> +       struct yogabook_wmi *data = _data;
> 
>> +       if (gpiod_get_value(data->backside_hall_gpio))
>> +               set_bit(YB_TABLET_MODE, &data->flags);
>> +       else
>> +               clear_bit(YB_TABLET_MODE, &data->flags);
> 
> assign_bit()?

Interesting I did not know about that one. I see that it
expands to exactly the same code though and I find
the current version more readable, so I'm going to keep
this as is.

> 
>> +       schedule_work(&data->work);
>> +
>> +       return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +       data->backside_hall_gpio =
>> +               devm_gpiod_get(&wdev->dev, "backside_hall_sw", GPIOD_IN);
>> +       if (IS_ERR(data->backside_hall_gpio)) {
> 
>> +               r = PTR_ERR(data->backside_hall_gpio);
>> +               dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw GPIO\n");
> 
> Can be
> 
>   r = dev_err_probe(...);
> 
> but I think you did that on purpose to make lines shorter.

Right, I did this this way to not make the lines too long.

Regards,

Hans



> 
>> +               goto error_put_devs;
>> +       }
> 

