Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD63EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Jul 2023 18:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjGXSjd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Jul 2023 14:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjGXSjd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2023 14:39:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6D3A6
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 11:39:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E78F5613C5
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16F3DC433C9
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690223971;
        bh=Xb920XX2GiJce3diDSr5pzDsshxhhGwQYzlTQab/0Bs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aAr2b52IO/hhxiw+xt09npwrmHJXu9OOEokUEKQpBqDtYRL9ou4SsTWAF6KQ9nW6t
         gmOpts6jBJ6ZIHl5GYsGbpmfcvpyc2BAvt+k/8zIuOHs2YmcqsznNHQlaOPH1oCQxu
         Qovsr1lL5SInYtw/2wISEQQZCAs6wGaSry27OL9OJ1gtMQ3aRvMWT0w93lNskoOwRm
         JBH1kSPN773UYdVZxDogNqO2qfKXIuaIMps2t7pMUwV8NfdHy7ByE1sRmoKww/LGdN
         g9eBD2DwTZa+S0MOvyH3sbaBv+d7g+1UMDz6HMt4N9+5jhDsMiz6GhPFYN4myFv/OM
         ycjBo8gmK1bIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E9130C4332E; Mon, 24 Jul 2023 18:39:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Mon, 24 Jul 2023 18:39:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-3u9GGpe8YV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #11 from Artem S. Tashkinov (aros@gmx.com) ---
Could you explain the nature of the second patch? From its description I
understood nothing at all.

Does it fix (improve) very high idle power consumption? Why is it needed? I
don't think it'll help me break through the frequency wall my laptop's firm=
ware
is imposing on me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
