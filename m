Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C526C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 09:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbiBEJUM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 04:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiBEJUL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 04:20:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB89C061346
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 01:20:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C5E760A65
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 09:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD79EC34114
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644052804;
        bh=o0DEy9gZ7ZHkRy5kWMRLkR1XyrPjyUYE63HAYo4yeYQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FTgCWge8bSvK6dF8i0UUu9CWKO0b+nXu775vuvVcucehItgc9ufKPLPAPjso38cMu
         CbM/oojdPndbnqGDtYb6XphXd8Sk56oavyvX8OjgF8nvK7c5WIbFWuQMuidQA673NN
         Yv/Elp9D3HgWgtNqEh2YYdXXjpUBP89ZekcpSqd+QE9qfInRd9jmMzZClqKhNyCK8T
         gfrTaCdT5dFwW2Smzt1krNka7IVTuuf4u3npa38tUd+ZpyEah1tOGOCBn1qEwx56MB
         bvs6uq+hA5iPo5Ycur7OpSt65n0V1M/JDHiNU1avNLDLf7IpxmPBeZHUZmvdpJR9zg
         wZPF2fGLkqk1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CDF0DC05FD4; Sat,  5 Feb 2022 09:20:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 05 Feb 2022 09:20:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-lzT1EaMT0S@https.bugzilla.kernel.org/>
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

--- Comment #216 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Jaap de Haan from comment #215)
> My Board happens to report "PRIME X570-P" instead of "PRIME X570-PRO" (wh=
at
> I saw in the source code)...

They look like two distinct models:

https://www.asus.com/Motherboards-Components/Motherboards/PRIME/PRIME-X570-=
PRO/

https://www.asus.com/Motherboards-Components/Motherboards/PRIME/PRIME-X570-=
P/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
