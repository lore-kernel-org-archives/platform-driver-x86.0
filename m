Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E87C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Sep 2022 15:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiIGPfa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Sep 2022 11:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiIGPf3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Sep 2022 11:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABAD7538E
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662564927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2ac0hM/jkpKi7OxOWSmlofyZKxvc3oq2DTgCyjiCZnE=;
        b=a+jutLzhYV3LEQPpP80SfivDRUvZVVvvLINJ/btdd3PKSuRKZTGbMP+fKyHaivn+CDizPA
        aGyjZXz47Or9s8m42p5Z5Vjq3alm5Y2Ddv8udakENUzGfIoY0boZqNHTgFSPcFoXnnW+mR
        XShD68yxFjqWs/d+rCROQoaJiXYX0VA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-4321FgczOBmkneTZpzVG0Q-1; Wed, 07 Sep 2022 11:35:24 -0400
X-MC-Unique: 4321FgczOBmkneTZpzVG0Q-1
Received: by mail-ej1-f70.google.com with SMTP id nc21-20020a1709071c1500b0076120d57502so3524739ejc.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Sep 2022 08:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2ac0hM/jkpKi7OxOWSmlofyZKxvc3oq2DTgCyjiCZnE=;
        b=mFE+TvmgEXrqEQ3xchc6i4dcD9Sx9qwft6PpCm3AnJDkDzRcYBGwOtTTYlyUSlmHQh
         7L/5o3BpFPZGocagHeVLHUhh73/RTNvWBi8un+Lhv9iGvWxFrwgINteHmL0qf8w6PiIr
         paVfQMKTqOATZ74IOQKjuKeNXdG+AdfvnfZZigTalx6jkxq++/VeR6ZVvG7WtplzUMe8
         V2A2/Q0TNvnO4nyYBL7To+FQMndkhULuwBaeSYEMAs9ZYgcmp/5za3zwU69cMBrRkW/M
         TRyTa5J0795DhuY8HVRJ86tJ+864ffDMywvUpYtCPb3DSFwBUpQlv2CRGYu255sXMA9a
         /phg==
X-Gm-Message-State: ACgBeo338ld3J7k1LA0d4+6GEeW4FAkH8Q1h/d/LuS55Oz8sP7Q1NoGb
        OLzyOkuCnpElHxlcvJYfQaYU1FST6Q6adWb3S8Osry9t2yRekUcpOxs2TxqRRwlbbFOeknO7RTl
        evH3D29wCgGzOIpLSIv4WZXTJc73dyy25sFO0admTUnNOH1NYPw==
X-Received: by 2002:a05:6402:a43:b0:44e:cf0a:5e82 with SMTP id bt3-20020a0564020a4300b0044ecf0a5e82mr3495492edb.118.1662564922884;
        Wed, 07 Sep 2022 08:35:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5xLctarDIJEw3j/5uPwmAJ05WcNAD/8+loQ6Kz22MXPXTDD68BpSz4NbXj9h9uU6Bl0kp3sRgT+szAgnN9vvY=
X-Received: by 2002:a05:6402:a43:b0:44e:cf0a:5e82 with SMTP id
 bt3-20020a0564020a4300b0044ecf0a5e82mr3495473edb.118.1662564922695; Wed, 07
 Sep 2022 08:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com> <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com> <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
 <a5ac5eb7-6a8e-aafd-10ca-b3049a7a74f4@amd.com> <CAKEBQohHJcxgRr4rMcdDMyi1cgBebcbeVcQu7qfAPuNK5E4t=Q@mail.gmail.com>
 <b29956c0-6b72-a8a4-ccca-0bad7b07c041@redhat.com>
In-Reply-To: <b29956c0-6b72-a8a4-ccca-0bad7b07c041@redhat.com>
From:   Bastien Nocera <bnocera@redhat.com>
Date:   Wed, 7 Sep 2022 17:35:11 +0200
Message-ID: <CAKEBQojBveLyF7fe=Bv6WAwog6cwtWsyCdwqC5mpqnL4w1aB8A@mail.gmail.com>
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 7 Sept 2022 at 16:35, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Bastien,
>
> On 9/7/22 16:24, Bastien Nocera wrote:
> > Hey Shyam,
> >
> > I misunderstood that CnQF was a single setting, but it looks like it
> > has 4 different levels, right?
> > Unless there's a major malfunction, I don't think that offering to
> > switch between 2 different policies where the difference is how
> > "static" the performance boosts are is very useful, or comprehensible,
> > to end-users.
> >
> > If CnQF only has a single "on" setting, then this could replace the
> > balanced mode for what you call "static slider", so the end-user can
> > still make a choice and have agency on whether the system tries to
> > save power, or increase performance.
> >
> > If CnQF has multiple levels (Turbo, Performance, Balanced and Quiet,
> > right?), then I don't think it's useful to have a sysfs setting to
> > switch it at runtime, which only confuses user-space and the users.
> > BIOS setting and/or kernel command-line option are the way to go.
> >
> > Did I understand this correctly?
>
> Let me try clarify things:
>
> CnQF has 4 levels internally, between which it switches automatically
> based on the workload of the last 5 minutes.

Oh, those profiles are internal only, OK. Do those automated levels
behave like the "static slider" ones, to the point of being
indistinguishable? So for example, does the static slider
"performance" behave like "CnQF" if the machine was heavily loaded
machine for 5 minutes?

