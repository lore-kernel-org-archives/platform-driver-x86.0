Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F4EC25B0E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Aug 2022 13:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbiHONDs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Aug 2022 09:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiHONDr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Aug 2022 09:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29C5B13F99
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660568626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9looORc2B9jMHH3VzUUV0AiKpljw9fLhRn4KnsP/uTk=;
        b=Et+sgcn5b6mRAjhN/3S6r3eMjTIXq4vbuTHK7gFwjAik+hKUA9NKSvOnmMYZCuik6hbXBp
        F+OO7Mwk6cH5/4tJ6KqHW4+nk0I3UZLn79KkCRWLPlZcoaJ37e/yYkUXl+9rlZ9dXjIlBz
        TkmkG6PLrfTxQ+zZM2huS0DrhOdsqC4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-nq-eQbBGNXmImOFSGn2W8Q-1; Mon, 15 Aug 2022 09:03:44 -0400
X-MC-Unique: nq-eQbBGNXmImOFSGn2W8Q-1
Received: by mail-ed1-f72.google.com with SMTP id m22-20020a056402431600b0043d6a88130aso4684608edc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Aug 2022 06:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9looORc2B9jMHH3VzUUV0AiKpljw9fLhRn4KnsP/uTk=;
        b=BvpYoHjRmhJigfwib8H5lUPnH/zeTZJfiKbPoS4A+b08hfwSNXaf/NLwFFCQZ1sVjX
         vRmb4p1wpjzMt7HTSD5YUvZZ5orhv6lKdJBleJZfEy1UWNkHTecQ5dMKMeTrnm/3rFaX
         Wbghi06vID0mTDnhVaP8vWs0YBFbqpGp1DlbFFzuaAxs2mpYI2uuunNk9V3C+uwtXMHD
         PgoK7tApekWCzmICYuJzPcRSKQze/1rWzK+qtVRbq3v92KqvBIv/EGeM4tWjaC8l79BQ
         K2bPtC2mSmbbIxRwSO4m+IPcseRPxDRI1QbKqJNeAfD5dcx7UoyZ5b4ecpXHy2zbPve2
         KmqA==
X-Gm-Message-State: ACgBeo2c2uChUBdAxFSWwFajiyUNEsDA5uFhFWbuWZDjT84R5wq04lHN
        XN4Q6tUVd5ZjaaZuaAa7FtzkxI0J/r+YrXmdCkeysd/9iy6sb+lSX19gAdosRHhZrQIu9ZG+JUg
        HSb+GRp+6agVCS75MahovQ12UKGyK58gdUw==
X-Received: by 2002:a17:907:72d0:b0:734:b451:c8d9 with SMTP id du16-20020a17090772d000b00734b451c8d9mr10212918ejc.272.1660568623427;
        Mon, 15 Aug 2022 06:03:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7SDKIwXTY8qn3QWNAK4WGFrAoJ7ewW8hNElK4OlyhW26psKDdMWu1raCkCKzrAeCtTLZCjqA==
X-Received: by 2002:a17:907:72d0:b0:734:b451:c8d9 with SMTP id du16-20020a17090772d000b00734b451c8d9mr10212901ejc.272.1660568623216;
        Mon, 15 Aug 2022 06:03:43 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m21-20020a170906849500b0072b6d91b056sm4084346ejx.142.2022.08.15.06.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 06:03:42 -0700 (PDT)
Message-ID: <7f616e90-f38d-64b7-a2f2-b847b237edd1@redhat.com>
Date:   Mon, 15 Aug 2022 15:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] platform/surface: aggregator_registry: Rename and add
 more HID device nodes
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220810144117.493710-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220810144117.493710-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/10/22 16:41, Maximilian Luz wrote:
> This series is twofold:
> 
> Patch 1 and 2 rename existing HID firmware nodes to better reflect the
> devices they represent and the hierarchy they are placed under. In
> particular, the three previously unknown nodes are for sensors, firmware
> updates via the CFU mechanism, and for a USB Type-C Connector System
> Software Interface (UCSI) HID client.
> 
> Patch 3 adds support for sensors and the UCSI client to the Surface Pro
> 8 by adding the missing SAM-connected HID nodes.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
> Regards,
> Max
> 
> Maximilian Luz (3):
>   platform/surface: aggregator_registry: Rename HID device nodes based
>     on their function
>   platform/surface: aggregator_registry: Rename HID device nodes based
>     on new findings
>   platform/surface: aggregator_registry: Add HID devices for sensors and
>     UCSI client to SP8
> 
>  .../surface/surface_aggregator_registry.c     | 44 ++++++++++---------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 

