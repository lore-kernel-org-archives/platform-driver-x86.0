Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8F5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jul 2022 06:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbiGMGdw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jul 2022 02:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbiGMGdv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jul 2022 02:33:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3C75726C
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 23:33:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65D5F61C54
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 06:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF8CBC341C0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 06:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657694029;
        bh=IlUJQkPmVDHR1urC6MbgdB1qF817H5zHJ5s/8PP0Y8U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HSvv35l97LLeOqatKbvpvqzyoa3Nw7e/v2BMuJwcQGjv6YL+9PhLz4W2JZtM4f6O9
         eSQ/pR1VkX5w4vmOyYrlxDnBwrAd8j8PwrmiOOpbGnZW/2d9WVl9I5ej1r3UjF6qHT
         Ov0IbziYTtYt4gjws7RPt8aKBcuHmG15cizOEKbqQ1Yc4xUgiCSR/6cANU2fSpr7hN
         oUv61PSPUCF2VLY4xYwBBknRTVpjcyAvUVvBIrf6J2NT6hjpFJHmiuDytYW4OuXKCq
         HStN/BauBaYDPd8qg/voeKhUCnuHBiMc11ct2ETyUXCWQuvWLsYzHy814Qqbo+ZC/t
         HM4cpp0qyFhiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9C1F9C05FD6; Wed, 13 Jul 2022 06:33:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Wed, 13 Jul 2022 06:33:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-OR0EoTufEx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #17 from madcatx@atlas.cz ---
My output from /sys/kernel/debug/dynamic_debug/control lists pinctrl_amd li=
ke
this

drivers/pinctrl/pinctrl-amd.c:1056 [pinctrl_amd]amd_gpio_probe =3Dp "amd gp=
io
driver loaded\012"
drivers/pinctrl/pinctrl-amd.c:655 [pinctrl_amd]do_amd_gpio_irq_handler =3Dp
"Disabling spurious GPIO IRQ %d\012"
drivers/pinctrl/pinctrl-amd.c:632 [pinctrl_amd]do_amd_gpio_irq_handler =3Dp
"Waking due to GPIO %d: 0x%x"

IIRC this means that those debugging statements are enabled. The only relev=
ant
line from dmesg is this though:

[    0.668575] amd_gpio AMDI0030:00: amd gpio driver loaded

I just noticed another case where the number of interrupts reached about 12=
000.
With a bit of careful optimism I think that loading pinctrl_amd early during
boot puts an early stop to the IRQ storm before the kernel intervenes and
disables the interrupt channel.

As for reproducibility, I think that the machine needs to run for some time
before the problem can be "re-reproduced". This is why it looked like it was
happening only on cold boots. Assuming there an EC connected to these GPIOs=
 I
guess it's some kind of timer overflow...?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
