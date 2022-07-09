Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9425BC43334
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 16:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiGIQoK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 12:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGIQoJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 12:44:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52C3120A4
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 09:44:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F7AA60F3E
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 16:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 985AEC341C7
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657385046;
        bh=DcYdOrvkUN8EMbsHnvXAG2IuBQeWTHQjw6K+Vpm7P/0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gf9VTlk84GfxEWAkvzEZTEI+yvLk4bQtLDd6e9TXD14iwOp51n3TOJXNR+E4bFpav
         t8PCTDR4qaY2xls5rCpuKCo55MTiTcQukAtSSDcn3tDL3ngdma5UOVSv5eKfmbfJHB
         bg8c9K97RihPcyKXHSacVEl77A/g9qdLhLdZGfFfBwZf8siIWhPgRkpGEIQkQEau79
         hGHiCkFwv039TYHZ8xaMlr0crnRA22ov4beLz0g6AFN+HktaYyOg/WLqRdaFhk7bmZ
         wi3eZ3vAhqXQQy9nDQNqPIeWbP5M6GZdZCeXif+7r0lXD2XFU9TrPNsM4N6dYfRiJ2
         5KR7bxtQZ+XZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 76D27C05FD6; Sat,  9 Jul 2022 16:44:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Sat, 09 Jul 2022 16:44:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-Ctsg4N8O9D@https.bugzilla.kernel.org/>
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

--- Comment #14 from Supasak Sutha (blur.3rd@gmail.com) ---
(In reply to Andy Shevchenko from comment #13)
> (In reply to Supasak Sutha from comment #12)
> > May be it's not reach that function. or I miss something?=20
> It maybe a clue actually. Can you replace this -ENODEV (should be failing
> line in your case, 2404)
> https://elixir.bootlin.com/linux/v5.19-rc4/source/drivers/spi/spi.c#L2401
> with -EPROBE_DEFER and tell me if anything has been changed?

[   16.010854] i2c i2c-16: 8/8 memory slots populated (from DMI)
[   16.010860] i2c i2c-16: Systems with more than 4 memory slots not suppor=
ted
yet, not instantiating SPD
[   16.012665] spi_master spi0: device:79 <--> device:79
[   16.013204] cs35l41-hda spi0-CSC3551:00-cs35l41-hda.0: error -EINVAL:
Platform not supported -22
[   16.013209] cs35l41-hda: probe of spi0-CSC3551:00-cs35l41-hda.0 failed w=
ith
error -22
[   16.013250] spi_master spi0: device:79 <--> device:79
[   16.013614] cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: error -EINVAL:
Platform not supported -22
[   16.013617] cs35l41-hda: probe of spi0-CSC3551:00-cs35l41-hda.1 failed w=
ith
error -22
[   16.013639] Serial bus multi instantiate pseudo device driver CSC3551:00:
Instantiated 2 SPI devices.
[   16.030810] loop: module loaded
[   16.031498] loop0: detected capacity change from 0 to 228816


I also attached full dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
