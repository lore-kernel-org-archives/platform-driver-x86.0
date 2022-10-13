Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0514C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Oct 2022 01:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiJMBTR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 21:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbiJMBTC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 21:19:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6017F123
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 18:18:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 518E9B81CB9
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 01:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1430C433C1
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 01:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665623878;
        bh=toLTOc/LymNHZUX2Ezho1n+yTYCwYE7nqTTmfo46Ykg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D0GiIXsuYvpv9r3mpBW0q9bJfHQiJrIblggNxUZEt4LjN8lk2R5KqDQ6LKWBfhf+N
         vGesVkDEhcdisvTG2vKOzashBMAcy389ZTO7UzpSwpqfTPIY/5kRXuVuG5eB1RL5la
         wujh6svgUa73N7l6JyjjntL+wc2y1Cz/IwC15H9HTD6oWEO3mpBOnTpPQiJoVY/VgK
         70zZ/KKyt4lXVxyRoaNiXKIr3wH+vpnbTVhUE5khL3QT8YzBEnTrbC2xasfLpQdfvi
         bTH9et3sXzfdnVeeqxrtQv9edvmvazeFoyTSSRKai68rILbyID+BrNhZloKkzdfrOm
         MGLDvO9FfK2+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D616DC433E6; Thu, 13 Oct 2022 01:17:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Thu, 13 Oct 2022 01:17:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-an6dAajAIY@https.bugzilla.kernel.org/>
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

--- Comment #37 from kolAflash (kolAflash@kolahilft.de) ---
@Mario

I think you might interpreted too much in the term "s2both" I used.
s2both is just a handy name uswsusp uses.
But I don't use uswsusp. (I just like the name "s2both")

The same technique uswsusp calls s2both is also known as "Hybrid Sleep" by
Systemd and as "Hybrid System Suspend" by the kernel documentation.
See here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Docum=
entation/admin-guide/pm/sleep-states.rst?h=3Dv6.0.1#n220



I opened a new bug for this Hybrid System Suspend problem.
Would you have a look at it?

Hybrid System Suspend broken HP EliteBook 845 G8 (a.k.a. Hybrid Sleep / s2b=
oth)
(s2idle Notebook)
https://bugzilla.kernel.org/show_bug.cgi?id=3D216574

I still suspect that the problem is related to s2idle. Because Hybrid System
Suspend usually works by writing the memory to the swap file (like hibernat=
e to
disk), and then entering "suspend to memory". So for "suspend to memory" so=
 far
"deep" S3 has been used. But with this new hardware I guess "s2idle" must be
used instead.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
