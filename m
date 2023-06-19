Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1D1EB64DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Jun 2023 14:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjFSOOC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Jun 2023 10:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbjFSON6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2023 10:13:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C0DC9
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 07:13:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5213460C57
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 14:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAE64C433CB
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687184032;
        bh=pX3VxyABNVGTGNBXgVzatJ1wvo6fw/dN6YZXg0B0/rM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nyrqqK29pGrpzMRyDAggY6pdcA/W4S9PG5x7lPNU3Evj85Ze45sHgxt1zrhWVvF2t
         8glPS8iXeG2OcQae+/ELqdQGfiSZMTRmPaxrfUOu+7wc9Wv9TOhk9HkGdNF/PrBTTW
         QDMr6OwzQJbhn0Vrow3AQAsLSNvl8RMG2ZTzcj68DAXcLq3VYH78AXROOVL3NIM7rG
         BL6u1gNIFIOhlmh7SOO6JVKFKaZScMxo5dYSsDiIGfhiejZKn3Oic0EwgfQPItdO5a
         f5a1T0xkIGfKaINexPH9vXk3xHNM7jUYSvPkDctDrrGJymrmFVGnGJtnM4d6IObPp1
         Xu6ka5lW2oxlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A22FAC4332E; Mon, 19 Jun 2023 14:13:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217571] amd_pmf: AMD 7840HS cpufreq locked at 400-544MHz after
 power unplugged
Date:   Mon, 19 Jun 2023 14:13:52 +0000
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
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-217571-215701-e0U60XjGmn@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|drivers_platform_x86@kernel |shyam-sundar.s-k@amd.com
                   |-bugs.osdl.org              |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
