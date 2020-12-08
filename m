Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EFAC4167B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19FB523A9A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729042AbgLHKUT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 05:20:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43217 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728966AbgLHKUT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 05:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607422732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b7LOANfTF5gMvsSKtEMAGjg/y+yK0PO3JhcZ4OHPyHg=;
        b=dmYVtUfX803MsbUzXUYOof+jVj5E/x38vCgk59K0UgDld3smPSntPhfcvz8f0QAw9AFuyY
        +D2VCDcqcAGt2Duy1MOvBfh0cLcG0WL+/ZKsG7WALgJpvp3gLffyq6YAg9W5scZ7FTPIne
        p6XwR5BHQUc+S8OMdmnLOkxfmJrgDU4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-S5TBGAhzOZCPo0m8qpkZaw-1; Tue, 08 Dec 2020 05:18:51 -0500
X-MC-Unique: S5TBGAhzOZCPo0m8qpkZaw-1
Received: by mail-ed1-f69.google.com with SMTP id ca7so7247286edb.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Dec 2020 02:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b7LOANfTF5gMvsSKtEMAGjg/y+yK0PO3JhcZ4OHPyHg=;
        b=W0GERh2oKIlLkUyKX3foHwIj9hM/G61abfZ9tWgoTDeS5tJeH+jIGHk/J1SgQEvVfA
         3SjCYwAnNVbDFCQYYGNeysdfsljFFsmBwSInBr7BEQ29TrRgIxpIC7+KG1+w/a267BOI
         YguSaDwFSvl3TfPYYjXO+JsxEKJPfU2IGnjJyrpF3q1ra2hOaLYdlb1VgOg/eIDvA6Hn
         h+ZUG5Nikqm0/FUkoLDhFlgtOnMjmRzBXcfZPGhrA702zVKpl/aAR84YSGbzfY+ZvJ/7
         NjnE4zYqUI9Ecu3yXLMLnS2fPvtmWcBwcVlh9vBV1mnD7I4u4LVZNb6evj1pGRAGu7fC
         sImg==
X-Gm-Message-State: AOAM532Lu1ESg4671JDEiMDS7oHwNpGCB6j6+YPC+3CSAmXxaf6PEI/5
        obOd6q1UtCtAbNhHI5r8s6/94zvbqoA/DNqL/vHHt39kzBRYdzhDEdDgLEh3MF8Qpz2qtpGRcan
        gdFqZaJIVwVhj0hoU3bRk/HTjpUNKy0MrBw==
X-Received: by 2002:aa7:d593:: with SMTP id r19mr24511414edq.246.1607422729771;
        Tue, 08 Dec 2020 02:18:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7PwJ5Xhw6dDA7aQnhq9gGB/+8srB77KAMv7jQcrP04mf3blXTVQ6nPWulz90+0WzE0O3mpQ==
X-Received: by 2002:aa7:d593:: with SMTP id r19mr24511412edq.246.1607422729650;
        Tue, 08 Dec 2020 02:18:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id 65sm16844617edj.83.2020.12.08.02.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 02:18:49 -0800 (PST)
Subject: Re: [PATCH] x86/platform: classmate-laptop: add WiFi media button
To:     Chris Chiu <chiu@endlessos.org>, cascardo@holoscopio.com,
        don@syst.com.br, dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessos.org, Carlo Caione <carlo@endlessm.com>
References: <20201208061111.29073-1-chiu@endlessos.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7e225468-5af3-fcd1-8aee-bde2344a0ec0@redhat.com>
Date:   Tue, 8 Dec 2020 11:18:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208061111.29073-1-chiu@endlessos.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/8/20 7:11 AM, Chris Chiu wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> The WiFi media button on the Quanta NL3 reports keycodes 0x8b and 0x9b
> to the platform driver. Add the mapping to support these codes.
> 
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> Reviewed-by: Chris Chiu <chiu@endlessos.org>

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
>  drivers/platform/x86/classmate-laptop.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
> index af063f690846..3e03e8d3a07f 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -1023,6 +1023,8 @@ static int cmpc_keys_codes[] = {
>  	KEY_CAMERA,
>  	KEY_BACK,
>  	KEY_FORWARD,
> +	KEY_UNKNOWN,
> +	KEY_WLAN, /* NL3: 0x8b (press), 0x9b (release) */
>  	KEY_MAX
>  };
>  
> 

