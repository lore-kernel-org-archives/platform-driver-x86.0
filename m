Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4987CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 10:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26FB760F8F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 10:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238891AbhIMKcx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 06:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58783 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238846AbhIMKcw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 06:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631529097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7T9aX55kye+sjXyNu2qRTomyCQ38lZ5ofuSRanp1Q0=;
        b=h6PJuD+rBC26drYM6RQLDjXYOIBmr+NbIMzEwek+zwQl61fG5fOGGnyXAgK2iI3qRfL2Zz
        EboXkWge2rHmUK6vLo6JDjpCAfAWR/FjzxN9U4+06aUVsSsEuNQ37qAhXPjDjLl6zxJGSb
        vpRSdvfuKJafceHpSSv10uqSFrh8fsg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-gdrnDZZTNmm1RYEc1DK-Mw-1; Mon, 13 Sep 2021 06:31:36 -0400
X-MC-Unique: gdrnDZZTNmm1RYEc1DK-Mw-1
Received: by mail-ej1-f71.google.com with SMTP id g4-20020a170906520400b005e7d062772dso3470737ejm.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 03:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G7T9aX55kye+sjXyNu2qRTomyCQ38lZ5ofuSRanp1Q0=;
        b=Kx5djzsVYgLd53X4flrnx+jdbuTuZU+L4LI4JDQlnIX0L72l5wVW6yG+J55QP+J5fY
         d6ggslQ8QfwdRKjNtPeB7QM/ClVp9iBRcWcCxMywMeBt49NOUkDSvZJMP83cUjpb5/2h
         UcSzzuRDlr/bVwfKb/pTQPmsMdUgFZEPlsnjOkRi+J4F5WiQGy04JuCZJPPQG2TRrwG5
         Sksmwf7aXozwyBQOI6e7ODS3y2eJmqTNquYGvL4ieocI268yGLc8/Sbor6W1EQA2jheu
         8C9AfJPp9igHaiah/JQCR1JfVH/nbyyRPVEdXwEb0/CFNQLdOnf+v7+Fpb3s1+URWGJO
         zznw==
X-Gm-Message-State: AOAM531uqbaPNh8RgqW+ixUh/TEr/WV+MNuY6nJmXuL/yRLFVpZKuz7Q
        WJmSiV8EzDGsbnIo81DwCCllDiWdUX5KnbjRtxslJdQOU3fd5Soz0A0Deqgnz2k3qN5TmrpobII
        SzwZQy+APPmV4RA/i/QS9yLdgtwYxRlSYsEfdIg4ukzyqZmYxph0OwaOI6NQw1Is6Hz0IKFjMLT
        XY7lxW+i4nCw==
X-Received: by 2002:a05:6402:34c6:: with SMTP id w6mr987062edc.97.1631529094639;
        Mon, 13 Sep 2021 03:31:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxikzUGW/8yUEXLTSrcII0o3s/co2SD9XcEUC67L3fOZL8RZh1SmBuSaJdGntt4MxDqxJD6jg==
X-Received: by 2002:a05:6402:34c6:: with SMTP id w6mr987038edc.97.1631529094408;
        Mon, 13 Sep 2021 03:31:34 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id f30sm3217478ejl.78.2021.09.13.03.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 03:31:34 -0700 (PDT)
Subject: Re: [RFC PATCH v1 00/30] platform/x86: wmi: minor improvements
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210904175450.156801-1-pobrn@protonmail.com>
 <902a8c92-618f-51a5-3288-253243744ed2@redhat.com>
 <N_isSZWZvE8KdPaxiUXrNjnwB44Fvwy9nqgzzCvuHGqG0RUcrgs-DWx_O7vYcklXl6yul8VRSmEuSZGrehlDcC74iGMB2XL8YDx7kac3gA4=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0c5daddb-4edc-1d6f-6acf-efb61026a1e0@redhat.com>
Date:   Mon, 13 Sep 2021 12:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <N_isSZWZvE8KdPaxiUXrNjnwB44Fvwy9nqgzzCvuHGqG0RUcrgs-DWx_O7vYcklXl6yul8VRSmEuSZGrehlDcC74iGMB2XL8YDx7kac3gA4=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/13/21 12:23 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. szeptember 13., hétfő 11:19 keltezéssel, Hans de Goede írta:
>> [...]
>> Thank you for this big cleanup series.
>>
>> Not sure why this is marked as a RFC?
>>
>> I've gone over patches 1 - 7 sofar and they all look like
>> straight forward simple cleanups. So I will at least apply those
>> right away.
>> [...]
> 
> It's RFC because, well, I wanted to get some comments and see if it's not unwanted.
> 
> And I had made some local changes since I have sent the series:
> patch 17[1] has been replaced. So please ignore that.

Ok I've dropped patch 17; and sorry if I've caused any extra work for you
by picking this up early. I had time to review and process this large series
today, so I decided to tackle it right away (now that the merge window is done).

Regards,

Hans

