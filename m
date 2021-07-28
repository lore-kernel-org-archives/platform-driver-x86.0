Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60260C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 10:03:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E01E60E78
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 10:03:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbhG1KDk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 06:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32181 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231852AbhG1KDg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 06:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627466614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GwhmQ7C85F230rECddooLFcsBp3jRhki99AY7vjwwSc=;
        b=jBck7HWmF5qrX7PN9wuNbalHkyLxRc9KHljc+Vu6sP7kCW1ognJBJjQ4rf3wO6yKRwVnou
        b2JIrOn+onVK3dhCxez5yxjfzhQc4Giq2erZkrXO/VUmebyhgyfr72ztWq+ZsqVtR4ANSe
        5JPHUeHeUspaEuw8CiGq+N+ReDpucpY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-e9Ir5XoeP8WkHvjI8Zk3Fw-1; Wed, 28 Jul 2021 06:03:33 -0400
X-MC-Unique: e9Ir5XoeP8WkHvjI8Zk3Fw-1
Received: by mail-ej1-f70.google.com with SMTP id e8-20020a1709060808b02904f7606bd58fso642815ejd.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 03:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GwhmQ7C85F230rECddooLFcsBp3jRhki99AY7vjwwSc=;
        b=et42rycPmED94WEypzRnnlmEvXYdoFZ5vN1DqJbLuMKXIO9/SbKTK+1m1C5qng3dpQ
         kbhgaCYeaDEb3LxyYhq+H6CgAOumZfcs6MwlrJuQ/rzLIm+xwu0CB0bnNDU99yLiyLXG
         r/lqEckGP8PRrjqFrb5e3k6Y0Dpvgrq/2yDS99n/zYr1gVvIEg1cji8JMSqzuJJRhWm0
         9PuxTFztyGMB6Pe4UEcSbDb54kMR4pBshPIwkjlwNeOSf69TUcy7UJxhufP3k9ECJWOk
         nvKyNs7FEoXZp3sA2ObVvDgMzqBsQlfRpPpG6Jz+wTDDmFkRwmvSdfPgDhpkcOpOiKuD
         TFpw==
X-Gm-Message-State: AOAM530JW/yDIMw/dvNkPfIKkD4go5hn6D14pxFdarjGqXZGeLXdbBBF
        bsdu6tyF7XOuqw+TyJY8zg1E4hdK78RNwbkEh/G11xzV5MzxCcMT532tXQEUTfVjRyEsVFaeClG
        fPOWh00bInXFNs6y66USJD6TFd4Pn1kfM2Q==
X-Received: by 2002:a05:6402:10d7:: with SMTP id p23mr32984443edu.74.1627466612374;
        Wed, 28 Jul 2021 03:03:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpaH4qZjVq5c1C3noTeH4oiEzRUqwERoQjxEjilavD9APIZ85teEGEaAN6otJBruhsQND5gA==
X-Received: by 2002:a05:6402:10d7:: with SMTP id p23mr32984419edu.74.1627466612195;
        Wed, 28 Jul 2021 03:03:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id aq24sm1888816ejc.48.2021.07.28.03.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 03:03:31 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-hid: add Alder Lake ACPI device ID
To:     Ping Bao <pingbao@gmail.com>, Alex Hung <alex.hung@canonical.com>
Cc:     Ping Bao <ping.a.bao@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:INTEL HID EVENT DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210721225615.20575-1-ping.a.bao@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9e95f7df-f12c-7a04-2234-279da65145f8@redhat.com>
Date:   Wed, 28 Jul 2021 12:03:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721225615.20575-1-ping.a.bao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/22/21 12:56 AM, Ping Bao wrote:
> Alder Lake has a new ACPI ID for Intel HID event filter device.
> 
> Signed-off-by: Ping Bao <ping.a.bao@intel.com>

[hans@x1 platform-drivers-x86]$ scripts/checkpatch.pl 00*
---------------------------------------------------------------
0001-platform-x86-intel-hid-add-Alder-Lake-ACPI-device-ID.patch
---------------------------------------------------------------
WARNING: From:/Signed-off-by: email address mismatch: 'From: Ping Bao <pingbao@gmail.com>' != 'Signed-off-by: Ping Bao <ping.a.bao@intel.com>'

total: 0 errors, 1 warnings, 7 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

0001-platform-x86-intel-hid-add-Alder-Lake-ACPI-device-ID.patch has style problems, please review.

I'll fix this up locally now, but please fix your email setup
so that the Author field of the patch gets set to
"Ping Bao <ping.a.bao@intel.com>"

Regards,

Hans



> ---
>  drivers/platform/x86/intel-hid.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 078648a9201b..e5fbe017f8e1 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -25,6 +25,7 @@ static const struct acpi_device_id intel_hid_ids[] = {
>  	{"INT33D5", 0},
>  	{"INTC1051", 0},
>  	{"INTC1054", 0},
> +	{"INTC1070", 0},
>  	{"", 0},
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
> 

