Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F86DCCA47F
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 14:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiGIOqH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 10:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiGIOqG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 10:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18945329
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657377965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4vhAlWCP2MzKZuVygchvSobxAm0RIMqx0Q+qkLptHnY=;
        b=FJ/+YgR43k1njk98AR250def0Avabhqyj9uuqpv7Gx308r3od2X3BczPuOZ+qhpuqyzZq/
        NZ+yJ1ZOyEKDTZXo/0DuTaWysrku9brqsffK+pNfuKXNZkpLvFNY7zeUhbl9B3tyKlAlsg
        lcX8jPGtqr03FuTU0UltaEvmm40Pn9I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-aRwGfOa6P7i_zt-zawVB5Q-1; Sat, 09 Jul 2022 10:46:04 -0400
X-MC-Unique: aRwGfOa6P7i_zt-zawVB5Q-1
Received: by mail-ed1-f72.google.com with SMTP id x8-20020a056402414800b0042d8498f50aso1114586eda.23
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Jul 2022 07:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4vhAlWCP2MzKZuVygchvSobxAm0RIMqx0Q+qkLptHnY=;
        b=XNwKrF/Z+TQprdZF3vQloNUNr13Axa550CADVJQfGMbUaZsj/1vps+3iEcHyk1PdYd
         T8t+gJ8KUCKeBFL39wbV/ralymVBjjpZU6RfIM8Ccag89cdb+/uhHGpTLv1gAeqhZ5Zp
         WvGDiZN1vlqSSnFxtZG1oZzFdjTUUY6E7SjwBHYNLT+zKnxBMXExKbZ1MobaNoOH+xW3
         mH2/OaPFn++wzh23pPw7Nn+Ha0uVO5+hqlHtOUThJxY6AF6dx+x/Tkwio5BVy1MjV2bH
         xqyG3d0HPxV74hixlV4h9WvO9DXEs6ISTSZ/d9kKnehBVYD5cbJtV1iNJsXYG8bU/UH+
         /LSg==
X-Gm-Message-State: AJIora8cDJ02Rxftvs6mcMNj6OaTNLGrRqZ+Ra1Aga1PpfHmTOTdxbw1
        hzoZ9SA6RPb6DWjiUMhzM3OzCuiZpsdz+XU47zL615vfTUPaMaAinDWBdriFdPKcbQs7+/IpQI4
        zRHEcCPhYKxIVUcFwKvRHjOJpFsPXpH+qqQ==
X-Received: by 2002:a05:6402:1d97:b0:43a:7b45:8e14 with SMTP id dk23-20020a0564021d9700b0043a7b458e14mr12043882edb.418.1657377962349;
        Sat, 09 Jul 2022 07:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQGOEsKzJwFUH7DiaCllX6STXI1KJdek/zl/mHSX1WMMzYUNZJ1Z6mfJdhQiBX66tC4r2TdQ==
X-Received: by 2002:a05:6402:1d97:b0:43a:7b45:8e14 with SMTP id dk23-20020a0564021d9700b0043a7b458e14mr12043869edb.418.1657377962149;
        Sat, 09 Jul 2022 07:46:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090630cd00b0072637b9c8c0sm651574ejb.219.2022.07.09.07.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 07:46:01 -0700 (PDT)
Message-ID: <10c418eb-78a4-294f-adc4-d08db07dc67c@redhat.com>
Date:   Sat, 9 Jul 2022 16:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 2/7] platform/x86: serial-multi-instantiate: Improve
 autodetection
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Gross <markgross@kernel.org>
References: <20220709000636.35550-1-andriy.shevchenko@linux.intel.com>
 <20220709000636.35550-2-andriy.shevchenko@linux.intel.com>
 <9826f272-ed7d-1daa-c852-6f353258bb2b@redhat.com>
 <CAHp75VfVoTcZD7vXxXckxu-crsXr7m4bx8F9D9cs2TtBbyeYqQ@mail.gmail.com>
 <154a12ef-29a7-8189-1a5d-648dc92cffd3@redhat.com>
 <CAHp75Vcfr9mjgWPRwg8i5OatEyLCDR-vMazarSAtJXd_-Fee-w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcfr9mjgWPRwg8i5OatEyLCDR-vMazarSAtJXd_-Fee-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 7/9/22 13:34, Andy Shevchenko wrote:
> On Sat, Jul 9, 2022 at 1:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 7/9/22 11:52, Andy Shevchenko wrote:
>>> On Saturday, July 9, 2022, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
>>>     On 7/9/22 02:06, Andy Shevchenko wrote:
> 
> ...
> 
>>>     So nack for this
>>>
>>> This effectively means nack to the series.
> 
>>> But it’s easy to fix. I can add check for ret == 0.
> 
> So, are you okay with fixing it this way? See below how.
> 
>> I don't see how this is a nack for the series, just drop 1/7 + 2/7
>> and rebase the rest. Yes there will be conflicts to resolve in
>> the rebase, but the rest of the cleanups can still go upstream
>> after the rebase.
> 
> Because patch 3 makes a little sense on its own if we drop the patch
> 2. The rest is the simple cleanups which I do not consider as a core
> of this series.

Patch 3 just removes the adev == NULL check and pushes
the ACPI_COMPANION(dev) calls into the function needing
the adev, I don't see how that relies on this patch ?

>>>     >       case SMI_AUTO_DETECT:
>>>     > -             if (i2c_acpi_client_count(adev) > 0)
>>>     > -                     return smi_i2c_probe(pdev, adev, smi, node->instances);
>>>     > -             else
>>>     > -                     return smi_spi_probe(pdev, adev, smi, node->instances);
>>>     > +             ret = smi_i2c_probe(pdev, adev, smi, node->instances);
>>>     > +             if (ret && ret != -ENOENT)
>>>     > +                     return ret;
> 
> /*
>  * ...comment about why we do the following check...
>  */
>  if (ret == 0)
>   return ret;

I'm ok with doing things this way. Note you then end up with:

             if (ret && ret != -ENOENT)
                     return ret;

             if (ret == 0)
                     return ret;

Which can be simplified to just:

             if (ret != -ENOENT)
                     return ret;

> 
>>>     > +             ret = smi_spi_probe(pdev, adev, smi, node->instances);
>>>     > +             if (ret && ret != -ENOENT)
>>>     > +                     return ret;
>>>     > +             if (ret)
>>>     > +                     return dev_err_probe(dev, ret, "Error No resources found\n");
>>>     > +             break;
> 
> if (ret == -ENOENT)
>   return dev_err_probe(...);
> return ret;

Hmm, we don't do this dev_err for the SMI_I2C / SMI_SPI cases,
I see 2 options to solve this:

1) Drop the return calls from switch (node->bus_type) {} instead
always set ret and then break. And do the:

 if (ret == -ENOENT)
   return dev_err_probe(...);

outside the switch-case

2) Drop the dev_err, the driver-core will already log an error for
the -ENOENT anyways.

Regards,

Hans




