Return-Path: <SRS0=2mT5=DG=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5854CC4346E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 10:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1160E20C09
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 10:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KZ4HPZ5q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgI2KRM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40443 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbgI2KRM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Sep 2020 06:17:12 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601374631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mOObd0ASgZj9ppsbIcbaTgW81uYugr+Ory6jwCP3mGo=;
        b=KZ4HPZ5q9MfqQxUnM+BxRpW2zZySydCam+ry2u6HNM+zVtxED6AqAkaZy1NgTUPJrajDDx
        eJPN2aiHPWU4sQ2FNZ7seP94TatNxG32IJeZ4wV3cCZ/F4pb5bEaN4JtniMgrxmTCMBPYj
        /IeV4mhT7JTWNfC6BuG30mdKmj8NgPM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Kj_uYXrrN2abS3RLE264sA-1; Tue, 29 Sep 2020 06:17:09 -0400
X-MC-Unique: Kj_uYXrrN2abS3RLE264sA-1
Received: by mail-ej1-f70.google.com with SMTP id rs9so1680617ejb.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2020 03:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mOObd0ASgZj9ppsbIcbaTgW81uYugr+Ory6jwCP3mGo=;
        b=s3A5Zd6nNvBpVSkslvAlnENddSbP/mGq2eYIoscag4hxwgMBN1npPRI1qpWm5UuH3b
         njkmi2ChQawWj5iD7DXgavUvE+qVr2O48cksUOJSJI4WVavlewy+EgMaOP8+qz5hvCO8
         augTosJvGNwXRc9xpjXGMeegpF844yD0ioUxaarCMe7f8ru3E7UF1R1A0AgPXoiZK3gR
         kAXh/ugCW+REzDkLLjSfq2x94kj2Fd8gslUifoYRReYMaB4RwpR76LiIQGCiO9RehJJx
         eNyTpuvENRBV1u+bw4YHFwg6Q/hrwqIjbaNNqXzAXrbQMfdQehLKensX4ew3Dph+2Yeu
         bdnQ==
X-Gm-Message-State: AOAM5339QRCPnmQue2d4K/NurXgRGuVzMXi0jmjVtG8ntN/IP0pPLL0i
        VzPake9VOn2+gAUCCFEIumBIsPef+RdaVigzUI7Wa4iCtRGQZrce6qyGFqbKPCqN4Zp3eXHwD/f
        cbEwxdeXkO9fMjtlBUMuLgcnpDabjOdDK5A==
X-Received: by 2002:a17:906:719a:: with SMTP id h26mr3162837ejk.336.1601374628053;
        Tue, 29 Sep 2020 03:17:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcB7ueuDG5cypCgqlJYSWilSBuD2g1k7d0mJR5Wv5Gi/z5RdGn0BdMU/yoIYOfxi+BU0ZnHg==
X-Received: by 2002:a17:906:719a:: with SMTP id h26mr3162819ejk.336.1601374627848;
        Tue, 29 Sep 2020 03:17:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id lo25sm4767646ejb.53.2020.09.29.03.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 03:17:07 -0700 (PDT)
Subject: Re: Keyboard regression by intel-vbtn
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <s5hft71klxl.wl-tiwai@suse.de>
 <bedb9d1b-3cca-43e2-ee44-1aac0e09a605@redhat.com>
 <s5h8sctkk2b.wl-tiwai@suse.de>
 <-ICwwoAndae7T9i-Ymr7Nx9jnXVd7H54dnkMmCWUcApM1S0FUPplPWhg8DVXkphN0L4DoTy24robhTiBzMmSBKZRl-P8VEXIX5r6ttceA_8=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8c3d8a56-541f-aafc-1be9-4d72d374effe@redhat.com>
Date:   Tue, 29 Sep 2020 12:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <-ICwwoAndae7T9i-Ymr7Nx9jnXVd7H54dnkMmCWUcApM1S0FUPplPWhg8DVXkphN0L4DoTy24robhTiBzMmSBKZRl-P8VEXIX5r6ttceA_8=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/20 11:59 AM, Barnabás Pőcze wrote:

<snip>

>> Oohoo, what a wonderful world :)
>>
> 
> 
> Splendid world, indeed. I'm wondering, however, why the incorrect state
> is reported? Is it similar to the linked issue on the Manjaro forum, where a
> different bit is seemingly used to report the tablet mode state, or something else?
> I'm also wondering why it was chosen that a *set* bit means that the tablet
> mode is *off*. All these problems could've been easily avoided... (given that
> I'm not missing anything obvious).

I'm afraid that the only answer which I have to these questions
is not helpful, but in my experience it is true: "firmware sucks".

Regards,

Hans

