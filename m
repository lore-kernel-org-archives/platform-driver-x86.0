Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B308DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 20:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiBNUQq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 15:16:46 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiBNUQo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 15:16:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECD0CCC
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 12:16:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 53DDBB81683
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 20:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAF1EC340E9
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 20:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644869492;
        bh=+vTgrNCt1gtMYCuhB7DjHwBYB3ZebOjPt9lgqTFfqkU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=abGQfwO1WWo1//rKKm1ircLaVbTEmtnvMighqbzMTWsZ6jiKkBhXi+dim4YJD7etx
         cQPbDL2hiCr8sIGixW1ShbP4B/zhhlMijRLsB2eHh2G4aw1J/XsFP9MYlFlnrflwUn
         eAjb9Sy3ch4T0HMIbQslaaUwXuWgUb1K7EQEZ+J0+YxV4WB9VoCx5hb+o9z/r42A5w
         /0NEmlrZP/UIN0CpIlmB42GpN0LqTthPNSWAdiVMnuKktgm+2zug0iICjhc3DcyxbU
         5DubT2VNlR8zUDmF9PhK2RTT8qkxLMVWJju0CA7i8MrPHWYZ5EQB2Zn3ZJGIQaqNMx
         YiKYSXhcJZW1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CB124C05FD2; Mon, 14 Feb 2022 20:11:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215531] Lenovo charge limit feature stops 1% short of the
 configured limit and says it's still charging
Date:   Mon, 14 Feb 2022 20:11:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nate@kde.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215531-215701-AfGamOOQHv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215531-215701@https.bugzilla.kernel.org/>
References: <bug-215531-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215531

--- Comment #4 from Nate Graham (nate@kde.org) ---
OK, thank you for the information. I will adjust our code in KDE Plasma
accordingly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
