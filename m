Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3496C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 13:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjCMN1y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 09:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjCMN1w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 09:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE16C5942E
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678714024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C3LBtxQh3FdZnjBFxxbwSxaTJMQwxJyDt7hyHTCGEwo=;
        b=ItVAGS2ea6ZPlIuPkmTPHdDHGb/+9KsNwCc1QUpmvs/drmhwitWhfmAtCYpDqpKXeqv8Hb
        eoYms+GbI3gGQNwy/FwXX9zrilkAZBYZfnwijpKHGhhd823IiSblDRL7Jg8KtA/Db6rtAX
        Qt2AkWLFd1tB+NIFi3REp7LUn/rrCA8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-HO5voTI0MDCqa6WJ5zpIRA-1; Mon, 13 Mar 2023 09:27:02 -0400
X-MC-Unique: HO5voTI0MDCqa6WJ5zpIRA-1
Received: by mail-ed1-f72.google.com with SMTP id r9-20020a05640251c900b004d4257341c2so16946486edd.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 06:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678714021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3LBtxQh3FdZnjBFxxbwSxaTJMQwxJyDt7hyHTCGEwo=;
        b=qZ4hMdVnQAV2PncRC+NXo/1im1tUGtVAqErElH54UoGmwtRK3e841CuHI5Yso+J7Gf
         IZw0UYSiZz2OTdhcQ/QPUOhODMvWAXyNA1/3KhyDH6Ez+l/43HERynMU9Yba9CV4JNti
         fDpqazJbSsANmKlJ3js503mG0DZB/OGUNpfb9jFfh7NCSKeuhRRGycFiVNaz0Gxt18eL
         1ur/nbF+OYjsmZf9KiUma3JeJDeyDVqyPTZppvR18eEzs7gWfRjAChsxZn3xNpoaqyF5
         ea5SWGD20dR66jeNXZ66dyHr061bKYMf1s1NEYNTkuiyUy95bLb86FyvrDSedIBZDFHm
         j4Ow==
X-Gm-Message-State: AO0yUKUoqDiq91AZeN4sjbG3xogcFovbLlOLeRHzE+eA2zNhGpKskgNo
        SZhEeFXY1vDH9fdjXi2PajvFPYvWgxias3FU0d41FXL0FUey+ARovc/7r2awYdcrelZ4j4Vq9Fn
        Jk+MXwPVs/e3iAbOor4rONbWJYexAZYrnxA==
X-Received: by 2002:a17:906:4cda:b0:870:58ae:842e with SMTP id q26-20020a1709064cda00b0087058ae842emr36065702ejt.24.1678714021467;
        Mon, 13 Mar 2023 06:27:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set/aSXKBNoNVmPl2BEccgtOzvp1ZVM/wg/Y0iZMHJMxd597CllBpEtwwgIWbNLXnaeEoCI0qFA==
X-Received: by 2002:a17:906:4cda:b0:870:58ae:842e with SMTP id q26-20020a1709064cda00b0087058ae842emr36065685ejt.24.1678714021191;
        Mon, 13 Mar 2023 06:27:01 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 6-20020a508746000000b004c5d1a15bd5sm2770120edv.69.2023.03.13.06.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 06:27:00 -0700 (PDT)
Message-ID: <d87df1ca-0fd7-bf8f-d4b3-2d4d0b79282a@redhat.com>
Date:   Mon, 13 Mar 2023 14:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: en-US
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Ed W <lists@wildgooses.com>,
        Philip Prindeville <philipp@redfish-solutions.com>
Cc:     platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <cb93fd68-5195-0d5e-cd40-5eba61df4c38@wildgooses.com>
 <3fffc76d-4e1b-4eef-3d9f-6d61cecacb46@redhat.com>
 <5F93DF5F-BEC4-4B2A-A057-A895282A66B2@redfish-solutions.com>
 <3a36b460-9108-5c83-b4f6-42b4718afcf0@redhat.com>
 <59ded4b9-04e9-d5d3-98eb-af0d4340a2fa@wildgooses.com>
 <b402d146-5110-970a-3f5b-8c4c4859ede1@redhat.com>
 <60af6134-3b0b-f8ec-1375-a9819a181911@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <60af6134-3b0b-f8ec-1375-a9819a181911@metux.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/17/23 14:50, Enrico Weigelt, metux IT consult wrote:
> On 13.02.23 15:25, Hans de Goede wrote:
> 
>> It would be good to know the ACPI names. Also what happens with the ACPI
>> registered LED devices when the pcengines-apu driver loads, does it
>> somehow unregister those ?
> 
> It doesn't (hasn't any code for that). But the even more interesting
> question is: does the acpi driver lock the IO space so my gpio driver,
> and so the apu driver itself, can't initialize at all ? Or are we in a
> situation where two different drivers meddle with the same chip ?

Since it seems that people are using a patched version of
the pcengines-apu driver with openwrt on newer models I would assume
that the answer here is: "No the ACPI code does not lock the IO space"
although it is unclear to me how the ACPI code exposes leds at all ?

Later in the thread you write that they do some hacks to expose
all io-space of the FCH as gpios and then presumably the embed
devicetree-bits pointing to those new GPIOs into ACPI to make
the leds-gpio.c code handle the LEDs ?

> 
>> If the ACPI LEDs are not unregistered and keep working, then I guess there is no userspace
>> API breakage when using pcengines-apu on newer APU models, "just" duplicate LED devices ?
> 
> Supporting both LED name schemes on the newer boards is an interesting
> thought. Do we have some way for aliasing LED names ?
> 
> OTOH, I wonder whether we need the model specific LED naming at all.
> In the old apuv1 driver, there used to be some (unsupported) LED-only
> support for apuv2, which used model-specific naming. When adding full
> apuv2/v3 support, I specifically chose not to do this, since I don't want userland having to care about the specific model version. And the
> naming is a bit more clear on the actual meaning of these LEDs.
> 
>>> - Additionally, we already broke this in the (distant) past because there was a previous APU driver
>>> which used different names still...
>>
>> Just because we have gotten away with it once, does not mean we should do it again :)
> 
> Back then the situation was different. Haven't even found anybody who's
> was actually using this in the field. This ancient driver (actually made
> for acpuv1, which is totally different HW) was only serving the three
> front LEDs, nothing else, and blocked using the other GPIOs (eg. button)
> Some people out there did weird hacks by directly writing registers from
> userland (obviously w/o loading the ancient driver) - and even worse:
> pcengines publically adviced to so.
> 
>> For the new models I'm fine with whatever LED naming is preferred.
> 
> NAK. The problem here is: userland now has to differenciate between
> various models again. Applications suddenly need to be rewritten in
> order to work with the next higher model, or it fails. That might be not
> a problem for home users, but in the industrial field it is a huge
> problem: you suddenly end up with two product configurations or need
> extra SW complexity to cope with several models at runtime - and this
> even grows with the next one.
> 
> Exactly what I wanted to prevent once and for all.

Note that making applications work OOTB on newer platforms is nice
to have, but is not specifically a blocker from the upstream kernel
review pov.  Userspace needing to adjust to e.g. /dev/sda becoming
/dev/nvme is not considerer userspace API breakage and this is
more or less the same.

Still I agree that preserving the userspace API across different
board models is something which we want to do if possible.

> Since the meaning of these LEDs doesn't change, there's just no need to
> change their naming.

I agree that if the LEDs have the same function as before the name should
be preserved to not needlessly make life harder for userspace consumers
of these LEDs.

Regards,

Hans

