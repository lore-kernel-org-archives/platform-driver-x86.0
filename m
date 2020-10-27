Return-Path: <SRS0=wg3L=EC=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B98C388F9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 11:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1749820829
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 11:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="El20sh9s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1746461AbgJ0LyM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Oct 2020 07:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33574 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S367979AbgJ0LyM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Oct 2020 07:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603799650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wcz7Jh3j3aQGwV+LI07wyYiNRQxa8Qovi53GHA6Gqy0=;
        b=El20sh9sVXbfKdy3sN8v4lpETtvxPlUspp3PwpDwoEnvbcTTmkAyGMKCmobUJ1k1F6yyN9
        OjOq/10wKOtP98v6zsIYdYIx9Mvjup3ZWEaXvT2l9paJag2HPy9njGvuziSpWD/2UPcqp/
        c4Sen2NQzanoZOP5ByU3uDnanO+BuwQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-ZHfFNZvyPaWAnKCv3QQ3UQ-1; Tue, 27 Oct 2020 07:54:09 -0400
X-MC-Unique: ZHfFNZvyPaWAnKCv3QQ3UQ-1
Received: by mail-ed1-f71.google.com with SMTP id u12so553043edi.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2020 04:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wcz7Jh3j3aQGwV+LI07wyYiNRQxa8Qovi53GHA6Gqy0=;
        b=SM1+omsNcM86tEzPjwYfg3p47iZqN8aWXM3AwrpPJNWid2oGr7GjS2NaTC3yJtIB14
         EqJyBXO6K98cIzkpEr9L91fvbHO/QPyxzGpbygEOPW2pcEGVibjezXv79yYEiNdYx2uu
         8GH5PSpUSkspDBEt8QAAubfYbAGcZdqM9tdLPzVJxL9X1OWlx/f5Xyzd2ETRvDb5u1hr
         TbdR25rawj+6IO+SLfnGZAZEyr6dcpUJZ4113/dkvyudckB4YloV9OLMBd13SvwTjg1q
         Sv+zPsGrH+n91lLezm+i04PTWgd9XQG5f4AVbcKrHm23tCktcXkYUHGs/mX+gr5rNTMw
         IvIA==
X-Gm-Message-State: AOAM531vJYMqv3EmyfGPFC/X+JZwHQEgKnSY23f4zLJcmYn/GcbuvX0s
        VdoOHChJdvBrUcst2SJSvVymluNH4PdGz9CelgRQoRYlk7JikLBjvLciasQclleo8nMM9/w2OHB
        Zzw7n6uYwSgyt6n4G4ZyByntnRmg9pdMSNg==
X-Received: by 2002:a17:906:3e48:: with SMTP id t8mr2007249eji.104.1603799647130;
        Tue, 27 Oct 2020 04:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD6dQuaGLcdO4jOMamhPnr6gep/CM2TLxXgKYxUPWXuFnpPAvU7Fy+O7IlgITHOocrLrwUSQ==
X-Received: by 2002:a17:906:3e48:: with SMTP id t8mr2007237eji.104.1603799646898;
        Tue, 27 Oct 2020 04:54:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id h15sm890976ejf.50.2020.10.27.04.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 04:54:06 -0700 (PDT)
Subject: Re: [PATCH v4 0/5] platform/surface: Create a platform subdirectory
 for Microsoft Surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        Stephen Just <stephenjust@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>, linux-kernel@vger.kernel.org
References: <20201009141128.683254-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <63c4454f-a8a9-badd-421c-ea6b018bf01c@redhat.com>
Date:   Tue, 27 Oct 2020 12:54:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201009141128.683254-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/20 4:11 PM, Maximilian Luz wrote:
> As has come up in the discussion around
> 
>   [RFC PATCH] Add support for Microsoft Surface System Aggregator Module
> 
> it may make sense to add a Microsoft Surface specific platform
> subdirectory. Andy has suggested drivers/platform/surface for that.
> This series follows said suggestion and creates that subdirectory, as
> well as moves Microsoft Surface related drivers over to it and updates
> their MAINTAINERS entries (if available) accordingly.
> 
> This series does not modify any existing driver code, symbols, or help
> text.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

