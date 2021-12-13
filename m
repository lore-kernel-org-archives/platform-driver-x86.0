Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F7EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Dec 2021 07:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhLMHCP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Dec 2021 02:02:15 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:39292 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhLMHCN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Dec 2021 02:02:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 081D7B80DB1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Dec 2021 07:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96A78C341EA
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Dec 2021 07:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639378929;
        bh=lx9CcqNNsfoRfuHL8gYO2STSIMUDnAPn0t3ENDDJ+ek=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UDoUYk3qzAGlWPE9XPPdAZVFJzWRVJN1C5srJIFK3aSFmZkE7J0E4MmARZ+8xXQxs
         b7iBGFq4IjDyQKWAzS5IEuln/6OfsM6AOpnHhKL9DxQEzg+Tm9DYtYU84+ZmpD0YcM
         Mq4jYm42FOJr7wlyIaO8Se6EiFtvBQXhKxRudItm4rHo/arxxTBK/osvLi7ou7zINm
         xfv1WEGHqekFjqSxkT5Rzcy/YaJFNTwuWF4N4xISgH5J0vrgGPiBb1NYfzJyj0ylc+
         GQLfBYzgn3uUHSfne9k59CWQYFONeV7NXBYDujDhUUf1G4bJUR0z2Sk7ursv+Hi2+V
         gorGl9AVfDaKg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7D55061151; Mon, 13 Dec 2021 07:02:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 13 Dec 2021 07:02:07 +0000
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
Message-ID: <bug-204807-215701-HV8iJ7F4ZL@https.bugzilla.kernel.org/>
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

--- Comment #197 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Denis Pauk from comment #192)

> @Eugene Shalygin Could you correct me if I have missed something?

Isn't the \_SB_.PCI0.LPCB.SIO1.MUT0 mutex, referenced by
\_SB_.PCI0.LPCB.SIO1.ENFG() / \_SB_.PCI0.LPCB.SIO1.EXFG(), the one we are
looking for?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
