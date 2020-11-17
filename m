Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33792C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Nov 2020 21:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0D9324199
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Nov 2020 21:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddU4qHWK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgKQVGq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Nov 2020 16:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgKQVGq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Nov 2020 16:06:46 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A85C0613CF;
        Tue, 17 Nov 2020 13:06:45 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id dk16so31374807ejb.12;
        Tue, 17 Nov 2020 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j9Vx247wONNjdeaxAVzGIosAkpuFEwJFnTNV+q2NFC0=;
        b=ddU4qHWKt+h7sMZVkb8UAuGL7veuojz3WAcVz0zhN2z822vrk3fh/ymBaokFGFQ5cW
         0Q5oNRgaffkG80BnanSM8G/CLSby82/WwKsLfXl5yqpOY4k1t7ZLJr+fvJKjNpshJVaZ
         jI70vyjCZqlxjoRGPaTiwFazWZsThLd3wBW8wcI351R1nYFiJquCYjQsOC3zRClQ1Z3s
         STsrPCMq4ii0GsMsydrhjq214y3WxepnXjnO0ADXPFrpZVZxNTkBJSyu/NKx4gGM9jOa
         eBrqeNUNJTLbao6UMPl7qsnTIulKBisKNHQAzeLuRAPZEMIjR/vladAlRJoGixcAcgVs
         4D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j9Vx247wONNjdeaxAVzGIosAkpuFEwJFnTNV+q2NFC0=;
        b=qcOAiAaXFRm8fgVyLj9/R5mPDUfNgg3kw+gFt4Lg0apezogVnoMPxljZec4nR/29Tc
         1mIhuNQUCANbFDKChlneQ4DiC0wyLZ94+62TPn6iybJpyXUKKHJf383sQvKz4qZyrpdG
         cZMOIWvb0eM8Au8peovRCXtdq9YNi5B8PUhlQ7atQaRPRzSMze1wSR0bighNqLStNTy/
         8B1aPSznTAg+vEp27pULgdmakONkaM86ZkVWO7zOpAoKYBPDtL1NqMIXFk2xAw+VvoPz
         sCcfKbz9ZOgAa3On0fb89e/9M90JfSJJ8vGEApUwb1N75nxvW/hYwPxF4adp3T5uOoTY
         TQHA==
X-Gm-Message-State: AOAM5307MgLNS16zYnJsGuMsVgbrSbNFevTbjYlS85W9AEjElAGsS5zC
        91g5vFOx/OVkngAPX0rh6jgeKF5aS9A=
X-Google-Smtp-Source: ABdhPJw2D0d502S4kc1Zu6ZSnfka5YqeniL3Co8sWRGQJ7JiW5omfktg0PVFUQvzTlzM5o3yjLuYTg==
X-Received: by 2002:a17:906:2454:: with SMTP id a20mr3121836ejb.208.1605647203956;
        Tue, 17 Nov 2020 13:06:43 -0800 (PST)
Received: from [192.168.2.202] (pd9e5afac.dip0.t-ipconnect.de. [217.229.175.172])
        by smtp.gmail.com with ESMTPSA id o1sm12174158ejc.81.2020.11.17.13.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 13:06:42 -0800 (PST)
Subject: Re: [PATCH 8/9] platform/surface: Add Surface Aggregator user-space
 interface
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20201115192143.21571-1-luzmaximilian@gmail.com>
 <20201115192143.21571-9-luzmaximilian@gmail.com>
 <5341e4aa-4af3-104e-af54-577f5b6a3594@infradead.org>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <93f75cd3-4520-5ba6-3c95-e012569a968b@gmail.com>
Date:   Tue, 17 Nov 2020 22:06:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5341e4aa-4af3-104e-af54-577f5b6a3594@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/17/20 9:36 PM, Randy Dunlap wrote:
> On 11/15/20 11:21 AM, Maximilian Luz wrote:
>> +#define SSAM_CDEV_REQUEST	_IOWR(0xA5, 1, struct ssam_cdev_request)
> 
> All ioctl major numbers (0xA5) should be documented in
> Documentation/userspace-api/ioctl/ioctl-number.rst
> 
> Apologies if I missed it somewhere else.

No, I forgot to do that. Will add it for the next revision.

Thanks,
Max
