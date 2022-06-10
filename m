Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAEEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 20:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243284AbiFJU3B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 16:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244799AbiFJU3A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 16:29:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 217EB3002C4
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 13:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654892938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+u44QcXVdJwe6eSMGtGuv2o7tQ9H97sb2AU9wHQqPIU=;
        b=DKzwtaeOuoBHJ7xeifoxvaTQp5PkidETzWn0qJ3bQLr0kuyxW5lYN73HNBWKIomrHM3PZd
        OUQUwKd7wzZCJad33f60a0S1gb0u+D7P0rliDB49psnmRf8TEcKHbd8I55gPBl7K6oa0hc
        Ys/3QehkE0Dba+URmypxWhyvsROvJaY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-LEzrqeiJMIO99MFwXQQOQg-1; Fri, 10 Jun 2022 16:28:57 -0400
X-MC-Unique: LEzrqeiJMIO99MFwXQQOQg-1
Received: by mail-ed1-f69.google.com with SMTP id x15-20020a05640226cf00b004318eab9feaso161531edd.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 13:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+u44QcXVdJwe6eSMGtGuv2o7tQ9H97sb2AU9wHQqPIU=;
        b=5C1cKKwlcvWFO2ongx6ZV5QtBvD4D6Eu2h6V2io/nRQgGKpZ54OGagZy15RJNm9zVD
         yU6+ibhkuETjBBdZW1F83jPmS2LC0xolgMUEHanCcoRFiUqR7kdgAz5MXB0FGi1nkElG
         IT7e8LT5yXRgZbYCCSiKUQRW6X3q+9OMquZnc+9NgfLlIGMVkKdXhZz6uIHJGktskvp5
         t7AG3iRoweJadochJo+BjbSFWM9pai8rjVbeYQqTouIKXUuNswgyzk/pqW1loTvyd8QM
         NbE1IUbBCMMlaINVBuGI4UW8oBo56ZLuLOafwiEzNWYoWaXdIS8fHW58K6gdtLwkivhH
         JE0A==
X-Gm-Message-State: AOAM532RyXuCI/A6euyZ9Y7cnyLtFIyVFgXcZZThlHZm+wHzsPBlj3k3
        AetqnBMao6M1vukaPfVoZYA40rYAHQxhFzsxnnAvadtR1AWIaN4Awzyxpl6q8NSCj+RpzO3Svaw
        Wucn9VOoErS3xvrOaILwSatKbBCxgQPjZ1w==
X-Received: by 2002:a17:906:3b87:b0:70d:3189:6aae with SMTP id u7-20020a1709063b8700b0070d31896aaemr38099320ejf.222.1654892935925;
        Fri, 10 Jun 2022 13:28:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL1o8NDwMcR2lxf3dBDZIYC5j427/sL6njURQZaHh8eayUk0h4euQQRb+G6NTF6gOAZZwTqA==
X-Received: by 2002:a17:906:3b87:b0:70d:3189:6aae with SMTP id u7-20020a1709063b8700b0070d31896aaemr38099311ejf.222.1654892935696;
        Fri, 10 Jun 2022 13:28:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id s11-20020aa7d78b000000b0042bca34bd15sm99170edq.95.2022.06.10.13.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 13:27:25 -0700 (PDT)
Message-ID: <e92f2e19-7303-f7bf-a5b5-dd7b236161cc@redhat.com>
Date:   Fri, 10 Jun 2022 22:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86/intel: hid: Add Surface Go to VGBS allow
 list
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Duke Lee <krnhotwings@gmail.com>
Cc:     Alex Hung <alex.hung@canonical.com>,
        Mark Gross <markgross@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220607213654.5567-1-krnhotwings@gmail.com>
 <CAHp75Vfzd+sWWffUHkAbXo-tU8rBnq1f+VUeDFWPtu46sxF=DQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vfzd+sWWffUHkAbXo-tU8rBnq1f+VUeDFWPtu46sxF=DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/8/22 12:49, Andy Shevchenko wrote:
> On Wed, Jun 8, 2022 at 7:48 AM Duke Lee <krnhotwings@gmail.com> wrote:
>>
>> The Surface Go reports Chassis Type 9 (Laptop,) so the device needs to be
>> added to dmi_vgbs_allow_list to enable tablet mode when an attached Type
>> Cover is folded back.
> 
>> Relevant bug report and discussion:
>> https://github.com/linux-surface/linux-surface/issues/837
> 
> It can be a BugLink tag instead.
> 
>>
> 
> BugLink: https://github.com/linux-surface/linux-surface/issues/837
>> Signed-off-by: Duke Lee <krnhotwings@gmail.com>
> 
> I believe Hans can tweak this on the fly, so
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Right, I've just merged this into my review-hans branch,
with the BugLink tag added. I'll also include this in my
first fixes pull-req for the 5.19 cycle.

Regards,

Hans



> 
>> ---
>>  drivers/platform/x86/intel/hid.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
>> index 216d31e3403d..79cff1fc675c 100644
>> --- a/drivers/platform/x86/intel/hid.c
>> +++ b/drivers/platform/x86/intel/hid.c
>> @@ -122,6 +122,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>>                         DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible 15-df0xxx"),
>>                 },
>>         },
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go"),
>> +               },
>> +       },
>>         { }
>>  };
>>
>> --
>> 2.36.1
>>
> 
> 

