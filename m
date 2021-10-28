Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C24C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 07:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D89161040
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 07:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhJ1H7a (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Oct 2021 03:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43582 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229899AbhJ1H7Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Oct 2021 03:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635407819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U7TdbsvAp/Y16Mwm9IVFaOGNQbCPw0m8p7ydAUxJthw=;
        b=BSxYgnYLhTz/H+P5FzgnhT7JxXPGWXmTFMjZyQAyrym+aIF4oRRUyt+hommIwYbK9XWv19
        b/c93Ch/s2OkqQ2odNcONvwpfvTPSzzGilM1cjWtRJ4Kz5pMlzmcpDIhVdzwo4nu363G6I
        O4WsdTxjtnPy8pkptZ3cZyOwfJ6dL9M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-bsNMjvViMX6myUNQy0ktXg-1; Thu, 28 Oct 2021 03:56:57 -0400
X-MC-Unique: bsNMjvViMX6myUNQy0ktXg-1
Received: by mail-ed1-f72.google.com with SMTP id z1-20020a05640235c100b003dcf0fbfbd8so4799821edc.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Oct 2021 00:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U7TdbsvAp/Y16Mwm9IVFaOGNQbCPw0m8p7ydAUxJthw=;
        b=H//kk9umL2KJmNiX2qcdEYSy8TiS5BrPbQaw59b521hDB7YVy7yiH4ZyxgwA8Y5rqZ
         vAuCSooDmR8Eqn6ZFAReevNqj017JNcaMDgo7Dc0wNZ7454oZJCMHv/4C++POfU/t+cM
         zucVJFtxfnOaJdOde4mYT1wdWDVYs2z4OdMdqHTM+rcsMt2nJ4JHNmki/5pxzp9qhgwe
         PV3RhQC74AY7c4gTo5CmJn6lyY/CUb4smS6SPoj2wzPUpXcrgVOQjsvDChDhyUwmUjdP
         fRkli3Qk9BKUWFlevvWFKXMsXZM3BEfRM8rKs8hYYiGNEMhZKg45M3bC4E+yrDcFIEz+
         5jqA==
X-Gm-Message-State: AOAM532rsaKV567TCMo4U36JOADfGZFWblM8660wy70+D6TQbwK7bSha
        wpSCo1derMH8yDk2Y/MTKZwADdPwgf6PwIwP/VGFxZfqJliZ7kfzsIV9xcJGjzgtFLHU+TiP7U4
        S+PJK444nLdT20ccwRQSIbiPKc6pklFTCiQ==
X-Received: by 2002:a17:906:7313:: with SMTP id di19mr3250744ejc.522.1635407816459;
        Thu, 28 Oct 2021 00:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3rfz5xXFMTVOC7XBoTLo+GZluZsSWcs54CvHcHufqbmiqnXG6FgaFQUy+rCWjzS2MaVcAdA==
X-Received: by 2002:a17:906:7313:: with SMTP id di19mr3250728ejc.522.1635407816258;
        Thu, 28 Oct 2021 00:56:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o9sm1006822ejy.8.2021.10.28.00.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 00:56:55 -0700 (PDT)
Message-ID: <7378cf79-41bd-ab09-c675-18162648b168@redhat.com>
Date:   Thu, 28 Oct 2021 09:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] platform/surface: aggregator: Clean up client device
 removal
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org
References: <20211028002243.1586083-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211028002243.1586083-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/28/21 02:22, Maximilian Luz wrote:
> Remove some duplicate code for Surface Aggregator client device removal and
> rename a function for consistency.
> 
> Maximilian Luz (3):
>   platform/surface: aggregator: Make client device removal more generic
>   platform/surface: aggregator_registry: Use generic client removal
>     function
>   platform/surface: aggregator_registry: Rename device registration
>     function

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll merge this once 5.16-rc1 is out.

Regards,

Hans

