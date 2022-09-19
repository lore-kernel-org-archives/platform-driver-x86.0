Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E44AC54EE9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 09:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiISJHj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiISJHd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 05:07:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1586211C21
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 02:07:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91E3A60C56
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 09:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02644C4314C
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663578452;
        bh=TMEYmYT/feme7BedfYrW41aERANZ8BbPNYZ+8duf3eg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ki0g3WN9SvmvkIS6Vu3bj1249uso2Fln05GTDn6fWVLFkOsQNCyncwMr8GHb9AdQA
         jhPCGAMFOA2z4QXMUdV33SDvmYT403b5ka7mx5jXeSM++0tCeeNj7csMCDy6Lt9Hb0
         pWU8kM3js9iRvy3QUTyc6+9j46mfOHkZo7LGq4J3hKpfvTfTVR/Cx7MqjBGYtUWEjj
         h2+MIIEgFNOSjFxcN1lJ6fijo6lWgR5sByMJL2tUhX9bzCYsYRD/rdxPfAg8T8oVTb
         vkqJboPwc28beKDLhno5Xu8oAvONcNvcqIdN76zHJFCWLcI4b+UTLUPPUOC59dXEJ4
         NCL3aCNtp+6QA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E3A85C433E4; Mon, 19 Sep 2022 09:07:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Mon, 19 Sep 2022 09:07:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216176-215701-eh0V2N35qi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

--- Comment #8 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
A quick update on the conversation-mode thing. Since the conversation-mode =
in
essence sets a charge star/end threshold it really should just use that
interface. This is what has been done for the similar eco mode on toshiba
laptops:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?id=3D18ef1bb093ab1e0a74d146cbf4a9d132d01374d8
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?id=3D8ef5db9eb084f6212345a7b09355c78ce05f71e2

Note there this is setting the end-threshold, not sure what this does in
ideapad-laptop.

Also we may want to add some extension to the start/end threshold API to qu=
ery
valid values, so that we can e.g. do:

# cat
/sys/class/power_supply/BAT1/charge_control_end_threshold_supported_values
80,100

In the Toshiba case.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
