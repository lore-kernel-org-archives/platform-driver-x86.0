Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943F8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Feb 2022 08:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbiBWIvk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Feb 2022 03:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbiBWIvj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Feb 2022 03:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 086387B549
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 00:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645606271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rabjGkMKoAH0YyMPAFX0LYPUhoMqUOIZnuU9A71lOME=;
        b=YIimTb4CThb1SmzUiW5L1P4GoMXIyVO4Dc4kQOc120Zo7MmLfHtu0THGk4NwIuooFK6VAk
        tWz7jeftfTzZHnP3/+SPV1Cgs1jZENBSvU+hOWeEPGofqVYl6fs7ediEmkEmtsYDGw+7+H
        qZs87+uvI03onocEpvWLn3G+VNGY30Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-pAq4eryKPF2HoBfiF7nWew-1; Wed, 23 Feb 2022 03:51:09 -0500
X-MC-Unique: pAq4eryKPF2HoBfiF7nWew-1
Received: by mail-ej1-f71.google.com with SMTP id nb1-20020a1709071c8100b006d03c250b6fso6709430ejc.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 00:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rabjGkMKoAH0YyMPAFX0LYPUhoMqUOIZnuU9A71lOME=;
        b=nGbnptLlABwNZdk4jn260+RsHG190cmlEobtc2Cg4pzQ32LwetcsD2PwUKzn/AOKR7
         fqtdKmxV415ceVLdn5zFd4NB1Ke8aUioUd+Q6BcWqVMDr5z/wbBvRpibBn167KCokBxQ
         0e9zrxpz16h7cEe5KC8nPLx0w4FFBt5ZQrqCT1kHo1nBYqOa3IKjaRo93s8o9UrSoigN
         /cY1Nv6bbheiXG5QuStt6DCL3NNMRmuMa0yK6pCIip0hOHbZr1IYUloQ3Kbyu+9MQrQX
         pjVlQTjZT3fdG2nCZrrMZOScHeAU8AV9WE+zCS47Hsd5qQfOWgWNZ5fhinCKerygmxPc
         Stfg==
X-Gm-Message-State: AOAM530TC/alYinKyDrpxh6wn0Q57Nc+sPBVJ9BRftlx2dzQ2sN1bGvD
        XBzND3sT20nkEIyuR1J2ieshT/7vx7QtLxD2ilE26rex2K9fWkXCw3plYbWHzJTu+ESp+VqlLny
        hdFO7SD35iWvYkOTJAYptUcvC8JAOE/LfKQ==
X-Received: by 2002:a50:fe14:0:b0:410:8621:6e0c with SMTP id f20-20020a50fe14000000b0041086216e0cmr29675235edt.356.1645606268233;
        Wed, 23 Feb 2022 00:51:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmJ8NLNjyqtF+pIBg5b7t4oWrPu6Aff4smecKhR0FxJTywYO64LUzVmOmUQrFe2sqyNg8Ksw==
X-Received: by 2002:a50:fe14:0:b0:410:8621:6e0c with SMTP id f20-20020a50fe14000000b0041086216e0cmr29675221edt.356.1645606268057;
        Wed, 23 Feb 2022 00:51:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id jz17sm7178483ejb.195.2022.02.23.00.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 00:51:07 -0800 (PST)
Message-ID: <4b9ae0d0-9692-4c8c-f88a-1e961812a8ae@redhat.com>
Date:   Wed, 23 Feb 2022 09:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Song Liu <song@kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Carlos Bilbao <carlos.bilbao@amd.com>, siva.sathappan@amd.com,
        nathan.fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>
References: <20220222050501.18789-1-nchatrad@amd.com>
 <CAPhsuW5yUXMY5DqhsDJP8i9RW5BPD9We3GQWyNDR_m90vnqfYg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPhsuW5yUXMY5DqhsDJP8i9RW5BPD9We3GQWyNDR_m90vnqfYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Song,

On 2/23/22 02:12, Song Liu wrote:
> On Mon, Feb 21, 2022 at 9:05 PM Naveen Krishna Chatradhi
> <nchatrad@amd.com> wrote:
>>
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> Recent Fam19h EPYC server line of processors from AMD support system
>> management functionality via HSMP (Host System Management Port) interface.
>>
>> The Host System Management Port (HSMP) is an interface to provide
>> OS-level software with access to system management functions via a
>> set of mailbox registers.
>>
>> More details on the interface can be found in chapter
>> "7 Host System Management Port (HSMP)" of the following PPR
>> https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
>>
>> This patch adds new amd_hsmp module under the drivers/platforms/x86/
>> which creates miscdevice with an IOCTL interface to the user space.
>> /dev/hsmp is for running the hsmp mailbox commands.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
>> Acked-by: Song Liu <song@kernel.org>
>> Reviewed-by: Nathan Fontenot <nathan.fontenot@amd.com>
> 
> What would be the next step for this set? We are hoping to back port it
> to our kernel to unblock some tests. Ideally, we would like to do the
> back port after it is applied to pdx86 tree.

I plan to review this tomorrow, since it has already seen
a lot of other reviews it will hopefully be fine and then
I will merge it into the pdx86 tree tomorrow.

Regards,

Hans

