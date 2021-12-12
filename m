Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F95C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Dec 2021 02:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhLLCVR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Dec 2021 21:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbhLLCVQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Dec 2021 21:21:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1F2C061714
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Dec 2021 18:21:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E39DDB80C9F
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Dec 2021 02:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E8D4C341CA
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Dec 2021 02:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639275673;
        bh=uevMijiofo3Wg6O/V/vnm775lxz3FcklB+zfEQwP2v0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XoBQJV3BHl5DAPIxiJTJWg3H6CUJUyz99QpUKLKE1y+Xmi+e2e/dBSMe+Zafy1aVI
         +GoPe3/CJHJNfSjs0gXbNHcRhOg2QDjB1YpAvgNaWPmJWpTAH+wqQ0mjh2GozYtQ+S
         CTNRHvh8xCX8VB6HRD2ji5G8+5DAcEND3h5Qn4j3hhBV7vixJPjoI8ThMZtn20A4BQ
         R6F9UAWcPgm13N3MTWyhrhk9kIyttWk770iW24oMYzArWfZW6FA6rwF4gClzc1Ey5U
         +RtfC0HgG5gzngvC9oY3R5LAsqUmwdLhtTmjsIsnGAVyZO48f+Nu6f2CkuHrhNQuBb
         +OR3lQWkqAtqw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 900AA610C9; Sun, 12 Dec 2021 02:21:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 12 Dec 2021 02:21:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jason@joickle.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-duCNZDb3Rf@https.bugzilla.kernel.org/>
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

Jason Oickle (jason@joickle.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jason@joickle.com

--- Comment #196 from Jason Oickle (jason@joickle.com) ---
I've been using the oct 10th version of this patch on 5.15 manjaro for a few
weeks without issues. Amazing work by Denis and everyone else involved!

I was just wondering if the patch is included in the 5.16 kernel or does it
still need to be patched manually?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
