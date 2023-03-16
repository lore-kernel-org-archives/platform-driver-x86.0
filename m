Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC86FC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 17:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCPRc2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 13:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjCPRc1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 13:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D14AD03C
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678987873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/08vluPjzxrx+ms2g2CAdKVV//z599hvAytsqxrTszw=;
        b=bo0rsUGJTEIKkFAchoGwEwfBWWJUwrw+fNUUUHNSfXqBK0d86f8AlwDBVKwn0uH7hgrFKD
        ueVaVV40fRwgTylTVbYEksNmMIwBBWiwjYHbhx2Fh6GSCTm9fIlHr+5MM0k2pG5sLxfKPB
        0RC3WBZFlqs3GFiVkslta8Hw72YClww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-8NyrHGE0NGCW6gbXYuE-rw-1; Thu, 16 Mar 2023 13:31:10 -0400
X-MC-Unique: 8NyrHGE0NGCW6gbXYuE-rw-1
Received: by mail-wm1-f69.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so939193wms.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 10:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678987869;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/08vluPjzxrx+ms2g2CAdKVV//z599hvAytsqxrTszw=;
        b=LGWdIv+YRnTzmMSAlmgZzmoo2mbjMaaoj2z3KDM+pfqt5qDVqYeYYe6NoBbxwP8Bow
         Xmvvet1D5X4aJfMRQPmRS+Z43zAZshsG4kHMRE3Vd4iGEdeVGOMnoIhyLujTE+mAhud7
         T2IWoLpvLM8rOXdv1N+dizGfVwdl0FcSJJLSFH/TQQVU6GCr5MVzhSnvj53XrDJf0p0b
         b7BIbN7q17Q67VAd4lZSBwzJuOuSzV03lWIVPWild2XjjiySFRlCr01p+VnHITgdwZ3G
         Xgwl0PbyRtYQNggrRc82GqSOcwZAeUxfN3vidrIPooyHj8fImGBErzpDI69przWQZRXx
         3twA==
X-Gm-Message-State: AO0yUKUzlnqtqyx92pZl8TgZqfrNti9v0paIi0GqBW63IrZtZZzOEv3r
        TnSD6/VOQHQpjabbMyYGimYDYR1qG1HlGNcL3XaLDOX5gLrgI7v5C0AclQ/bGsyYomxEBlyEY/9
        zRxQDDOe+GwWvlwLPDsUsQAA6/FvTjI5nzg==
X-Received: by 2002:a05:600c:34c3:b0:3eb:5ab3:b6d0 with SMTP id d3-20020a05600c34c300b003eb5ab3b6d0mr22301110wmq.6.1678987869083;
        Thu, 16 Mar 2023 10:31:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set8in/lkI4jv3umpLr5SfG/+NupQAriJfTTzpU2lr1Cm4vESkvwCGyoOm7e3Bzmv2djyZ7kNsQ==
X-Received: by 2002:a05:600c:34c3:b0:3eb:5ab3:b6d0 with SMTP id d3-20020a05600c34c300b003eb5ab3b6d0mr22301088wmq.6.1678987868741;
        Thu, 16 Mar 2023 10:31:08 -0700 (PDT)
Received: from localhost ([90.167.94.186])
        by smtp.gmail.com with ESMTPSA id e25-20020a05600c219900b003ed1fa34bd3sm5477336wme.13.2023.03.16.10.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 10:31:08 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
        Daniel Oliveira Nascimento <don@syst.com.br>,
        Mattia Dongili <malattia@linux.it>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] platform: olpc: mark SPI related data as maybe unused
In-Reply-To: <51d9b1de-5f22-2085-1d3e-6c29afb44120@redhat.com>
References: <20230312132624.352703-1-krzysztof.kozlowski@linaro.org>
 <63814b1b-1297-da4d-79fe-8f2e58e30482@redhat.com>
 <f9408067-ee3c-9f5b-d1b3-7017113c8026@linaro.org>
 <51d9b1de-5f22-2085-1d3e-6c29afb44120@redhat.com>
Date:   Thu, 16 Mar 2023 18:31:07 +0100
Message-ID: <87o7osli1w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hans de Goede <hdegoede@redhat.com> writes:

[...]

>>> Exposing modaliases for a non supported way of binding the driver does not really seem useful ?
>> 
>> However binding the device and module loading (uevent) uses sometimes
>> different pieces. Maybe something changed in kernel, but sometime ago
>> certain buses where sending uevent for module loading with one ID (e.g.
>> platform or spi bus) but device matching would be according to OF. Thus
>> if you did not have entries in spi_device_id, the module would not autoload.
>> 
>> It was exactly the case for example here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c46ed2281bbe4b84e6f3d4bdfb0e4e9ab813fa9d&context=30&ignorews=0&dt=0
>> 
>> You needed spi_device_id for proper module autoloading.
>> 
>> Unless something change in between in the kernel?
>
> Looks like your right, the spi_uevent() code always emits "spi:xxxxxxx" style modalias even for dt/of enumerated devices:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/spi/spi.c#n398
>
> So the table needs to stay.
>

Yeah, and in fact dropping the spi_device_id table will cause the kernel
to warn that an spi_device_id entry doesn't exist for a given of_device_id
entry since commit 5fa6863ba692 ("spi: Check we have a spi_device_id for
each DT compatible").

Fixing that is not trivial because a lot of drivers are rely on current
behaviour of the SPI core always returning a spi:<dev> modalias. So don't
even have an OF table, even when the SPI devices are instantiated by DT.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

