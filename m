Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7E1C1B0D9
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A70623A9B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgLHKTW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 05:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40498 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726703AbgLHKTV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 05:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607422674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dHWlb1Aqveo7dfSVs3Xd4U22qHUanqmfMvA9GmfPX+8=;
        b=MNN52ZzY4w8iFbiyisgTMojSZzSxLb9i2jjkOnDETFeGMjZx3Q3RLFpVH0qgWr3yahZhEB
        tpHPiLarqzHkjkXPzIkTB+rJshjrHOiUN7ldc6eKUuUqwHbLWhFnQljSkVcP19FAjRTts2
        2v4gOP2/PoFZCMW7z63JoEFnUxNahq0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-t0004jFQM-6BU1MR_eQ5pw-1; Tue, 08 Dec 2020 05:17:50 -0500
X-MC-Unique: t0004jFQM-6BU1MR_eQ5pw-1
Received: by mail-ej1-f72.google.com with SMTP id g18so4955895eje.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Dec 2020 02:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dHWlb1Aqveo7dfSVs3Xd4U22qHUanqmfMvA9GmfPX+8=;
        b=g6Da4kKnVCbB91rRMBIJLD9Q6f5bMJQ4sdK+ExvVwuNeqozc4Fx+fkvlcWDPrHf990
         Nl0vnhr/F0Q/4AW0x4Xhpv6b46A4C9/UbTUPT+axrzr0r+TNzaEzTAcTO3a9rbMxtyCX
         eAooODQYiOEnzec1rDKCc3qUOk0zT1HM74//3Gotb8GPF2sp+AoRZb/DU7dvkiRkf5y0
         f18BOvowYpsq+GwGz3arn0rUq9eUiIzFLmmiBJxQMNhpFnKn+5A0GwmJfEIXl2OuHRK7
         iHxmpTWaVt/83oaHqniAU9tw1YO1HmZS0o79YTpShqGozFuXOAmUbEFTxik1V+hYmvLa
         sIGA==
X-Gm-Message-State: AOAM533Qk5GXc34LLU5X1f2DUVY6W0/KBdr/c8Po4VkcK05F5n/QQJjB
        FRKRMaTtZahfMMpifcuwtdc7w5+wxcUL4Ia+RfkgbSoBNUIagenOOPWU2DJEywwYArzNE+x1PzM
        sdp23139ybbn2FhwnQgt7yuQlH6q9uIfiEsGBxczQuLiV8iMFcbwj9BDmpuokF00rzXckfLRWqC
        JQem/CVfKSXQ==
X-Received: by 2002:a17:906:518a:: with SMTP id y10mr23043539ejk.323.1607422668441;
        Tue, 08 Dec 2020 02:17:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8q9cAIIqFrgEUkej/ICjnQLIm0gbLzePsb4A0dpdl1EJKQ7N8/FxK22YUZm1rk23jf8cRAQ==
X-Received: by 2002:a17:906:518a:: with SMTP id y10mr23043518ejk.323.1607422668170;
        Tue, 08 Dec 2020 02:17:48 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u26sm16336730edo.37.2020.12.08.02.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 02:17:47 -0800 (PST)
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.11-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "andy@infradead.org" <andy@infradead.org>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <57d6648282491906e0e1f70fe3b9a44f72cec90d.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a1770d57-5898-4c7e-5b3f-53bf56740076@redhat.com>
Date:   Tue, 8 Dec 2020 11:17:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <57d6648282491906e0e1f70fe3b9a44f72cec90d.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/7/20 11:33 PM, Pandruvada, Srinivas wrote:
> Hi Mark, Hans,
> 
> The following changes are on top of
> http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/for-next
> 
> 
> The following changes since commit
> e8a60aa7404bfef37705da5607c97737073ac38d:
> 
>   platform/x86: Introduce support for Systems Management Driver over
> WMI for Dell Systems (2020-10-28 10:52:16 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 785ec678b9a1cff570589a42c471e3d180fb62ff:
> 
>   tools/power/x86/intel-speed-select: Update version for v5.11 (2020-
> 12-07 14:20:39 -0800)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (3):
>       tools/power/x86/intel-speed-select: Read TRL from mailbox
>       tools/power/x86/intel-speed-select: Account for missing sysfs for
> die_id
>       tools/power/x86/intel-speed-select: Update version for v5.11

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> 
>  tools/power/x86/intel-speed-select/isst-config.c | 8 ++++++--
>  tools/power/x86/intel-speed-select/isst-core.c   | 2 +-
>  tools/power/x86/intel-speed-select/isst.h        | 1 +
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> 
> Thanks,
> Srinivas
> 

