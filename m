Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C955AC352A1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Nov 2022 10:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbiK3KiO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 05:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234531AbiK3KiN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 05:38:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A0445ED7
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669804637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLa8AzlHOrSU45KCtzXisqtvFoABjHdv0YQ5GJeGwu4=;
        b=P7HLdWVaR6Rt/CgAwBSXXj8Cf/YlJuy1vGmRDgltWTA3TqSmMTm5ERN4rgXxdi/0lA+bhw
        8kvTxduRD24KzG344fRurUxzWoQwmlXNiWnWomZmq19Xi5Nb0Xk7NZhjHsyVoBoTDVp6wB
        m3CdwGkpf/XpGY+BwDBKyb3ry/+XeS0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-WjNp92EYOLmKbmUGQFu2eg-1; Wed, 30 Nov 2022 05:37:15 -0500
X-MC-Unique: WjNp92EYOLmKbmUGQFu2eg-1
Received: by mail-ej1-f69.google.com with SMTP id hq18-20020a1709073f1200b007ade8dd3494so8182505ejc.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLa8AzlHOrSU45KCtzXisqtvFoABjHdv0YQ5GJeGwu4=;
        b=czj+gwUIdyNWeY8OB93J9sEL376zotX8HcONuU5dHg8dOLbum5EdPV1xhWF7RvYGTx
         FwFW81fK/xKy+wj1qwKOCCl36oQWOcYbJPJAl4ETg+yitysosJfwOKHmAVv7wc41SO1o
         1vxxE7/dwjgvJ1Qw5PlsxDPgtX2Z2JXfijvlao8OAuXoOPh6WajoDOGFfLhBw+kmYciV
         qOmg94AdDV0ycyuOBPpaXh8KaLJxirGz9oHc/rXPxHevHMJOQA2ypGiszmhIjzGDmIMk
         G3HKN/akdeyLafahvkINn9z8QUoNvuZDIMxdMOj3W+PjcAObDHUEx37eetoVVODQpdat
         GMsQ==
X-Gm-Message-State: ANoB5pluBkurZHCihTBWKjAMgdu+MHdQZD/iupObD63W/U+EqKYx1L1/
        EXjT9RU/k/00Fm6S5B4dIAFXX872PU5vFcQD6AopO1ooo64vRG2lYTp8MJUusvc57T1n4kWYTNu
        Xg0AairT7JY0vY/n8paGJH/cYtkvoPDRU3w==
X-Received: by 2002:a17:906:5052:b0:7a9:6107:572a with SMTP id e18-20020a170906505200b007a96107572amr51852673ejk.729.1669804634205;
        Wed, 30 Nov 2022 02:37:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5zisYgipQtHZ4HF/gBS6f6BFGjROtSKjpzmYfhuTkOkz2fzYYatOo58K4pqM52J+8h9JqQeA==
X-Received: by 2002:a17:906:5052:b0:7a9:6107:572a with SMTP id e18-20020a170906505200b007a96107572amr51852666ejk.729.1669804634023;
        Wed, 30 Nov 2022 02:37:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb88000000b0046ac017b007sm485594edr.18.2022.11.30.02.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:37:13 -0800 (PST)
Message-ID: <21624116-0d91-4e5a-7fd2-7bc5eb6e3b72@redhat.com>
Date:   Wed, 30 Nov 2022 11:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/6] platform/x86: int3472/discrete: Ensure the clk/power
 enable pins are in output mode
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-6-hdegoede@redhat.com>
 <CAHp75VdQqJu1YRozd5-qKKn5W9Rk_fLyzfHm0+HVDcgg0heCDA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdQqJu1YRozd5-qKKn5W9Rk_fLyzfHm0+HVDcgg0heCDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/22 10:59, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
>> specifying that the pins direction should be initialized to a specific
>> value.
>>
>> This means that in some cases the pins might be left in input mode, causing
>> the gpiod_set() calls made to enable the clk / regulator to not work.
>>
>> One example of this problem is the clk-enable GPIO for the ov01a1s sensor
>> on a Dell Latitude 9420 being left in input mode causing the clk to
>> never get enabled.
>>
>> Explicitly set the direction of the pins to output to fix this.
> 
> ...
> 
>> +       /* Ensure the pin is in output mode */
> 
> ...in output mode and non-active state */

Ack.

>> +       gpiod_direction_output(int3472->clock.ena_gpio, 0);
> 
> ...
> 
>> +       /* Ensure the pin is in output mode */
>> +       gpiod_direction_output(int3472->regulator.gpio, 0);
> 
> So, previously it was AS IS and now it's non-active state. I believe
> this makes no regressions for the other laptops / platforms.

Correct, and no regression intended indeed. I'll add the improved
comment when merging this (unless there are other / bigger
reasons for a v2).

Regards,

Hans


