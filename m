Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2945DC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 11:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiKOLjZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 06:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbiKOLjT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 06:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A9423E9B
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668512299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cBuz4dB8pKEl0Eik12rqRP7QJDFUdnfWL8rmGUmRMkk=;
        b=KOSvYmpGYqToOyrXpZD8jSyW+ZzwuoT/BTOgHJi9BrSWlsTV2cE0XH0daUW5Ar02YVpCqi
        RHZvHFtvQbvz2MuQK0PQGKo36KS70WXRVt+g239oTnuql/6j7pTWwkBU9g/+sN1piOPvNY
        FI228Cm08jfBH/8k5/HIZuYHK19tiAo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-s0iChnc_M22zT02KWuorQQ-1; Tue, 15 Nov 2022 06:38:18 -0500
X-MC-Unique: s0iChnc_M22zT02KWuorQQ-1
Received: by mail-ed1-f70.google.com with SMTP id z11-20020a056402274b00b00461dba91468so9723710edd.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBuz4dB8pKEl0Eik12rqRP7QJDFUdnfWL8rmGUmRMkk=;
        b=w44QCotuMrzcmRgTT5n6fgD2yc2Y3s6gTDgboMro51o6H3Ja5DJn3IG11+v1JnsYrz
         syU9pdk2OwNxnj5rwXIv+2rEBvaCPHPawC3vGJZ5nmWkLyUa1oLHT23+Z1dSSVkat3/U
         p1F/XKcPj7pG0nnkpOddIsGBXF78z0M7V2/s3qBoZlpiD0dYCQBUa6G7Nb/G2fRxY3bC
         mGTomZLNgxmLgK0zQDBvTa1LVNefi27poWrwQnn5bET+U8QEEn51REB2qnmATFCCgxnH
         16esz9x7G9Z646V8AFw49nY8G6lLPtlS5DQY6+C3Rig3fvNjTEfzW9avPuQj5hJrltmJ
         SDXg==
X-Gm-Message-State: ANoB5pmO1YDMw56sK21/PAyNYaISvdxXhGLvWaWq17eD8yUZ8pRVW9cb
        OjMK994SJybt4ycQxYMIukN2ur3AUILM3lb9K2twqn3RMW6o6tNHbfEo1mjUAwJwyGCoJJmuJ68
        PJqP8kRim2975CIVWVxl/tqyywZ/zxeNiig==
X-Received: by 2002:a17:906:81da:b0:78d:a01b:b474 with SMTP id e26-20020a17090681da00b0078da01bb474mr13759810ejx.8.1668512297138;
        Tue, 15 Nov 2022 03:38:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4wT12I4HXRTPwOUfdpoipCB1G2eQz/MycoS5CRqzbh4CrriFYMveBAuh7Af5AA11wxq9NXlA==
X-Received: by 2002:a17:906:81da:b0:78d:a01b:b474 with SMTP id e26-20020a17090681da00b0078da01bb474mr13759801ejx.8.1668512296987;
        Tue, 15 Nov 2022 03:38:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709063ac400b007acd04fcedcsm5404574ejd.46.2022.11.15.03.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 03:38:16 -0800 (PST)
Message-ID: <14f8fbd3-b1db-34af-d443-947bbdb21e37@redhat.com>
Date:   Tue, 15 Nov 2022 12:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/1] platform/x86/amd: Fix pmc compile dependency errors.
Content-Language: en-US, nl
To:     Borislav Petkov <bp@alien8.de>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     Yupeng Li <liyupeng@zbhlos.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "caizp2008@163.com" <caizp2008@163.com>,
        "smf-linux@virginmedia.com" <smf-linux@virginmedia.com>
References: <20221026072531.346013-1-liyupeng@zbhlos.com>
 <0910bcc4-d55f-6f3a-b2df-4e30d164aeeb@redhat.com>
 <721f6a1a-1144-4fe4-e722-2ba2d7200680@amd.com> <Y25m8tPTtyfHOCfK@zn.tnic>
 <MN0PR12MB6101AB9F2AD8A41CE3EC5650E2009@MN0PR12MB6101.namprd12.prod.outlook.com>
 <Y25sohHGkdAn5OZD@zn.tnic>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y25sohHGkdAn5OZD@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/11/22 16:39, Borislav Petkov wrote:
> On Fri, Nov 11, 2022 at 03:16:10PM +0000, Limonciello, Mario wrote:
>> I sent up a patch for it, but Hans hasn't applied it.
>> https://patchwork.kernel.org/project/platform-driver-x86/patch/20221108023323.19304-1-mario.limonciello@amd.com/
> 
> Yap, that fixes it.
> 
> So yeah, Hans, make sure to Cc: stable too when applying.

Done. I'll send this out in my next fixes pull-req to Linus
before the end of this week.

Regards,

Hans


