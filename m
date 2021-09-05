Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888B7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 11:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B85660F21
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 11:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237775AbhIELYj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Sep 2021 07:24:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhIELYd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Sep 2021 07:24:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AFF8661056
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Sep 2021 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630841010;
        bh=i+t/efkholfwXSsO89fPAPdmutTIEvXvPr1kbllkmsk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qByGjhGhPYNJl3pUbUE1QsLl3gkIIAWnN9z5pAZ/o4JBukzXRlKIsJytq2UP7nnVT
         28Og4o2QVuYZxHDnV67hQXM3N+1iZA06y3YGnfQvjLaD+Qvvp2rQtck0gz+DSb0n/h
         a/abm8o+Bb4hFlu/R+pv+H7DksGIwHecejmDjs00onFzmq1ybFKaFjKkZDbvXkFwUh
         mSjkglEEk8gCAp4RKi3dDBx7Dk+acxBDdVTqA+kZvkVwNHGbdzBnx0c8fnx4OhH/3Y
         p9rze9ERIBXS5+Jp0b89Yk9aNTQBrrzW3+mXBaMxqBU44tBA5o9+l12p9PvBVif/lC
         tXvkkx7ECxg0A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Sep 2021 11:23:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-9HPwN4JBcH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #92 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #91)
> (In reply to pehlm from comment #90)
> > Can you please also add my board: "TUF GAMING X570-PLUS".
> >=20
> > Thank you for working on the patch!
>=20
> I'm pretty sure all X570 based ASUS motherboards with this chip have to w=
ork
> via WMI and adding them one by one will needlessly inflate the patch.
> Blacklisting could be used instead (though I'm quite sure there will be no
> SKUs to blacklist).

I even might agree with you, but here is a dilemma: do you want to have the
patch accepted in mainline (*), or do you want a better code right now?

*) this is what maintainer wants.

@Denis Pauk, you may consider to have an array of strings and use
match_string() call instead of plenty of strcmp():s.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
