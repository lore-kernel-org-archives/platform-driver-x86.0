Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A25C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Oct 2021 20:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15E8561216
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Oct 2021 20:04:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbhJNUHC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Oct 2021 16:07:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229932AbhJNUHB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Oct 2021 16:07:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A11FC611CC
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Oct 2021 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634241896;
        bh=dm28NJ92Idqbc5e1FAzmjAzVck/ZKAaTI0x6e/xn98M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=moYxy+PBfQhXwRigm7Eyii2OWTByYiKBJJsPEP8frE29FZWlauD8Bj1m9FhSZcaWJ
         XTn6JJmcezWr24P3PDmyIB1ZF3UT10Y1TsKxIoG0Kg0MUA7bgOGAqbwaWVfpnFw/Vy
         PzpWLrQrmyvGdL9I+zCWtbo13esIypXWzt0ajbDunwmjCb8zz739iD9UMlTxlv98Gx
         YPGMcqKbnqL1EZyME9h2qlDa9VYNoHae96DhXhO//Cg9M0H+qUIZhP4arIyWHVzHNz
         CY2q8RhGexdgdmJmYKfFcxSXP7QlPzgufWAulGb8p5DmqxOJdRFqtNRd/xoglDVP0M
         hs0ojYABqaUgQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 14 Oct 2021 20:04:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-bihcCRvOGh@https.bugzilla.kernel.org/>
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

--- Comment #143 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Andy Shevchenko from comment #142)

> It won't mean anything. The each register read separately may take a long
> time since EC is a separate uController that may be interrupted at any ti=
me
> by any higher priority task (to be sure you have to have a look into the
> firmware source code). So, I'll be not surprised if 1s in some cases is n=
ot
> enough. Not I'm against the shrtening the timeouts, but somebody should
> really know what they are about and why.

I'm looking for a rough estimate. All my other machines need less than 0.3 s
for that, and only the ASUS one never completes in less than 2.7 s.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
