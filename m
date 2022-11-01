Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B2DC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 13:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiKANuq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 09:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiKANum (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 09:50:42 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971856179
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 06:50:41 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id l11so20648771edb.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Nov 2022 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QQAnjt+7XG8p++j0HFBqJ1i4IPg+WyhF6FRul3d1/9M=;
        b=hesLDdylycooTsz6aCItyOr7PtE299wGrzDAYVq5R34UZo3QscVnl8OQaus4HSG6AK
         Mdk1ppaD67TQP3cDlAYo9APgzs+RmxBeuxxRVjavusi51UKc1MYMzXMjUVHxKbCg5vI8
         VUExyH4qUIkhWDbZmocLqwRhLD+gdvCFrB9qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQAnjt+7XG8p++j0HFBqJ1i4IPg+WyhF6FRul3d1/9M=;
        b=LmHo7YXT+MY0Yt+Yc0A9+oAtrm3Lwe+lPcxvrsmmJc4Q6+nmBBhwCtvD30N2p8XMz4
         DZaQaET1idBXqy/GMeHJMRXaIehXT/jwHSpVCfoM+cGQ8nEfmRCv6Fa5sX/MlT1AGBVG
         pjrc3uanW7tuTtShYpRAqGil2Q4l0pVjfIzQgIGjd0QZhodx8Sv+MQlbc3ah0m7tpf8I
         JFwuIePIUn73ZuOS91cfDuGdpbMyc9Xo8PLgV/1WkD5HkHFA29fMfrTkxM6rq2SCCD8P
         wQJVRsz1olUekNKvtleWEuczuHKQx8Qgp2cQP9dcrIiGrMMo80ewJs/AXFQe9egc26tK
         23oA==
X-Gm-Message-State: ACrzQf33QEjR7T6Vpx4CTbBqzycHKfbyll2W7A9YUZgam9y9RUb85qe2
        elWLkehBZqnJ/ULXjnbX1NGvkSUND78Ewr5C
X-Google-Smtp-Source: AMsMyM6ciyrewN+WeNDTtaQusRLNGSIlXqCd1rsa3D5kbV9Vumv7xaRNT7hKVregtmPEiywyh3DzqA==
X-Received: by 2002:aa7:da42:0:b0:461:9465:b019 with SMTP id w2-20020aa7da42000000b004619465b019mr19856730eds.144.1667310639962;
        Tue, 01 Nov 2022 06:50:39 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00780ab5a9116sm4186509eje.211.2022.11.01.06.50.38
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 06:50:38 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id b2so37185344eja.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Nov 2022 06:50:38 -0700 (PDT)
X-Received: by 2002:a17:907:75f1:b0:78a:f935:647d with SMTP id
 jz17-20020a17090775f100b0078af935647dmr18150379ejc.587.1667310637954; Tue, 01
 Nov 2022 06:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
 <4b7304c0-8dd5-9add-7c84-4e9f0aa9396b@redhat.com> <MN0PR12MB6101BCCA364437A76FED924AE2339@MN0PR12MB6101.namprd12.prod.outlook.com>
 <CAG-rBijvNoN3ppz6bdkEUofYPPBxCtFfo1nWBK5TdG69fcKMnA@mail.gmail.com>
 <CAE2upjS6qRGRcuVYuAB5DMf66A7VcfCKKYEkpsr1My7RnKDFtQ@mail.gmail.com>
 <CAG-rBihDRq1y61tAp56yYCoTOSZXO9OZNzn7gXb_y8XaiO_zqg@mail.gmail.com>
 <MN0PR12MB610109F448E3FC8CE71FBA76E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
 <CAG-rBijSASfbfWQNarjGqj2UxQDOSdwM-qj5YA5A9ur=DNJf-g@mail.gmail.com> <cb5ab68e-5034-d937-e28e-e838e50172a8@amd.com>
In-Reply-To: <cb5ab68e-5034-d937-e28e-e838e50172a8@amd.com>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Tue, 1 Nov 2022 09:50:26 -0400
X-Gmail-Original-Message-ID: <CAM7w-FW2Yer3B+Z6giP8Jc8i5xEMueFKzY=R172drWaYtRHwQg@mail.gmail.com>
Message-ID: <CAM7w-FW2Yer3B+Z6giP8Jc8i5xEMueFKzY=R172drWaYtRHwQg@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: intel_pmc_core: promote S0ix failure
 warn() to WARN()
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Rafael J Wysocki <rjw@rjwysocki.net>,
        Rajat Jain <rajatja@google.com>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 31, 2022 at 9:58 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> I actually thought that by putting the duration of time put in
> last_hw_deepest_state you'll be able to catch this by comparing the
> duration of the suspend to the duration of last_hw_deepest_state.

I'm not sure if this method would catch all or even most suspend
failures. That's why the EC monitoring of S0ix was devised. I will
circulate this internally, see what comes back.

> >
> > Is the light worth the candle?
>
> I wrote an RFC that I sent out for it with my ideas at least.
>

That is much appreciated ! Yet even for good ideas, it's often
necessary to weigh the benefits and downsides of the intervention.
Perhaps we can get some pros/cons feedback from other stakeholders ?

Sven
