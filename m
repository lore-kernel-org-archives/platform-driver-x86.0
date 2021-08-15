Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FE5C4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 Aug 2021 13:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DC9960FC3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 Aug 2021 13:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbhHONuj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 15 Aug 2021 09:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44510 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232896AbhHONuj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Aug 2021 09:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629035408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DAmPAB45JQYOh7SceFWdhwzgrwmdIgWQsxCYBnzZq2E=;
        b=WTeD9MQZyYwiW+YBnWD0IJrGj59US1Xp42xIcHoD69uWQut+hoWH3omzIOv/uS0x5o0cy0
        GkLBpot4U1GH1iINa7kMot+En9gyxu1OxlsOgNM75PzS/2T1109zZcow8gsIWbacAwyc2+
        QhR34h7uEmEreFYMHiV0eEhlAMRdEtY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-OuGmHG2IMpSM1g2d4COJpA-1; Sun, 15 Aug 2021 09:50:07 -0400
X-MC-Unique: OuGmHG2IMpSM1g2d4COJpA-1
Received: by mail-ed1-f70.google.com with SMTP id e3-20020a50ec830000b02903be5be2fc73so7354976edr.16
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Aug 2021 06:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DAmPAB45JQYOh7SceFWdhwzgrwmdIgWQsxCYBnzZq2E=;
        b=QLul2uNalLrvCKuKVLJaJJMKiqhxctR2yCxi+EZO9CwvDJ0vOifI5yKkNcdSLvrurD
         2OfB3pZ+M2lgBaM62t25LlNSESsLgfBKg4f/lpJvwnPuK01lwIGtGbEdpRvtAenC9LsQ
         XyOWOSeCvI3hzew5GnpHybqFHT5DopEEpfDsuF1W70QGB/QvHkN+hWpDb/0e7jl33IT6
         fjAz6uCdeB+M10NrzVBLLSOZvShdgEw2Yl2xZlqHFZ1z4FBPbrLZi9pDyrxnq4S0kMEc
         r5NSj21w8HhIm5+852+5su3rk0Q4nrQ3VaYczho/tRO0A1qdMvrZ3Mq4RkwxAPAyiDcB
         yCaA==
X-Gm-Message-State: AOAM532nc+8PxYDE17pvEnoAFnmq/HOX8i+P5ujo5QXEBDEa6df/Vz29
        88TH2FuAp5uxf7BtnIbxz/C932iBRnA1vnuQP5GNHYCgyFFuDjfrvdDwU4VzpJ6ngTNnwyUvFYk
        hFBR9Ayk/K30naK/Kat/CPRcDU9B8sFjfXg==
X-Received: by 2002:a17:906:cf91:: with SMTP id um17mr11842454ejb.490.1629035406140;
        Sun, 15 Aug 2021 06:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSQv4ghrHllFygor8H+hzT1GA73DX4OevwFGmTOZroe2BQ1ho9G4tiMZ9XX3ZANI7r23DDdw==
X-Received: by 2002:a17:906:cf91:: with SMTP id um17mr11842451ejb.490.1629035406004;
        Sun, 15 Aug 2021 06:50:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s3sm2717870ejm.49.2021.08.15.06.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Aug 2021 06:50:05 -0700 (PDT)
Subject: Re: [PATCH v5] platform/x86: acer-wmi: Add Turbo Mode support for
 Acer PH315-53
To:     Jafar Akhondali <jafar.akhoondali@gmail.com>
Cc:     jlee@suse.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, mgross@linux.intel.com
References: <20210812125307.1749207-1-jafar.akhoondali@gmail.com>
 <77aab2df-b3c3-541d-461a-8755277fd425@redhat.com>
 <CAMW3L+3WUCXx60fALT=2J8TjK_BO3jOTb+8+JQQrKA1_F9pLTQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e3fbabc6-36a7-6c8d-2b28-065467325697@redhat.com>
Date:   Sun, 15 Aug 2021 15:50:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMW3L+3WUCXx60fALT=2J8TjK_BO3jOTb+8+JQQrKA1_F9pLTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/14/21 1:40 PM, Jafar Akhondali wrote:
>  Hi Hans,
> Thank you for your efforts on the patch, I've sure learned a lot from
> your comments as this
> was my first contribution to Linux kernel.
> 
> Just an extra question, for the next patch I'm gonna send turbo mode support for
> 14 other Acer Predator laptops. The only required change is that I should add
> "quirk_entry" for GPU and CPU fan count, and match product names to their quirk.
> 
> 12 of these Predator laptops have exactly 1 fan for CPU and 1 fan for GPU,
> but two of them have 2 fans for GPU and 1 for CPU. So my question is should
> I add the quirks per product (which will end up to have 14 quirks,
> same as current patch) like:
> 
> static struct quirk_entry quirk_acer_predator_ph315_53 = {
>       .turbo = 1,
>       .cpu_fans = 1,
>       .gpu_fans = 1,
> };
> 
> or should I specify the quirk per fan count like this one:
> 
> static struct quirk_entry quirk_acer_predator_gpu_fan_one_cpu_fan_one = {
>       .turbo = 1,
>       .cpu_fans = 1,
>       .gpu_fans = 1,
> };
> 
> and then set different matched DMI product names to the above quirk?
> 
> The first approach is more verbose, the second uses less code.
> If possible, I would like to know your thoughts on this.

Please use the second approach of having a single:

static struct quirk_entry quirk_acer_predator_gpu_fan_one_cpu_fan_one = {
      .turbo = 1,
      .cpu_fans = 1,
      .gpu_fans = 1,
};

With the DMI entries with all laptops with this setup pointing to that
one quirk_entry.

Regards,

Hans

