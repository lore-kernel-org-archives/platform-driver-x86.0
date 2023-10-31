Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A597AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 13:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344432AbjJaNC4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 09:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344434AbjJaNCy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 09:02:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DF7B7
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 06:02:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93F2DC433B6
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698757371;
        bh=PclzS65HNrklTUXMWiNukN5LcHawYpiRydderPDOum8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Pw1p8iqiTGfvZJJTW8DAna8+wfCTRErFj8K7yU+ztIR1dZWolJkvko3PWxI84tpwc
         TfnNXcgekK2LcccyfCccwhYSMXOgehiRf4OAvXpVSaEpN9UFIMrjAwuRbWtUt4wmSu
         qLRwA7C8pJj92e28vRW1DgSdDJZmti4pqYFIpRZirCbs0k1EFtKMzPTF6bUKzBO5KY
         0XTvtaHKSLfhPQkNW6h/XXX+9RtGNfLixq9s4MSY0OCZVpME01FQvP24H6YsenYmZW
         mKntVB5+VoJ/JUdXlSTmJ2iA++26TX66JjC5mQil/SWdeDNRSvoBfjlG2MABGmAg8W
         WB4jSB86sjY2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 814CCC53BD0; Tue, 31 Oct 2023 13:02:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 13:02:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-2qqjTCBruh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Have you already updated your BIOS to the latest BIOS?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
