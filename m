Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FE2C56202
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 14:28:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ADD9221E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 14:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gCbdhyfV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390176AbgKZO2e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Nov 2020 09:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60631 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389951AbgKZO2d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Nov 2020 09:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606400912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CVu3B75nitNrQbGb0VNkttik9wWLapdR6+icCVXpoc8=;
        b=gCbdhyfVzAy8pTHOBprduuuBgSLYAYjs3oYZoajSOPk1lb+v/eXEwzEuTMqEmoTElRxkxL
        5wXBQ7WX6QPYOGGYZS/Nizt6D0FpWYUE3wsssZBLNpq2ZYsKqN8tOpF3/bsrzlCXs1C3DY
        Xn9UphCv18RYAJKHmEj2iSLDeMNPgDk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-AL0mfRDbMIe8XIE-LI5PQg-1; Thu, 26 Nov 2020 09:28:30 -0500
X-MC-Unique: AL0mfRDbMIe8XIE-LI5PQg-1
Received: by mail-ej1-f69.google.com with SMTP id dc13so928040ejb.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2020 06:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CVu3B75nitNrQbGb0VNkttik9wWLapdR6+icCVXpoc8=;
        b=T56Mb3JaNu0U7ci/YHMo7lIeNJogxmS4ncHZZEEEWMaLo9P/cH0ieaxH7NZKI4SL8i
         pfly84332qozwt3LsdrZnX1wDkeYphhDVbZ3/tb86/pUita4QBsExiXYXuC0gnBuVd+/
         y3FlP7NDmzMhmXqA9IVAJe/atrYLicguoyRxbn+2i83/xy8m5riqH+XpPdfBvC6vtAlb
         VnviNtkfng+1XnH9cKumU5hg2FHGjwmwkHqHo+0WzRH9NgKd0S70T2gaNp8KlXm/zlVd
         v66iMngfYXZxxGdpeQqr1NrG71OFFdECimxHiagLw4PPb/RmVYFJscUQLlVyYLe/qYJk
         Xiuw==
X-Gm-Message-State: AOAM5308rgZxGhz7G1Q3GYCI+WnkbConJPG2QFlKR1ijVZY/KPAiC53r
        HzPrsrmjPgApLzStBSV3Q1HT2RUtxKfouVu1aGfBATnavyIxiga28+rC4nOuUfTdcvyYfYaHHWB
        aycA3AD6iN4YCCQorbs6Yx7/KKRIdc5eF8Q==
X-Received: by 2002:aa7:db0c:: with SMTP id t12mr2893202eds.41.1606400908922;
        Thu, 26 Nov 2020 06:28:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAmkD6Jl8VPfHLuK9ob/oKbSpy43wrhhffWo2LKoRhoXvGymEwOD6XcD+RHHITmdBeul3Zqw==
X-Received: by 2002:aa7:db0c:: with SMTP id t12mr2893189eds.41.1606400908783;
        Thu, 26 Nov 2020 06:28:28 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n15sm3302152eje.112.2020.11.26.06.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 06:28:28 -0800 (PST)
Subject: Re: [PATCH platform 0/2] platform/x86: mlx-platform: Remove PSU
 EEPROM configuration
To:     Vadim Pasternak <vadimp@nvidia.com>, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201125101056.174708-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <82e98646-1269-ce44-e573-67f2b852f822@redhat.com>
Date:   Thu, 26 Nov 2020 15:28:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125101056.174708-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/20 11:10 AM, Vadim Pasternak wrote:
> Remove PSU EEPROM configuration for systems MSN2700, MSN2100, MSN274x
> to support the requirement of power unit replacement by "off the shelf"
> device, matching electrical required parameters. Such device can be
> equipped with different EEPROM types or even could be not equipped with
> EEPROM.
> 
> Patch set contains two bug fixes:
> - For MSN2700 and MSN2100 system types.
> - For MSN274x system types.
> 
> Vadim Pasternak (2):
>   platform/x86: mlx-platform: Remove PSU EEPROM from default platform
>     configuration
>   platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x platform
>     configuration

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

