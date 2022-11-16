Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1247FC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 15:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbiKPPeL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 10:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiKPPeK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 10:34:10 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905F160C8
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:34:08 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id j15so30549898wrq.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ifwtZe7NMRIMSMHQljjvojeOfAvGKeNdw92n2YfQfk=;
        b=fUKnL3YqRggJUXV4xpvA9NmQefLMC+ZAlDR/wmhWEbni/qt0j1ITQ9hlgfLtoruQZk
         NrbPmRK2IbSwWyvjGAGvyQq978BDnE+Rm/xzVQq6yg50qw9CoP2+LmmHYGVz5yLCeJNg
         PogQ5UEoyBkpcGeRtdMDnTZEvKRKm6Pw+wNGb26nqSlVbVgObW/84Ac1lFPiYhtBKOj4
         jPjHE9kkK4ijTR2WnGVhG2Dex7NVPEz2jWCUG9TULaRvjJ2JVrIiC8tOigdvBXAzUtlc
         X3igDiE7UkidAMD2Jkzi8/ymbx+ahg0t/kTIL4AX7Jk7eSFUtewzJDBLGPT87RhllHl/
         nMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ifwtZe7NMRIMSMHQljjvojeOfAvGKeNdw92n2YfQfk=;
        b=nChzl54OgNeX/L5SsCpdCGvym/b8aVFP1zs07VQU+/zHD86H5hZhovLlFlubfgHiGS
         ufjyzJomccASro/yQIRsj2Yhu+EWoslVwc093w7sedpQaSuxYKOVHe9XWFeMB761VUjk
         bmHr07pP3TTnoLBgfphnCjnAlRqT/0xTsxzpVOVCDFo5zCViLqPr5Pw20xjgoCQTsWVB
         hoKowFg+OQW0l9OGPmH0IIkHuAKKrJ6GkvMTtZOhRRNuyhsZE0ZkRGySScEeIXjkynCz
         CxAyKJuMOAFm50U8gXbJL91vQyQORKEF5Xrr/SlhXROdhMA6hEzbcOEgqQaAiqJlAhij
         7WVQ==
X-Gm-Message-State: ANoB5plEMU7p/ytKUgo78pIySMMf95g8ZgW4R44Go20URc6TMne12uBa
        7r5RDakNZ0o0BR3uedjx6ETzoQg21A0+MA==
X-Google-Smtp-Source: AA0mqf50BY/llryiCf9wq9t+Licz+BO9QY7fFRUkS/M7dqFuvhaMeYnYsdO5f0kfN/1gtLWir4BA1w==
X-Received: by 2002:a5d:500c:0:b0:236:5ede:9f8e with SMTP id e12-20020a5d500c000000b002365ede9f8emr14490008wrt.372.1668612846979;
        Wed, 16 Nov 2022 07:34:06 -0800 (PST)
Received: from eray-Lenovo-Z50-70.. ([188.132.247.187])
        by smtp.googlemail.com with ESMTPSA id bv13-20020a0560001f0d00b0022cce7689d3sm12780936wrb.36.2022.11.16.07.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 07:34:06 -0800 (PST)
From:   =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>
To:     hdegoede@redhat.com
Cc:     cleverline1mc@gmail.com, erayorcunus@gmail.com,
        g_goessel@outlook.com, ike.pan@canonical.com,
        jiaxun.yang@flygoat.com, limanyi@uniontech.com,
        maxtram95@gmail.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Date:   Wed, 16 Nov 2022 18:34:03 +0300
Message-Id: <20221116153403.14670-1-erayorcunus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <51b68bf6-94d5-8ae3-6da4-58136d49c36e@redhat.com>
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com> <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com> <20221110120022.35041-1-erayorcunus@gmail.com> <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com> <20221110164220.46640-1-erayorcunus@gmail.com> <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com> <20221110184709.52768-1-erayorcunus@gmail.com> <d86d9c20-6f5c-0de9-2c09-7667080dd65c@redhat.com> <CAKErNvquRV9M6CU2RTO7nj1X=vwnByomk7Xndg2eGLN4DBh4uw@mail.gmail.com> <51b68bf6-94d5-8ae3-6da4-58136d49c36e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 16 Nov 2022 at 18:19, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,

Hi, sorry for the late reply.

> On 11/11/22 12:44, Maxim Mikityanskiy wrote:
> > Maybe also add a module parameter to force the i8042 workaround? This
> > change is likely to break the touchpad toggle for some devices similar
> > to Z570 (maybe Z580? Y580? idk), so people would at least have an
> > option to force enable it using the module parameter, before the
> > relevant entry gets added to the DMI table, the patch gets merged, and
> > the kernel gets updated.
> 
> That is a good idea. I'm about to send out this as a proper patch-series
> and I've added a module parameter to the version.

Alright, I will continue the discussion from there then.

> BTW did you ever try simply writing back the value returned from
> VPCCMD_R_TOUCHPAD to VPCCMD_W_TOUCHPAD ?
> 
> Eray has been looking at what the Windows tools do and according
> to Eray they always call VPCCMD_W_TOUCHPAD on touchpad toggle
> events. So maybe just writing back the value is enough to actually
> disable the touchpad ?

It isn't, as I said before, VPCCMD_W_TOUCHPAD is nulled/empty on Z570 and
S12, so it won't work.

Best,
Eray
