Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CE0C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 08:35:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B94C622264
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 08:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/sn+NxE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgKCIfW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 03:35:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgKCIfW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 03:35:22 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15965C0613D1
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2020 00:35:22 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id h5so9019184vsp.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 00:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=RM4TcFG/tQ+lwk/6TkWOtMQlC8As5gETbsJB0n1A0nM=;
        b=a/sn+NxEs648XMY95OhzXvxV2owF6Ei5nCDLwm4YZHMVuC1B0quQSwvOgZNYa/gxBb
         NCBHZfAWrFB1CHCMLlT5TN1QFcQtPowsVlxVQXL1uKXohXe1YlT9YpvbexJNV8mMbn57
         0Z56O5e4iowYViBIRtbCZuSw/j8JKNv5Io8FhEo/zJVMVga1x+aN5LJBBcqU5ZBiahV0
         dmS1DP07A0xURlj3npCe1Vv+vA//W/yqBMt5jN6c9Flo7EtTpV9PHodA7L8PVwkRlGgq
         vEKIzECb+iAYLpr5Uyf2bfi8GKJIwTRxNqVxVlHq2jKMB3DpuNN1yI4lLZ+1k1R9vJ+u
         99YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=RM4TcFG/tQ+lwk/6TkWOtMQlC8As5gETbsJB0n1A0nM=;
        b=mL2HGxKqaG5yeVAHk8rsILbWkl0YxPqvq+ONevnrgsj9ZwLwfaQLinRBZv6V7gdI25
         +sK9/QtAsTNuIfoxj0SmxNN9uleWAjT7Azj/WCLth+sj1DeK7+GJypyuvt+LQ0nkbhsj
         1mGJFzQDAqTamufWzXXekK/1Hsv85PF6GVxncHx02nZnbvqgBapjZ+mHr2Mel6ZWt/qb
         m7SoDL7e7C5F3CG7Y2+UpqtzkyVgmbfBq0T5nNNINjArRhVS82/poj/NCQSfPTJJY93o
         3JN/sN5mlDjYq71B16Z80f9Dwpm1JrKLJN7Tw6WFzeZ1VAkh2z7yItW0FAEHkmGPrUrE
         gXuA==
X-Gm-Message-State: AOAM533Gfxs9qMXCP8rFWLJPGVYl2DoL20Zlxzt77ffcoPBC1sS7HEUA
        CnRNhcAIKExh6vHhCl6NY8u18VQn5lQNyMWdqcxTWUZtjRE=
X-Google-Smtp-Source: ABdhPJyppDlKBUixhonBD3Zl/LhKAuBnrm2kO8rgg1WoOaFbF1mqTSla/ZMr9enFemyg46Ve88bYFz9qLis+euG+sPY=
X-Received: by 2002:a05:6102:22c3:: with SMTP id a3mr2686723vsh.24.1604392520742;
 Tue, 03 Nov 2020 00:35:20 -0800 (PST)
MIME-Version: 1.0
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com>
In-Reply-To: <Q5ZWCQ.DX8TK304ORAI@gmail.com>
From:   Rhys Perry <rhysperry111@gmail.com>
Date:   Tue, 3 Nov 2020 08:34:54 +0000
Message-ID: <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 3 Jul 2020 at 23:22, <rhysperry111@gmail.com> wrote:
>
> Hi,
>
> I would just like to preface this by saying that I am no too familiar
> with mailing list etiquette so I am sorry if I break any rules.
>
> I have a laptop with dedicated brighness keys (HP Pavilion
> 15-cx0598na). I believe these keys are handled by hp_wmi.
>
> Whenever I press (and release) one of the brightness keys, this message
> appears in the journal:
> ```
> [50761.461630] atkbd serio0: Unknown key pressed (translated set 2,
> code 0xab on isa0060/serio0).
> [50761.461637] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make
> it known.
> [50761.492161] atkbd serio0: Unknown key released (translated set 2,
> code 0xab on isa0060/serio0).
> [50761.492168] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make
> it known.
> ```
> Now, this is not that interesting at first, I obviously just need to
> map a keycode. The confusing part is that for both the brightness up
> AND the brightness down key I get the same code (e02b). I am not to
> sure how to debug this behavior but I would appreciate if someone
> helped investigate this issue.
>
> I am not sure if this is relevant, but my RFKILL key does not work
> either (but does not show anything in journal).
>
> Here is a link to acpidump:
> https://www.dropbox.com/s/ulyltq0gz35s79l/acpidump?dl=0
>
> ::: Rhys Perry :::

Sorry if this is breaking kernel mailing list etiquette, but I am
posting this question again as I did not get a response last time.
