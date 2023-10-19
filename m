Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CBACDB465
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Oct 2023 20:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjJSUDz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Oct 2023 16:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346397AbjJSUDx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2023 16:03:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5EE124
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 13:03:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 416DCC433C8
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697745831;
        bh=2ga+sWtOqN0frI3/cRBIu7E7nx9hCZ1swOcw+auYpYk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=d9s2ZbPa+T3IbMuvHcvP3Uu0DnT33LpyEIfcFAEzTMUHd542zj8m6q86atGBvtVyX
         2Zbc/OpViYtVt50p5XwOXrmitmWff01RN2Pboa2JTohRhoVpbmAyKqDJArumT3yUON
         60X63hvj//V3IRnGVFtSGlzogO+9qQ2VKfJ2GLrivMkomrpKBLhvZ1Ne2BubO+p2hD
         ZSKAk8x6rDS57nAEH56EqS4Y9J6rzf65DtnAvR9hsZihT3jkjLVL+jtj2AVitDoK1C
         P3slcWEXZOJ54gp/3bIytFbpbG6sTWHqBlJH63dY1dk3YOSeylex9VXTK1vFP6KhpC
         Y9jHcJsyXvaCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 26F2CC4332E; Thu, 19 Oct 2023 20:03:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218024] broken suspend to idle on Lenovo V15 G4 AMN (and
 related laptops)
Date:   Thu, 19 Oct 2023 20:03:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dlazar@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218024-215701-aV92UqM1vo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218024-215701@https.bugzilla.kernel.org/>
References: <bug-218024-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218024

--- Comment #11 from David Lazar (dlazar@gmail.com) ---
(In reply to Mark Pearson from comment #9)
> Checking psref.lenovo.com only matches I could find for 7x20 (which I thi=
nk
> is what Mendocino is) are:
>=20
> V15 AMN (82YU and 83CQ model)
> Ideapad1 14 AMN7 (82VF model)
> Ideapad1 15 AMN7 (82VG & 82X5 model)

Isn't V14 G4 AMN (82YT, 83GE) also affected?
IdeaPad Slim 3 14AMN8 (82XN)?
IdeaPad Slim 3 14AMN8 (82XQ)?

I'm starting to suspect that "AMN" stands for "AMD MendociNo".

(In reply to Mario Limonciello (AMD) from comment #10)
> David, do you mind squeezing all those into your patch and sending it out=
 to
> the mailing lists?

Happy to do it, but it's my first kernel patch since the early 2000s, so I'=
ll
have to read up on the process first. :-)  Any pointers greatly appreciated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
