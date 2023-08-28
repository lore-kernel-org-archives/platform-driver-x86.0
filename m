Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B45C83F12
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Aug 2023 13:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjH1NNZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 09:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjH1NNQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 09:13:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC8411D
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 06:13:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 095B1647E9
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 13:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 696FAC433C9
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693228390;
        bh=add/LVAisIbeNAPgteExkAErvlLbuPDigjMiUu/X8+0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nFqe1FruG/soZEhX7Ppc+readsWuSMMb0ay3BBw3/vFJ5xmL6hBnBmg0JMfx/nbgv
         Qm3V3HtsQQHHni+U+rriIWC4qIJA3Cbg1YgrlNsUzQKHgZHVy175/ICNrEM9CqA/oC
         i0p1Ld1+f9y06yVJAuk7bHuHq1MjWZwkgQR93IeEeqNyVFiZQ7pjjVYt057SiitgNz
         doprKd0MSaAeCHELnpPCgZtUv1GjU7aMLAhiqBpI+L+9oIXOWgyZ9a6SNbo3V1HIbt
         U+Q0e6Z6xMqCYeD2Gzckac6VQEEbh4ePYrSAUKEfMSx9PeE2gXE6RMEdRiRvmhSM/U
         qmMwk4BeMEZ6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5A5BAC53BD0; Mon, 28 Aug 2023 13:13:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 28 Aug 2023 13:13:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bugzilla@svhs.ru
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-ukINxtBdib@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Dmitry (bugzilla@svhs.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla@svhs.ru

--- Comment #332 from Dmitry (bugzilla@svhs.ru) ---
Hello,
i've this board :=20
Base Board Information
        Manufacturer: ASUSTeK COMPUTER INC.
        Product Name: X99-A II

# dmesg|tail -n 3
[431341.603491] nct6775: Found NCT6791D or compatible chip at 0x2e:0x290
[431341.603501] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20210730/utaddress-204)
[431341.603510] ACPI: OSL: Resource conflict; ACPI support missing from dri=
ver?

Sensors not found, add support for access to nct6775
Thanks a lot !

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
