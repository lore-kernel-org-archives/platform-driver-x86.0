Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08805C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Aug 2022 14:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbiHJOlf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Aug 2022 10:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbiHJOlX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Aug 2022 10:41:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136A64D4C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 07:41:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B6976153F
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 14:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06FC1C433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660142469;
        bh=OXIPeV5DdQ3GneVCmD/Y0ksXAn/SlB5qlq6c+GNuC24=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gew0SX67LSnA+9p/LtH3kQaI48g8IyW6UYBy2efGwsVM8AwpaykIxLc9hepL2Lgu4
         OIL+Bamamvimy+82lzOB3lBCfeizVdGj2wFx49MYAf+cVKZ9TtK6s6p3MxiZZepPp+
         XTlSqE4DsA9/nFQollZU+HJMeGtViMC0jDBWbfw1RR7FwhpDouGqLLrn/d2ksKBSL/
         OXR+KTMCFIlb2w4S/yMvEAEWhmOXba87ggpOl2LtUdP94rOmP/078Z7NZIQDUpyBKr
         KtXPbKAyWBXlz/E/4gJH39vivke6ywQt9kZjErA4C9Vd3it8mpgIUf/ydMZJ3+2YBF
         1ltx+HXv/3ySA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E4B1FC433E7; Wed, 10 Aug 2022 14:41:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216347] ACPI power profile keeps switching to "low-power" on
 ThinkPad T14 Gen1 (AMD)
Date:   Wed, 10 Aug 2022 14:41:08 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216347-215701-DqsmwDMJEr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216347-215701@https.bugzilla.kernel.org/>
References: <bug-216347-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216347

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Do you have power-profiles-daemon installed?  That's the most likely cause =
to
this behavior I would expect.  In general it's probably better to change the
profile using the d-bus API with PPD if you have PPD installed so you don't
have two things fighting over the same file.

FYI - technically there are different profiles for Lenovo AMD systems on AC
adapter or battery but thinkpad_acpi doesn't export them right now.  If this
changes in the future you may want to keep an eye on it because your udev r=
ules
won't make sense anymore.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
