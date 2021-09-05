Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2ABC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 10:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 956EB61057
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 10:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237661AbhIEKrI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Sep 2021 06:47:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:34040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230145AbhIEKrI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Sep 2021 06:47:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6834661051
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Sep 2021 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630838765;
        bh=VjMEqgKrEiyO8EFUpsVKCJWEulg0uwDOzL7toxdgfUg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lsL4VOK71FtUxflqEWZ94YCVNOj5j0/FI+M/PA4Xkg3LH11bZmyKQ3HAqnTzU2+MP
         54krG8WVSJQH4UePyz4ZcR8pfKUiWMeKcGvnqhEEm18vi2AtSugtiRcLyaeUGWoDEH
         VFwZTdtz6iH1cprJo+cRhpex7Oo+LkibXKUkb32gDwakouaiujtq6r6KUw4TeQNx/0
         PTmt3rvymyxmQScyXGw+18tYRwoOjKUCmyekcuEt4u6EuPUWecrz/qlaJT9dy5p/sO
         reYV8ybYGSvBJRZAc7zz/hb5tj0skmAe9YM8GAmKLYmYZPPFMYyCPP1/M6C9ykWAiE
         VOjalyvDwFnog==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Sep 2021 10:46:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-2Nzcjkmb8O@https.bugzilla.kernel.org/>
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

--- Comment #91 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to pehlm from comment #90)
> Can you please also add my board: "TUF GAMING X570-PLUS".
>=20
> Thank you for working on the patch!

I'm pretty sure all X570 based ASUS motherboards with this chip have to work
via WMI and adding them one by one will needlessly inflate the patch.
Blacklisting could be used instead (though I'm quite sure there will be no =
SKUs
to blacklist).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
