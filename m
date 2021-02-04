Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9138C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 20:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65A2264DDD
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 20:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBDUkd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:40:33 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:42194 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhBDUkd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 15:40:33 -0500
Date:   Thu, 04 Feb 2021 20:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612471190;
        bh=rULvh0QTRFdC81GyW2HT66CuYkpmjoPj1DI2ZS/xyD4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=td4S8f6FQURkk47Jj8EFb9RC9WPcZkan5+HaR/lELM01xQSEnNsWgXXnj/ffC+N8y
         qWV2JZDYuN1GWlD+yjrXNqEGXAhU9y+BsG3n741s4gWtmFGthpSyy5seWPw5Rqs0B6
         1q9NKZ8ikbX5XIB9SvkhMx8pxhek8WrsuCiOp96I=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH 0/2] platform/x86: thinkpad_acpi/ideapad-laptop: move into subfolder and extract common DYTC code
Message-ID: <20210204203933.559752-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Kconfing and Makefile based on
https://lore.kernel.org/platform-driver-x86/20210203195832.2950605-1-mario.=
limonciello@dell.com/

Barnab=C3=A1s P=C5=91cze (2):
  platform/x86: move thinkpad_acpi and ideapad-laptop into lenovo
    subfolder
  platform/x86: thinkpad_acpi/ideapad-laptop: extract common DYTC
    constants/functions

 MAINTAINERS                                   |   4 +-
 drivers/platform/x86/Kconfig                  | 156 +--------------
 drivers/platform/x86/Makefile                 |   7 +-
 drivers/platform/x86/lenovo/Kconfig           | 177 ++++++++++++++++++
 drivers/platform/x86/lenovo/Makefile          |   8 +
 drivers/platform/x86/lenovo/dytc.h            |  79 ++++++++
 .../x86/{ =3D> lenovo}/ideapad-laptop.c         |  72 +------
 .../platform/x86/{ =3D> lenovo}/thinkpad_acpi.c |  73 +-------
 8 files changed, 274 insertions(+), 302 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/Kconfig
 create mode 100644 drivers/platform/x86/lenovo/Makefile
 create mode 100644 drivers/platform/x86/lenovo/dytc.h
 rename drivers/platform/x86/{ =3D> lenovo}/ideapad-laptop.c (94%)
 rename drivers/platform/x86/{ =3D> lenovo}/thinkpad_acpi.c (99%)

--=20
2.30.0

