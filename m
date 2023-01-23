Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9F5C54E94
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 17:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbjAWRZ4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 12:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233680AbjAWRZv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 12:25:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375C0449D
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 09:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674494704;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wz1OQUv/j5OjNY7PR057jS3xXH6p04f6vsRF7QSNmRE=;
        b=Z/Qm8ttivyoh+0wD15d9XR/5pxZekbEsBqtGcFCd0IAZpKe1KyBD1RmCVwADjNDzanrW2n
        /YL03RdBliB5VnWbhE+crs1IHmafGfHT+oe1GpggGbFU/MSxYycwmUV0TqlvWL0czrJb/u
        nqHw5FBh7RsAUxFlkuwMkOOJfyqnZWA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-cEE6oy38O9aWjUAuHh46nA-1; Mon, 23 Jan 2023 12:25:03 -0500
X-MC-Unique: cEE6oy38O9aWjUAuHh46nA-1
Received: by mail-ej1-f69.google.com with SMTP id hr22-20020a1709073f9600b0086ffb73ac1cso8228132ejc.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 09:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz1OQUv/j5OjNY7PR057jS3xXH6p04f6vsRF7QSNmRE=;
        b=8CFVVjPuz+dsmCRznNqKA39vZLSJ10/vsWuL711AhMQ1PVEkH6Cm/klQ4SbSD9f1Xq
         7U4b/XiVhhQsN/NupMbYzdBbzhWmKdpIWmKJM58mODVvT1lYETEhhbC/OizOeX1a3kZU
         aJRS+IKyqYdU/F7IVishPdd4qnXHJ4uSBTWrHuhQzxPbVBQLsnSn+whi2KeqcKQB8S3j
         Wf5Tzn9JR6uHtOOtARpLpqcp187zC7j0sJ/6eA/ZQo02dHHMr/JJaB+ORckd674wJTuN
         3MPfFaXqTSJYFuQwI9ymt4pqG+1PWqIDlUF20DH0NXFXe5QnopWePd1V1PHwDi5MDUf6
         7jog==
X-Gm-Message-State: AFqh2koty2JrAZFa6kHCgg0XNvg0tfNRJvzbSGyHTSC5ixh/2Ul9g4lK
        DOlIsRZKiztnkrGSreDvogDpSkphGgrtcbU65XVXVzIKmJurBBnFJ78rLX4F02wtpmhhUDXtdWs
        LbxzphLNvR4MEDW4cvzPElIY8OwwjSBYtpw==
X-Received: by 2002:a05:6402:449a:b0:499:d1ca:6d83 with SMTP id er26-20020a056402449a00b00499d1ca6d83mr27093100edb.2.1674494702201;
        Mon, 23 Jan 2023 09:25:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXto0/TI8VlAL9+qXM0cqei21dkUh2muTMa11VUJgwp1CxCZyNK/3zVFo3HmcngnDhSqA+SGCw==
X-Received: by 2002:a05:6402:449a:b0:499:d1ca:6d83 with SMTP id er26-20020a056402449a00b00499d1ca6d83mr27093095edb.2.1674494701995;
        Mon, 23 Jan 2023 09:25:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u9-20020aa7d889000000b00457b5ba968csm21625416edq.27.2023.01.23.09.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:25:01 -0800 (PST)
Message-ID: <7c0ae129-a737-5b7a-ed28-9a597d4170b8@redhat.com>
Date:   Mon, 23 Jan 2023 18:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] ACPI: video: Fix apple gmux detection
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Aditya Garg <gargaditya08@live.com>,
        Mark Gross <mgross@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>, linux-acpi@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20230123113750.462144-1-hdegoede@redhat.com>
 <20230123113750.462144-4-hdegoede@redhat.com>
 <CAHp75VeKfVVxfcWkiz1oHigryNNAy1PZYbbfh+OycViODV-jHg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeKfVVxfcWkiz1oHigryNNAy1PZYbbfh+OycViODV-jHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 1/23/23 17:37, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Some apple laptop models have an ACPI device with a HID of APP000B
>> and that device has an IO resource (so it does not describe the new
>> unsupported MMIO based gmux type), but there actually is no gmux
>> in the laptop at all.
>>
>> The gmux_probe() function of the actual apple-gmux driver has code
>> to detect this, this code has been factored out into a new
>> apple_gmux_detect() helper in apple-gmux.h.
>>
>> Use this new function to fix acpi_video_get_backlight_type() wrongly
>> returning apple_gmux as type on these new laptops.
> 
> ...
> 
>> -static bool apple_gmux_backlight_present(void)
>> -{
>> -       struct acpi_device *adev;
>> -       struct device *dev;
>> -
>> -       adev = acpi_dev_get_first_match_dev(GMUX_ACPI_HID, NULL, -1);
>> -       if (!adev)
>> -               return false;
>> -
>> -       dev = acpi_get_first_physical_node(adev);
>> -       if (!dev)
>> -               return false;
>> -
>> -       /*
>> -        * drivers/platform/x86/apple-gmux.c only supports old style
>> -        * Apple GMUX with an IO-resource.
>> -        */
>> -       return pnp_get_resource(to_pnp_dev(dev), IORESOURCE_IO, 0) != NULL;
>> -}
> 
> Oh, the leak is already somewhere... Lemme cook a patch...

This code is very likely going away, with a Fixes tag
for the original commit which introduced it.

So IMHO it is best to let the leak be (I will fix it
in the replacement in this patch-set).

This patch-set fixes an actual regression and is intended
for stable. So also having a leak fix "flying around" is
only going to confuse things.

Regards,

Hans


