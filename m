Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB4BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 13:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbhLENNK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:13:10 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44964 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbhLENNJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 08:13:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B0B2661005
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1475EC341D1
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638709782;
        bh=haYrM4J5xp33W4AQKsNEU8gAxowTSZcVgp/+oEK9caA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LThS6KV71AeGSUv1asg8GYpSX+HdJ1DIa9b6mam5Q50I+TLaivdbXeFiy8+1+cjWI
         o77nCZnfzn3ZjlVy0ksrbdOOGIwWQuAivZfvqyOMDKPVfDQtThQORLw5ekRN3hd5xU
         Aidlq9HHqInMCCVjK0QLeiK469V7k6GjFTEp2H8eAf+SFIZCI1x8AucyCy4BMO5ecz
         dyDkSWTYjwziGKE8PZgBr0wEDa2ceh09IA79Z4TnHN1asNXqJJv5Y4A+LayoWY6qYF
         QRfoguvG7EOxEapB5b2wh09qYnVlCdZESgGb7q3Memh4EMWRfFj1o9bDMwTB/7eIWo
         J/qBW5L9M/17g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 05FB4611C0; Sun,  5 Dec 2021 13:09:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 13:09:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-64sCzw5lqE@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #299757|0                           |1
        is obsolete|                            |

--- Comment #181 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299887
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299887&action=3Dedit
Add X570-I mutex

Could you check with updated patch?=20=20

(In reply to Mikhail from comment #179)
> Created attachment 299883 [details]
> dsdt.dat (ROG STRIX X570-I GAMING)
>=20
> > acpidump should create binary dump of DSDT section(dsdt.dat) of your bo=
ard,
> > could you attach it here?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
