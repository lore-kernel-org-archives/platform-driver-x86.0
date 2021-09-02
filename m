Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1ECC43214
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:33:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2114E60462
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241297AbhIBJeb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 05:34:31 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:34015 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343929AbhIBJe1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 05:34:27 -0400
Date:   Thu, 2 Sep 2021 11:33:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1630575205;
        bh=vDXXuVZNAdH1DjkO2dOqXZ3e04GyZa96JvE0GmVzpqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bF587EkMYed8IaYavhK23AqtnMSbEBsbJ2CX7Ry2HBx+ctY3YXqz32c9TEzBR2Z9c
         O4MU9t6JWJz6aRFfdR8GVDafBg7E0XiXCgvl3TUdTKg7FPHelr2CVmkZw6+NRJaH9r
         rRkZO5IccmSTKctxnim7cY/P9n7BWPNNYwV+gz4Q=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Dadap <ddadap@nvidia.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Message-ID: <7ae1497c-958b-4027-ab47-41ff854d25cc@t-8ch.de>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
 <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
 <CAHp75Vf76-qf=9_tnYYnXw8C15GNcf0Up-kt3GKoe_hd=i3UcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf76-qf=9_tnYYnXw8C15GNcf0Up-kt3GKoe_hd=i3UcA@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Do, 2021-09-02T12:28+0300, Andy Shevchenko wrote:
> On Wed, Sep 1, 2021 at 12:25 PM Thomas Weißschuh <linux@weissschuh.net> wrote:
> 
> > > v4: Use MODULE_DEVICE_TABLE() (Thomas Wei??schuh <thomas@t-8ch.de>)
> > >     Fix scope of internal driver state; various style fixes (Barnab??s
> > >     P??cze, Andy Shevchenko)
> > >     Use devm_backlight_device_register() (Barnab??s P??cze)
> > >     Add kerneldoc comments for enums and structs (Andy Shevchenko)
> >
> > It seems your Mailsetup breaks Unicode.
> 
> I see it properly, so, the problem is on your branch of email delivery.

It's also broken on lore.kernel.org:
https://lore.kernel.org/platform-driver-x86/20210831224906.1072-1-ddadap@nvidia.com/

Anyways, as it won't be part of the history it shouldn't be urgent.

Thomas
