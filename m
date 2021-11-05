Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060F8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 13:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7704611AE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 13:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhKENRr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 09:17:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232727AbhKENRr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 09:17:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A79D061357
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636118107;
        bh=H3vLA5FGMBQnT5d6mUd8OHleQHq46ToXXH0s8JwcvHc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TaJuODNA4MR8GB4K84n2NWjKQGRqeKhZI0k/U4CdGkxAqRclZiz7ttsJUoe8oU0Qz
         xKZOWT5pHAkTSeSQ/+g7OBA7j6SmhC5JG/bCYcVKysy9y+KQtSCjXIO6tpCSr9QW5e
         0lRG+qK7qWIzybqGz/Kf28pb15EcJef6MvYfxXdw+bwRtA7gTK3YNkzq2Awx4qMtaV
         9Yuwhgh2kMvROF9ekGQgmp5dTACd5K2UjKvfo8GmuHvqhMWr6Qa6mbhFGuAgfQczwE
         ScmPIeWo9HsFl4m9eMA/Yg+nO+DcBIOg/Vf9rNya0d6qn5qtDWaKLh9Rc3MFyOj5R6
         tAsIVe7fYnykQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 13:15:05 +0000
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
Message-ID: <bug-204807-215701-FC9Kyu72gS@https.bugzilla.kernel.org/>
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

--- Comment #150 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Olli Asikainen from comment #149)
> My ancient MAXIMUS VII HERO (NCT6791D) suffers from this bug as well.
>=20
> I added the board name to asus_wmi_boards, but this is what I get: ...
> Any idea?

Please share your DSDT ACPI table (/sys/firmware/acpi/tables/DSDT or acpidu=
mp
-b -n DSDT).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
