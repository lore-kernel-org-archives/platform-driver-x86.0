Return-Path: <SRS0=7IVD=DP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435C9C43467
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 11:44:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E62ED21527
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 11:44:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a67aoc/y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgJHLoH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Oct 2020 07:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50470 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726028AbgJHLoH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Oct 2020 07:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602157445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sPP/9V0uyRXp+Z6vdn5kqxJQA3/F3PuAhbOknmvzZjQ=;
        b=a67aoc/yPCdjERdsEoYvT3P0m4MyrO50THrUr1hmBbzxH1xKWk25qzcq6X7G8PiQEQNvqz
        E8naUsQblnbXfQxCHRDEIVnYUFtxkSpkqOOMSnjmgtPosv1oh9YUNAEfdVA/5ioJOKJrjq
        jC6AZwTp3EyOP78Bw/nqG14tAAIR4Rw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-Ny2tN4wrPV-eVLMa31ku6w-1; Thu, 08 Oct 2020 07:44:03 -0400
X-MC-Unique: Ny2tN4wrPV-eVLMa31ku6w-1
Received: by mail-ej1-f72.google.com with SMTP id z25so2124324ejd.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2020 04:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sPP/9V0uyRXp+Z6vdn5kqxJQA3/F3PuAhbOknmvzZjQ=;
        b=fcxmUxKj+6D9dKBicGslT8L/wNwuOawiPehtwpvg3qqcgXp1WmOvnHOpQXJi8YBzlm
         UiffbASI3ZRW+A0E7epskrisXsfutb5GJy7tn5+Xq/g1hW9/PQ+3cjoYm6BVZkG6l9pY
         QacV8jN4s976L4dDF8bAC0QGORtpEuDcl2zTqy7QbjJd/Kl7XaJ+jesutIUnmt6C8SF6
         Ea66UlWNL+2sylUkfRT++AA9/YVXahzByx7qG8UDF01/0Dh1uwGkMX0kAaRIjQaMe70D
         8J7qX9Vu0nAKfEE4GOLLfQsZpKKOgsinPtUewgJ2sj7nKP5Hj2qeGBOw32h4CdhWhRDy
         bKTw==
X-Gm-Message-State: AOAM531fc/Yp2SjhljxD2ue3YMTrknIr9nj3HvWfvs+oVDlozwPbgeMh
        A1O5SAEQrzJI2boxCBdqO+RRXKWR6+2YDy0+w5CiW6y00a8Wp9CyIZs9XtFM8rnOVG4dyKZK8ry
        YThCXK+eBQov1KA+6+9Su24X58Th70gkhSQ==
X-Received: by 2002:aa7:c9c3:: with SMTP id i3mr8699570edt.236.1602157441985;
        Thu, 08 Oct 2020 04:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysTVjCmI2kXxjwowh882OGyD+PTwbzqWNDox2N1xXVOBydn3JX68JzLBEJS6FBxq8FmTeTBA==
X-Received: by 2002:aa7:c9c3:: with SMTP id i3mr8699547edt.236.1602157441717;
        Thu, 08 Oct 2020 04:44:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id 1sm3800602edy.89.2020.10.08.04.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 04:44:00 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] platform/surface: Create a platform subdirectory
 for Microsoft Surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        Stephen Just <stephenjust@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>, linux-kernel@vger.kernel.org
References: <20201005160307.39201-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a82e3aff-801d-d116-bbf4-91f3981f713b@redhat.com>
Date:   Thu, 8 Oct 2020 13:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005160307.39201-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Maximilian,

On 10/5/20 6:03 PM, Maximilian Luz wrote:
> As has come up in the discussion around
> 
>    [RFC PATCH] Add support for Microsoft Surface System Aggregator Module
> 
> it may make sense to add a Microsoft Surface specific platform
> subdirectory. Andy has suggested drivers/platform/surface for that.
> This series follows said suggestion and creates that subdirectory, as
> well as moves Microsoft Surface related drivers over to it and updates
> their MAINTAINERS entries (if available) accordingly.
> 
> This series does not modify any existing driver code, symbols, or help
> text.

In case you do not know I'm taking over from any as
drivers/platform/x86 maintainer.

I'm fine with the concept of this series, but who is going to maintain
this new drivers/platform/surface directory ?

Ah I see that the first patch answers that question and the plan
is to keep this part of the pdx86 maintainership.

I would prefer for the new dir to have its own
MAINTAINERS entry if I'm honest, I would like to try and
split maintainership for the surface stuff as follows:

1. Who will review (and add their Reviewed-by or ask for improvements
    or nack) patches to files in this dir?

2. Who will gather approved patches apply them to a for-next branch
    and send them out to Linus during the merge Window?

I can pick up 2. but I could really use some help with 1. So I
was thinking having a separate MAINTAINERS entry for the new
dir with you (Maximilian) (and me and Mark Gross) listed as
MAINTAINERS; and then I'm hoping that you can do the review
of surface related patches. At least those which you have not
written yourself.

How does that sound ?

Regards,

Hans



> Link to discussion:
>    https://lore.kernel.org/lkml/CAHp75Vfp86h38Rd-VEgER7ASADdmz5ymAkuHvD0Q6WPDqZBqHw@mail.gmail.com/
> 
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Changes in v2:
>   - Rebase onto linux-platform-drivers-x86/for-next to incorporate
>     changes in Maintainer file.
> 
> For more details regarding changes, refer to the individual patches.
> 
> Maximilian Luz (5):
>    platform: Add Surface platform directory
>    platform/surface: Move Surface 3 WMI driver to platform/surface
>    platform/surface: Move Surface 3 Button driver to platform/surface
>    platform/surface: Move Surface 3 Power OpRegion driver to
>      platform/surface
>    platform/surface: Move Surface Pro 3 Button driver to platform/surface
> 
>   MAINTAINERS                                   |  3 +-
>   drivers/platform/Kconfig                      |  2 +
>   drivers/platform/Makefile                     |  1 +
>   drivers/platform/surface/Kconfig              | 49 +++++++++++++++++++
>   drivers/platform/surface/Makefile             | 10 ++++
>   .../platform/{x86 => surface}/surface3-wmi.c  |  0
>   .../{x86 => surface}/surface3_button.c        |  0
>   .../{x86 => surface}/surface3_power.c         |  0
>   .../{x86 => surface}/surfacepro3_button.c     |  0
>   drivers/platform/x86/Kconfig                  | 31 ------------
>   drivers/platform/x86/Makefile                 |  6 ---
>   11 files changed, 64 insertions(+), 38 deletions(-)
>   create mode 100644 drivers/platform/surface/Kconfig
>   create mode 100644 drivers/platform/surface/Makefile
>   rename drivers/platform/{x86 => surface}/surface3-wmi.c (100%)
>   rename drivers/platform/{x86 => surface}/surface3_button.c (100%)
>   rename drivers/platform/{x86 => surface}/surface3_power.c (100%)
>   rename drivers/platform/{x86 => surface}/surfacepro3_button.c (100%)
> 

