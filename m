Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF358EB64D9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Jun 2023 04:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjFSEA6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Jun 2023 00:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjFSEA5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2023 00:00:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDAFC5
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2023 21:00:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D88ED6111F
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 04:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4461AC433C0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 04:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687147255;
        bh=cYO8jHQQMEhE18REh/a+OA8YDiqbTrTfYNphHDwl6Pg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IEmdhDGkdD+OyzgrarADXcdoe/4VTm3qvOJznBs6xusgyqdB2s//rMgJGKV1qiaWI
         ioSdtgMJP4QHD2Lol7HCj5kV5d2QT0J2sy56spxG4eJghndszdGhQBJLQPZJijrmq8
         D1UNIcSqe5FiSxWmD77HVGL02/1Oz720RPe9QaQK1VcMYkCpRSBWn+ou7jhCQI0SzA
         lbNqo1MLrQs40ypqj5F2C0B88Q7KKzFbUnyrdcy3U3RQ6LUqRb1k1E937DEdUTvQyu
         TCZShD/pUQjBaccP/SWF9GNnb2hxeW2fjwURbYt5cLJqMJGWhkyxvyyhDJpGkDVh3l
         JsOw8pLYGo4ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2710BC4332E; Mon, 19 Jun 2023 04:00:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217571] amd_pmf: AMD 7840HS cpufreq locked at 400-544MHz after
 power unplugged
Date:   Mon, 19 Jun 2023 04:00:54 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217571-215701-rsLChAfMCu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217571-215701@https.bugzilla.kernel.org/>
References: <bug-217571-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217571

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you please turn on dynamic debugging for amd_pmf on the kernel command =
line
and then share a full dmesg demonstrating from boot until when this happens?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
