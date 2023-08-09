Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73778C001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 20:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjHIUHL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 16:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjHIUHJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 16:07:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A0910D4
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691611579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kPyCucPVFGj6QF7MZvc8reErfptibCTxehFLBybRkOk=;
        b=Q6cRXTPUSpKdFGocKAgTk/tDNCKLY4pBhSCyhzSD6do5ufw5HDWgtOVzidjkiWe/7CUuDa
        kIAvNL0No+nRQHCQAwv/muxEOYEV1EgEUwhrzA8BPFqLigbBhePifa0+iF36x13ol0MzNp
        wTRoYtTKMojL570E0m2R2qYY+O5Ilog=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-8emWWkFJPouRzq9Ctdvmfg-1; Wed, 09 Aug 2023 16:06:17 -0400
X-MC-Unique: 8emWWkFJPouRzq9Ctdvmfg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bfe6a531bso13364966b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Aug 2023 13:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611575; x=1692216375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPyCucPVFGj6QF7MZvc8reErfptibCTxehFLBybRkOk=;
        b=VrlEbYgd28pn3p4qySszuI2KhLvkHaLYWKGWt0RiH9oVfU3COf+MrLrOB895twHDa2
         V8cCvCvqsqWUFrUX/Jea4GY3lVVQ7iJ0XRwFR1A+Lie094BaiL9ZjN43g2OGD85H6Z5T
         YslwJQ6YcQazDFi2JA8fIga1/LDSIobc25nkWwxuV4apsP0hBiePGr8a8EF5rHHkRkl1
         4rTczIZTlowoEEXcbnpw/rj9z4gjXH4i+SM2qR1zFs+TxyJ4KtKPamCQ0tNrfx8HAStO
         5HHCzLOBZOFxOFJC9Z5mcVBAvmpG+eqjsOkI12TDVvm4JTEEE1Fb//ObWu1PAN972ZbX
         CsOA==
X-Gm-Message-State: AOJu0YzEfQspm+Zy3HdE2Yx87+vw1v2Q4fl9QlNJKvPaEKn4XG1WlvR9
        0yZm6Soy/AZfaeqpqw7B0jZk7Kd1h2Sjpmt1Q/YG5MD+LbDQM+hvFXQA1q8oPpx8zRB6OCIXJwF
        5sc4ImTv/H1xc8E7pCpQ381dp5H10g6U0Hg==
X-Received: by 2002:a17:906:209d:b0:992:ef60:ab0d with SMTP id 29-20020a170906209d00b00992ef60ab0dmr89042ejq.69.1691611575713;
        Wed, 09 Aug 2023 13:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE47+r0VzKLVYJAIlh2fZlpopHjQ+mNGORZXqPkiSa9aTPhEt4cWQKO1R2PoZk9n5xeRM91Sw==
X-Received: by 2002:a17:906:209d:b0:992:ef60:ab0d with SMTP id 29-20020a170906209d00b00992ef60ab0dmr89027ejq.69.1691611575433;
        Wed, 09 Aug 2023 13:06:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mc23-20020a170906eb5700b0098e78ff1a87sm8315081ejb.120.2023.08.09.13.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 13:06:14 -0700 (PDT)
Message-ID: <a06595ce-2a83-94b2-eb97-962b27025ef8@redhat.com>
Date:   Wed, 9 Aug 2023 22:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/2] fix logical errors for BX-59A
Content-Language: en-US, nl
To:     xingtong_wu@163.com, andriy.shevchenko@linux.intel.com
Cc:     ilpo.jarvinen@linux.intel.com, markgross@kernel.org,
        xingtong.wu@siemens.com, lee@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        gerd.haeussler.ext@siemens.com, tobias.schaffner@siemens.com,
        lkp@intel.com
References: <ZNEUHo0fR280O4mN@smile.fi.intel.com>
 <20430802173515.2363-1-xingtong_wu@163.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20430802173515.2363-1-xingtong_wu@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/43 19:35, xingtong_wu@163.com wrote:
> From: "xingtong.wu" <xingtong.wu@siemens.com>
> 
> changes since v2:
>  - Collect tag "Reviewed-by" in changelog
>  - Delete blank line between tags block "Closes" and "Signed-off-by"
> 
> changes since v1:
>  - Improve the changelog to make things clear
> 
> These are rather simple patches fixing logical errors in Siemens
> IPC drivers.
> 
> xingtong.wu (2):
>   platform/x86/siemens: simatic-ipc: fix logical error for BX-59A
>   platform/x86/siemens: simatic-ipc-batt: fix logical error for BX-59A
> 
>  drivers/platform/x86/siemens/simatic-ipc-batt.c | 3 ++-
>  drivers/platform/x86/siemens/simatic-ipc.c      | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)


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



