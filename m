Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3BFC6FA82
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 18:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbiI0SBA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 14:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiI0SBA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 14:01:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4551B19C08
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 11:00:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E633CB80B98
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 18:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA577C43470
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664301654;
        bh=QrybqhtVqyIEi/IfEfjP9a+IyQPLNixryVDC/vqmwsw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gxc+7WfirjXzCKvFFSEHWhXjYttHUui0TtfgNRirGO/GmARXPBwVoAVGGoGIuFR0e
         PVH9N6wkdrbJDqtspFzxDGec6oSWj3ndz2ukgFmSlubfCG4pEJnPhLpfjjJnSi5uGx
         +ZskSISMJmC0pm9qyqsGHOEKo8HT3cdwv+mmnITKItUbFf1jlYjiuyvQqA0i6SsO6Z
         f2PwpB/VUngBXyPhmbKXNbUtARiT9P8S0o/7MASz0iZ8AMnu66a1ZBx+zgrwH21RPL
         HtVe8fydAqsnazIKjIs+8NC6eIP2FCb6NYfvqu/hQ9GJiTFQK2pxM2FeHmyZ0v81BN
         uhOT4KTOj6e4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 837C8C433E4; Tue, 27 Sep 2022 18:00:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Tue, 27 Sep 2022 18:00:54 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-XFDxDC3RfN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #16 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> And indeed, power usage went down to 2 % per hour! :-)
> So should I open a bug for s2idle in openSUSE instead!?

Eventually; yes.  But I think you need to further root cause why this is
happening in openSUSE before opening a bug asking them to change a policy or
userspace software.  Narrow down which wakeup trigger is causing the spurio=
us
events, and confirm that in Ubuntu 22.10 that wakeup trigger is disabled.

> But I couldn't get the s2idle power usage significantly below 2 % per hou=
r.=20

When the power consumption is at this level in your test environment, can y=
ou
please double check with amd_pmc.dyndbg enabled matches a high percentage of
the time you were suspended?=20

> Tomorrow I'm planning to do the debugging steps described by Mario in com=
ment
> #14.
> So maybe with that the consumption can be brought further down for s2idle.

Yeah let's see if that series of patches changes anything.  Like I suggeste=
d on
the otherwise unpatched configuration you should also correlate the number =
you
get for time (in microseconds) you were in the deepest state against the am=
ount
of time you were in suspend.

> But I also still the idea of using S3 (especially because of the very low
> power consumption).
> So I'd still like to see a fix for the commit initially mentioned.=20
> Or maybe not a fix, but a kernel command line option to disable that
> behavior.

s2idle should be less power consumption than S3 on AMD SoCs and also have a
much faster suspend and wakeup process.
I suspect what is happening here is that HP's EC is issuing wakeups too
frequently and causing a wasted power consumption.  Let's see the informati=
on
from my other debugging steps and proposed patch if they help.

For your request I sent up https://patchwork.freedesktop.org/patch/504971/ =
for
discussion.  You can feel free to leave a Tested-by: comment there if that
works for you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
