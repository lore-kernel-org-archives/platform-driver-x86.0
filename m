Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4ABC433ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 09:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8423F60FD8
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 09:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbhDKJr3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Apr 2021 05:47:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:35394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235281AbhDKJr1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Apr 2021 05:47:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BA8136120C
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Apr 2021 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618134413;
        bh=DuYr/etI8u9ynAMiFeRE5W/7kD2FJva+RtHWI4suFLs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mt0B1eyowXUQDSeWxwD5njXecMUDKOq/lGJrygYDZ20phJa1FUXEdrEBbZmPgZGNB
         VXuVglKBMoEG9nHafc+HokVSxF/tXNYCUH10+3joUURwP1KBndHZXYPBffvaTQqBQN
         9eBlpVYkujiFOunApkDGrwXC7EqiHvVxP4tAfofrDbm7aiQ0oQfwmUvJzX6/42yG/e
         rbX+4hPJz0eANSRuySC+72DsfME/DALszqCT9VUPqvX/GxcGJxo+JLBoDoUO+v0TLG
         l+w4FWr9pZ9WATreXyFNjXJOnQShDegF5tqbHJ/HbvCJXBw20rNl4iCxDSPSsVd0/A
         5Mv3KM1qLJzWQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 11 Apr 2021 09:46:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-1iVPJ9p8Ur@https.bugzilla.kernel.org/>
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

--- Comment #56 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Hmm,

asus-wmi-sensors also is not such a great solution, it seems the WMI interf=
ace
is buggy on some boards and causes fans to stop or get stuck at max speed,
which is quite bad, see:

https://github.com/electrified/asus-wmi-sensors#known-issues

So it seems that the situation with sensors on these boards simply sucks and
Asus is to blame here. If even the "official" method of accessing the senso=
rs
is buggy then Asus needs to get their firmware fixed and until that is done
users are better of without sensors support.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
