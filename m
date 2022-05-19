Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF41C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 May 2022 17:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242802AbiESRiw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 May 2022 13:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242863AbiESRiu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 May 2022 13:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DE16A5035
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652981926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xT+DddQugG4iwTysI8HRLb1sjtX9nO4NqgI0BDmJlBE=;
        b=W+H+FzDD4XagpdcXbkHHfYxKHOd9be1q8m8kfWs/YASByGlIdW+RD64is6+nDryaSmevXu
        V83pnIegwSK84bkzQh3HiJf4jWRQg9OlJpuzhxna199WrncaO7sC4Wo1L8v5eIts4v1dwU
        JNOP9tdTqickMmpGnncAZj7w2gSaUYk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-F74pHaolPNapKTF3T6iyxA-1; Thu, 19 May 2022 13:38:45 -0400
X-MC-Unique: F74pHaolPNapKTF3T6iyxA-1
Received: by mail-ed1-f69.google.com with SMTP id i22-20020aa7dd16000000b0042a9f9e2272so4037655edv.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 10:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xT+DddQugG4iwTysI8HRLb1sjtX9nO4NqgI0BDmJlBE=;
        b=sMZgGciY528WI/39ZkZbwwd+SlkA5dHr8uuZjrUbt68PrCJtkRQEydUq/fPSdcvkWj
         H/XOAm+qQ4KrtkkvLooJfzHMM8JPeEUgcZlRLztnwb6yV5w7gvjLBi2Riq/J6sRmTig7
         hbusPRwsEO+yM4q4nBz0wpPFATP/DvYWHSJWlYIOq3n2hen/JSAKBw19xA4d8VRS4QGU
         m223wO7vY/yUHPC+75UBU8LzzCS53Wu1o+5StNdMfsznq6uMz1AAPtxA1WeGZFZpSjag
         xphuRrf6WFXnLR/emhlpI5xTxXyXVHYi+irMCkg2FCH6TdKzESyFWaRfwQ7YudPI1raM
         SFJQ==
X-Gm-Message-State: AOAM532QLNOzDYlbFFexa/L9ccfmYO+iIH0DMvNpWGuOjA/J6R2v6CL/
        xUlxZdaBmHAzIgcsPyK+UKR6ldK89SLtlEl8Fta+ojGn3xPpRfVwfaQSatttwcCWr3fS5Y1knNl
        t8ayeneUqKVM21Qz/ebEzpi2PjeRDT0JqsA==
X-Received: by 2002:a17:907:6d96:b0:6fe:6da7:6bc6 with SMTP id sb22-20020a1709076d9600b006fe6da76bc6mr5329354ejc.57.1652981923950;
        Thu, 19 May 2022 10:38:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEMjWFkQfd18c2iV1zR2cO0D5V9rR1DXWUrSOCmVrIAC5vA4qCGn5clilMna1lxljOfhD4tg==
X-Received: by 2002:a17:907:6d96:b0:6fe:6da7:6bc6 with SMTP id sb22-20020a1709076d9600b006fe6da76bc6mr5329338ejc.57.1652981923701;
        Thu, 19 May 2022 10:38:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jl7-20020a17090775c700b006fea2035036sm320340ejc.86.2022.05.19.10.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 10:38:43 -0700 (PDT)
Message-ID: <e683e5b5-05f0-dc2d-2c0c-cbccba3dcf98@redhat.com>
Date:   Thu, 19 May 2022 19:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] platform/x86: intel-hid: fix _DSM function index
 handling
Content-Language: en-US
To:     =?UTF-8?Q?Michael_Niew=c3=b6hner?= <linux@mniewoehner.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Mark Gross <markgross@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
References: <44828f285aeacf0e941f4f6452b190b46146043f.camel@mniewoehner.de>
 <CAHp75VcoLqByXy_VdhAu-j9oU_cL7FhdcegG=ePGkNK=cD+wKA@mail.gmail.com>
 <66f813f5bcc724a0f6dd5adefe6a9728dbe509e3.camel@mniewoehner.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <66f813f5bcc724a0f6dd5adefe6a9728dbe509e3.camel@mniewoehner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/17/22 20:31, Michael Niewöhner wrote:
> intel_hid_dsm_fn_mask is a bit mask containing one bit for each function
> index. Fix the function index check in intel_hid_evaluate_method
> accordingly, which was missed in commit 97ab4516205e ("platform/x86:
> intel-hid: fix _DSM function index handling").
> 
> Fixes: 97ab4516205e ("platform/x86: intel-hid: fix _DSM function index handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Niewöhner <linux@mniewoehner.de>

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


> ---
> Changes in v3:
> Added Fixes tag
> 
> Changes in v2:
> Added Cc to stable
> 
>  drivers/platform/x86/intel/hid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 13f8cf70b9ae..5c39d40a701b 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -238,7 +238,7 @@ static bool intel_hid_evaluate_method(acpi_handle handle,
>  
>         method_name = (char *)intel_hid_dsm_fn_to_method[fn_index];
>  
> -       if (!(intel_hid_dsm_fn_mask & fn_index))
> +       if (!(intel_hid_dsm_fn_mask & BIT(fn_index)))
>                 goto skip_dsm_eval;
>  
>         obj = acpi_evaluate_dsm_typed(handle, &intel_dsm_guid,
> 

