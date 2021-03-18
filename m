Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DA6C433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 11:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CED864F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 11:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhCRLCf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Mar 2021 07:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21998 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230015AbhCRLCG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 07:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616065326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qT8sXvj00qItqzlYyDhKarkrcjScc1QZn8W/3wkQDsY=;
        b=GOKQyi+iKfT1akjt/pdOK+YM/nsVOdaaiLXfViTqsZOHdhGjBYyLhLczfxTArg040uqpHr
        GTifYBhDNzaakv0rLXaJqG3iDJ5u0P2/n7jbrzfonnTZMx1adO2I9snElkG3nbKOA99qUQ
        zmf1H+6hG9WomZZZcvHMTTauiXO7QM8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-0xUVJTdeMhmAskId09NsWA-1; Thu, 18 Mar 2021 07:02:04 -0400
X-MC-Unique: 0xUVJTdeMhmAskId09NsWA-1
Received: by mail-ed1-f72.google.com with SMTP id h2so20887273edw.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Mar 2021 04:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qT8sXvj00qItqzlYyDhKarkrcjScc1QZn8W/3wkQDsY=;
        b=pUA3vCmfKTcWjOYHV0GFACINaaXXBiASyf9E6I/f60pPdHC4NLyMoMwnDPNvg/Md7r
         8phU7QTds1UjoLkjpyADc6lFa4MAeLaShgJT39FW4cIc6B3Svl7rnXGgNE1+Lqqq4E7I
         QlRYvM2el32PktN/yffeBvzwEhJYgfRCe0R1f9pEzPrQkxdymuioNX3latzxFv6OybPu
         ydXEOqFL3Jn8HOK3aApl404+zJZ/OIVekA6/k0RuKyylTEhLrBUyK3YgRvbkHeb8Zz44
         92NoXVrhsaWZzzPXP6y8NsZ4GWHs7WT/knk3fZTMAHLJ5c2PiiUCg05yCgDJtdh/8i8/
         TBsQ==
X-Gm-Message-State: AOAM530srSN7Z1oxg8/228n3rVAK1MZ1zcr1f5e15qlNdKz9ixSMawKJ
        psuQzIKWn8P28Rog0z1EKkMeYwYOR73WE5XipHLb2yk3vgLjXiozO3DtMUxNGorsOhA7+VSPRm0
        JBM6N46Z+6ZtjXhTTM7QypvMcezTy8yMOdl/DsopeMBVojMvdMyzWMsroXTh606P/+tzJibt/wu
        bvAPumNfS11g==
X-Received: by 2002:a17:906:bccc:: with SMTP id lw12mr39741390ejb.268.1616065322894;
        Thu, 18 Mar 2021 04:02:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4YEOii3XmAv1UFRr9lF62Tb1p12XeAreUyUkh32SNdZLwXapAN5f76EMeu27pU0dsEfkCHA==
X-Received: by 2002:a17:906:bccc:: with SMTP id lw12mr39741365ejb.268.1616065322619;
        Thu, 18 Mar 2021 04:02:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b12sm1691963eds.94.2021.03.18.04.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 04:02:02 -0700 (PDT)
Subject: Re: [GIT PULL v2] Immutable branch between MFD and Platform/X86 due
 for the v5.13 merge window
To:     Lee Jones <lee.jones@linaro.org>,
        "David E. Box" <david.e.box@linux.intel.com>
Cc:     mgross@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210128172846.99352-1-david.e.box@linux.intel.com>
 <20210224201005.1034005-1-david.e.box@linux.intel.com>
 <20210309181206.GT4931@dell> <20210310105711.GJ701493@dell>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f72cdea8-cd65-84e5-8dcd-1e94c01c90d1@redhat.com>
Date:   Thu, 18 Mar 2021 12:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310105711.GJ701493@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/21 11:57 AM, Lee Jones wrote:
> Rebased onto -rc2
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-platform-x86-v5.13
> 
> for you to fetch changes up to aa47ad3f853ae72c32b7e46dfc8bc2c8dc2dbad7:
> 
>   mfd: intel_pmt: Add support for DG1 (2021-03-10 10:48:48 +0000)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD and Platform/x86 due for the v5.13 merge window

Thank you, I've merged this into my review-hans branch now, so this will
soon be in pdx86/for-next.

Regards,

Hans

