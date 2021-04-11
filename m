Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33429C433ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 10:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E432F611CE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 10:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233822AbhDKK12 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Apr 2021 06:27:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233696AbhDKK11 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Apr 2021 06:27:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D03A6611F2
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Apr 2021 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618136831;
        bh=9ZrYv4LGgV/L2VjTvEEf6S9eIXE45UA/Pw0OqSDQ6KA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=itgz+Hp53LsLmuw///q7tsZnAwc5led9Pvs+O1jSKfc2whsP+tx8g6eDm+nX5udl9
         5VLI+ZpuDfgM9uqSfXIQmg0T1XXs/5eEOLD/gP1ntjdaOtYJscUm0bOLgSvIz27wo4
         v0j9UaShEEAZZ5Tz1Fpvu1xbOoByvbTqjpsWZuHkuck/5Ut/9c+RkgDPtTtMUgIdHq
         mzctlymN5JQLe+weBB8yCpGwnsnkBw6wRq/zdMdH3iYTGWSdQFlwRSu7l6ehVu1Z1K
         H6XchP5fhhCIAr1gBMFI+q/z+KiI3My437cKQaZWcZWxRJ80trS9VZzYISHsj74o6E
         69PH0wYD3mWXA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 11 Apr 2021 10:27:11 +0000
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
Message-ID: <bug-204807-215701-txgX9k9RMX@https.bugzilla.kernel.org/>
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

--- Comment #58 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Mateusz Jo=C5=84czyk from comment #57)
> (In reply to Hans de Goede from comment #56)
> > Hmm,
> >=20
> > asus-wmi-sensors also is not such a great solution, it seems the WMI
> > interface is buggy on some boards and causes fans to stop or get stuck =
at
> > max speed, which is quite bad, see:
> >=20
> > https://github.com/electrified/asus-wmi-sensors#known-issues
>=20
> IMHO, this could be caused by access races, not necessarily by a buggy BI=
OS.
> The driver may simply not implement correct synchronization methods. It m=
ay
> be necessary to call some ACPI / WMI methods before and after accessing t=
he
> sensors to avoid resource conflicts.

Perhaps, but usually WMI methods take the locks which they need on entry and
release them on exit. I'm not even sure if an ACPI method (which this
ultimately is) can hold locks after it exits, I would not be surprised if a=
ll
acquired locks are automatically dropped on exit from the interpreter.

Also note that the README also states that on some motherboards the problems
are fixed in later BIOS versions, which also points to a race inside the AML
code and not a bug in the driver.

> As is written in the documentation:
> > The more frequently the WMI interface is polled the greater the potenti=
al
> for
> > this to happen.
>=20
> I am also not sure if the driver implements correct locking behavior
> kernel-wise.

I did not check, but this should not matter, that may mess up the driver's
state, but the WMI code is expected to do its own locking at the AML level,=
 to
e.g. protect against similar accesses to the super IO through the ACPI ther=
mal
region interface.

Note I'm not claiming that this is definitely not an issue with the driver,=
 it
could be. But I've seen a lot of very buggy AML code and I've yet to find a
single vendor which does not write very low quality AML code. It seems ther=
e is
absolutely no code-review done on the AML code and very little QA.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
