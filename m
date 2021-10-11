Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D585C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 12:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 808BC60EE2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 12:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbhJKM6O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 08:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42507 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235129AbhJKM6O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 08:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633956974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=viKmwUa7rcBGqBnlBwF5+/qMbjMaoc07fuxoSskXJVc=;
        b=RL+PRi7PDYeRaYcwX2MQ0N7YuSXb/s/Gcf4uE6vaF3X6Hr2kPd1pFuYnJLCYvziVkVWzqQ
        klxDeGE5zuJpJhhgUeGtW27lU9kSsbuZftDb4DFgzlin7qDHdFouRCWDzIijutRb39IRvg
        15j1q5koExX4O7gTzaKbzQTgs0NWa2s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-rtibRr9YNsmqePPuYy-8cA-1; Mon, 11 Oct 2021 08:56:13 -0400
X-MC-Unique: rtibRr9YNsmqePPuYy-8cA-1
Received: by mail-ed1-f72.google.com with SMTP id cy14-20020a0564021c8e00b003db8c9a6e30so3404991edb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 05:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=viKmwUa7rcBGqBnlBwF5+/qMbjMaoc07fuxoSskXJVc=;
        b=2wdbPfXuNyWNAU/x5QI3JUmzVpZJ/xpnOo0zPfK00RmKKN3tmbNAORT782dUk7Gvq6
         7ydQBGQqmmFr8F+/iOx1lHc3FX3Ngvy/rU5Lv7dRb8wVOJtyGKuv0H7exgvSVdK5twH4
         OFxklpiELt+5VlV/iMmHI4I+MmTUNnW5Ikxvo6VV17LtzHq63zGakuXlgt62v59IpGKM
         SegUmicleoCI8qG4PvuW0lMw2Lw+74AFIbM9Qh6Fb61ciz4KdTNL4jbEE9RtzKfKq9oc
         mjPhqU0WCheUBv27htwgfVVVQj2C/EKkfwja7EzqDi92J18mUnBUkcJXh2BUKQ2b6G0w
         Rniw==
X-Gm-Message-State: AOAM532gK0550lIXLXKpVk4pcn3xg+akYuEgfc2RAZGc7VeCJE3Q6uLk
        HArx5eD3VZEhJ8ugvs7ZzvZZxP537HG/26DmaMT/aL4gka8kuKjjHQtq6LYkTfQE0uy7yKTLOEz
        irDa9DW6NajidUNy7QSvuZMFLqG6L2I7pE4/FjMlR/q1As/NcAvHDa0muQsGpZJu662ug7LJuJ7
        VYZwFBDPjaHA==
X-Received: by 2002:a17:906:c055:: with SMTP id bm21mr25308814ejb.350.1633956971677;
        Mon, 11 Oct 2021 05:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjEcLUgmrduvGevQNHpAgrOflqn8dBNzlAjhFS8hxjKfn8R6fh6cQNu0kL0J+iiuVOK7wNMA==
X-Received: by 2002:a17:906:c055:: with SMTP id bm21mr25308788ejb.350.1633956971414;
        Mon, 11 Oct 2021 05:56:11 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id h10sm4182132edf.85.2021.10.11.05.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 05:56:11 -0700 (PDT)
Subject: Re: [PATCH platform 0/2] platform/mellanox: Fixes for register space
 access
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210927142214.2613929-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <88795fc8-7f7e-2f4d-fbae-86c7645b5c9f@redhat.com>
Date:   Mon, 11 Oct 2021 14:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927142214.2613929-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/27/21 4:22 PM, Vadim Pasternak wrote:
> Patch set contains:
> Patch #1 - Fix argument for kstrtou32() conversion.
> Patch #2 - Fix rea access for complex attribute.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Since these are both clear bug fixes I will also include these
in my upcoming pdx86-fixes pull-req for 5.15 .

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

