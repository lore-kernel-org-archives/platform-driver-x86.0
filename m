Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05939C2BBCD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Dec 2020 21:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D03CC229C4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Dec 2020 21:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgLTVTP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Dec 2020 16:19:15 -0500
Received: from mail.ispras.ru ([83.149.199.84]:36432 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgLTVTP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Dec 2020 16:19:15 -0500
X-Greylist: delayed 374 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Dec 2020 16:19:14 EST
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
        by mail.ispras.ru (Postfix) with ESMTPS id 9A64540A1DA4;
        Sun, 20 Dec 2020 21:12:14 +0000 (UTC)
Date:   Mon, 21 Dec 2020 00:12:14 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     platform-driver-x86@vger.kernel.org
cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Alexander.Deucher@amd.com, linux-kernel@vger.kernel.org
Subject: amd-pmc s2idle driver issues
Message-ID: <alpine.LNX.2.20.13.2012202341520.6949@monopod.intra.ispras.ru>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi folks,

I've tried the "platform/x86: amd-pmc: Add AMD platform support for S2Idle"
patch on my Acer Swift SF314-42 laptop (Renoir SoC, Ryzen 4500U CPU) and hit
the following issues:

1. The driver doesn't bind to any device. It has the following binding table:

+static const struct acpi_device_id amd_pmc_acpi_ids[] = {
+	{"AMDI0005", 0},
+	{"AMD0004", 0},
+	{ }
+};

This laptop has "AMD0005" instead. Adding it to the list allows the driver to
successfully probe.

2. The debugfs interface does not seem to be very helpful. It shows

SMU FW Info: ffffffff

It's not very informative. The code seems to be fetching SMU version from mmio,
so I guess the file should be saying "FW version" rather than "FW Info", and
then, I think version number is not supposed to be "-1".


(and I'm afraid I cannot use the driver, as there seems to be an issue with
GPU resume: sometimes the screen is frozen or black after resume, so I need
to reboot the laptop :( )

Alexander
