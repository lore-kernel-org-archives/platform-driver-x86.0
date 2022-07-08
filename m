Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4281AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 17:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbiGHRKu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 13:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238421AbiGHRKt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 13:10:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07875925F
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 10:10:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5212DB800C1
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 17:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 008B9C341C6
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657300243;
        bh=XLuvsVIAZs8Q/wRlAoD+j6OIeXmy3NDcGDBNEWRF2aM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BBsf6pDmCIPgk7L/S/z8xoC4QVcKJYy0UPqs4a8FzIzsuUQRvGs/1qR5o2DHHPIyj
         qanC6eEK/+NWJs2YO8YCt8QaQzawqCTsQt7zqIOXhD0SCcSP+dgtuweuFWiuevr+mM
         VAXsYDglil4UZGLyqc3/cATtKJY8jbhea03Su4pYpKPvA4A0nfOdMW9TZaa1QgPxfX
         5Cl4VQIaNk57PLhI6ELX4LpelBI4UFYbn3C59ZdvGcyuTnqWHynP9vBh5ZTzQ334yK
         76A+2zzeY1jE+h0AwbE+9bi/DIkDBjIrJjYmmWDWIn0N3tJkYyydsc4/CxgQuUtpnn
         RexlWgT0OUI+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DA989C05FD6; Fri,  8 Jul 2022 17:10:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 17:10:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-lWlL2u4PpW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #7 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
So, this line fails:
  https://elixir.bootlin.com/linux/v5.19-rc4/source/drivers/spi/spi.c#L2399
Can you double check that is true in your case?

If so, it mean that by some reason we can't find registered SPI controller.

You may add a debug print before this
https://elixir.bootlin.com/linux/v5.19-rc4/source/drivers/spi/spi.c#L4224

  dev_info(dev, "%s <--> %s\n", acpi_dev_name(ACPI_COMPANION(dev->parent)),
acpi_dev_name(data));

Meanwhile can you attach file from `acpidump -o ux3402za.dat` or if there is
known publicly available dump (GitHub?) share that link?

P.S. Regarding booting v5.19-rc5, possible this thread will shed a light
https://lore.kernel.org/all/272584304.305738.1657029005216@office.mailbox.o=
rg/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
