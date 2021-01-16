Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E37C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46EEB221ED
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbhAPUfP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:35:15 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:53263 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPUfO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:35:14 -0500
Date:   Sat, 16 Jan 2021 20:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610829272;
        bh=sOFM2phcRU+uFnUsL1+vBxKM8nH+luEkkB4+C7/Gc9o=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=IUlxr6yU9efrX39RmsJ3yUHImZw3Sgu3Sj+Jr0MljzYta+SEaNNPu9O3Zys0+jtP/
         P+4oiV/t7QyivO+iZXIeH+31bG7di5XsreRj1q6dGrEEgi/e30rb2OFKMpN7J8IXhg
         kNZcmy64ed8qmTq8Y0ycZ5egtx1EV6ojyjsLp7+E=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 07/24] platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate variant to display log messages
Message-ID: <xOz_6Hj0TZSyCFbqlSs7eCqC-z6d7ayRd425T6w2A_aZ02Y4KoUDTXMSXZWr08SGO3msoWaW91uKT9fJODw5QD257jNRxl7yd-gTBdAwdWo=@protonmail.com>
In-Reply-To: <CAHp75VfjDCAqPpPsaDiRCBDrq7VwyiZpOMpr-VvebPe+3b3w9A@mail.gmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-8-pobrn@protonmail.com> <CAHp75VfjDCAqPpPsaDiRCBDrq7VwyiZpOMpr-VvebPe+3b3w9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. janu=C3=A1r 16., szombat 20:46 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:

> On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze wrote:
> >
> > Having the device name in the log message makes it easier to determine =
in
> > the context of which device the message was printed, so utilize the
> > appropriate variants of dev_{err,warn,...} when printing log messages.
>
> This doesn't explain transitions like pr_err() -> dev_warn() or
> pr_info() -> dev_warn().
> Care to elaborate in the commit message?
> [...]

Thanks for the review, and thanks for pointing this out. I don't recall int=
endeding
to promote/demote any of the log messages when I was making these changes. =
I will
revisit my them and modify the commit and commit message accordingly.


Thanks,
Barnab=C3=A1s P=C5=91cze
