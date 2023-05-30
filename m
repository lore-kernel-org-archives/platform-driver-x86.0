Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B17CC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 May 2023 09:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbjE3J2D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 May 2023 05:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjE3J1a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 May 2023 05:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8457410F0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685438722;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iGFdC+Cr7aKjAl09TH5gAS+8YxPdVhcFSlEZ7wtzGTo=;
        b=OZohiWF3dHisbx1uZQqPCD5/IXOBPtLNFiPA5WFSPG2OzAzr8YfpkMmSlUOaXaC2/6JhZ+
        kJdccbosV9h6+74Sqp5m1x44qv6FyN8brvCYRE3VDrlVa2qcy4GBMB+fXJJBL0/ek42CM7
        nJ2S3k/RSFOcPwwdmvFG4WzC6RiqTAA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-lrq0JP6YMIibsMkmKOFw7w-1; Tue, 30 May 2023 05:25:21 -0400
X-MC-Unique: lrq0JP6YMIibsMkmKOFw7w-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5149ab05081so1781016a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 May 2023 02:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438720; x=1688030720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGFdC+Cr7aKjAl09TH5gAS+8YxPdVhcFSlEZ7wtzGTo=;
        b=b+pM/2ac39mNP1OawtLCGX3eXq1NpkEyHtk/rkaIZsQJVv/jx46K7BulcmyiKDY2Be
         es4vpi+gLj5IIWR/010dNH17a1GK/5GvvtG1tvqyzBjs/+f3ngRUKSeWdAHc14l1O8dg
         bTdyEJ4CvDVhF/cuCJ1mEVMMM/6ao35ws2G9AmBTx+8vioVmcoZ4jXX0+ARFUwMlc+qr
         U9oKSMhbl5pJ6cbHqjwrgOez6+kGpSp/dlb6FztE7LXQxjhzRoAMW5vyex9H4qWgJFOV
         /60GqAouTMf29HMi7qHQRdCwsRU1tUuUBH7ex6utFfw7hN5Dfobn1Vzjof8pAis9spI4
         gWlg==
X-Gm-Message-State: AC+VfDzmg8Rj7wxG6IJNEva9iQVmR6FkokAWlqAWZ1jX5FbLx8shj1UZ
        hJTUbQj2SXX6HMRoYwJywzxTDJKFhPh9KSG5x4dzauGVD2GqZS9kA0sBv5+kqebnzzrdofdQpyD
        y6/0L1mNPPsA8EIxkF3KXuVdUh/+DeuTXdqcGzYmQpQ==
X-Received: by 2002:aa7:d586:0:b0:508:3b1f:e6b5 with SMTP id r6-20020aa7d586000000b005083b1fe6b5mr1131318edq.15.1685438720208;
        Tue, 30 May 2023 02:25:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ511i+IlMrjdQEJaICGOkr307RIVrnzNJvm1eJGPS5QvRTCkjJO0Vsv78u0FAcgUlNcYeeTIg==
X-Received: by 2002:aa7:d586:0:b0:508:3b1f:e6b5 with SMTP id r6-20020aa7d586000000b005083b1fe6b5mr1131312edq.15.1685438720035;
        Tue, 30 May 2023 02:25:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ca28-20020aa7cd7c000000b0050bc6d0e880sm4100809edb.61.2023.05.30.02.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:25:19 -0700 (PDT)
Message-ID: <1cd0a13e-1842-2e1c-524b-e9580ea48b52@redhat.com>
Date:   Tue, 30 May 2023 11:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/2] platform/surface: aggregator_tabletsw: Add support
 for book mode
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525213218.2797480-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230525213218.2797480-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/25/23 23:32, Maximilian Luz wrote:
> Surface devices with a type-cover have an additional "book" mode. This
> mode is activated when the device is oriented in portrait mode and the
> type-cover is in an open position (including completely folded back;
> unlike in landscape orientation there are no special modes for any of
> the intermediate positions).
> 
> Currently, this mode is unsupported by the tablet switch driver, leading
> to an error message (see individual commits for the exact messages).
> Since the keyboard and touchpad input gets deactivated in this mode, map
> it to tablet-mode.
> 
> I've split this change into two patches, one for each of the subsystems
> (KIP and POS). This a) allows proper attribution via the "Fixes" tag and
> b) with that should allow them to be backported fairly easily.

Thank you for your patch series, I've applied this series
to my fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans






> Maximilian Luz (2):
>   platform/surface: aggregator_tabletsw: Add support for book mode in
>     KIP subsystem
>   platform/surface: aggregator_tabletsw: Add support for book mode in
>     POS subsystem
> 
>  drivers/platform/surface/surface_aggregator_tabletsw.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

