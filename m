Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2617DC6379F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Feb 2023 15:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjBQPSJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Feb 2023 10:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjBQPSI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 10:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB5E66045
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 07:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676647043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DPdNLt/I3ktzcdYZVdwbdQK/qn4M4szYVUn8ufCGVWg=;
        b=fZj34niRcD+7fKbpQdiBnAvujvXVStSemD9EOobWn7mIqaAiOLpi5GICxbLqbP67UV3d0V
        gA6AwDS0dIxDx1ReaOpAlboJa/QlpmqBso/idgGnRlY35Ag4X9J8u+5Dq8PeqRFz0F2R3U
        tovDIhPPPkCbvPFvT6bkrzNz2hQYExk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-kEF3Ex2sNKa9u-nB98v-sg-1; Fri, 17 Feb 2023 10:17:22 -0500
X-MC-Unique: kEF3Ex2sNKa9u-nB98v-sg-1
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b004acbf564d75so1424480edw.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 07:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPdNLt/I3ktzcdYZVdwbdQK/qn4M4szYVUn8ufCGVWg=;
        b=77kbJMEWagRIiNg2jJQlhaQFo1/2tCP/G/T0dr/YNotztAiat0YV3QXKVDaQ/VhuEo
         KlTr605V7i8HsL9fuibNKf9HViZ+pGY8X870SZPbpFIQwgrWJD9wk828c5X+CHwI5Zsr
         lW1yoLnp/Qli4kiOvgmJWn1Ya6dEpin0EEZe/lDGpLRy/PK2vLhJ9RnXITvyfOvPKl+l
         FyJNnvymXXo05fh5WsmUV3Pk7zjo/uk5JCyUtPaph0MRABklRKJWoKj6wRuY+ZIlJujk
         p17bQNiHga19iWTkO26VEFbgbR9jGMFNxCUTSXYFHY1MXCHiEeCpTvE4kzP83QyVVAJ5
         3NyA==
X-Gm-Message-State: AO0yUKUjsMTYLczpxeu23iOJnC+jSCJBQ2Crg876XxzHEf6StqQMIWIY
        55Pto4s3XeyEWTO8F47I5hKGUm5mcpUg/MS0u8zRxQHt8euRedbyHmd+Y+JV/i4RPsB68O2/UII
        S+qPO3YsaHWSsEF8cf0RAE6toqqEIn8pkVA==
X-Received: by 2002:aa7:c04c:0:b0:4ac:c81d:149e with SMTP id k12-20020aa7c04c000000b004acc81d149emr983492edo.40.1676647041596;
        Fri, 17 Feb 2023 07:17:21 -0800 (PST)
X-Google-Smtp-Source: AK7set95d7uFKB8IJ0iHFbs0uLlQgiFhEuup5YULrphi8q94ZPihBpGo+8toH2Gq3iAoqg04Pmz3HA==
X-Received: by 2002:aa7:c04c:0:b0:4ac:c81d:149e with SMTP id k12-20020aa7c04c000000b004acc81d149emr983472edo.40.1676647041342;
        Fri, 17 Feb 2023 07:17:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x72-20020a50bace000000b004acbe8255f1sm2419715ede.86.2023.02.17.07.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 07:17:20 -0800 (PST)
Message-ID: <f70070f7-e4d6-9373-d3af-f781160c9e25@redhat.com>
Date:   Fri, 17 Feb 2023 16:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Acer Iconia One 7
 B1-750 data
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230217150012.32094-1-hdegoede@redhat.com>
 <CAHp75Vdou0d83E4C8Hr2aFyt+EeC-e+7szt0r+jn2nCsZNwQWQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vdou0d83E4C8Hr2aFyt+EeC-e+7szt0r+jn2nCsZNwQWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/17/23 16:10, Andy Shevchenko wrote:
> On Fri, Feb 17, 2023 at 5:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Acer Iconia One 7 B1-750 is a x86 ACPI tablet which ships with Android
>> x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not
> 
> a factory
> 
>> actually there, causing various resource conflicts. Enumeration of these
>> is skipped through the acpi_quirk_skip_i2c_client_enumeration().
>>
>> Add support for manually instantiating the I2C + other devices which are
>> actually present on this tablet by adding the necessary device info to
>> the x86-android-tablets module.
> 
> ...
> I'm not against this patch, but what I have noticed is...
> 
>> +                       .chip = "INT33FC:02",
> 
> ...this. Can it actually be changed to HID + UID?
> 
> Yes, I know that above probably will in 99.999% cases work, but it's a
> little bit fragile.

"INT33FC:02" is the gpiochip name and is also used for gpiod_lookup_table
entries which also go by gpiochip-name and we cannot just go and change
long time used gpiochip names since those are also part of the ioctl
GPIO access userspace API.

Note by the way that ACPI device enumeration always happens in the same
order, so these names are perfectly stable.

Regards,

Hans



