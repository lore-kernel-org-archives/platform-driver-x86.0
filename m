Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3316C1B0D9
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7375239FD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgLHKSs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 05:18:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51088 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727628AbgLHKSs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 05:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607422641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V7ghnr94M4oyTTLnAUgx22ge58iAEYBvxpJ10jqNm3Y=;
        b=ZGBoNJ4oKdqXq+u9wiRzSAPtXTdqT8LgvwG8Zl5o9Fqf1mVqone5KMSLnFeLC+to8bXtTK
        snaOTU8yFbpSFxciag5cnv0s9/wIkU+qBLkCyxIls1Pl5uP3VNwmbUfB7sauexAotxyxSr
        G3EQ1VcPgNc6OUISond3TIT4q9GvpN0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-hx-TwI8sPr6ov4_EICezAw-1; Tue, 08 Dec 2020 05:17:19 -0500
X-MC-Unique: hx-TwI8sPr6ov4_EICezAw-1
Received: by mail-ej1-f72.google.com with SMTP id u10so4975032ejy.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Dec 2020 02:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V7ghnr94M4oyTTLnAUgx22ge58iAEYBvxpJ10jqNm3Y=;
        b=C3Rbko12TppGSpYnXjRv4Hjb/nbGFoDDkFwFfp3ekcpmwgXwNyi2z1CW5+JWEdIZTZ
         xOvyUIRrlpo+St86pp2zVTV3StP/F2oUL9zat7qomiVvRzKQTVJngK7oyJO3S7bniMsX
         VUJlTwbKxtFKtWUoIpuxX0Ub/mZJuPAip5n1wDXlcFU5zcwb+mZu6phHHST6az4Oh0mH
         aK/YZWmzzPZ3y/ok7+hCPTsWs1WH9FBzX55hl8OVY1dr3ALoqnte8mC2sXg17HrZ9sN6
         Zd44z51mnD2iqv86riMwFyqeJJtSp1TDX/4WUignWhoqtSvZoCmcMtnSYYl5UfXuReDr
         3APw==
X-Gm-Message-State: AOAM533AQ8QFqMqC4uAvlqG6s3vVaUUTBHuqMLTPY7WS7KQvOrJUhOim
        DEk9mlXJnkwtoEf8yvFtJXzb0LIh3qdSVt6Sxcb5HUc1H+H9i5hi9TtWAZjZmq0KwSbCMwYO0Uv
        YoXhz5NFVWyka/mwPOXCAdMTyj9R6OnfgKg==
X-Received: by 2002:a05:6402:22ea:: with SMTP id dn10mr23620091edb.67.1607422638468;
        Tue, 08 Dec 2020 02:17:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMgz2p79ATKIl5ou8LZsSdM2IsgZ5zLI7QxR6nFDwa+9zzS3kserBJqfTfNEHiZekytu5vqA==
X-Received: by 2002:a05:6402:22ea:: with SMTP id dn10mr23620079edb.67.1607422638268;
        Tue, 08 Dec 2020 02:17:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id qn4sm4333537ejb.50.2020.12.08.02.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 02:17:17 -0800 (PST)
Subject: Re: [PATCH platform 0/2] platform/x86: mlx-platform: Fix item counter
 assignment
To:     Vadim Pasternak <vadimp@nvidia.com>, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201207174745.22889-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a5491c65-8783-a2d8-1fce-a46fa9a718b7@redhat.com>
Date:   Tue, 8 Dec 2020 11:17:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207174745.22889-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/7/20 6:47 PM, Vadim Pasternak wrote:
> Fix array names to match assignments for data items and data items
> counter for power and fan attributes.
> 
> Patch #1: Provide fixes for system types MSN2700, MSN24xx.
> Patch #1: Provide fixes for system type MSN2700/ComEx.

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

> 
> Vadim Pasternak (2):
>   platform/x86: mlx-platform: Fix item counter assignment for MSN2700,
>     MSN24xx systems
>   platform/x86: mlx-platform: Fix item counter assignment for
>     MSN2700/ComEx system
> 
>  drivers/platform/x86/mlx-platform.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

