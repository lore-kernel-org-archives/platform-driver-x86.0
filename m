Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B16AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 14:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244558AbhLFOZd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 09:25:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44856 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242034AbhLFOZc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 09:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638800523;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HIOBuhv1dlz9DZ1sKAPX9K8OJaVKpBLu0/3Ve9MBFDY=;
        b=a6xqwueGl7mNa6Zi3xEtNXPtWLUu22NlsYZ92j7qZDdrAlOdofr31F8Gn2aYipLvBj6aM9
        eLIwt3nxNUQEirqGO5ggzRkPszsnIPMoQz89cFTzjKzaGnqlmyuOjrjpOa3ZEfn0D0UXMm
        n5LJsI+fT8UIWSJuHXZJdDXoneDcnSk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-u3u-MyNuMyGTBVkQu9NCOQ-1; Mon, 06 Dec 2021 09:22:01 -0500
X-MC-Unique: u3u-MyNuMyGTBVkQu9NCOQ-1
Received: by mail-ed1-f71.google.com with SMTP id a3-20020a05640213c300b003e7d12bb925so8504914edx.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Dec 2021 06:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HIOBuhv1dlz9DZ1sKAPX9K8OJaVKpBLu0/3Ve9MBFDY=;
        b=UBtTrF5fXJ6Y4YPT+inU3SwAJi7y0NTg14PlkaBYDEa5t0qptv51UwY0r5XAXMEPp+
         tta/im52oRAc/GK+ies9UgnPee01u+0RmNdLhe/ZNpoU1sTamFE2tmUtzAKmBionT75a
         zxeinSM+REzvmNtZY3/cK3S+3uQZBmfD/rJf3sLHVZ0knyy3Zv2dD0B5f3+dmfaUkm2/
         OdIesqzXxXFTn9Gat913gGTs3pIAOxi1Pq8Rh6YYaD/2QYwAQFHaZyCetGKeIQmWzlD1
         hcLXQOV4B3kpLDSAy7NmK3/2S7K3GpbhzAbgKijo+7v/UhfAqOtA/9rG2XjQhJ82B3WG
         YMdw==
X-Gm-Message-State: AOAM530+3SJU/bTW/zsNoOVElMvhzCEIPbhIU8mvNGmOwKg/JEbMQyhr
        3crJ+Gl6rxlgaroq+ql2DBZO1Up6Y0dOIaPZ0nDaVPvin9jRGYCE0S2h8dfJXVKp21P/6gA5a10
        nYadtGERc61jivZgyxWbPGzIZYxAbSaU9SQ==
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr54157139edd.245.1638800520490;
        Mon, 06 Dec 2021 06:22:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaJQvEBbBG2XPniqV6BSWrmsgBsZ9awJAVuDdlTWazzpoULwi3lqxHg0Ngw2C06lmg/h4WGA==
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr54157118edd.245.1638800520309;
        Mon, 06 Dec 2021 06:22:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f16sm8438710edd.37.2021.12.06.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 06:22:00 -0800 (PST)
Message-ID: <fc3480f0-c537-6017-862e-109595b28d02@redhat.com>
Date:   Mon, 6 Dec 2021 15:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: resource sanity check, mapping multiple BARs
Content-Language: en-US
To:     Ferry Toth <fntoth@gmail.com>, platform-driver-x86@vger.kernel.org
References: <51b6676b-0000-ba23-0003-1b7e53158ef4@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <51b6676b-0000-ba23-0003-1b7e53158ef4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ferry,

On 12/5/21 23:02, Ferry Toth wrote:
> Hi,
> 
> Between v5.15 and v5.16-rc the following (unrelated?) errors are appearing in kernel.log:
> 
> resource sanity check: requesting [mem 0xff200000-0xff3fffff], which spans more than 0000:00:0e.0 [mem 0xff298000-0xff29bfff]
> caller devm_ioremap+0x45/0x80 mapping multiple BARs
> pmd_set_huge: Cannot satisfy [mem 0x05e00000-0x06000000] with a huge-page mapping due to MTRR override.
> 
> This is on Intel Edison (Merrifield), which has (from lspci):
> 
> 00:0e.0 System peripheral: Intel Corporation Device 119b (rev 01)
>     Flags: fast devsel, IRQ 25
>     Memory at ff298000 (32-bit, non-prefetchable) [size=16K]
>     Memory at ff2a2000 (32-bit, non-prefetchable) [size=4K]
>     Capabilities: [b0] Power Management version 3
>     Capabilities: [b8] Vendor Specific Information: Len=08 <?>
>     Capabilities: [c0] PCI-X non-bridge device
>     Capabilities: [100] Vendor Specific Information: ID=0000 Rev=0 Len=024 <?>
> 
> Any suggestions on the cause of this would be welcome.

Not sure why you send this to the platform-driver-x86 list.

The platform-driver-x86 list is for things like ACPI/WMI drivers for vendor
specific firmware APIs, think drivers like dell-laptop, dell-wmi and
thinkpad_acpi.

It is probably best if you resend your email to the linux-pci@vger
and the generic linux-kernel@vger lists.

Regards,

Hans

