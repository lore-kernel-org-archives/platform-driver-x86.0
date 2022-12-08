Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313A6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 15:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiLHP7m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLHP7k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 10:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D7456564
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 07:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670515122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bHbU0bnviXv1HhfoKuqP0zoN5gOBLyg/29v+GLocayU=;
        b=bE77YGQl3+OUNsWLntZLuiM2jvwy7LFHQ4YqjViG1zOxEq3EOa78ZHj1LQHTvYzHgHsPDT
        PDP/2jCHgVAjMLVYFYUxue7t+FGtITBP/wXAXcMiRYXjBe01pCJiegVP09ndPRwwMO/Yc4
        JOKfHp/wokspsDZLQpf4Yjm9g7tZR4Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-p3hhu8jZMKmWVBSKXy33ig-1; Thu, 08 Dec 2022 10:58:41 -0500
X-MC-Unique: p3hhu8jZMKmWVBSKXy33ig-1
Received: by mail-ej1-f69.google.com with SMTP id sh37-20020a1709076ea500b007c09b177cd1so1421494ejc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 07:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHbU0bnviXv1HhfoKuqP0zoN5gOBLyg/29v+GLocayU=;
        b=RJ/U6iRG3IqpMZrCEhdMLFR7ra/73NdYKFogF5Ej5HQHkslFgz5GY9CUkFo3Q/X9kd
         0cakRBsTbG9DxjaPQcF3IkWXCpo4cHXBdFolBqty9hrjHvzmilIrAagpzDyHoxIxqEhf
         5zCznCXpuG+j3YRfDLfl5f2gTLzxoPcLc8u1ApGuBgKwwR4GDY4YNZ97sHY0lm6MrRZp
         WiBW2dgEsKz52xfuDKAfFaRydEmeQkkUhQHTsrMpd//1tmwcfT97d+PztQyTGEt+r+BQ
         IbH7n+CIk4FGz4B4se7dDkkERvLeNgoWGDc2BJe6kbZBNu+DS1hQUngTWh5ChC5CJpfG
         J3nQ==
X-Gm-Message-State: ANoB5pkwdzemV7yavxnJpcFDZotzhdj3oOXKBTSJMrBtPStaaOV1t3VD
        +ZoQ6dSqKxWOr+HzOhQ9knaXpuzttwnZKwxxFq/fI5TTvbJF8jdYGR0IIrpjBGlxpeiz1qcHZGS
        nviZ1zEE0imL3QZqRUwxm/jX5g51ujENd0Q==
X-Received: by 2002:a05:6402:370a:b0:461:2505:832d with SMTP id ek10-20020a056402370a00b004612505832dmr2717955edb.10.1670515119993;
        Thu, 08 Dec 2022 07:58:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4cUG6Q2x/maYgWNR6Y7IlQnrJzdRh/eXHpvNl5Tn2XE1ZK4eWjcmjqN3qbbeIVhtBAAEU3Gw==
X-Received: by 2002:a05:6402:370a:b0:461:2505:832d with SMTP id ek10-20020a056402370a00b004612505832dmr2717946edb.10.1670515119769;
        Thu, 08 Dec 2022 07:58:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7df11000000b004610899742asm3511795edy.13.2022.12.08.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 07:58:39 -0800 (PST)
Message-ID: <b632a7f2-6f6d-9dec-a245-9f9d21268d80@redhat.com>
Date:   Thu, 8 Dec 2022 16:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 0/5] Introduction of HP-BIOSCFG driver
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221202173616.180108-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221202173616.180108-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 12/2/22 18:36, Jorge Lopez wrote:
> Version 5 restructures the patches submitted in previous versions.
> Earlier hp-bioscfg patches were squashed together before creating
> the new split.
> 
> Version 5.0 breaks down the changes into 5 patches
> 
> The driver files were broken down in 5 patches of 3 files each
> with exception of patch 1/5
> 
> Jorge Lopez (5):
>   Introduction of HP-BIOSCFG driver (1)
>   Introduction of HP-BIOSCFG driver (2)
>   Introduction of HP-BIOSCFG driver (3)
>   Introduction of HP-BIOSCFG driver (4)
>   Introduction of HP-BIOSCFG driver (5)

Thank you for the new version. Unfortunately I
don't have time atm to review this.

And the next 2 weeks are the merge window,
followed by 2 weeks of christmas vacation.

So I'm afraid that I likely won't get around to reviewing
this until the week of January 9th.

Regards,

Hans


> 
>  .../testing/sysfs-class-firmware-attributes   |  181 ++-
>  MAINTAINERS                                   |    6 +
>  drivers/platform/x86/hp/Kconfig               |   16 +
>  drivers/platform/x86/hp/Makefile              |    1 +
>  drivers/platform/x86/hp/hp-bioscfg/Makefile   |   19 +
>  .../x86/hp/hp-bioscfg/biosattr-interface.c    |  283 +++++
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1066 +++++++++++++++++
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  673 +++++++++++
>  .../x86/hp/hp-bioscfg/enum-attributes.c       |  499 ++++++++
>  .../x86/hp/hp-bioscfg/int-attributes.c        |  450 +++++++
>  .../x86/hp/hp-bioscfg/ordered-attributes.c    |  549 +++++++++
>  .../x86/hp/hp-bioscfg/passwdattr-interface.c  |   51 +
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  631 ++++++++++
>  .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  419 +++++++
>  .../x86/hp/hp-bioscfg/string-attributes.c     |  425 +++++++
>  .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 ++++++++++++++++
>  .../x86/hp/hp-bioscfg/surestart-attributes.c  |  149 +++
>  17 files changed, 6430 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
> 

