Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CA3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Mar 2022 18:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241464AbiCDSCR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Mar 2022 13:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241449AbiCDSCL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 13:02:11 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78B71C57D9
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Mar 2022 10:01:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3E645CE2DB9
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Mar 2022 18:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BF6EC34116
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Mar 2022 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646416880;
        bh=2RLMDP/pNxGV5cSq/VFe/4lWfhT8AYg4PrN3Eg2QF08=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VmV72iV9ZleqNrxfcFNNU3gLyVJJqXBunmgT8gbez3Q/5raEOayNUzeoftDjNh7Yj
         jQJSuBZXjLpn9fDbBDBIu9u+VeoznbI3RtHbc+D6twYSQjfbwwlHz2psELzrev0Y5g
         TEnLSulL9v4m7A8Es4wsJK0t7kBzITCVxnaiOKvhV6p5JQF6NXGCqJSWXMszsQgEq8
         n8sVD1DAR2RSFgssSPxIPqxXfQaCGoXNCClnN+ri5JUv+XGZEQ/5wuoEzB6OTuGGCt
         zSjI0/IOOzhicT+0M8LUyLIM96QNXvgOvx+T2krtDiwslWkkCww14YrNfWRksDpSED
         QjtNGLhwCCM5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6C86DC05F98; Fri,  4 Mar 2022 18:01:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 04 Mar 2022 18:01:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: emayor@live.com.ar
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-CzFCE4fF2W@https.bugzilla.kernel.org/>
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

Emmanuel Mayor (emayor@live.com.ar) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |emayor@live.com.ar

--- Comment #223 from Emmanuel Mayor (emayor@live.com.ar) ---
Same issue with Rog Strix Z370-H Gaming, which has Nuvoton NCT6793D

Kernel version: 5.16.11-zen1-1-zen

[    2.018193] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20210930/utaddress-204)
[    2.018199] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
