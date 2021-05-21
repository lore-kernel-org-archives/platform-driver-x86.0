Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE7CC433ED
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 09:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 362A1613C8
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 09:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhEUJvK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 05:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230488AbhEUJvJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 05:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621590586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IjVI8NV63LFnPGjIGDVYVcxDE8c9QMm9DxXJ2CvIadY=;
        b=hr2++mwxUOzjvthMdknOkNvBGgkGjujR5GhSk3bTnfUrOZVEZfn25+2270JK0Lj9LIXpaP
        OYwv/7wAWZ40E6t/KvETDe6FPjhyUIggnf5ZdkS8TlDaymEVj4vayGB3ocZHAOvStQ8STn
        d1o12watnY+Tc0egJI0Bl8clrK1hKUk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-rfhHMrwQM7eZrR2nvBL6GQ-1; Fri, 21 May 2021 05:49:44 -0400
X-MC-Unique: rfhHMrwQM7eZrR2nvBL6GQ-1
Received: by mail-ed1-f71.google.com with SMTP id w22-20020a05640234d6b029038d04376b6aso11012096edc.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 May 2021 02:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IjVI8NV63LFnPGjIGDVYVcxDE8c9QMm9DxXJ2CvIadY=;
        b=df8Uxmi3MEQGaFawfCNXthiV02HLRGJeOUSoojHtVnzgFVF3ByNSMl5+Oar+683io3
         89IraqtcSoqLRL/mh9IzxUzzdi29m6rRdLmFdo2gDcp5OX0R7lBawBaHTQ4LDNYTERG/
         l0nXoZdyNlMyKEIv1qTu/3SBKxC4zfiKMR5DIr6DCWsGdVCXGClsriBtuMB/QKpiJwBv
         /B/vr2C8GPXA/kLPwg6ec5J1dJjkqNn4JKr6KDmyLzAlgJB3O/SBA2vRtL+gMD2BOU9U
         +MFoboZUDb6OqoCNsMYfCwt8slOhlG2JQyRx+J5LFU+dBTl9hPLouuB5B1/riDgMcLUh
         /6dg==
X-Gm-Message-State: AOAM532rINmWLX3mgqg6csB8sepE/G8+dE21TgpaAkjJ2BTUnfocFfu1
        ptA6X9bbs3fPAtBH+Nt6gQqx0p0CbJkdfLlh2n85s+06h2TQMF2DeOucre5+6jR1TSByvVxZ7y+
        9e8jFwF/WELOeMfE1lyzGGolpZc4b3iHSNA==
X-Received: by 2002:a50:9549:: with SMTP id v9mr5774806eda.312.1621590583172;
        Fri, 21 May 2021 02:49:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGCWJDbkwFAmEbqh+wdMCPdSMdHGIeh58ElK08TuCsv7fsjYCeXL6Z9Y7Ni3bPbEWS1QxI7A==
X-Received: by 2002:a50:9549:: with SMTP id v9mr5774787eda.312.1621590582999;
        Fri, 21 May 2021 02:49:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id by3sm3715628edb.38.2021.05.21.02.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 02:49:42 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix inconsistent indenting
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, hmh@hmh.eng.br
Cc:     mgross@linux.intel.com, jdelvare@suse.com, linux@roeck-us.net,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <1621589904-64475-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <00c331bb-17ec-89c0-6dd0-ffe2933df07b@redhat.com>
Date:   Fri, 21 May 2021 11:49:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621589904-64475-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/21/21 11:38 AM, Jiapeng Chong wrote:
> Eliminate the follow smatch warning:
> 
> drivers/platform/x86/thinkpad_acpi.c:7942 volume_write() warn:
> inconsistent indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index dd60c93..d0aa566 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7939,7 +7939,7 @@ static int volume_write(char *buf)
>  			} else if (sscanf(cmd, "level %u", &l) == 1 &&
>  				   l >= 0 && l <= TP_EC_VOLUME_MAX) {
>  					new_level = l;
> -				continue;
> +					continue;
>  			}
>  		}
>  		if (strlencmp(cmd, "mute") == 0)

Thank you for your patch, but actually the indentation of the "new_level = l;"
is wrong, it is indented one level too much.

Please send a new version changing (reducing) the indentation of the
"new_level = l;" statement instead.

Regards,

Hans

