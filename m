Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70595C07E9A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 13:12:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 512276128B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 13:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhGNNPG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Jul 2021 09:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31514 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231522AbhGNNPF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Jul 2021 09:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626268333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ib5sAqWu/NMDDmkx1SlogJuAklOslb6IPIKDVn2qUwI=;
        b=IGqWF1BPvKxRyXDf3PG7NCc3sz3RlzIq3XLQOSQuNK/BbQqhLwQ0bP3lKip76+G3+ryORC
        rJN3dmoFtWmxO6N/e0IQY+wf6DhQPecNNNETFaWQDYfZbNkkp0neHmGH3LA8dlMW5Rz/hB
        eByGY0HMJmBL8MVyfjHUtBaJR16Bz9E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-qYwbfQ5yMM6HfEB_GuEwZg-1; Wed, 14 Jul 2021 09:12:12 -0400
X-MC-Unique: qYwbfQ5yMM6HfEB_GuEwZg-1
Received: by mail-ed1-f72.google.com with SMTP id z13-20020a05640235cdb02903aa750a46efso1226540edc.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jul 2021 06:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ib5sAqWu/NMDDmkx1SlogJuAklOslb6IPIKDVn2qUwI=;
        b=ekdSFIPi5jgsIN/w3GeUAkKT17Rk39IqFogTaAXoZdqu0ed0pjG70CTceVNjyJ1G0H
         LEa7+EHP36xbx0l3LhXICEg3R6/r8vpudPMglP181W1CLP5DgOslQ7vfe97a0GklgUnC
         7bp6dum9kb22H2ViIQq0hk/71tqSpzW3KsWTx8QUaAliIjfKlXShXvniIf0JoLNCdxl+
         0MdNiJtxbVWBnUR+G6viGQrgWZJwPs/U8pVQ5C+J9bmRsGHzTEXVK0eM7WCBHDQntQ7r
         BK9PXEgxTEXq4V4bdoYuSfn/nW8dmGgEDVlL3aOPivMF2eg54aiUxk+Dpy7fW5vvko0c
         WL/A==
X-Gm-Message-State: AOAM531p9xT5UuKqMZSEzEJXyX4SvwiQyOdQALaQ17r2rdvtJJ9Y/YqH
        lHqXC7TLcqkyIsZI31xt6UK4O3zVPC1oJMZi0Z39WxQnf3gMhBmuePjkyJc+JyPCX4hgaalKTIv
        24YeFfsYlf+ysa8rqkewQyiiTEochJaoeF9jGucx6Z3XsqNHS9Y+RyIV0rQyyV02ePShGmQ0jQ+
        OBWBTmZRMggQ==
X-Received: by 2002:a17:907:f8e:: with SMTP id kb14mr12130037ejc.40.1626268331151;
        Wed, 14 Jul 2021 06:12:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDMTZP3wqYMqJomoTqTOLFuLkAJrM+UUmM4EWMnM+euO+46NFyRwcKHAQXeLjpuq0mXc604g==
X-Received: by 2002:a17:907:f8e:: with SMTP id kb14mr12130015ejc.40.1626268330866;
        Wed, 14 Jul 2021 06:12:10 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q9sm764957ejf.70.2021.07.14.06.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 06:12:10 -0700 (PDT)
Subject: Re: [PATCH v5 0/7] updates to amd-pmc driver
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, rrangel@chromium.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <41158fad-d078-cb0c-c680-fc6712bf8c68@redhat.com>
Date:   Wed, 14 Jul 2021 15:12:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/29/21 10:47 AM, Shyam Sundar S K wrote:
> Couple of existing issues on the completion codes to SMU
> and a newer way to get the s0ix statistics are introduced.
> 
> Also, add acpi ids for current and future revisions of the
> pmc controller.
> 
> Shyam Sundar S K (7):
>   platform/x86: amd-pmc: Fix command completion code
>   platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
>   platform/x86: amd-pmc: call dump registers only once
>   platform/x86: amd-pmc: Add support for logging SMU metrics
>   amd-pmc: Add support for logging s0ix counters
>   platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
>   platform/x86: amd-pmc: Add new acpi id for future PMC controllers

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also apply this to the fixes branch and include it in my
upcoming v5.14 pdx86 fixes pull-req to Linus.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

