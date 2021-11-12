Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A58C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Nov 2021 10:57:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B04F060F39
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Nov 2021 10:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbhKLK7y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Nov 2021 05:59:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:58070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234935AbhKLK7r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Nov 2021 05:59:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0993C6103E
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Nov 2021 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636714617;
        bh=uHrrD2yXAkMAfq52X3x11//CoKkIPfuX3N2iP7lRhVg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uUW9nQeB32nZQruwVur9Nay+8AnjaPAUGTre8eQqZ4uvnD8XiNyqrMq64Op/ar89M
         TdRVQBENWM8FV6XXMmyQFTI+d2wc3YpGSmUBlzYHwpyoyFrlq+tNqZCT7R5bKsxj5Q
         svxrr5fUp8zpBYEQ18G0aLQk9IQsbZG5RZNhlMb/n7Zc8G3gGaAUgT1nBPQTINZ8HJ
         /B+2Ofz095wK+ky6rcu6uatT2q8cnB6ZKw7bCxUVaL3hyHII+OXKiNVYaQFNErwTPp
         L1WHAKDikT2B1YSwC+AutXEHVdIbFQQMK0FtvDcwydBcQfXl9BeA4mV6Mddce/yr9U
         E+shlZWJSZ4fw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 12 Nov 2021 10:56:54 +0000
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
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-I8Ev48rBJo@https.bugzilla.kernel.org/>
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

--- Comment #171 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Eugene Shalygin from comment #170)
> (In reply to Denis Pauk from comment #169)
>=20
> > Could you look to nct6775_data:{un}lock? Do you mean something like it?
>=20
> Yes, something like that.

With all my respect, folks, please move this kind of discussions to the mai=
ling
list. I'm going now to mark similar comments as private so real users won't
suffer reading these technical details which they are not interested in. I =
hope
you understand my motivation.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
