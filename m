Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02B9CE7A94
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 12:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjIYMyV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 08:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjIYMyU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 08:54:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C73FC
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 05:54:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36A83C433C9
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 12:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695646454;
        bh=DW/kFk33Ap/5jpZFrMJqvNQNuYiJIVmIPsVhC5CrKr8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=faUCjcL9h/OIQE9/UNrG5jVvezgJhUVvHKWHhn8wdEpSaAGjat0QqFG+UNcD6bnyL
         H264/nyhQZyMl16E65Qd1mreXtaqodWcQVGakv1ATsa/Z7xaEGMID4rssRiEvFyRWw
         lu4fZjUBor6I4NvNZvjXnwyZKcYHgitLplkQmWJuAOh8+WQw4OSRtqnu34xijAKb49
         g6/hXKfRQDhWdDsmSsWahPuUzOr+5BI46r1Lop8cxw+cuTi18BtAn5VHphyXMGF+pC
         CvTTaWPzB9gGhWENzspPwXDr3ZT/3bKQh7q06oSCKmx4WWHChfzadCkVsVn/M0nOCP
         bqT26lpCLUQCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1393DC4332E; Mon, 25 Sep 2023 12:54:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Mon, 25 Sep 2023 12:54:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217947-215701-Pi7Dpbf8ny@https.bugzilla.kernel.org/>
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

--- Comment #2 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Hi,

Can I confirm this is on a T14s G3 AMD platform?

Thanks for the detailed report - very helpful and very much appreciated. I'=
ll
need to reproduce this but I don't have one of these platforms myself so wi=
ll
need to ask a colleague for help.

It looks like this line is causing problems on this platform:
funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;

Normally that should return PSC mode (in this case - unless you have AMT mo=
de,
which you don't on that gen platform).=20
But it's saying it is in standard mode instead....which is peculiar. The FW=
 is
doing something non-standard to other platforms.

Do you still get the warning when:
 - you're in performance or low-power modes?
 - you're in lap mode?

As a quick test could you try adding:

 /* Check if we are PSC mode, or have AMT enabled */
 funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
+if (funcmode =3D=3D DYTC_FUNCTION_STD)
+  funcmode =3D DYTC_FUNCTION_PSC;

To see if it behaves correctly please?

I'll have to check with the FW team and find out why this change in
behaviour...I suspect I need to do a kernel patch to better handle this AMT
case though.

Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
