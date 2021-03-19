Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC33DC433C1
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 15:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 955456193C
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 15:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhCSPOl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Mar 2021 11:14:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:47556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230196AbhCSPOP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Mar 2021 11:14:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6249B61930
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Mar 2021 15:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616166855;
        bh=jaPhiZnldY3tjbfJDWUKAONo0tTC8yL4Sckf3LnnS/M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ji7xiJ8FQ2iHxtFxO/V/sd8wJuEM+NAp7Bpvk5EGdGCUNikxfwwnC6C7892jJ8QGj
         k/30OP9UU6Vx9E55x+ZL6w1ia5m97xBoLu9hGI9ifWzaGXmhfxj/gCv3VQDaLGBCow
         mN7Eo0AO6/0wu7g5oDbrW4rOBrnwsceYK2Ca902+CFo7yGWyWBhvpBybOsGeDEwBJS
         HNcxW4gEAPe6VcGbzeW5e/Gs93D3zf+NRQAMumWzoQz4F+o/ceuaiY7GhiyfvYTD9G
         VZAjDXieAycQWlPapGNFKpJgOx0di2xNWU3tAQRBK/NQlhkNtfSHZh3NJvRcFJQ9fl
         Z0B2WbsCerXFQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 19 Mar 2021 15:14:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-APGvdqzfF7@https.bugzilla.kernel.org/>
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

--- Comment #35 from Artem S. Tashkinov (aros@gmx.com) ---
This might not be a classic "bug" but **no one on Earth cares**. What people
care about is having their systems work and be supported by Linux out of the
box with **no cryptic voodoo applied**. You don't ask Windows users to run
bcdedit.exe to fix their hardware, do you?

So, why do Linux users have to edit system configuration files to get at le=
ast
comparable experience? Don't get me started that HWiNFO64 shows up to ten t=
imes
more hardware sensors and their parameters than lm-sensors.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
