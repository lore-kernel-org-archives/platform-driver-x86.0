Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3244C6FA83
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 18:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbiI0SHX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 14:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiI0SHW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 14:07:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BBEF370D
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 11:07:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9A9661AFD
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 18:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35E05C433D6
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664302038;
        bh=0zV45zjZQvm5MdQkT28/Yvw54BZEdjAxxqbIdofA0TA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KjuHyYENqx1u0Ho47lKqTMswZWRqq/De1EZdb5gfIxHqr16MGf+MUEuhYQ87XvIoG
         HqKTUgLYQekzkwyf2QqXRELNpESoBMyCshyulgxHwRm1nhpXJWaAUH0sSbOzKhLmak
         EuVlqdnleq9DOP1oM6SBzgnagxN2dI3F2Gj0uRQAVgGHzUphl0cjxOYb1k9UlXE8Qj
         f/zjetSKmoBIy7gs8zdRwI2UZiViNI8S0mK1l3ZGB3oBy2qQNlkWPC5MAHbqjMFFVa
         RMOoIwWEaaG1M0KIPJkfsoZ5Cl7kyGJipfvuJOqQL7VjyZwxaOd32qN3F9KgUEw5Kg
         6TxbOf5vZMDPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 23E3EC433E4; Tue, 27 Sep 2022 18:07:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Tue, 27 Sep 2022 18:07:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-Wax9Ea3Mnx@https.bugzilla.kernel.org/>
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

--- Comment #18 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I think the reason this helped you was because the platform was not actua=
lly
> getting properly powered down so the GPU was never powered off, thus on
> resume the GPU was in an unknown state

Which also re-affirms my point that the firmware wasn't properly enabled fo=
r S3
in the first place.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
