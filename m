Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3F1C4338F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Aug 2021 23:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 331DD61288
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Aug 2021 23:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhHUXSe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 21 Aug 2021 19:18:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:37242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230343AbhHUXSe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Aug 2021 19:18:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 16C0161288
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Aug 2021 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629587874;
        bh=jQKgViBpDi+O+prDGx5eGCQlv90t1RJauWYCtcYpkpE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JjplPMNyQDcyG538GY18jnzRYZpcrD1n4D2fBkttoJUo69gZYQjTd0du0syY/78qh
         34TywT5zkscWGeUAlKVieOI1FeVPu5Y01aHwPmTI5SblcQUHjUTmVPQhwfvl0IcSwD
         qhoL1LnoVXcqH7A+CL7Iv49Ows9AsSEKpOo/gNyn+RA2SbMn1jdBd2d73UC6KW/m3+
         lirKxjlOMRx6X+xV7zT045BucUE8/jlFmyM7eDqvYfGE6i7oz3wKIs+8PXc2dewEmR
         +Drw86vXl5kmLKSfEZ45XikgODhe16gTuZJFsMmI7OFw80EUwESbfocQqE9QoHgXlI
         LgExO4UHaDWmA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Sat, 21 Aug 2021 23:17:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201885-215701-KdHK34TQsX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aros@gmx.com

--- Comment #12 from Artem S. Tashkinov (aros@gmx.com) ---
acpi PNP0C14:01: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (f=
irst
instance was on PNP0C14:00)
acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (f=
irst
instance was on PNP0C14:00)
acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (f=
irst
instance was on PNP0C14:00)
acpi PNP0C14:04: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (f=
irst
instance was on PNP0C14:00)

(In reply to Kenneth R. Crudup from comment #11)
> https://lkml.org/lkml/2017/12/8/914

It was never merged unfortunately.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
