Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE650C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Oct 2022 14:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiJCOcv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Oct 2022 10:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJCOcu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Oct 2022 10:32:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D34481D6
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 07:32:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95B0F61058
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0452BC433B5
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664807569;
        bh=pmQu5X+x4i0xtTEAoEUq2XBzmPXhldFdVfZR3DQQQFE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S+406z3JdqWep9lYhgZ34pIbTZSgCCIo1ZiZVugeT+Ez8aoXUpTAjl1nUfduN9b1y
         7r+lDie706IKxUKhlwgvSBNBsYLBFrEXCPPwd5WrPZY6ewn7VQ0ns37Jpe52bGV09s
         j5AC/7n6cmAL2UTHp5RLDfmgnH/jwnmYvWZqcno+vqaHBO32Y4T/QLLO8W8wOQ6A+m
         d9fJtZ6SijId0KSv0yYXuMCL86tMMX16+O4tOlGkBeoLuxTBllO9eEG6X3o6belLCM
         WpqDX8yf1LBjo62drk4K+eDFA9u4zssW/oirKI6laEIo47GGN+fSTsjfSDVSz3Raal
         QaxmGFEAG5MdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E9594C433E9; Mon,  3 Oct 2022 14:32:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 03 Oct 2022 14:32:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-G3UFfT6pLo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #54 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 302926
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302926&action=3Dedit
[PATCH 2/4] ACPICA: Allow address_space_handler Install and _REG execution =
as 2
separate steps

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
