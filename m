Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD97C41604
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 16:21:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A36C02087D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 16:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HrKVLNaS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgJGQVZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 12:21:25 -0400
Received: from mail-41104.protonmail.ch ([185.70.41.104]:21770 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbgJGQVZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 12:21:25 -0400
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id 5CCDB20090E5
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2020 16:21:23 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HrKVLNaS"
Date:   Wed, 07 Oct 2020 16:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1602087680;
        bh=sklXRSR4DchLmeZEc2eD8zFfXahwNu0zPXFsGRi9IRc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=HrKVLNaSyH7IE7ar+lWwH/fuO6RzAmzHXTHUoZppCD8n2rSkvD8LJxEOkD2GE2ezi
         7aUtFicC2dOg68vk4m7k/SNNdSyNl4qZZKz639YKFWp36k/WGwz5J8K8fJeTrKEiGY
         PAgp73kCGa0/QqxHewLeZTz65MhfDE5w5uQHhptk=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for thermal policy
Message-ID: <zm1oBveg0S9L-MagzWnleGj5ZfQg8cV95Ugbzz6WZbnv-nzpF8_9Fghwj8P8V-ZAmVF6kRBWF-blVcOFirhSN3xxmE_8cOUycONWZMJP5xE=@protonmail.com>
In-Reply-To: <5d60709b-e3cb-685f-2b3e-07381b9855e5@redhat.com>
References: <20200917214957.GD29136@mtg-dev.jf.intel.com> <20201004211305.11628-1-eliadevito@gmail.com> <CAHp75VfbK226a-SsNj=Bnpfc3wWyT9K_D4XzAMOu9of1_g+8-A@mail.gmail.com> <5d60709b-e3cb-685f-2b3e-07381b9855e5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

2020. okt=C3=B3ber 7., szerda 16:02 keltez=C3=A9ssel, Hans de Goede =C3=
=ADrta:
> [...]
> Elia, Thank you for your patch, I've applied this patch to me review-hans=
 branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x8=
6.git/log/?h=3Dreview-hans
> [...]

I don't know if the problem is on my end, but opening that url
results in an "Invalid branch: review-hans" error.


Thanks,
Barnab=C3=A1s P=C5=91cze
