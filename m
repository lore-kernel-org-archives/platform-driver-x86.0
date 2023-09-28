Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0622CE7AF8
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Sep 2023 06:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjI1GKn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Sep 2023 02:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjI1GKn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2023 02:10:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A98099
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 23:10:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F263DC433C9
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 06:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695881441;
        bh=ZlcHpDwBUi6TN9wx86Kjvfe7A9HNFLV7UAXLcmbaa3g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HQMNEFEh7id2QTIGQYnQm/fjU81QiE5TGuznaAKWb4wAAcGtv06fp67tBJvOTLSSm
         L/pf/fBHyCh9rCdx3Rk574DZhtj39hIGesnFBUK7gIAs/G/PUxCHreDBZfQXAxdul2
         UqFbQqIK2syGOnoqI311vAWmK7bzM+VxsJHGoONxI/sCwcrViiKApeb8+HHN35ZgTQ
         Qa+lZeBkxeKtJN2ax3zc1/NUBv43Pofyk7N/EzGbG5aG4J/2W8v+SWege3zko94oKh
         w9Apt4KH0NGNslp3r6h0tp2nCFvEWX9CDTLnoRiK1sxbSnfrgOnDTdR8Mgy85/tHmd
         W/Yjp3zzfVpFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D1643C4332E; Thu, 28 Sep 2023 06:10:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Thu, 28 Sep 2023 06:10:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jirislaby@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217947-215701-rDePGqaoOZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217947-215701@https.bugzilla.kernel.org/>
References: <bug-217947-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

--- Comment #8 from Jiri Slaby (jirislaby@gmail.com) ---
(In reply to Mark Pearson from comment #7)
> OK - so (just to be sure) with those changes it is working correctly?

It appears so.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
