Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DB1C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 24 Dec 2022 14:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiLXOsV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 24 Dec 2022 09:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiLXOsU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 24 Dec 2022 09:48:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC18FE0E8
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Dec 2022 06:48:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 530C960AB6
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Dec 2022 14:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B544BC43329
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Dec 2022 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671893298;
        bh=ZByeIYfOQNcTHPvcmdRWcUjyJ/qI++n/JceDpMd0wMs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KQhr4ln5aIM/OXJChy43GZK0OFQOjjR0+MCIUcIziJK1SeKipIYOz6KAdq4VZbXcR
         r/xSmbzzmjoy6svRhXZhhJevwgFQ03a7UsbnA636u54ELeJdPY6gQd7x8Nprvow40Z
         K0sOdmD48UBpC1EcqnKokflm70BzgG01rsY5Rl/sts/gguBRV8Mjtqat4FpJJbt2o6
         CVsgu02hi17dLW2t4pKSGRq9nyVsDGGhzV/0CThJ7AQCo4f/bfAFnZUNVqyAWliXHq
         umLeq34g4eDiO3RtlcGAUN4au4TL06zHHRZSaGmZmS08ITQyXVNMV+zfZZPtJQMI4D
         sGC+cS4V2P3Hw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A673DC43142; Sat, 24 Dec 2022 14:48:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 24 Dec 2022 14:48:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: thomas.langkamp@medicalschool-hamburg.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-dUG16xC9jx@https.bugzilla.kernel.org/>
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

--- Comment #279 from Thomas Langkamp (thomas.langkamp@medicalschool-hambur=
g.de) ---
Sehr geehrte Damen und Herren, vielen Dank f=C3=BCr Ihre Nachricht. Ich bin=
 am 9.1.
wieder im B=C3=BCro. Mit freundlichen Gr=C3=BC=C3=9Fen Thomas Langkamp, Doz=
ent f=C3=BCr Statistik
und Wissenschaftliche Arbeit MSH Medical School Hamburg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
