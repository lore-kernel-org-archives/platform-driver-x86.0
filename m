Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50CDC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 02:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5D2261279
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 02:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237687AbhKICXV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 21:23:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:46166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236458AbhKICXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 21:23:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A1027619EA
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Nov 2021 02:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636424431;
        bh=+KnNv5Q2bde7CRfV8YqYGU9DMC+S5PQNpWOeKYpY8E8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YZazWzVJRBiea/mL3sDL3Jrdm/dzJTX4eSMTM29xpcHg96h34L5qsa0EqG260LxTJ
         XOI4naXGujBVlYQobizChHFUvLd/AFdK6o2AEvhIVKCgZ7QOXFt41GxBpUCa13khOg
         GjNcOunwHGD1uIGT3SEhXFZdUQHSC7cH3vgr67+r9w73q83Tw5siNeSNcMBfAKSIXw
         1r+Gr6jCmdCr7hrXRkVlQNntnnzsySqRZiPqgYdFVC2LKCO1kq+C6dmNQDMkTAXwX4
         s0e9ox8lPR7qPxA5r5GEN0NJRhOcyxFBaLI4i3JPH9Exc1RXDXTs14+jLEvwgQb6sb
         SQ41C7NpWOnIQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 09 Nov 2021 02:20:29 +0000
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
Message-ID: <bug-204807-215701-143Sau9xqY@https.bugzilla.kernel.org/>
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

--- Comment #162 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Denis Pauk from comment #159)

> It looks as different for different boards, B550-E uses
> "\\_SB.PCI0.SBRG.SIO1.MUT0" as mutex name.

Then we are better off with a platform driver that provides these mutexes if
required and known, that can be used by both nct6775 and ec sensors modules?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
