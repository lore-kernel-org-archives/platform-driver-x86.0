Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C850C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Jul 2022 17:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiGERTM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Jul 2022 13:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiGERTM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Jul 2022 13:19:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FADD4A
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 10:19:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6CBA1617B6
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 17:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9C97C341CB
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657041549;
        bh=aaR/rZmec44GCpNYnnGKoxuhzmMdkEAKcpGuz2ZsBI0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Zs8i315dIRlW518zJFgC9jsybhXd9tANnEokcHBhWgvDDBdPn3BI7nMSXcI6L3Uzo
         SWY0yk5jyouk3OyzEVtMfvzrP6jn6Atevm0atUBkB3AfVOStPP88DAxv9ygH275UfI
         f9NoOmXL7+VBA69LIIlE7e12Fy26FdXWWmlO+gzQcBFGAteHsajSoyHHhJ8G3l6fM7
         PE18SAWu9hEk/okv2uEHP2x5xmqyB5OIiQERO4uJ7vuvqabbFDXFEWA80pZ09dSpOg
         W3lAyIjC/BG6LeCx7OCFRvejKot14DKuJLSq0mr8puZXp8xur3EZoerv6Crn66yhVd
         aWXCa/1elpCBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AD387CC13B7; Tue,  5 Jul 2022 17:19:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Tue, 05 Jul 2022 17:19:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215993-215701-JKXWEvH3HW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

Supasak Sutha (blur.3rd@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |blur.3rd@gmail.com

--- Comment #1 from Supasak Sutha (blur.3rd@gmail.com) ---
*** Bug 216155 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
