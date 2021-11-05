Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F17EC433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E798861252
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhKEOJJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 10:09:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232106AbhKEOJJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 10:09:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AFE8E61355
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636121189;
        bh=BFTvHyWReID5lAlfqUOSK/hYNn8wGBfMaDT5Bhyptqk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TSOfyiw8YtCu5IDUyauykUvMZDbX6ZaYN46/mYsM/F4Vn0EWB7+dunaEaOHu8Ynm1
         hoF/povHvdnVj/12HNg+jpjOvRU6CClwwetOEyP+vb8ocRP40/eDazRBjBHiQV/a3y
         PCZbXakuuJmU7FPGHy/B17oppUwv3zpXujOLGpLHP7Ff8HeNBQSh5RLrzVyf7iZPZY
         c4L3OcdwbcT7XRvZkFN1gZkK2kK22lrLKoAhT5NhU5FQ0Xx9x2bV8yKjIT01w96CFv
         SRDWdS6zCglQ8KASML9EQ6or9LCfIp8IWVwOJavUzvZZSO0BqQWDB/ly0+01xl6sof
         YcO7PBdVlgw5w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 14:06:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: olli.asikainen@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-CzYSdL8uhf@https.bugzilla.kernel.org/>
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

--- Comment #153 from Olli Asikainen (olli.asikainen@gmail.com) ---
Yeah, it's old and suffers from the same bug, but I reckon supporting this
would be a completely different story. Thanks for your answer Eugene and so=
rry
for the noise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
