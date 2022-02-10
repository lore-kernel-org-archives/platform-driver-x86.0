Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC5FC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Feb 2022 01:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbiBJB0g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Feb 2022 20:26:36 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiBJB0Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Feb 2022 20:26:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1459D20188
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 17:26:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C65661757
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 01:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDD0C340EF
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 01:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644455426;
        bh=J8tPzfk27lBkxLTvhYOzcjeW3u2AwMmMCNqvO+lKyZw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZXE+e9SJLZyJKduZ7RNWYLqk+S2TdtZgjJg7/AjtR1TvqjxpTe4nyS0Bx/92KXRSU
         yvrcMIN6jitMVdzFIpjOwk3AblZMuPdjGJJQPP4SW1TFSv44T0H4r3aVrt/sq5pC8w
         9jGzuBYErQIUxQ1MCN75VW6faIKfapxid51Fle/Rsp2nEYCZmlcLTjCKlFTol4weBw
         vjlL/Uhd/wa3STK4WDbjy7eIQQEN50xal/HDg6bLrxIWaMFblSR1kZ+6baqThGG1b9
         V8MjrqrndGeNO6ursdBKSY6VRZM+Rj0A/u5NOUSRnlipUE4RTlpAp723eqVyn3qEg+
         Owvjucb+WqK4A==
Received: by mail-yb1-f175.google.com with SMTP id x136so9257525ybe.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Feb 2022 17:10:26 -0800 (PST)
X-Gm-Message-State: AOAM531f3sHginQcHf8ubbfi30jowCCUS2eMYv2QwCiNoTFwq+GKGJ1F
        TV8oPRqgl9iF6HgaKMxLhoKDfBVn6D+sariJgS4=
X-Google-Smtp-Source: ABdhPJziw0DjuwoIJH4raceESauJe2v4zBoB8t9K+WdhLVBu6QMh5stvE8YHanwhc7WlZfC1b2Y1gB9RqtvkTZCXWTQ=
X-Received: by 2002:a05:6902:1208:: with SMTP id s8mr5164925ybu.654.1644455425779;
 Wed, 09 Feb 2022 17:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20220209184406.99938-1-nchatrad@amd.com> <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
In-Reply-To: <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Wed, 9 Feb 2022 17:10:15 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
Message-ID: <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
To:     Nathan Fontenot <nafonten@amd.com>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, suma.hegde@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Feb 9, 2022 at 1:08 PM Nathan Fontenot <nafonten@amd.com> wrote:
>
[...]
> > +
> > +static const struct hsmp_msg_desc msg_desc_table[] = {
> > +     /* num_args, response_size, type */
> > +     {0, 0, RSVD},   /* RESERVED */
> > +     {1, 1, GET},    /* HSMP_TEST */
> > +     {0, 1, GET},    /* HSMP_GET_SMU_VER */
> > +     {0, 1, GET},    /* HSMP_GET_PROTO_VER */
> > +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER */
> > +     {1, 0, SET},    /* HSMP_SET_SOCKET_POWER_LIMIT */
> > +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT */
> > +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT_MAX */
> > +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT */
> > +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT_SOCKET */
> > +     {1, 1, GET},    /* HSMP_GET_BOOST_LIMIT */
> > +     {0, 1, GET},    /* HSMP_GET_PROC_HOT */
> > +     {1, 0, SET},    /* HSMP_SET_XGMI_LINK_WIDTH */
> > +     {1, 0, SET},    /* HSMP_SET_DF_PSTATE */
> > +     {0, 0, SET},    /* HSMP_SET_AUTO_DF_PSTATE */
> > +     {0, 2, GET},    /* HSMP_GET_FCLK_MCLK */
> > +     {0, 1, GET},    /* HSMP_GET_CCLK_THROTTLE_LIMIT */
> > +     {0, 1, GET},    /* HSMP_GET_C0_PERCENT */
> > +     {1, 0, SET},    /* HSMP_SET_NBIO_DPM_LEVEL */
> > +     {0, 0, RSVD},   /* RESERVED */
> > +     {0, 1, GET},    /* HSMP_GET_DDR_BANDWIDTH */
> > +     {0, 1, GET},    /* HSMP_GET_TEMP_MONITOR */
> > +};
>
> The hsmp_msg_desc, hsmp_msg_type, and msg_desc_table are used by the driver for
> validating user data. These aren't part of the user API.
>
> Perhaps these should be defined in the driver itself instead of being a part of
> the uapi header.

This was my idea. While I agree it is a little weird to have these
tables in a uapi
header, I think it is helpful to give the user some reference about
proper num_args
and response_size for each message. I don't have a better idea to achieve this.

Thanks,
Song
