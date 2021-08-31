Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B684C432BE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Aug 2021 12:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12CC06109D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Aug 2021 12:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhHaMyl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Aug 2021 08:54:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:38628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230175AbhHaMyl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Aug 2021 08:54:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E9D8761076
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Aug 2021 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630414426;
        bh=r2gTTLrGH8rf4AjWPoD+nCHwhn+9Wev2yOceXaOB0Kg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QE7lK12av460H5Ubq6Xj4L3xzWlxSs11vSWtk7n9Gnsnre5tLEyE/2QYPoWcLUo9l
         /vMwBu0nwtTnA+i+iI71GjuodK4HmFT0nKgCMRWYKHStEFI0JWFu/RYiJpx7EySAnY
         //jtzySJOaHV1qI5lbdoW+eMZ2V9ugb92+mfzQaPVNnc/FLtnnBDtABGLvSAPoU1yT
         7+4pgR/quVObQWAuqLIeLtWfBQhecN31TLwbFVzZDlV9fgQcB5Jl32HtvD8QRP1Vif
         Wl1IaGuY2Z4JhK6oPyqdxXlS6Z1AgoEOMp61dtioOT1FQQEM14zwSp494vMti16Fhe
         ptmuJi/2pjW0g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 31 Aug 2021 12:53:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: napalmllama@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-MJ5LHs6qsX@https.bugzilla.kernel.org/>
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

--- Comment #86 from Tom Lloyd (napalmllama@gmail.com) ---
Please add my board name "TUF GAMING B550-PLUS".

I'm happy to roll the patch into my kernel and make whatever checks are nee=
ded,
but I'm new to this so could use some guidance.  Email me if you want me to
test on my box?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
