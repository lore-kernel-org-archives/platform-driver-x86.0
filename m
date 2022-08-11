Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7B0C19F2D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Aug 2022 08:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234580AbiHKIl5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Aug 2022 04:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbiHKIl4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Aug 2022 04:41:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97808E0D0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 01:41:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 454F9614CE
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 08:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABAF7C433D7
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660207314;
        bh=gr3o8lQDCoJx4mIc3Us0kiKnnSpNhkm7N2Rx6N4q+Xg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ox/Hwfp+JRX8ZYreYVgcxIZO2ZUCEKWPWpCeDlg8vUjSWC8Ajnr21MMeM/8d0slir
         yPfx2ocMXi6dVSjYZg13SysFf0DXT+EJUzb5ZlGZYy3kFbYdJlZTP+UjC3vtNgfGdA
         xFTJ56OiA/tw1RX6D9GtKt/04wYdMVZF5hrl1DhCVBJw55tjemUOV/0FSIsGbe8Mro
         KxC/wF1Aw5c0AmlgDAGdt/VsDPZQPs0Adb4pa8OO+pME241xczBC6h13ce/5RscyYt
         mN+YxXvc9eqdczpXIgzljQX4PM9+mU5YzNKeQ06K94V+ltUxpTjo146va9wYMfKv6/
         nKkQ7Ki3E21SA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8B4F0C433E4; Thu, 11 Aug 2022 08:41:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216347] ACPI power profile keeps switching to "low-power" on
 ThinkPad T14 Gen1 (AMD)
Date:   Thu, 11 Aug 2022 08:41:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216347-215701-Xa8tRGfkGK@https.bugzilla.kernel.org/>
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

--- Comment #4 from madcatx@atlas.cz ---
I modded the driver to log the events, here's the output. Note that I log a=
ll
events and have an extra output for the THM event so the output is a bit
noisier that necessary.

[  110.307214] TPACPI event id 24626
* Manual switch to performance
[  110.307221] TPACPI event THM_CSM_COMPLETED
[  110.308287] TPACPI event id 4114
* Drop to low power
[  125.374888] TPACPI event id 24626
[  125.374894] TPACPI event THM_CSM_COMPLETED
* Manual switch to performance
[  178.560859] TPACPI event id 24626
[  178.560862] TPACPI event THM_CSM_COMPLETED
* Drop to low power
[  321.588092] TPACPI event id 24626
[  321.588100] TPACPI event THM_CSM_COMPLETED
* Manual switch to performance
[  340.418211] TPACPI event id 24626
[  340.418215] TPACPI event THM_CSM_COMPLETED
* Manual switch to performance
[  344.953610] TPACPI event id 24626
[  344.953614] TPACPI event THM_CSM_COMPLETED
* Drop to low power
[  350.357321] TPACPI event id 24626
[  350.357328] TPACPI event THM_CSM_COMPLETED
* Manual switch to performance
[  352.865566] TPACPI event id 24626
[  352.865573] TPACPI event THM_CSM_COMPLETED
* Drop to low power
[  362.030351] TPACPI event id 24626
[  362.030355] TPACPI event THM_CSM_COMPLETED

There doesn't seem to be anything hammering the toggle, it just switches it=
self
back to "low-power".

There doesn't seem to be any apparent pattern that would provoke this. All I
can tell is that the power profile seems to switch itself back from
"performance" to "low-power" after some time. It can take anywhere from 5 t=
o 70
seconds for this to happen.

It also looks like the "balanced" profile seems to stick but I need to veri=
fy
this better.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
