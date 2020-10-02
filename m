Return-Path: <SRS0=yw7w=DJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83066C4363D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 15:01:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC03F20679
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 15:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="nwplkA6S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgJBPBq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Oct 2020 11:01:46 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:59005 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388152AbgJBPBq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Oct 2020 11:01:46 -0400
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 635492007F6D
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2020 15:01:44 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="nwplkA6S"
Date:   Fri, 02 Oct 2020 15:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1601650901;
        bh=y8u3Yi9u4L6ppmYxEuGzZ+AVcztImVs7OJAIEhmE/1w=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=nwplkA6SYoP1McD6dTZtBxQoJAgDfRLC78TZoqUMDbGL0KZkrkfUU8WNHqxbpLMj4
         cnYJdW9l7eG4kEi+UPHcbMVI36e8rCb5aOtZm/P71Ti8IoHw3RGJ27T3MWdb3iGaPv
         e2m7vhptpow6qziODSr/GcEIYzCshrB5GSIyscfA=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Switch to an allow-list for SW_TABLET_MODE reporting
Message-ID: <_GDJXv2BrCsSZ77bLZXvXW2bz0MslNNwgXGiPib5cvCYWleijYXNMnTikDp3Lj1IP6bcQES3tC243dn_h6teAe0_3OVVeOotRtS60MB4WD8=@protonmail.com>
In-Reply-To: <CAHp75VcoyvpvfpfpcNa_j4oTRQV2Cyue+RJ33AdYz+q8uyCFag@mail.gmail.com>
References: <20200930131905.48924-1-hdegoede@redhat.com> <CAHp75VcoyvpvfpfpcNa_j4oTRQV2Cyue+RJ33AdYz+q8uyCFag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> [...]
> I have reverted previous attempts and applied this one, but...
>
> > Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLE=
T_MODE on the 9 / "Laptop" chasis-type")
> > BugLink: https://forum.manjaro.org/t/keyboard-and-touchpad-only-work-on=
-kernel-5-6/22668
> > BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=3D1175599
>
> > Cc: Barnab1s PY1cze pobrn@protonmail.com
>
> ...seems like a broken name to me. I'll try to fix this.
> [...]

Yes, it is. :-(
Maybe I shouldn't have used accented characters, sorry. I thought UTF-8
was reasonably well-supported in 2020.


Regards,
Barnab=C3=A1s P=C5=91cze
