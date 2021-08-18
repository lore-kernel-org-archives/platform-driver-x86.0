Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4E7C4320A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:34:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD66661107
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239884AbhHRPfQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 11:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45996 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239533AbhHRPfQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 11:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629300881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Benrt4p7+lX2XumY6+SSEMQ8nr7l2K2J1dd6bBTIvG4=;
        b=K5qRiYMm7r8f9kvWecDsaI4w4rxpDDsS6l6z2fHKHPSUVHUsO8gI6L7Pjp3nvceAoXuqM0
        tUtE6czGQAbF7BRrhi8xSC4j/pn2VatFaBKc6DEQfAjISOlgXWp7WZoEG0HLQngaJMnvBL
        rmuj249OqS+wEnFL7RhYI3w+6SSHDtg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-ZNLupKy2PS2auhgk6S8A8A-1; Wed, 18 Aug 2021 11:34:40 -0400
X-MC-Unique: ZNLupKy2PS2auhgk6S8A8A-1
Received: by mail-ej1-f69.google.com with SMTP id h7-20020a17090619c700b005bc3c7dead9so1018444ejd.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 08:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Benrt4p7+lX2XumY6+SSEMQ8nr7l2K2J1dd6bBTIvG4=;
        b=bLEtq6jehVGfsZUpNdjuvOCcf2P9qwP2WeEPwyCNKSb8KlJZCMlUgbrl2U8DPltU09
         dWSexC8Lf1fBJ3PWDHajGbFhX8phCW8izVVKQRhXOTouzjizzkGHLkmpt2S+vtZ6MYhP
         nM+wsbxvdoJfyMWTY/THeeoeraq9lXzDK4fwxMfRAbQcnBKQ1ZRK2XutZ9LMY7rufWPt
         cGl9NXnbfdB5JWUaXoRxUFHFhGxjcYc9tSQVT9RE7kYckCPxfZ2OS02RB+mWfZhrlkME
         IpqXvtv8NVSM4hFLnZms9JQpGuFUSDi586OgO6AG+fFnUts2T9ONMaMZt1xZq1LS3Exa
         rjqw==
X-Gm-Message-State: AOAM5307Gziwd2ACxq4xgcYZee4gbbtEjBfqJBpEMaW7mWdTd3+AWJSF
        nBmGC0Zfju+mrWSvi3f2X7snYehaisx8kqCCDPd6bskNWijEjF1jtPeCgTm8+qAao+yZ3vaiZGO
        /XfK+NX2CWRm2tvlSH4svBR8pMqLOPvLrOvYQp71A2NOFj1woVI1rgvo0pDmofGBEnjGn5tly4d
        hXgPw5beD5Cg==
X-Received: by 2002:a05:6402:27d4:: with SMTP id c20mr10917901ede.78.1629300878792;
        Wed, 18 Aug 2021 08:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVA48Cqr7aD+x0YRzcCIU2mfHo06wwChRGvn59UZzrl6XfGzxPuTykZfEC7HXuXdhM9ojviA==
X-Received: by 2002:a05:6402:27d4:: with SMTP id c20mr10917881ede.78.1629300878606;
        Wed, 18 Aug 2021 08:34:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o17sm194306edc.58.2021.08.18.08.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 08:34:38 -0700 (PDT)
Subject: Re: [PATCH V2 0/3] lg-laptop: Support new models and correct events
 for FN keys
To:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <cover.1629291912.git.matan@svgalib.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a9769126-833d-862b-f456-8f58481ff303@redhat.com>
Date:   Wed, 18 Aug 2021 17:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1629291912.git.matan@svgalib.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/21 3:05 PM, Matan Ziv-Av wrote:
> V2 of lg-laptop driver fixes, according to Hans de Goede's comments.
> 
> Matan Ziv-Av (3):
>   platform/x86: lg-laptop: Support for battery charge limit on newer
>     models
>   platform/x86: lg-laptop: Use correct event for touchpad toggle FN-key
>   platform/x86: lg-laptop: Use correct event for keyboard backlight
>     FN-key

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

