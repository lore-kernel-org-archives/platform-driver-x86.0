Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE9BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 15:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DE9260EE9
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 15:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhKEPUX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 11:20:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229680AbhKEPUX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 11:20:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AD4FB61244
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636125463;
        bh=5dRaLuX+BTXpHZcprajONemFza+hFykAAFOIZKOG1Y4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fYRrpBa1MaJIzanKyxSgyfW4KIv3pyGlEG4YnaXaSUtqmA4qHEzEAK7Kr+Cg7UG1/
         6HY+ObNImAJjY6fGvNAPs0Dl7Rqk2Vc7EjQNcS2jDp9LXHkjNDyrnsgLTDlj45dZRs
         9qqCdYvRc6d1D+2f4gJKz/vEOgGUNuIAcCfrAs8P40SDa4U8fvAGVdhZ5flzO8fN5l
         y65vwenVPXS76N+qHB3wiOSup3eCHL3WtVeW/N3BFNO9q4nVQPn9QNN26LDQSi9kaF
         deFVcW6IzqUmqEfKnoDsrRFy1SI/nAT0EC99vDejwFlaiK7l4K3hX1xlSyl4mRcnXo
         GwRGiPAHZomIQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 15:17:41 +0000
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
Message-ID: <bug-204807-215701-FTgKQ0StrA@https.bugzilla.kernel.org/>
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

--- Comment #157 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Eugene Shalygin from comment #156)
> (In reply to Andy Shevchenko from comment #155)
>=20
> I use acpi_acquire_mutex()/acpi_release_mutex() for the ASUS EC sensors
> driver
> (https://github.com/zeule/asus-ec-sensors/blob/master/asus-ec-sensors.
> c#L417), but there seem to be no other users of these function inside the
> kernel sources (checked 5.15.0)

Looks legit. Object is passed by handle:path.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
