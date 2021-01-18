Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DC5C433E6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:24:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97BDD22D03
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 18:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393603AbhARSX6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Jan 2021 13:23:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42493 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407544AbhARSW1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jan 2021 13:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610994059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0XLTOZpDzxwy3KhTnwZh01zwffGrl40DvZH48TFWH/A=;
        b=TmceWUjJjT0mxEfw20ziM6Y5MfU74BlJVZZTA7Q10whthWXtl9avQVQpwNkbb95LfWeW0+
        4cPD9QIiNkl/C+EHYJvUtKezW1ji9zpysXiybj7DO5vcGg0a8nbSMRd+IF+zss+gQDEYwS
        jXLjDJy993dbClWfTGj3X3EmotlSjOc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-wBs8L6pmOySiyXOT7ogbjg-1; Mon, 18 Jan 2021 13:20:57 -0500
X-MC-Unique: wBs8L6pmOySiyXOT7ogbjg-1
Received: by mail-ed1-f72.google.com with SMTP id ck25so4322158edb.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jan 2021 10:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0XLTOZpDzxwy3KhTnwZh01zwffGrl40DvZH48TFWH/A=;
        b=iFiaj12FoaCgruI62r2qZMGskbJj+ubEzdF9yTiJI0S0fqg69mmvjqKfNI9VpdTW9J
         km2z7pKvjCWxdpry1vwJ3VqsNbjUJ/CVbvqXPs/mh9oC4tDcipsyzjUFCfSjxJSmDjQ7
         FO+SiB89Spw+tDsCBQjpGea7mTgfb+uhyKondOT7CWmJM0o1iVsHIDI0ZYqThxNoxqsN
         sM53ACvouKyqD4w4eckDPbxOtzgzngg+w842oJEXSyxwFT+WQwukY88PX3AlMHt6uAJb
         vq5xnYTFsUH2/pChbvR9ZwEuYbYV0M5y+hhaYWLfcRmSqJcLM8Yc0v54aRT8t4r1T4gQ
         CqvQ==
X-Gm-Message-State: AOAM532Rtc2wbaasZIvdv3UuZE43N5hlbFfYyipVqcNxXvwCig8QGVhR
        Y7S8pGfCbcNCR0O/KnqeTzEEemLhatL426oks3UJHqJgolv3IHQHpGVOmC1pUcul9zRJhnGHVZf
        vmwRRW6Roes7kJsz9Gm5yhIdOSJE++8Xw9Zhc+vOQCGXMBlu3gCZPkYxqs/4UbXot3ccgsqY8GE
        jEr3SCw/i0IA==
X-Received: by 2002:a17:906:944a:: with SMTP id z10mr620057ejx.96.1610994055967;
        Mon, 18 Jan 2021 10:20:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfhE9TJAExzYFs1vk0RoI31mts7Pw/Piku3pc7gvUuxX1645JFBmAzXTbo8hAg4hmFy7LLeg==
X-Received: by 2002:a17:906:944a:: with SMTP id z10mr620046ejx.96.1610994055741;
        Mon, 18 Jan 2021 10:20:55 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id dm6sm6305649ejc.32.2021.01.18.10.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 10:20:55 -0800 (PST)
Subject: Re: [PATCH v6 16/16] platform/surface: aggregator: fix a kernel-doc
 markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
 <4a6bf33cfbd06654d78294127f2b6d354d073089.1610610937.git.mchehab+huawei@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <151f5b83-fdac-72e6-604f-ed16444e685a@redhat.com>
Date:   Mon, 18 Jan 2021 19:20:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4a6bf33cfbd06654d78294127f2b6d354d073089.1610610937.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/14/21 9:04 AM, Mauro Carvalho Chehab wrote:
> A function has a different name between their prototype
> and its kernel-doc markup:
> 
> 	../drivers/platform/surface/aggregator/ssh_request_layer.c:1065: warning: expecting prototype for ssh_rtl_tx_start(). Prototype was for ssh_rtl_start() instead
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

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
>  drivers/platform/surface/aggregator/ssh_request_layer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
> index bb1c862411a2..25db4d638cfa 100644
> --- a/drivers/platform/surface/aggregator/ssh_request_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
> @@ -1056,7 +1056,7 @@ void ssh_rtl_destroy(struct ssh_rtl *rtl)
>  }
>  
>  /**
> - * ssh_rtl_tx_start() - Start request transmitter and receiver.
> + * ssh_rtl_start() - Start request transmitter and receiver.
>   * @rtl: The request transport layer.
>   *
>   * Return: Returns zero on success, a negative error code on failure.
> 

