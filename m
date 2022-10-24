Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2340FA3740
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 09:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiJXJqn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 05:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbiJXJq0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 05:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8516750198
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666604784;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iJ+b2y7UqeW+tpjJ0iR2mEUHudPKaMh+lMgb9JMkYy4=;
        b=UD0V63q9Mc76L4gEo311oBG9qgszQLihjCvPU8VyOp731kxM9XA5khXNuSOyM9Q5VPl6Lo
        9r8ojbtS82eE7T+nkH2TsViE1NVVpzbzMTHdwljDqTFNITrfho9FholbVFxA3eBxwH97TD
        wPCZwWHBivUDz5KsQOtCMIBWjA36Hn4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-qez7q_GDNdCAKysx_4VeYA-1; Mon, 24 Oct 2022 05:46:20 -0400
X-MC-Unique: qez7q_GDNdCAKysx_4VeYA-1
Received: by mail-ed1-f69.google.com with SMTP id x18-20020a05640226d200b00461e027f704so1384369edd.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 02:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ+b2y7UqeW+tpjJ0iR2mEUHudPKaMh+lMgb9JMkYy4=;
        b=uEfwnrcnlNFSRBHfNmNxPl9e+UBDKN7actwwfUb70nHO/ncS6rVNPIoz/+yjUeTe9Q
         gldw2sxp4nyTfbKGkTsu66FomMfhsOZSgc8CljNMrDNkOJByHzFIIw7VGstjfzFxISnP
         YY8geYaYiwIX1yJL1mWFj5wl07vgqcSqHpqq+vi4r0yN0qEROtrthd2acbQM4AiNRZaN
         ZANH1LkaAWcX8rmgIVkFC/I7qlA0u6umaN32SP//M+R9Ifs8Eku/R3ZQOGy7xX+TEHj1
         BLC+8AxX0C5t39OxasM6JrYQZDfDExrFGyaNUj+HbzCVRPdFUkIT06t8Pr4PN/351Zg+
         egyQ==
X-Gm-Message-State: ACrzQf1bMdXNNctLxqk4jzGLQWnxaSHet38OhNtsixlIIwRF/K3AMRPf
        vPhWl9T90gp3M0WcP1c0Az8AOVJcCswKcVK4CJfHCZ9kzdX8eS1lMCe1LLLUMnHPiZHJgqqdlL0
        +reflEwuWt3Vppy4ZVpSI+pcs/Ks4urUAlA==
X-Received: by 2002:a17:907:72d6:b0:79b:8cce:112a with SMTP id du22-20020a17090772d600b0079b8cce112amr13431075ejc.118.1666604779659;
        Mon, 24 Oct 2022 02:46:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BZyVa08kflimw4PK8QRr04Qjjr4pRy5NLIwviaB6j/+ny1aS8XHJBp6uISRRbf0v+5S7hXg==
X-Received: by 2002:a17:907:72d6:b0:79b:8cce:112a with SMTP id du22-20020a17090772d600b0079b8cce112amr13431064ejc.118.1666604779483;
        Mon, 24 Oct 2022 02:46:19 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b00788c820e630sm15179673ejg.121.2022.10.24.02.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 02:46:18 -0700 (PDT)
Message-ID: <8957290c-9499-a399-3e4e-e0276caccd65@redhat.com>
Date:   Mon, 24 Oct 2022 11:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] platform/x86/intel: pmc/core: Add Raptor Lake
 support to pmc core driver
Content-Language: en-US
To:     Jiri Slaby <jirislaby@kernel.org>,
        Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <20220912233307.409954-1-gayatri.kammela@linux.intel.com>
 <20220912233307.409954-2-gayatri.kammela@linux.intel.com>
 <3537fa63-9015-c63d-2321-a77062e24d6f@redhat.com>
 <58855ea9-0d89-e17d-349a-657512068663@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <58855ea9-0d89-e17d-349a-657512068663@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/14/22 09:50, Jiri Slaby wrote:
> On 19. 09. 22, 13:41, Hans de Goede wrote:
> 
>> On 9/13/22 00:33, Gayatri Kammela wrote:
>>> Add Raptor Lake client parts (both RPL and RPL_S) support to pmc core
>>> driver. Raptor Lake client parts reuse all the Alder Lake PCH IPs.
>>>
>>> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Cc: David Box <david.e.box@intel.com>
>>> Acked-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
>>> Acked-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>
>>> ---
>>> Changes since v1:
>>> 1) Added a dependency patch- ea902bcc1943f7539200ec464de3f54335588774 :
>>>   "x86/cpu: Add new Raptor Lake CPU model number".
>>> 2) Rebased the above patch on v6.0-rc1 with "Acked-by" from Hans and
>>>   Rajneesh.
>>
>> I still cannot take this, since patch 1/2 is *already merged* through
>> another tree, so me cherry-picking it leads to potential conflicts.
>>
>> As I have already explained twice you need to submit this upstream
>> throuh the same tree which has the original merge of patch 1/2.
> 
> Hi, friendly ping: has this ever happened, Gayatri?

Since the necessary change are in 6.1-rc1 now, I have merged this
patch now and I'll include this in the pdx86 fixes pull-req which
I'm preparing for 6.1-rc3:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

