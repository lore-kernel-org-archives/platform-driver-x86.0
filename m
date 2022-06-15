Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFAEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Jun 2022 09:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbiFOJqq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Jun 2022 05:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbiFOJqq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jun 2022 05:46:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6948457BE
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 02:46:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 58D7661B00
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 09:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4A12C34115
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655286404;
        bh=AE/XmqdYdkeElhhDfYuwx04dtIj/so9j4k7eZnf9H3o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mzcTC1HOKK5UdKiFQGGc5o8lxsZnQqwtuOYVqSI8eFlRg+kYk6TdSfX46fMY9zVLZ
         Yz8/i7WsajtZW5oIre4dqeSKJrFV2Y4oas/OH6YOkSEcm63bEkt9JShgTTEaNzcfFl
         YEpIehUzLBGN4JWHb80lWHoBD6bTb7eqc86J/4XjacZrR/lE4sm7AbKyxdIcrVCgzo
         P2ybTabcwCjCp/k1yl9niwI7Ha1aSoBkQhwXOMcCBXiPnEq6KnK01nDTE0XtbhBlzD
         gVTWke+QkzmJ69NMK2ByiQ0Bgxj3keP91R1T7/H1YybB+831JWRJiJkL6ZEVMgU0H3
         bupXo2zvbuhbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 981A2C05FD5; Wed, 15 Jun 2022 09:46:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Wed, 15 Jun 2022 09:46:44 +0000
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
Message-ID: <bug-214899-215701-qaiTppLhv0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #39 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Andy Shevchenko from comment #38)
> (In reply to Hans de Goede from comment #36)
> > Created attachment 301177 [details]
> > Attempt 2 at fixing this (3 patches in a tarbal)
>=20
> I would propose, if it's feasible, to evaluate _HID/_CID (to be PCI host
> bridge compatible) of the first level of \_SB and evaluate _INI of all of
> them. The listing of the names seems a bit fragile, while I don't believe
> there will be many new entries. That said, IIRC, \_SB.PCI is also present=
 in
> some DSDTs.

That is an interesting proposal, but this happens really early on and for s=
ome
devices _HID / _CID is not just an ACPI Name() field but an actual Method w=
hich
does a bunch of things, like e.g. checking GPIOs to see which touchscreen/p=
ad
model is installed.=20

Although it is unlikely to encounter such _CID / _HID methods on devices
directly under _SB, it cannot be ruled out, so calling _CID + _HID for all
devices under _SB seems unwise.

Also note that these patches still need to change a bit, as I mentioned they
cause trouble on a X1C8. I've a plan for this which I plan to implement tod=
ay
and then I'll send out a RFC series to the linux-acpi list (and also attach=
 it
here for Johannes to test the new version).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
