Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D45FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 14:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E0C7603E5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 14:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238581AbhJ0OcD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 10:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39413 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238237AbhJ0OcD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 10:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635344977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1TutWtNWFAZGxh9/9EQ+Z/ODI7l3NFQCcnYgc7PSp4E=;
        b=dSXzkBwc4JCPHIKxGO2AWOAXTIgWp+tA1uQk3Hut+43h099YzWGw4yXqFrXxHYWKbW/1+m
        XfsJ3bQtOU9MHzj9FdNjspyYkRJooAE0Yc6JPTXUVZ0pVrFJOnG+41w/rUqU+jENGsCKc0
        6rplvvZG/CbeBubCH/iIVFvqr+nbOeU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-U6NQ6SQXPWuNqrNhBcYUgA-1; Wed, 27 Oct 2021 10:29:35 -0400
X-MC-Unique: U6NQ6SQXPWuNqrNhBcYUgA-1
Received: by mail-ed1-f70.google.com with SMTP id h16-20020a05640250d000b003dd8167857aso2542406edb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 07:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1TutWtNWFAZGxh9/9EQ+Z/ODI7l3NFQCcnYgc7PSp4E=;
        b=fKPdgcgqKDB3DHt6HVwmCKLwsUTt7Y3F5yF5RD+FPDznhQpm7C/0CT689vTWBNPH3z
         Rk3/R7eC+7EqzzjEidXftTqgNlF2sE8UUtXU6/gQ/PemBJhSogHs+OJ14YJF5UMgyEwO
         lCxQ3v+nxLxUPKMf/HSL1q5exrzyV7HneH0ShnqzjVGs9SctY5a3mF+20xGFtgAY3F5U
         pTkD/7g5WS9hkEZUapnplgJpW9eLuIO24t3/EtjKLJV7KfvMS9qdgGAL6RhVwJvjSTCQ
         J0T5CB2+s/0Ewq7adKqKfWb2SQJJu7/n1NtMl0TxiTRSltH0+ylT6G7ZQOw78sEHAE5W
         Si+w==
X-Gm-Message-State: AOAM533ZESosbLlDx31foVOoqGAUg/bZnLYgxH/G6owpbuvjH5iEsfvh
        CWusH3C4NHhJVRMUNJbxC+qCac6uXDu7sWidYiA3c46vNaqopTh69R58lobSuDMOv1vQeF16Irn
        vLrUdU3ZfB6rKSvY28h3QtIppLMhbJGrBkA==
X-Received: by 2002:a17:907:16a3:: with SMTP id hc35mr15780614ejc.497.1635344974639;
        Wed, 27 Oct 2021 07:29:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyF+zvDYmKs7dRApmzRmSo5JIGwpdZy6SCv5mw8ACfSG9IGP+JhJa36nnKPpjxVf+ijuvusQ==
X-Received: by 2002:a17:907:16a3:: with SMTP id hc35mr15780594ejc.497.1635344974437;
        Wed, 27 Oct 2021 07:29:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h7sm113309edt.37.2021.10.27.07.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 07:29:34 -0700 (PDT)
Message-ID: <9386f248-41fa-8a3c-a480-c0aa8734712d@redhat.com>
Date:   Wed, 27 Oct 2021 16:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH platform-next 0/3] platform/x86: mlx-platform: Extend to
 support new systems and additional user interfaces
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, oleksandrs@nvidia.com
References: <20211023094022.4193813-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211023094022.4193813-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/23/21 11:40, Vadim Pasternak wrote:
> Add support for new systems:
> - InfiniBand system type MQM97xx.
> - Ethernet water cooling system type SGN2410.
> 
> Extend the existing system class "VMOD0010" with additional BIOS related
> attributes.
> 
> Patch set contains:
> Patch #1 - adds support for MQM97xx system.
> Patch #2 - adds support for BIOS related attributes.
> Patch #3 - adds support for SGN2410 system.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> Vadim Pasternak (3):
>   platform/x86: mlx-platform: Extend FAN and LED configuration to
>     support new MQM97xx systems
>   platform/x86: mlx-platform: Add BIOS attributes for CoffeeLake COMEx
>     based systems
>   platform/x86: mlx-platform: Add support for new system SGN2410
> 
>  drivers/platform/x86/mlx-platform.c | 193 +++++++++++++++++++++++++++-
>  1 file changed, 192 insertions(+), 1 deletion(-)
> 

