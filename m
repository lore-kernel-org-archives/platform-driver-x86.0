Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD90C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Feb 2022 18:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbiBOSVt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Feb 2022 13:21:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234053AbiBOSVs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Feb 2022 13:21:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43904119433
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 10:21:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D391B6164A
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 18:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1A6C340EC
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644949297;
        bh=ukZkbQgXB1bRJa8NtvuFQNOIV7zjP6r/iAzSnoQHbF8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mKgDwpavdOBzOtoc1zjGZEVw43TY0v5CGP18DJG0IpCMzGlUFUuS/EVo2APRDvLuM
         jow+SGDctLrfIA4gvfV46jYUloUZ1paFM9RBGPQEqRCiPvKlgJj0SHP4Tc72z1qq6l
         1zzKtRGAiJfubXR699EDacjV+TBBAaEp0AevbrmEdqhiMt+IOv4n5qn+iYAw5ijMkR
         pMHbv0xn06cjeprv3c3uRk/lWdo5Qxf0b6JxoyHvvlqni0PVRp1JNeSBXZc0BqOZpo
         1AccaqRjWaRdeDbBaWEhJVeY1c10JtxBfRrNV9ZLIPQpcW7U6VofUkFwts/TEjJ15Q
         OdQChoLa36S2Q==
Received: by mail-yb1-f173.google.com with SMTP id o19so58459444ybc.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 10:21:37 -0800 (PST)
X-Gm-Message-State: AOAM5308c0svS0+adLwCm5RwYREZzilPNcv/q1EK+HGuXiP/nwdMI9UD
        qHQYOuVCwIvSR8hOhqlcHF9jnOnF5EqthHg9QAo=
X-Google-Smtp-Source: ABdhPJx72o9M1sqQH3Zp/5RnEpbYCURtTkrXVAT3sjITVP7c0SnxrEj84MkMdYf6e+N6AAhgfKnPPjj1ma/SXhfrwpU=
X-Received: by 2002:a5b:a03:: with SMTP id k3mr169877ybq.219.1644949296396;
 Tue, 15 Feb 2022 10:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20220209184406.99938-1-nchatrad@amd.com> <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
 <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
 <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com> <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
 <aeb4d8d9-a43c-0697-5035-eff7f4ba3728@amd.com> <CAPhsuW6QHwpBH79GeNo22YNsRdcWvUupa10sbqup_qZ5V-__HA@mail.gmail.com>
 <2549f688-c148-f893-1fe0-52a09a8fb1d5@amd.com> <CAPhsuW5OMLcFWt8iUu0K57iSvxGME=Dj1PCO8VZ0QL1gHZ-dpw@mail.gmail.com>
 <e1249c0a-6729-c02b-45b2-80d0fde07f7b@amd.com>
In-Reply-To: <e1249c0a-6729-c02b-45b2-80d0fde07f7b@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Tue, 15 Feb 2022 10:21:25 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7mDRswhVjYf+4iinO+sph_rQ1JykEof+apoiSOVwOXXQ@mail.gmail.com>
Message-ID: <CAPhsuW7mDRswhVjYf+4iinO+sph_rQ1JykEof+apoiSOVwOXXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
To:     Nathan Fontenot <nafonten@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
Cc:     platform-driver-x86@vger.kernel.org, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, suma.hegde@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Naveen Krishna,

On Tue, Feb 15, 2022 at 9:24 AM Nathan Fontenot <nafonten@amd.com> wrote:
>
> On 2/14/22 11:21, Song Liu wrote:
> > On Mon, Feb 14, 2022 at 7:32 AM Chatradhi, Naveen Krishna
> > <nchatrad@amd.com> wrote:
> >>
> >> Hi Song,
> >>
> >> On 2/11/2022 3:10 AM, Song Liu wrote:
> > [...]
> >>
> >> HSMP mailbox messages are evolving and each platform defines a support=
ed
> >> list of messages.
> >>
> >> On a given platform these messages are described in the PPR.
> >>
> >> Eg: Milan PPR has "7 Host System Management Port (HSMP)", is made publ=
ic
> >>
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=3D04=
%7C01%7CNathan.Fontenot%40amd.com%7C6026990f93ed41d04d0608d9efde79a1%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637804561503265585%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000&amp;sdata=3Do5BR%2FgHpjnNVa9zVu75I3RyzO8WNB4L7FMEvLNbzZVY%3D&amp;rese=
rved=3D0
> >>
> >>
> >> Bringing detailed description of these messages from PPR into the kern=
el
> >> would be a
> >>
> >> duplicating effort. Which will also bring in challenges such as
> >> maintaining the details
> >>
> >> for every supported platform and submitting kernel patches for every
> >> platform.
> >>
> >>
> >> We would like to avoid bringing more details of these messages to the
> >> kernel documentation.
> >>
> >> Such a structure can be described as part of esmi_oob_library to ease
> >> user space tool development.
> >
> > I agree there is  extra effort to adding extra logic and documentations=
 to
> > the kernel. How about we ship current version with a few minor changes:
> > 1). msg_desc_table is in the header, so please prefix it with hsmp_
> > 2) as Nathan suggested, add more comments to msg_desc_table. Maybe
> > something like:
> > /*
> >  * HSMP_GET_FCLK_MCLK,
> >  * output arg0 =3D fclk (MHz); arg1 =3D mclk (MHz)
> >  */
>
> Agreed, this is the type of update I was thinking of.
>
> -Nathan
>
> > {0, 2, GET},
> >
> > Besides these, I have a question. Per the hardware design, args and
> > reponse in hsmp_message share the same registers. Shall we make
> > them in/out argments in hsmp_message and save 256 bytes per
> > hsmp_message?

Do these make sense to you? We are hoping to back port these changes
to unblock our tests. But we need them to be applied to pdx86 first.

Thanks,
Song
