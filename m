Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08757C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 11:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbhLELNW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 06:13:22 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:60106 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbhLELNW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 06:13:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DAD860FD9
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC24AC341D5
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638702594;
        bh=H/mYHeCxbDMPBfbza7/gkYA0efeXbTB7PqdY1JvnTdo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=l+lrEqAaOB9pG3S3BkNjdp90PZeRXFomlCoeQobsVIiScdcWr9zh3OPJQigmQQAOS
         f1owU+AkS7FIKslxXQ4uJQLNhI8Ts7LdNyXez3XRseGP4A64WcbqdF2i94Wua30Xlu
         AAZL+05rY0A/P1coOc6dj5o+W2msRuYteckLDSs5DDulA9UL/qiu26AI2HGJVAEUNh
         MONoPkrIbN3NK2TaFMy+G1u2si1HschCdl5luEIqlkni+H+vxhrxVFTfo66O10yS7+
         8ni2UPLOUmSvn4rak/rRTXflHiUNpma2tlbbBe7rhufMEw5QCWQBawgPi9ynzU4yS8
         yO3zpLyA8EcJQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9EF3260F55; Sun,  5 Dec 2021 11:09:54 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 11:09:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-pxSUjt0l3o@https.bugzilla.kernel.org/>
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

--- Comment #177 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
Oh sorry it does not exist I looked at the GPU sensors by mistake.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
