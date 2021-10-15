Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE70C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Oct 2021 18:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19A576121F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Oct 2021 18:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242497AbhJOSCN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Oct 2021 14:02:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242442AbhJOSCM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Oct 2021 14:02:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 37EE361252
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 Oct 2021 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634320806;
        bh=GCMrEycxJAgUsBpDo4LQ95Qg06ed8p/zrAAd1MwQjd4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dQLs9RkA7Q/dU10pWwJm2njvMy7irkDyXWrpqACApn+aQcumoA9MhHrAKeKGdctrG
         l3k4PJZI6nRrHYr8IFoWEQ5Jcu5MZstFcFgQJc1sgsCWZmGUocJO4DXTy4Nc3kEiQQ
         PiPtIfw39IDLLCrtTSVOv8UGtM9bPkxAxvT98w/LVwFKUw5LnCVRUcS0hjumywgIQQ
         8tRZYNag4mhvUg+/IKtjiAJRh0BGhttekBXM2iq+l56Zmutk3U/b/i9NHn8z5ZqEXT
         OjxPJZKYRU27nnRJsVa/DdF5Y6uuZg5P0/97crd+1PYTl0l8QrpNP9EaSUOy8iS2N6
         xd+4VO4M4Q6Qw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 197991] Volume and rotation lock buttons do not work on the
 Wacom Mobile Studio Pro
Date:   Fri, 15 Oct 2021 18:00:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ucelsanicin@yahoo.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-197991-215701-PNOqxiA1fG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-197991-215701@https.bugzilla.kernel.org/>
References: <bug-197991-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D197991

Ahmed Sayeed (ucelsanicin@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ucelsanicin@yahoo.com

--- Comment #25 from Ahmed Sayeed (ucelsanicin@yahoo.com) ---
The glibc regular expression code mishandles regular expressions such as:

   .*((.)\2){2}$ https://www.webb-dev.co.uk/services/navona-trains/

as it does not backtrack enough to find a match that satisfies the
back-references when they are used twice.
http://www.compilatori.com/computers/latest-car-deals/
To reproduce the problem, compile and run the attached file backrefbug.c. It
will exit with status 2, whereas the correct exit status is 0.
 http://www.acpirateradio.co.uk/computers/latest-car-deals/
This bug was originally reported against GNU 'grep' here:
The glibc regular expression code mishandles regular expressions such as:

   .*((.)\2){2}$ http://www.logoarts.co.uk/computers/latest-car-deals/

as it does not backtrack enough to find a match that satisfies the
back-references when they are used twice.

To reproduce the problem, compile and run the attached file backrefbug.c. It
will exit with status 2, whereas the correct exit status is 0.
http://www.slipstone.co.uk/computers/latest-car-deals/

This bug was originally reported against GNU 'grep' here:
The glibc regular expression code mishandles regular expressions such as:
http://embermanchester.uk/computers/latest-car-deals/

   .*((.)\2){2}$

as it does not backtrack enough to find a match that satisfies the
back-references when they are used twice.
http://connstr.net/computers/latest-car-deals/

To reproduce the problem, compile and run the attached file backrefbug.c. It
will exit with status 2, whereas the correct exit status is 0.
http://joerg.li/computers/latest-car-deals/

This bug was originally reported against GNU 'grep' here:
The glibc regular expression code mishandles regular expressions such as:

   .*((.)\2){2}$ http://www.jopspeech.com/computers/latest-car-deals/

as it does not backtrack enough to find a match that satisfies the
back-references when they are used twice.
 http://www.wearelondonmade.com/computers/latest-car-deals/
To reproduce the problem, compile and run the attached file backrefbug.c. It
will exit with status 2, whereas the correct exit status is 0.
 https://waytowhatsnext.com/crypto/crypto-world/
This bug was originally reported against GNU 'grep' here:
The glibc regular expression code mishandles regular expressions such as:
http://www.iu-bloomington.com/crypto/latest-coins/
   .*((.)\2){2}$

as it does not backtrack enough to find a match that satisfies the
back-references when they are used twice.
https://komiya-dental.com/crypto/alt-coins/

To reproduce the problem, compile and run the attached file backrefbug.c. It
will exit with status 2, whereas the correct exit status is 0.
http://www-look-4.com/computers/latest-car-deals/

This bug was originally reported against GNU 'grep' here:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
