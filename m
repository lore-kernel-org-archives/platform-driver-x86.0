Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458FDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 14:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235352AbiAKOB5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 09:01:57 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50676 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238129AbiAKOB5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 09:01:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19F1961677
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 14:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82E33C36AFD
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641909716;
        bh=6BSBjt3h3a3qxivq1rbnH+HpAI81/Umr6zukYNSBFUo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oQqr+5HDsXYGoFvNwjFZY7f95/4TSaOh9PTV2S69Fd5xfxiacmrr+H1Ohv4MCuFZx
         l5b0yD0xI/nFnJWc3nhVb/KvNHn9D2brwg3CFVFBTSF62xrnErgjnMHKZaHCEvtlz5
         TIm4VV+XwhsZCHZoEix5IQ/DieQ1J0A40mhJyjTXUySu2ha4eLpsaMBVWL4sRzWuy6
         B2Vt8ZRguOSBauvWtObrOghZVj9wBu/559+nSYT0tSdcnEJgOVwdp5AtS6yDAAVVFe
         kytP/X+P3obBsJ4Zop1rIMoyFGeb3HI5kVP1b+2H37u6bVVBmhZQcPBcT5I/KL5YR3
         rVwH5jiM/TTlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 73AA7C05FD1; Tue, 11 Jan 2022 14:01:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 11 Jan 2022 14:01:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: savicaleksa83@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-mkPXbHm0LS@https.bugzilla.kernel.org/>
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

--- Comment #208 from Aleksa Savic (savicaleksa83@gmail.com) ---
That's what I suspected, thanks for confirming. Do I need to check anything
else, is it good for addition?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
