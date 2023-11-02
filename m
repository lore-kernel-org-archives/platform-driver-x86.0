Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D30C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 13:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjKBNof (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 09:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjKBNof (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 09:44:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE129D7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 06:44:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73990C43391
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 13:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698932672;
        bh=qGGlF2KgYnzVop1d/stIJi3zFP4MsKq7XPM4brZACek=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rqHin5QJ78iQmAkaCyjX2hXHc594gCueAo8BuhpVOnjHVkQdvTEKznZYPK3CogruH
         Hy8dKDqsO9jK/N94tw0bq3Esyn3ft9wRII8WMOzKtuYih3NRpxfRngda1Vj1rXWKIq
         uaWjDfyc7nlT/L3tQsQiapFiBfrzfG4E5ynaYDhDGrqHbSzdSHFJyerCaJSHDenKAX
         BHEmzlPr9Nj+zDSwJQHOv8oOMfw6Bt7aiPhn+ilXKpa0LVWBYbVARr4ZZGhq9LMMCT
         AQkPOaiUh2bHs1F/czTyf5+IC+XIgD70V4gmcsICAg2Bvy1n1AiJV+OdZPvMYGTQ+s
         3NarAwsNlpgEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 551CFC4332E; Thu,  2 Nov 2023 13:44:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 13:44:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-m3RMNgMnAI@https.bugzilla.kernel.org/>
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

--- Comment #25 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #24)
> The reason to copy the config is to give you a shortcut to have the same
> config you're already using without having to learn the entire kernel con=
fig
> system and what your system actually needs.  It's literally the filename
> ".config".  So:
>=20
> # cp /boot/config-6.5.0-10006-tuxedo .config

Thank you. I did this. But then I didn't do this:
> > 9) Install build dependencies for building the kernel ("apt build-dep
> > linux-image" should hopefully help here)
Because, I tried "sudo apt install apt build-dep linux-image" --> it didn't
find build-dep and show all linux-image* for different versions. Should I t=
ry
to "make -j$(nproc) bindeb-pkg"?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
