Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C96DC07E9B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6FF66120A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbhGUIqE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 04:46:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:58840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236428AbhGUIgi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 04:36:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D71666120C
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626859030;
        bh=W8WxmgYHVYmisiKCAsEm1xTd25oO13CdG3JGVnzewKQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jgPP7+OVBrN7jIJfLfWAF0atFXGlrW3B4kQxQkCFvTaS1j7T2VB+MaMWzdbNhuLIv
         k6DLvRlxBzWpaY8P/XZUaVwH/FlQ9Rd/7HlX7Td+UAqT9Egwc0XOBkYNctlouCNF5K
         7qb0YuCObVdyNWphIK8cQxh8MnTVTST8eYZXTIFsCZ4CULtE08Zg8vi8c3ar2Z5Wxt
         YkmxuPys/DjUnr/THIBgzIqNVjeqlornl9PsCjToBr3LMdsc0F5a3qMAwgmUJiAYVK
         9osNZKzQ+xpP7lv8WoAdsPzZX98pu1Wbhnrw6sN9kzIxVkHZdtlJDU7uIIS+w+hw90
         SRUB2Z12owKjw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 09:17:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-QLoAZ5ZVsX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #16 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Riccardo Mori from comment #14)
> This isn't an issue related only to Clevo laptop though, see the dmesg lo=
gs
> for this MSI with AMI BIOS https://linux-hardware.org/?probe=3D3f205f2881
>=20
> I can also confirm that it works on Windows, can we get at least a
> workaround?

If there is no bug in the GPIO driver, from its perspective there is nothin=
g we
can do. Period.

Perhaps it's possible to work around via I=C2=B2C HID driver or so.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
