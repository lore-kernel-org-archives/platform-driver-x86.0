Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06811C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 17:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245567AbiBNRVv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 12:21:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237047AbiBNRVv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 12:21:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444FD2AC4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 09:21:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD2D6B80C6D
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 17:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2F6C340E9
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644859300;
        bh=I82JZilGFITG2+aTwXc4bdz0b5e97kAhcD0dRLAoMAA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t7odv9fyZFGhtlSRuCm9kbhU+ccWWHCPk1n3VOvazdrsjIscSO56uCjZX8HX4g++I
         b0pVPqqPHeuSOqLjZNZESjhla+y8NzT1gxhLqo46uE2lMkv6XLis3IuPrm66HG0eR2
         7hcPT9IpHxrvc97mr163P2qTrzEzudZiWfCUQbcQx8b/WsVounaSowTucP0u8e8vlE
         lr67Mh0KXrm0LduxQsXBx20JHQ9i3iXJWIHOCJIRncnavQJ28dPdkwNbcYR5yctFpR
         npvf6zPmB1HredgrtDRgMTVfxxhf8ZEpunYPgcUB4zFIEZD8HZk8CkpYKchGeqkKKX
         Gk3sHKMjRaZvQ==
Received: by mail-yb1-f173.google.com with SMTP id v63so21089751ybv.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 09:21:40 -0800 (PST)
X-Gm-Message-State: AOAM532VY/lazUNOQKdh7B3X7sbAkHnU9SWkbY+bfxjT53WD1fJMV+JM
        1BDoF32iuAQPftu6ilWNOZsPnmU0FktKfKUzcMM=
X-Google-Smtp-Source: ABdhPJyqKUtAI6seVZ3ekjdZfEMsYV32fOYY9BxGQLrjXmwch/FDtnCpWq9+oKyn5FCtYv2HNr/slRFrEL4T3IEUCNc=
X-Received: by 2002:a05:6902:5:: with SMTP id l5mr46187ybh.558.1644859299729;
 Mon, 14 Feb 2022 09:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20220209184406.99938-1-nchatrad@amd.com> <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
 <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com>
 <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com> <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
 <aeb4d8d9-a43c-0697-5035-eff7f4ba3728@amd.com> <CAPhsuW6QHwpBH79GeNo22YNsRdcWvUupa10sbqup_qZ5V-__HA@mail.gmail.com>
 <2549f688-c148-f893-1fe0-52a09a8fb1d5@amd.com>
In-Reply-To: <2549f688-c148-f893-1fe0-52a09a8fb1d5@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Mon, 14 Feb 2022 09:21:28 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5OMLcFWt8iUu0K57iSvxGME=Dj1PCO8VZ0QL1gHZ-dpw@mail.gmail.com>
Message-ID: <CAPhsuW5OMLcFWt8iUu0K57iSvxGME=Dj1PCO8VZ0QL1gHZ-dpw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
To:     "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
Cc:     Nathan Fontenot <nafonten@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, suma.hegde@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 14, 2022 at 7:32 AM Chatradhi, Naveen Krishna
<nchatrad@amd.com> wrote:
>
> Hi Song,
>
> On 2/11/2022 3:10 AM, Song Liu wrote:
[...]
>
> HSMP mailbox messages are evolving and each platform defines a supported
> list of messages.
>
> On a given platform these messages are described in the PPR.
>
> Eg: Milan PPR has "7 Host System Management Port (HSMP)", is made public
>
> https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
>
>
> Bringing detailed description of these messages from PPR into the kernel
> would be a
>
> duplicating effort. Which will also bring in challenges such as
> maintaining the details
>
> for every supported platform and submitting kernel patches for every
> platform.
>
>
> We would like to avoid bringing more details of these messages to the
> kernel documentation.
>
> Such a structure can be described as part of esmi_oob_library to ease
> user space tool development.

I agree there is  extra effort to adding extra logic and documentations to
the kernel. How about we ship current version with a few minor changes:
1). msg_desc_table is in the header, so please prefix it with hsmp_
2) as Nathan suggested, add more comments to msg_desc_table. Maybe
something like:
/*
 * HSMP_GET_FCLK_MCLK,
 * output arg0 = fclk (MHz); arg1 = mclk (MHz)
 */
{0, 2, GET},

Besides these, I have a question. Per the hardware design, args and
reponse in hsmp_message share the same registers. Shall we make
them in/out argments in hsmp_message and save 256 bytes per
hsmp_message?

Thanks,
Song
