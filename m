Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53C4C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 08:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 823DC6103A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 08:47:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhHMIra (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Aug 2021 04:47:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22135 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239538AbhHMIra (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Aug 2021 04:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628844423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q/2LLLa4Knn+Y6OU5yiYg2idNmi6VgzjwtSnMoXh7QY=;
        b=B16yGQ4kcQVLtdY5j4HlJppSfonE9GYlFmru2dDY20AueUYtQA8yx6DoRn9DOjiJN9n/Iq
        3PPQZfB94CzT4rfiO06JpQhyYYRNhmTn997xs0SteBf45CiurZZQ6G1pJqLYNYcq8+MFyB
        LbhtyyCYXH9rnbL6YHZpHgWxPnmfpqY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-smtB0Dw6Pgek_ogfF2opeA-1; Fri, 13 Aug 2021 04:47:02 -0400
X-MC-Unique: smtB0Dw6Pgek_ogfF2opeA-1
Received: by mail-ed1-f70.google.com with SMTP id m16-20020a056402511000b003bead176527so1984774edd.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Aug 2021 01:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q/2LLLa4Knn+Y6OU5yiYg2idNmi6VgzjwtSnMoXh7QY=;
        b=fvYBsoWxkGajse4Mh+gf9XEKbZmzH6cINdJAPxW+cNvk6vQbn2MrpBAxhTlfBNwQeE
         SxeqQShjyjoWcW5E66KO4RugwTdsFoDHRhBuWaiSnfytDGIvvV13NVd5Q5v+XypueGcC
         0Raaxbx30BaGfDBRYtlNygoRL9fKtNjgCNmYVuOdsJOj30T0xpljnRPQLZgUKLPDQbrs
         f5bQ6LnKiaHfEs3vb7ZtH3XhPkxMa4LzDhN0u06z+pmgHey/1qaFFkhdP32e7Ycnp5vN
         AJERWp5u/wrv/EHgyjtoe8nSGcSmEWJReQV6wHXWDkbrE9JlRP3EjVyFeiR6kT0zHU8v
         m/kA==
X-Gm-Message-State: AOAM5324D9eOiL2AYoVmURAsclAh4hzHtUVWXJeQ2dLul0TRMAA+5CTt
        69AKoWeIPYiMUToit8rdsw/oP53T+rOdY30hP7Q4TTFBi4Zqgf58MGDmVO0/IfgsTdf+HRVUGAE
        9ihyqTdyEIFEuxohVtFZ7KJ7r1q4RHC8oPvvcvELLAbAgMTvlGKZn5C4J5N+KJqyzYTw2kold51
        A2cVGWW6QxkQ==
X-Received: by 2002:aa7:cc08:: with SMTP id q8mr1702246edt.225.1628844420809;
        Fri, 13 Aug 2021 01:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5EloBaEg+0tMtbqyttcX5xHezj44yloaXLpv99plL6aoifnGakzAUprzKQ5XPKCB4a6lvHg==
X-Received: by 2002:aa7:cc08:: with SMTP id q8mr1702186edt.225.1628844419980;
        Fri, 13 Aug 2021 01:46:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z4sm92658edc.33.2021.08.13.01.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 01:46:59 -0700 (PDT)
Subject: Re: [PATCH] asus-wmi: Add support for platform_profile
From:   Hans de Goede <hdegoede@redhat.com>
To:     Luke Jones <luke@ljones.dev>, Bastien Nocera <hadess@hadess.net>
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210813024201.9518-1-luke@ljones.dev>
 <35JRXQ.1ZW8QHWM1YRG@ljones.dev>
 <9cceb3cb-f6d3-ade4-b219-87b2bbce5798@redhat.com>
 <R1ORXQ.WGLIPS8I54X63@ljones.dev>
 <5b503320-c1a3-2653-b269-ba8d40568edf@redhat.com>
 <a4acaf03-b6b3-49f3-14e8-6766e9e24215@redhat.com>
Message-ID: <a1303271-d61e-a500-5c65-6b6bab4d40ce@redhat.com>
Date:   Fri, 13 Aug 2021 10:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a4acaf03-b6b3-49f3-14e8-6766e9e24215@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

p.s.


<snip>

Note that inotify (and thus GFileMonitor) does not really work on sysfs files.

Interesting email thread about this here:

https://linux-fsdevel.vger.kernel.narkive.com/u0qmXPFK/inotify-sysfs

