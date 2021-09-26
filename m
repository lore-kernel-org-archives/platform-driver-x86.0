Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD6FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Sep 2021 04:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A960361157
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Sep 2021 04:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhIZE4A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Sep 2021 00:56:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:55608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229737AbhIZEz4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Sep 2021 00:55:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 650DF6117A
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Sep 2021 04:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632632059;
        bh=pjt9zM9ORTuOElKvrmpMjIR8GSKGQxNNUNdYR3TDsf0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=edi4GLHp4iJmQiePQ8J05PKds+7+RBuHHywTzwVLZkLhWjLNxjrehe9P/rF7Z4+ph
         Y4ZCo7InLYENZvN4wkpRGwb22o7s7X6v/hx679a9DwM/CryQsZYD1BJgSFhM5loFvM
         AUD5+Lym/Cthe2n8B/8lC0MtHCT+NMMUNup4ISBkWsPKIwej7xnrUYQDHvj7a51vge
         LwHnp3BfMqDYMDZnXyK7OBlZSib0hrh3vkb1sepYH1xHJZOOil9SGtmgbDgV9vYkdT
         uF6VbPbOPGPjQKVkHXHL47GGlpyPqixkrSuP/8hVA3DbKy5rzKhrrGJ68dmxkyQh5m
         3NYCevX7mWv2A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 26 Sep 2021 04:54:18 +0000
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
Message-ID: <bug-204807-215701-7f6v4TFtH1@https.bugzilla.kernel.org/>
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

--- Comment #132 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Denis Pauk from comment #131)
> (In reply to Eugene Shalygin from comment #129)
> > Thank you for your efforts to mainline these drivers! I have a couple of
> > changes and questions to the EC part. Is a review going on somewhere wh=
ere
> I
> > can participate? Otherwise here are the main points:
> >=20
> I have not sent it to review yet. I prefer to have checked at least one
> motherboard from each group before send for review. Especially i2c adapte=
r.=20

Don't forget to split per logical change (to me sounds like new code contai=
ns 3
to 5 logical pieces, hence the number of patches).

> (In reply to Kamil Pietrzak from comment #130)
> > Motherboard "TUF GAMING Z490-PLUS (WI-FI)" is using Nuvoton NCT6798D Su=
per
> > I/O, so probably all motherboards that use same Nuvoton chip may benefit
> > from those new voltage scaling factors.=20=20
>=20
> What do you think about use kernel mode parameter for use custom value un=
til
> we will have some approve that other motherboards with NCT6798D has same
> scale factors?

Once added, parameter may not be removed (because we don't break user space=
).
So, this parameter is not so critical and I am definitely against adding it.

The compromise would be to name after the tested board (with probably comme=
nt
in the commit message and/or the code that this is possible to have the same
for all NCT6789D chips) and when confirmed, rename as Kamil proposed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
