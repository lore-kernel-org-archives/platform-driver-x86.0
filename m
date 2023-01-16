Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CF7C46467
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Jan 2023 16:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbjAPQrN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Jan 2023 11:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233877AbjAPQqd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Jan 2023 11:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9B14EC5
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Jan 2023 08:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673886808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ktJY7iT7aszEO9Fplsh+7BPSeM8Ab+8TqOWZCHi0oW0=;
        b=C0OvbUJpow7ijY4uLosZBiAcKExgbHbS5Gr7i1Ucl6Swbm7oZyiWOLzXRZxaVcQir5fMPV
        mfdWmGNJcbSp8T3p7//j8JFrCNErZzXc5CdenGvMdSe02mx1n5tkyUbvo/VeKgssFHiV2M
        W3ib/RmTlnlIsAeRWiCASg1R8WK2Fts=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-0FmihqZcPo-gjon0rWvsuw-1; Mon, 16 Jan 2023 11:33:27 -0500
X-MC-Unique: 0FmihqZcPo-gjon0rWvsuw-1
Received: by mail-ej1-f70.google.com with SMTP id qb2-20020a1709077e8200b00842b790008fso20278879ejc.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Jan 2023 08:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktJY7iT7aszEO9Fplsh+7BPSeM8Ab+8TqOWZCHi0oW0=;
        b=zGTNy8+eRCD1BhbIUp3EbgqG0cOpc66Rgr2uCIk4OBQXeGnttFKgZ2hhfRoYLfeFP0
         mmyw28oalsndkaDQNZ1xPLDGrqHPjN/D+MhmksLGRAXae8lHu8WaaOwY3mHvAh9Lw3Y0
         OB3A0Exe2f+eU0pQ0GAE2P0abcuXheQyVESbLfGKNM5dWbTN5jlcQzKsmmPKnA/wwUMP
         LTpyKdnqKH3J1ESu3iMlzb1kp94fnA78A+F3DKN9aCjK4FcvvvUFdCMWatBUEBg5ITgw
         ZFGGPS119J3wXpvg03fNqgTDa4MZ9/s+vwivHIOhmH7avebfuoa1+l+hvGJeEOffzdWr
         bE7g==
X-Gm-Message-State: AFqh2koPEawSKWbduMWNNLglcz7/BT2rUeO10C7QSKL7NLsA6bAQNmTf
        xdT5rlkSpDAxBGJpkkgtl8Z7tG8/MS9JzmGwBsI5Ygqeqsm9gosHyCKPNUHL7ts/ISmBrdRLNpn
        YUJTmQm56VNEVEBmT9F8tPtydtdC5sCLsVA==
X-Received: by 2002:a05:6402:2889:b0:49e:1c17:904 with SMTP id eg9-20020a056402288900b0049e1c170904mr2702189edb.15.1673886806393;
        Mon, 16 Jan 2023 08:33:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsN6Isr1R09l1LLTyhAH+Uvcgh0NEONfRYIXJL47Ii/lFdh/So3zW3rOgKBvmbqDUctbSvf7g==
X-Received: by 2002:a05:6402:2889:b0:49e:1c17:904 with SMTP id eg9-20020a056402288900b0049e1c170904mr2702178edb.15.1673886806235;
        Mon, 16 Jan 2023 08:33:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7dcc1000000b0047a3a407b49sm11680629edu.43.2023.01.16.08.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 08:33:25 -0800 (PST)
Message-ID: <7c2bbed6-3cbb-2e2a-f3bb-f389149d4181@redhat.com>
Date:   Mon, 16 Jan 2023 17:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] platform/x86: Drop empty platform remove functions
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Peter Kaestle <peter@piie.net>,
        Mark Gross <markgross@kernel.org>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/13/22 17:23, Uwe Kleine-König wrote:
> Hello,
> 
> this series removes all platform remove functions that only return zero
> below drivers/platform/x86. There is no reason to have these, as the only
> caller is platform core code doing:
> 
>         if (drv->remove) {
>                 int ret = drv->remove(dev);
> 
>                 if (ret)
>                         dev_warn(...)
>         }
> 
> (in platform_remove()) and so having no remove function is both
> equivalent and simpler.

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





> Uwe Kleine-König (3):
>   platform/x86: acerhdf: Drop empty platform remove function
>   platform/x86: intel: oaktrail: Drop empty platform remove function
>   platform/x86: intel: punit_ipc: Drop empty platform remove function
> 
>  drivers/platform/x86/acerhdf.c         | 6 ------
>  drivers/platform/x86/intel/oaktrail.c  | 6 ------
>  drivers/platform/x86/intel/punit_ipc.c | 6 ------
>  3 files changed, 18 deletions(-)
> 
> 
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476

