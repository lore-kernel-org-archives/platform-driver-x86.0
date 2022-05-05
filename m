Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7268DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 May 2022 17:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382368AbiEERgp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 May 2022 13:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235800AbiEERgo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 May 2022 13:36:44 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0EB6B52E64
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 May 2022 10:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651771983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eM4cXVKw10nB3OTGJYme9KzcjWir9gWjYqhtqtiwXZE=;
        b=fVwDSHoR5LFp2nPrkoqQyym1918WNnWeQYagCs+JkEj0Iul67ru2UdHwsJEUBz+gLE2Em9
        9HImIfyamONvRe/YyF2NBYhmOZ0jWi591pKezEppjgvQqSIWegq8UTq761WWzjE72I7zm9
        e/8p8QtrcFxqPbXTmSWvzI0WOjEsAVE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-1bT7B2NfOraHADSg2QXAqA-1; Thu, 05 May 2022 13:33:01 -0400
X-MC-Unique: 1bT7B2NfOraHADSg2QXAqA-1
Received: by mail-qv1-f71.google.com with SMTP id kj4-20020a056214528400b0044399a9bb4cso3744440qvb.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 May 2022 10:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=eM4cXVKw10nB3OTGJYme9KzcjWir9gWjYqhtqtiwXZE=;
        b=QUMEMvj+JIfTqxB+DSVTSmCY9mdLGljKaKOrJirrpo1l/cDmY+uUjid2R8n4x9P+40
         OOr0rarylBhaGwU63fxbDgXbl+4tpPAV5ZR1SaB8iDH8XwHZkt1/AwGDMUiNDgs5wmKU
         o8rDg6RS1N/zqHtEGwSSGgMtdpPw4rI9KPLqUUymP/yfstBULw6Q+/VeGiwNqdDMteP/
         Yut2p66U7ihP0gmSrvXy9QyKTNvYF/ep6R+XykCHbezTiPg/iCHujONqQ2LJr03sf1yH
         KeTh1cDcsVwQa4DcUHqFdyJb32I/wfPADdIGJqQCDiz65BGlXdr6eshLOCmpzpy06PkL
         4Qdg==
X-Gm-Message-State: AOAM531sutdASN6F4ayfxd66tUxZCVJTVFFKNI1r1yW76KCWprNAp5As
        DPlUAFKVo7hKAziNbs5EQtlje/xwshXAfUPPkB/+YXZTzC2gdYa58mMvxgA7+GCML5pUOfbSJ6C
        kW8pkZ+qen77MffAJN2MBINAG0P8bzTlq1Q==
X-Received: by 2002:ac8:4e53:0:b0:2f3:af5d:a9b5 with SMTP id e19-20020ac84e53000000b002f3af5da9b5mr12338433qtw.392.1651771981307;
        Thu, 05 May 2022 10:33:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPHgC56QvOK+uBy2tDqzB0GLPmPDg3MBQbs3tVpbIzKXq1gmmk+M1Qkkgp1in43pE+HtBSIg==
X-Received: by 2002:ac8:4e53:0:b0:2f3:af5d:a9b5 with SMTP id e19-20020ac84e53000000b002f3af5da9b5mr12338413qtw.392.1651771981092;
        Thu, 05 May 2022 10:33:01 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id a26-20020ac84d9a000000b002f39b99f676sm1126848qtw.16.2022.05.05.10.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 10:33:00 -0700 (PDT)
Message-ID: <bb8fa51d02d84c2a912709f3e308e096b6fe7988.camel@redhat.com>
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Correct
 dual fan probe
From:   Lyude Paul <lyude@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>,
        Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Date:   Thu, 05 May 2022 13:32:59 -0400
In-Reply-To: <191b8c12-c04a-197c-d9e6-f510c738ba41@lenovo.com>
References: <markpearson@lenovo.com>
         <20220502191200.63470-1-markpearson@lenovo.com>
         <bcc78237-fa4c-4d9f-86a6-4d1a8ea0e0fe@t-8ch.de>
         <191b8c12-c04a-197c-d9e6-f510c738ba41@lenovo.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

So - no promises, but which laptops in particular did you need access to? I
should have at least:

P50 (I think??? would have to double check this one), P1 2nd gen, X1 Extreme
2nd gen, and I think I may have access to a P51/P52.

As well, I only have a few old thinkpads (there may actually be a bunch in the
boston office though). However, given how nice the older thinkpads are it's
not too unlikely I could poke around my friends who still use ancient
thinkpads and see if any of them have access to these. Problem is though the
older IBM models seem to be the ones missing comments with the model numbers,
so I'd probably need to know what those are. However, given how old these
machines are feel free not to bother with it if identifying the model numbers
looks to be too much work.

On Wed, 2022-05-04 at 21:57 -0400, Mark Pearson wrote:
> I had deliberately done it this was as the logic was cleaner this way
> with setting/clearing the second_fan setting but I'm good with putting
> the order back as it was and doing the quirks first.
> 
> I'd love to get rid of the quirks completely but looking at the list of
> platforms there's some I'm not going to be able to get hold of to test
> so it's moot.
> 
> Mark

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

