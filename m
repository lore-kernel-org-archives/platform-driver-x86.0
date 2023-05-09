Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9027EC7EE22
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 09:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbjEIJ3M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 05:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjEIJ3M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 05:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811321A4
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 02:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683624505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8fH/0gqnejY1KJuoaq7lUuqNeU8o3TBJSw/luOwGD3M=;
        b=OYaVkBMFCbUNHPy8gsLIy+OPqStEwCE0TKPOm8Cfao5F6wcLm26CO9TJD0Ty2Nok2yaCsD
        AubLt/cq5HDUN13ABHRibNmqz7zdlvh2f6N8E/uudqE8IIjvgNpfML/XZumYiqx4qc0D3y
        r2T1Xn7oYpJcr3v/S21o7/gxn3QxW/g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360--yNkLGz0NYKyxkh5W0sH-g-1; Tue, 09 May 2023 05:28:24 -0400
X-MC-Unique: -yNkLGz0NYKyxkh5W0sH-g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50bd1f08901so5372478a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 02:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624503; x=1686216503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fH/0gqnejY1KJuoaq7lUuqNeU8o3TBJSw/luOwGD3M=;
        b=bA39vEYEoBQv83wwJ5rjjVhvUBIX331zWUpsezM47tBEAO/Rg2tR8eECWDMOsbCEEa
         MBfQiDiqkReFAVpk3eGuYb02463hdW/24qjz4WX43kfhZ7V9NuT5shz7lKw3B8tT1rPP
         5UxaOlb6EYF1SiuI2zT+VaRnQoeE4eTdFvNt2Br5JL4GKegSxyeR+IA+ODpehcEGrqtL
         e5H7rBOzHQZge/t/UEZAJUfWBA6UO5bX2vEbQgAtUu2daZTZpuumfBwUkDvKyydN10so
         UskDLktkJMVDkqsjs3FRP2T4TF01CfulIzYen/asOivBpMSvQe+Gs20LdKWkCWdLSiZX
         gQmw==
X-Gm-Message-State: AC+VfDx1kB7jnDX/JaWHIrcq3wekQ21SxFMuA7KvVyMIlS6ZAoCX79oW
        +m5rNdP6GX2GXX0NQutXyC2+ROjnj0fzl5omngVSoRu+TUbSPzxmgs1P2D3q2g42gJ4dJS+x7Nw
        ri6dJZx1RATHX/XNoSKITttLJnK7qlMsPX1iXgocZfg==
X-Received: by 2002:aa7:c389:0:b0:504:80d8:a034 with SMTP id k9-20020aa7c389000000b0050480d8a034mr9526106edq.40.1683624503012;
        Tue, 09 May 2023 02:28:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51TKcQFdCeH5VV5UUILy1U292848J7I0ez1onznbIZSOwmLhX2rGLXxCd0jX8BYO9zPsyYXQ==
X-Received: by 2002:aa7:c389:0:b0:504:80d8:a034 with SMTP id k9-20020aa7c389000000b0050480d8a034mr9526093edq.40.1683624502741;
        Tue, 09 May 2023 02:28:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7c695000000b0050bdd7fafd8sm568361edq.29.2023.05.09.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:28:22 -0700 (PDT)
Message-ID: <a9dddb33-acc0-9b2f-4d9f-d78ece8e7aec@redhat.com>
Date:   Tue, 9 May 2023 11:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] platform/x86: x86-android-tablets: Add Nextbook Ares
 8A data
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230429105057.7697-1-hdegoede@redhat.com>
 <20230429105057.7697-3-hdegoede@redhat.com>
 <CAHp75VfaN4Az9OHVG2OfmgsqD8DmoY2VsmQ_5mvYF414_xDX1A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfaN4Az9OHVG2OfmgsqD8DmoY2VsmQ_5mvYF414_xDX1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/23 13:59, Andy Shevchenko wrote:
> On Sat, Apr 29, 2023 at 1:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Nextbook Ares 8A is a x86 ACPI tablet which ships with Android x86
>> as factory OS. Its DSDT contains a bunch of I2C devices which are not
>> actually there, causing various resource conflicts. Enumeration of these
>> is skipped through the acpi_quirk_skip_i2c_client_enumeration().
>>
>> Add support for manually instantiating the I2C devices which are
>> actually present on this tablet by adding the necessary device info to
>> the x86-android-tablets module.
>>
>> Note the Ares 8A is the Cherry Trail (CHT) model, the regular Ares 8
>> is Bay Trail (BYT) based and was already supported. This also updates
>> the comments for the BYT model to point out this is the BYT model.
> 
> ...
> 
>> -               /* Nextbook Ares 8 */
>> +               /* Nextbook Ares 8 (BYT version)*/
> 
> Missing space.

Thank you, I've fixed this while merging this.

I've added these patches to my review-hans (soon to be for-next) branch now.

Regards,

Hans



