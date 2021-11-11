Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56650C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 09:45:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D1FB610FC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 09:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhKKJsh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25955 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229649AbhKKJsg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 04:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636623947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NHZpzPiJjVdQJR747hgvu7Kbq8RX36AdGZlglYBTJok=;
        b=VT5s6B3CNvvgcdFoZonuDo2X3gday5nRy/5iABfEKGKqiFnuSNVZ3cViUu+HollqmElkAT
        CK/lmCFasUTTs1paX2IQywoZxEjDPPDOy755oTC2vRkIe/zeBTO+5uAIplp9CXfbkc6jzG
        pqZnlDwgQ+PWIYqX7b83fORDq5r+EU0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-FEIABrf8PFKDiAkDd3ZiNw-1; Thu, 11 Nov 2021 04:45:44 -0500
X-MC-Unique: FEIABrf8PFKDiAkDd3ZiNw-1
Received: by mail-ed1-f71.google.com with SMTP id y12-20020a056402270c00b003e28de6e995so4926189edd.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 01:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NHZpzPiJjVdQJR747hgvu7Kbq8RX36AdGZlglYBTJok=;
        b=4azdAZ7q5Xvp7B5/PRkFqIpVflHBmdE4Zch6ctehhMPAWMmClKwPfKcplwtZoIoqIC
         uhzhlq4Sek/gAJ9aSaIRR6k0WWuPKlsYzjLT6VqjVj0Qla8Xey3zHlQso6lmJjBJ0e2n
         phu6d4SBaAgUiDMwt9jlW596dE2GErXJ6Yw9EOlbpPkAHX8M7IBIrk6ylVJI2Gk749n3
         A2uEzQ8+uqLGENEDuxQ9EAEEtoV9w/WpL7PKjTODOnmyeJE4EPKwA8mDZaQ09424ktTJ
         GtPzd+ygnj7eosCeI2I0Yg2tDBjb8+4LgLmP8HgPEpPWW5sOaW0PcaLYoRj6uQrrjTfX
         UGmg==
X-Gm-Message-State: AOAM531H84+w8tB9WkwmlMTsWq3M0F/95rQm0mSU3begLOakup39u4Cc
        IeBluOPgfV3evW1fNbF6vygRbRxLeSyDoavmfDYnKUEA3LPn3PVBwkq11o98jyHhS+ijkzAo/AW
        egsNxVcZ78OmH4H610SsICvKoyjDMuwxqDA==
X-Received: by 2002:a17:907:216e:: with SMTP id rl14mr7758006ejb.368.1636623943063;
        Thu, 11 Nov 2021 01:45:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+VyX7ZbK3W3c9WLo5vQL9u3j9cA6xOlIQkmsHYVnZ8N2eTGqGysfnVpZRSlV5X1PUiyWblA==
X-Received: by 2002:a17:907:216e:: with SMTP id rl14mr7757948ejb.368.1636623942584;
        Thu, 11 Nov 2021 01:45:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id qk7sm1058625ejc.23.2021.11.11.01.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 01:45:42 -0800 (PST)
Message-ID: <b33c60d4-1da3-9e71-66d6-3e4e5c43b6b8@redhat.com>
Date:   Thu, 11 Nov 2021 10:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fix documentation for
 adaptive keyboard
Content-Language: en-US
To:     Vincent Bernat <vincent@bernat.ch>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20211109195209.176905-1-vincent@bernat.ch>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211109195209.176905-1-vincent@bernat.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/9/21 20:52, Vincent Bernat wrote:
> The different values were offset by 1. 0 is for "home mode", 1 for
> "web-browser mode", etc. Moreover, the URL to the laptop's user guide
> did not work anymore.
> 
> Signed-off-by: Vincent Bernat <vincent@bernat.ch>

Thank you for this fix.

I will add this fix to my tree once 5.16-rc is out and
I will include this fix in my first pdx86 fixes pull-req
for 5.16.

Regards,

Hans

> ---
>  Documentation/admin-guide/laptops/thinkpad-acpi.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 6721a80a2d4f..475eb0e81e4a 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1520,15 +1520,15 @@ This sysfs attribute controls the keyboard "face" that will be shown on the
>  Lenovo X1 Carbon 2nd gen (2014)'s adaptive keyboard. The value can be read
>  and set.
>  
> -- 1 = Home mode
> -- 2 = Web-browser mode
> -- 3 = Web-conference mode
> -- 4 = Function mode
> -- 5 = Layflat mode
> +- 0 = Home mode
> +- 1 = Web-browser mode
> +- 2 = Web-conference mode
> +- 3 = Function mode
> +- 4 = Layflat mode
>  
>  For more details about which buttons will appear depending on the mode, please
>  review the laptop's user guide:
> -http://www.lenovo.com/shop/americas/content/user_guides/x1carbon_2_ug_en.pdf
> +https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/x1carbon_2_ug_en.pdf
>  
>  Battery charge control
>  ----------------------
> 

