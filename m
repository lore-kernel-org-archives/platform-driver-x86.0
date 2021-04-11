Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB97FC433B4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 11:20:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4A296121E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 11:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhDKLUg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Apr 2021 07:20:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:59926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233696AbhDKLUf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Apr 2021 07:20:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C25AE61206
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Apr 2021 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618140019;
        bh=Q3+h5E0ACvRF7MCOBeMxZ4sFjbtNVgCp9+k4F7/ebBI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aMW1QUnfiPM0ERgZ4AXKscE+E71ONlV1kswsyeb4dKWlQkHsLeYoUC5cX/4HqJSda
         5Z4ih2fXbb0DS8hKbAmzgLgUk+8gc+2c3r/3RgJHGhaHv7pe/amngN4swTqtgk/koF
         v5EXQNpRySRqGl7qVJ4ymIIypOfxLrZATfg7atb+sRoD+1bTmHvFdQ5V8sDWjkqT/e
         pqo3aD1zEjIRS5N172XHXLY6Y1EprsmQPA5xYcaofsKRbW6a36ZQqLI1/rlnk2hCCM
         M3DOnlQOO/Mfm5jRYXZhZ7HiGcnySBGovc4HlYcZFSEXRrTWP6OoQ2mlIAzAWjReMo
         2Gdc74VNp+yLQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 11 Apr 2021 11:20:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kdudka@redhat.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-LnsVl95EOn@https.bugzilla.kernel.org/>
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

--- Comment #60 from Kamil Dudka (kdudka@redhat.com) ---
asus-wmi-sensors was already mentioned in comment #39.  I tried it with ASUS
PRIME B360-PLUS but no device was matched by the driver.  It could have been
some user error though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
