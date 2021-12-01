Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB37C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Dec 2021 03:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241435AbhLADTv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 22:19:51 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:45256 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241422AbhLADTu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 22:19:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C71A5B81C0F
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Dec 2021 03:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E720C53FCB
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Dec 2021 03:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638328588;
        bh=793gj4fwG0OjQqMuzeZt1rSnRWJCZFe68yj1vALZW0M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IngBC503t9QUGA8Sp8Z7p5fpu7rGCWYyL0D8Tor+mQfzebFyQcDJtBPZKsQrEAMYq
         uAQhj9BIIF0LYr/pfcfnp5nCaecPuasMi5vShNuLomAz6N35jhGDreqbLujwm/32Ft
         cSvfXWShTWxJPEGv1GyvOpA2pfl9blhUphDBYaObo40lyhELCARwDz8Qs3v3hOQVJQ
         gj5vFsTx8aapB03CakakKevxcLw+zaZ3/LvyuL1pjbjvS8DJF0NRCgPVmwmvhLNi6g
         rNtj3tjpLMH6REz//AtA2rIgVBfrvTK/Pr1Kd+J6sKxeETrU+3LDq38SaUl8JrHBUp
         sUv9b4NvCkBNw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4221160F3A; Wed,  1 Dec 2021 03:16:28 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215177] Stop exporting platform_profile interface for Lenovo
 T14/P14s Gen2 AMD
Date:   Wed, 01 Dec 2021 03:16:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: markpearson@lenovo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215177-215701-Pqk6lxigRw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215177-215701@https.bugzilla.kernel.org/>
References: <bug-215177-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215177

Mark Pearson (markpearson@lenovo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |markpearson@lenovo.com

--- Comment #3 from Mark Pearson (markpearson@lenovo.com) ---
Just to note here, as is stated in the Lenovo forum thread where this was
originally raised, I am looking into this with the AMD platforms FW team to=
 see
if we can add support.
I'll update once I have a better understanding of the best way to solve it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
