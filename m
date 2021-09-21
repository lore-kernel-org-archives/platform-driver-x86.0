Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEE1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 13:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5095960E08
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 13:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbhIUNSL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 09:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21794 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231658AbhIUNSL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 09:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632230202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3YtKbFzMF+3F2f+/WrhdhhbtXNnbNhvLwPsbO24bQxk=;
        b=BXWCuo983xIFZRMNbrLoFHlvrWLA5e9ThbzIV58xyDG3TUiQrT/C4izXLRr33/t0HnYldx
        s3jWNkvbeSI0AuI6BADQZ1b3SfMZ+y7RT3OvdxlbSeogP8qGC1E4x9eBT26Q0Te2Qs5vLH
        vbW0wBsgO0/3g9ZBuISTtoELj+mSmrw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-1qQTy5NqOp6_Soebd02xKA-1; Tue, 21 Sep 2021 09:16:40 -0400
X-MC-Unique: 1qQTy5NqOp6_Soebd02xKA-1
Received: by mail-ed1-f71.google.com with SMTP id e7-20020aa7d7c7000000b003d3e6df477cso18948532eds.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 06:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3YtKbFzMF+3F2f+/WrhdhhbtXNnbNhvLwPsbO24bQxk=;
        b=fR30Fp6JvVeXNBOSv2v97Q8X5dmw17Ge7LPEiW6FZiJWp/gnOFXFVlVdEkOpCwVO59
         sBKmSEj9FfsBwrta6j7bd6vcADwg1vMcvg/kyEbc55RNGFSn3KOaTwx0NLQ96YSnBcCC
         fOnHLRUBTTgAsmUThbFiOAgXqZrMpRS5zZnbFCLJeE3tg5dkYkouC0pkJiMxWZT/tQfT
         yVGzNyncU/w8DvzsbT3+YCZXOOZx7dns4/NAnAJXLhDdS++yN/DUlGBPLUvzwOsnpM2J
         8Qnsg2n/S2ZGYImKE3y5UCkltLDFg6ys2ugZLHby+ls4E/aMCqo/YDrw0ebAhYSLkyYT
         sYqQ==
X-Gm-Message-State: AOAM533InWF/oA28Ax414N4GaJ/ySjSJ2wqTQdgIpXKiipA3eIItk95O
        IbrocKFN09vV1CmybB4AxYnTrWNQ6/87dlO1ygng1Fh7NwzCWKBf1wbVGt5SXpfbqyHQwFsbYHB
        eEI5lM1PglSctXa6nWSbqRNXmmgeH8gl3DA==
X-Received: by 2002:a05:6402:1011:: with SMTP id c17mr35952983edu.144.1632230199306;
        Tue, 21 Sep 2021 06:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5kmvwCNa4G/jM+LxrlIQz9D8W39YoUQpWcO4oQbDdlSluFebItAM9SIviDTFnlNHp0kjgcA==
X-Received: by 2002:a05:6402:1011:: with SMTP id c17mr35952965edu.144.1632230199102;
        Tue, 21 Sep 2021 06:16:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k20sm7367448ejd.33.2021.09.21.06.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 06:16:38 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B550I Aorus
 Pro AX
To:     Tobias Jakobi <cubic2k@gmail.com>, thomas@weissschuh.net
Cc:     platform-driver-x86@vger.kernel.org,
        Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
References: <20210921100702.3838-1-tjakobi@math.uni-bielefeld.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <610b1e6c-5910-deaf-5a99-8877d0655998@redhat.com>
Date:   Tue, 21 Sep 2021 15:16:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210921100702.3838-1-tjakobi@math.uni-bielefeld.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/21 12:07 PM, Tobias Jakobi wrote:
> - tested with a AMD Ryzen 7 5800X
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll also add this to the pdx86 fixes branch and include it in my next
pdx86-fixes for 5.15 pull-req to Linus.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 7f3a03f937f6..d53634c8a6e0 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -144,6 +144,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 GAMING X V2"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550I AORUS PRO AX"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M AORUS PRO-P"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
> 

