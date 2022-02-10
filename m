Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDD4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344698AbiBJVkX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Feb 2022 16:40:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240037AbiBJVkW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Feb 2022 16:40:22 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17495BBC
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 13:40:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 5E239CE26EC
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBCFC340EE
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644529217;
        bh=fXpzEUD1WlYDDkMAyrI63tZeDOWDHd58bJWceN0n73s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HP6ICS0Y2a2XA24osmQ97bopRtuZN9/O2tvjFqwVad9Mv5BtJALpsr3B8e0VIuhtB
         oyMGs4zOhj0n/qUr+bGlKJX3lAE8qTnoEBfQvWOqhmoDYH/cM6hMnf9JuJ6kwyS0jb
         6pL3Wa7qFAxnYeT4EkglJOPWi77pQJg3PhoXsODJaR+dl2FqaoI416Mgpzp0rzre1n
         uViTppb0Dt4qA7t7HBUeKR533mQqyuFJtqsA4a6x8TSSZVVCnmHlb00hnaUw3SKXat
         e4PUr6S4tznuqJ9F4O+Y7j+exnIjNQnlQQBM/G+13ZNVNkmjRoiJ0iDNm+vhtGeuY9
         xs+BBS+8b0qWA==
Received: by mail-yb1-f179.google.com with SMTP id y6so19436375ybc.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 13:40:17 -0800 (PST)
X-Gm-Message-State: AOAM532dykfaDXy17x088LJqa3g2A6t4w/WUZC3zNeAhGjsZkvzHf0jr
        Jis/slncqkqVLopiWjFEBd0ZtGSa0k1BRTJL/k0=
X-Google-Smtp-Source: ABdhPJxAl14/zccY+39BNTMQ1MXW53oI6SNLE0UlQkPbzYyORGnUPHWW6yYaaIO8B6jUIA4jPNs44vuOdBFC23Pa7i4=
X-Received: by 2002:a81:4406:: with SMTP id r6mr9362276ywa.447.1644529216622;
 Thu, 10 Feb 2022 13:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20220209184406.99938-1-nchatrad@amd.com> <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
 <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
 <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com> <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
 <aeb4d8d9-a43c-0697-5035-eff7f4ba3728@amd.com>
In-Reply-To: <aeb4d8d9-a43c-0697-5035-eff7f4ba3728@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Thu, 10 Feb 2022 13:40:04 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6QHwpBH79GeNo22YNsRdcWvUupa10sbqup_qZ5V-__HA@mail.gmail.com>
Message-ID: <CAPhsuW6QHwpBH79GeNo22YNsRdcWvUupa10sbqup_qZ5V-__HA@mail.gmail.com>
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

On Thu, Feb 10, 2022 at 12:42 PM Nathan Fontenot <nafonten@amd.com> wrote:
>
> On 2/10/22 14:32, Song Liu wrote:
> > On Thu, Feb 10, 2022 at 11:52 AM Nathan Fontenot <nafonten@amd.com> wrote:
> >>
> >> On 2/9/22 19:10, Song Liu wrote:
> >>> On Wed, Feb 9, 2022 at 1:08 PM Nathan Fontenot <nafonten@amd.com> wrote:
> >>>>
> >>> [...]
> >>>>> +
> >>>>> +static const struct hsmp_msg_desc msg_desc_table[] = {
> >>>>> +     /* num_args, response_size, type */
> >>>>> +     {0, 0, RSVD},   /* RESERVED */
> >>>>> +     {1, 1, GET},    /* HSMP_TEST */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_SMU_VER */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_PROTO_VER */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER */
> >>>>> +     {1, 0, SET},    /* HSMP_SET_SOCKET_POWER_LIMIT */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT_MAX */
> >>>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT */
> >>>>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT_SOCKET */
> >>>>> +     {1, 1, GET},    /* HSMP_GET_BOOST_LIMIT */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_PROC_HOT */
> >>>>> +     {1, 0, SET},    /* HSMP_SET_XGMI_LINK_WIDTH */
> >>>>> +     {1, 0, SET},    /* HSMP_SET_DF_PSTATE */
> >>>>> +     {0, 0, SET},    /* HSMP_SET_AUTO_DF_PSTATE */
> >>>>> +     {0, 2, GET},    /* HSMP_GET_FCLK_MCLK */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_CCLK_THROTTLE_LIMIT */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_C0_PERCENT */
> >>>>> +     {1, 0, SET},    /* HSMP_SET_NBIO_DPM_LEVEL */
> >>>>> +     {0, 0, RSVD},   /* RESERVED */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_DDR_BANDWIDTH */
> >>>>> +     {0, 1, GET},    /* HSMP_GET_TEMP_MONITOR */
> >>>>> +};
> >>>>
> >>>> The hsmp_msg_desc, hsmp_msg_type, and msg_desc_table are used by the driver for
> >>>> validating user data. These aren't part of the user API.
> >>>>
> >>>> Perhaps these should be defined in the driver itself instead of being a part of
> >>>> the uapi header.
> >>>
> >>> This was my idea. While I agree it is a little weird to have these
> >>> tables in a uapi
> >>> header, I think it is helpful to give the user some reference about
> >>> proper num_args
> >>> and response_size for each message. I don't have a better idea to achieve this.
> >>>
> >>
> >> I like the idea to give users a reference on args and responses for each HSMP function.
> >> If this table is kept in the uapi header perhaps we should add a short description of
> >> what the expected args and responses are for each HSMP function with a pointer to the
> >> full documentation of the HSMP functions in the PPR.
> >
> > I guess we can use unions do give full descriptions, like:
> >
> > struct hsmp_message {
> >        __u32   msg_id;                         /* Message ID */
> >        __u16   num_args;                       /* Number of arguments
> > in message */
> >        __u16   response_sz;                    /* Number of expected
> > response words */
> >        union {
> >               struct {
> >                       __u32   args[HSMP_MAX_MSG_LEN];
> >                }; /* ensure size of args */
> >               struct {
> >                        __u32 test_arg1;
> >               } hsmp_test;
> >               /* args for other commands */
> >        } args;
> >        union {
> >               struct {
> >                       __u32   response[HSMP_MAX_MSG_LEN];
> >                }; /* ensure size of response */
> >               struct {
> >                        __u32 test_response1; /* or better name */
> >               } hsmp_test;
> >               /* reponse for other commands */
> >        } response;
> >         __u16   sock_ind;                       /* socket number */
> > };
> >
>
> I was thinking of keeping the msg_desc_table as is, just provide more details
> about the expected args and responses in a comment. I think creating a union
> of structs for each HSMP function (and there are more functions coming) would
> get a bit messy.

Yeah, I think msg_desc_table with detailed comments also works.

>
> > btw: do we really need HSMP_MAX_MSG_LEN of 8? The list above
> > have at most 2 args/responses.
>
> The PPR spec defines the args and responses as having up to 8 so we ned to keep
> the max length at 8. No current HSMP has more than 2 though.

Got it. Thanks for the explanation.

Song
