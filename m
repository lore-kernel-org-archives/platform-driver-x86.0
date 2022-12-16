Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D3DC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Dec 2022 23:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiLPXUL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Dec 2022 18:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLPXUK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Dec 2022 18:20:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515C1C76F
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 15:20:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06D4AB81E48
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 23:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2316C433D2
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 23:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671232806;
        bh=KGwgYc3EmOfSShZybvo2z6SE5XKzuDDift1hbDNtCTg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MUDAzCj78ZJIOCrlUh1IW1eQjumWWSq1TTbQy46XN8tpuu+uMqDeM5bm9QpJxCO6t
         EitrCoyW9ush0zuGGRVTUFv9a53yPPycON1yyzM3T0MO7FoO8Tkg6Zk8ukF91/DGp+
         OppVBT5F14c0iT46+fVZ5CDFGtj2Yd4ZF8PxOSz4OBZRCJel0DDZE00rrKXQcGows/
         5GGLQuX/2ZeDM0PncoVqBlcxLQYWcA+u88qTpdPhRiCMg2Etuf5/4GHdnBeiXdRybH
         L+LwkzU2TjhnLCRO5FT7C3pIE5kXnRZSfTn3pKfuxlnAbrUQgD1VFOq8rXoZCkBqvJ
         8CQmtpg1ERaXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A0447C43141; Fri, 16 Dec 2022 23:20:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 16 Dec 2022 23:20:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rcrit@greyoak.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-2YbbZ60sQa@https.bugzilla.kernel.org/>
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

Rob Crittenden (rcrit@greyoak.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rcrit@greyoak.com

--- Comment #277 from Rob Crittenden (rcrit@greyoak.com) ---
The MB "ROG CROSSHAIR VIII HERO" is already in the supported list. There is=
 a
wi-fi edition as well. Can it be added to the allow list?

$ cat /sys/class/dmi/id/board_name
ROG CROSSHAIR VIII HERO (WI-FI)

I built the nct6775* code with this name included as a module using dkms and
tested it for a few weeks with kernels 6.0.1[0-2] on Fedora 37 successfully.

[30073.435475] nct6775: Using Asus WMI to access 0xc1 chip.
[30073.435509] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
