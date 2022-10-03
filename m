Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0334AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Oct 2022 17:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJCRV4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Oct 2022 13:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJCRVz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Oct 2022 13:21:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00771FCE4
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 10:21:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C7A36103F
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 17:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED8C6C433D7
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664817714;
        bh=+fL+W5DC6q04yCfOKKJ/JrUujUHVGRimKGbPCFwEkpc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ph6Ry2q/yJt3HexV2K+faDOldQG8E+A0FuFtI3qllPV6MPOa1VYZBn+sN65LJz77p
         +4ER/EmNF1p1TnGRvl3sXtWE6jcqDz228kAy9V7hnHzD+3EJM977FNHClaf2xQo236
         uc8Pko/V1RaBhumqnqocyNgoBKx9bTgMNIPV/o4XBuiWqQY7Y9oL2QiBovJkaNuFt6
         TNrhYcxuzUrvnUgF1PtvpyMcvriw8ykznWnz/MiQNIuaiZxZoT6F6D+3kRYS8UBCCJ
         cL1OzXiDqkF/klufvzSVqhiglS9tHXNCEn16YUHo+1eUuuXvdH/NDuNc6rkVJQSUf4
         rd/g2h7STC+ZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D1BA7C433E4; Mon,  3 Oct 2022 17:21:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Mon, 03 Oct 2022 17:21:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-C9P6aQtRKv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #33 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I guess you'll need dmidecode or lshw for that. So I attached it.

The problem with generically issuing a patch here is that some people may
prefer to have high power consumption but those EC triggered wake sources
working.

I don't want to make decisions on their behalf by quirking this.  You prefer
the lower power consumption and don't care for those other sources so it ma=
kes
sense to keep it in your kernel command line configuration.

> So an automatic detection may spare a lot of future work.

I don't believe there is a safe way to do it.  I've added various debugging
mechanisms into the kernel related to this situation (that I've referenced =
in
this bug and others).  We'll have to rely upon those to determine what's
happening.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
