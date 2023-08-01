Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C633C41513
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Aug 2023 13:52:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjHANwn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Aug 2023 09:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjHANwm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2023 09:52:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D627F1
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2023 06:52:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02509615B0
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2023 13:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60DB1C433C8
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2023 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690897960;
        bh=H4tQTwQbL3tKu4sWRTq7HxG7THIW39XKxftC7X+yf4I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=luuimksHhkbfJs2yz/aNY9ZRPp7zpWNbH1cucDGIqjFvqJHu5W/IdV61Ah/xMgdhI
         iB0EYpMafMlyOjz7j+Vv10B9zBe6i7UNzMrEJ/d59W4d9zMUGu0LQ6Np4JzOjvaEux
         ZEInyIYQBUDnJE3eHQlGbwKeehbo6/ZHg/aqpbBUUu9qW0pN/T1pFuioh6acznZJnV
         /I6vfOpTn4vrGmpgTOl2BNvx62v63XodWZPrq2vm/lak1ezxkFTL+UtwqX+RbyQdtw
         wHehR3Qj0gY411nhYakKaNT91tZk18t0EYscPUGBsdQiq4DQ3L4cJ4gZIF3EtjQhc9
         LXVS81d03naAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4D1B8C4332E; Tue,  1 Aug 2023 13:52:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Tue, 01 Aug 2023 13:52:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-aMu1nNZj1D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #27 from Artem S. Tashkinov (aros@gmx.com) ---
Dear Mario Limonciello and Alex Deucher,

I've discovered multiple other HP laptops affected by the issue of AMD Phoe=
nix
APUs never reaching their advertised boost speeds. It's not about Linux AMD=
 PMF
driver, it's under Windows:

HP OMEN by HP Gaming Laptop 16-xd0xxx, 7840HS - 4619MHz limit
https://browser.geekbench.com/v6/cpu/1868206.gb6

HP HP ZBook Power 15.6 inch G10 A Mobile Workstation PC, 7840HS - 4500MHz l=
imit
https://browser.geekbench.com/v6/cpu/2027018.gb6

HP Victus by HP Gaming Laptop 16-s0xxx, 7840HS - 4619MHz limit
https://browser.geekbench.com/v6/cpu/1638542.gb6

HP EliteBook 845 14 inch G10 Notebook PC, 7840HS - 4500MHz limit
https://browser.geekbench.com/v6/cpu/1946323.gb6

HP EliteBook 845 14 inch G10 Notebook PC, 7940HS - 4500MHz limit
https://browser.geekbench.com/v6/cpu/1958365.gb6

I know you know people in AMD who work with your partners - would be great =
if
they contacted HP and ask them to remove the artificial limit.

Thank you very much!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
