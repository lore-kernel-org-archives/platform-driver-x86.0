Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22380C4167B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Oct 2023 14:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjJ2OM3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Oct 2023 10:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjJ2OM2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Oct 2023 10:12:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5749B8
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Oct 2023 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698588698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B7RRuWO8DuTUd/JPOGnWGCp+6a0KP5E5NVbq7dIsXtY=;
        b=fbD4WH7xQJtZcwL9aEAJ+y9h2NzGHLRRV0Cwat5jsbYGf+bqDDotwCSHViyopOPgzIJ71P
        CDBsNImpzcuqkUF3NrEcvuxsRx31CBr8mrpLdZD8KX9eKrauoxNf+qM7i9SEfLRjUE8NUO
        6kt1BXY0wi5up0nUawMF2M3IoxDdEnM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-WdDmw3XdNc6xtcTOMDUP2w-1; Sun, 29 Oct 2023 10:11:36 -0400
X-MC-Unique: WdDmw3XdNc6xtcTOMDUP2w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a62adedadbso247971866b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Oct 2023 07:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698588696; x=1699193496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7RRuWO8DuTUd/JPOGnWGCp+6a0KP5E5NVbq7dIsXtY=;
        b=AhN6s0HuTgsbGGtFq37DzytAQz9CcBji04tJXIaK0tc9KczP1jtswraa/8dUm2GxPN
         KiisysgJk9CdSK5vUOlrhUQCydinar5qAYM2TUZm6W5cIdCNSzOFfF7AA9ttzKcuYTVs
         olXOMfWB1Vv/mAzp5WboMHRkVrchpwIsUpJ3A7BDNcWLXOciLaplCey4Pe/SN6kddTQG
         Q1NNvmrTjoU1lqcCflWnJxMk3V314b2VMj6pf/ZQGbA698mIs374aHU2pXMJdAIsQ09o
         OuXADJczkn38llq09d58OBcQgr/ExgJku1NoU3ohp74X93pN8UIS2gXeriuuOSFPqIFo
         Wprg==
X-Gm-Message-State: AOJu0YxfScpSxL01qn8YVyAcR9XSwXhX8xx+rqdq4HShJTSSvRTzXFfd
        noD3TyH39IFfX1lHLLITuVOeMJXoMG2xop1wMayDL/o+Nget1GPOQ+vje1Id5q9xUZOZxQiqPGx
        15Oowny0xJX+AWTlb/WuAjy8q+hFDFL3pBA==
X-Received: by 2002:a17:906:eece:b0:9ce:96db:c83e with SMTP id wu14-20020a170906eece00b009ce96dbc83emr7528859ejb.42.1698588695854;
        Sun, 29 Oct 2023 07:11:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo2o4o4mB16rbOSmHXI7z5lQFlPtCbMBajwEhTUxskiosk/x6gkJ28R8qh8mPL8vype5LPhw==
X-Received: by 2002:a17:906:eece:b0:9ce:96db:c83e with SMTP id wu14-20020a170906eece00b009ce96dbc83emr7528840ejb.42.1698588695539;
        Sun, 29 Oct 2023 07:11:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906719500b009c657110cf2sm4359890ejk.99.2023.10.29.07.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 07:11:34 -0700 (PDT)
Message-ID: <7eb734c7-1246-d938-49da-fb1419d35492@redhat.com>
Date:   Sun, 29 Oct 2023 15:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: Add s2idle quirk for more Lenovo laptops
To:     David Lazar <dlazar@gmail.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <ZTlsyOaFucF2pWrL@localhost>
 <e2370602-256a-4c30-b73f-1552d7d8bf22@redhat.com>
 <ZT5ekV2JaWhf5bWF@localhost>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZT5ekV2JaWhf5bWF@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 10/29/23 14:30, David Lazar wrote:
> On Thu, 26 Oct 2023, Hans de Goede wrote:
>> I'll prep + send a fixes pull-req to Linus
>> with just this single patch tomorrow.
> 
> The patch recently landed in Linus' tree, so thanks for that.
> 
> I didn't realize that the fixes for this laptop family would be also
> considered for the stable trees, so I hadn't Cc-ed
> stable@vger.kernel.org in my original patch.  But I now see that gregkh
> picked up Thomas' fix for stable-6.1 and stable-6.5:
> 
> https://www.spinics.net/lists/stable-commits/msg321665.html
> 
> So, should we also forward this patch to gregkh, to make these laptops
> work with the stable trees?  What's the process for that?

Yes you should also submit the patch to the stable series.

To do this send the patch to stable@vger.kernel.org and at the top
of the body (so below the first line / subject) of the commit msg add:

commit 3bde7ec13c971445faade32172cb0b4370b841d9 upstream

So the entire commit msg should look like this:

"""
<original subject>

commit 3bde7ec13c971445faade32172cb0b4370b841d9 upstream

<original
 body>
"""

And then submit the patch with this updated subject to
stable@vger.kernel.org and that's it.

Regards,

Hans


