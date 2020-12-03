Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077B2C4361B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 23:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD02A2076D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 23:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgLCXxo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Dec 2020 18:53:44 -0500
Received: from mail4.protonmail.ch ([185.70.40.27]:31159 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgLCXxo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Dec 2020 18:53:44 -0500
X-Greylist: delayed 460 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Dec 2020 18:53:43 EST
Date:   Thu, 03 Dec 2020 23:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1607039582;
        bh=76cnCDcbV+bVOdYRaXnr4zF98Zu9UULsK0fglJwpWlQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=WzERO6BYSIsKO3lezFEOihwh3Ru+D1+tvnT3ptqi28Uqn0Mb4wE+XvLLF+3x8FrNZ
         7sYKKCP9jcyKH1cVoLkQhSqAbJDifVD7IRHLS/ywMWXKwqk1K4NHfLDm7FYv9C1wHe
         oPYMeLCCfVL+og6+mRxG29hWmJkHTzPwojmiS3mI=
To:     Elia Devito <eliadevito@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Alex Hung <alex.hung@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 2/2] intel-hid: add alternative method to enable switches
Message-ID: <dZOYAwID-kLArecWZIijmPEsGIBufXoFhTl6ueCv-rXqxZow2klBtVhCB6b9OQhjTsb5zRSSBE7tlB25Za1A_VUBlzlk-vlMQb6SzBeVkzY=@protonmail.com>
In-Reply-To: <u_tIRoW7nG4DQc7H_wcr9yn8oIc5rO9SsWKfOoJz4c9KKDJtUsYore_4tyNYxn3r0OpEOI5rsyrE__1Y2hbIc8lnS5cJKeeFmqyPdRjDVyU=@protonmail.com>
References: <69f340f6-4301-6546-f14a-47d90208d44b@redhat.com> <20201203212148.36039-1-eliadevito@gmail.com> <u_tIRoW7nG4DQc7H_wcr9yn8oIc5rO9SsWKfOoJz4c9KKDJtUsYore_4tyNYxn3r0OpEOI5rsyrE__1Y2hbIc8lnS5cJKeeFmqyPdRjDVyU=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2020. december 4., p=C3=A9ntek 0:45 keltez=C3=A9ssel, Barnab=C3=A1s P=C5=
=91cze =C3=ADrta:

> Hi
>
> [...]


Oh well, I replied to the wrong email, apologies. :-(
