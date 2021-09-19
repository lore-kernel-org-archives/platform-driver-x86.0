Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02536C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 22:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD4C561028
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 22:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbhISWyC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Sep 2021 18:54:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230007AbhISWyB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 18:54:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 268266115C
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 22:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632091956;
        bh=EFaiCiBnpK0tTYKdYv/YJsSuv5Bfp2t0vA//73ZjGGs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GJK2ZUM7IDh+NO+uP++QLLAl513lkma/XVJ0/WOMinzyqE7CeSUD8N9Ei4RZYp9xv
         /4D0Xk12kXenjoXPh4gK8nu6PtFckHUg/H7coTfFq2SPFBN7jwqXA/+XkPtPvRKM8j
         Zolg1f8/qh66mnIdUURFesYFRZ6xP6k14g4dNdiShblWXjyOAxEWmBcRuSS1dT2vE4
         nZQYgahfvqutbljBtNpUj8tto1xte8KgDqIneoumxQdpgTfIG++zMOvHEBJz6GE7S7
         tnOZqoETLc5KaFmk1d+P+o1MSwYjrnHigdBzdskonUKV+nmujCvqbIEZqCveLM5ZNh
         hRfDChwezgOYg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 22:52:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mirh@protonmail.ch
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-QnclxpjvVf@https.bugzilla.kernel.org/>
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

mirh (mirh@protonmail.ch) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chunkeey@googlemail.com,
                   |                            |mirh@protonmail.ch

--- Comment #124 from mirh (mirh@protonmail.ch) ---
(In reply to Eugene Shalygin from comment #111)
> Most of these boards, as you probably know already, seem to not provide
> readings for all the available sensors via the Nuvoton chip. For example,=
=20
> [...] we found that the Nuvoton 6798D chip provides sensors readings for
> configured in the BIOS QFan sources in its registers [2]. Maybe those are
> worth displaying with the nct6775 driver? They can include sensors that
> are otherwise are available from the embedded controller only.

I can't really vouch for high end desktop motherboards, but at least as far=
 as
laptops are concerned this has been the case since forever about everywhere
(ranging from "somewhat nitpicky" lacks to "kinda important" ones)
https://github.com/daringer/asus-fan/issues/13
https://github.com/daringer/asus-fan/issues/44#issuecomment-487380638

I don't know how dangerous accessing EC could be (be it directly, or through
possible ACPI methods.. in some cases datasheets may even be available), but
something else that isn't just vanilla WMI is needed.=20

https://sourceforge.net/p/acpi4asus/mailman/message/7375427/
Btw following the breadcrumb trail of the asus linux drivers history.. it s=
eems
like different/older machines may have used 'ECRW' in its place (or if not =
any
I found that to still be present on my 2016 X756UX).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
