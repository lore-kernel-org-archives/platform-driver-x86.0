Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5436C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Feb 2023 03:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjBKD52 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 22:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjBKD52 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 22:57:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C98C1ABE0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 19:57:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1049CB826DA
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Feb 2023 03:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABEC4C433EF
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Feb 2023 03:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676087844;
        bh=fNuO80A18SWfeDIjh62JEFwbps57jiJL6l57vsKyXkg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S1EgbaOiTVxGuJM2Hc34s2ilN8WhAbj1XVYo8Z2ClPgmeZKVMowHTHzak37PbWE2X
         fwp/GfCLxscfG5p+h69/f7o459MIoRX+Ss2gSHO0m5ghFqzmm6zBxhWfeZeMkFHWoM
         IAv8drfk4Q9mzYR7guQDpfT5XwU1CseMen0CRwKr/TLQUDO0WiZ9NzwsYCAT7cYL7a
         wn+kHVADlK7KVZjrsbBuFi6RKWQ2k0p4Yzg+cdoHmEwxNgopDLQ3RHXOvjbPPaRa7C
         4zVujJCI6dbc0srfQUcTnMzXUgzK+cvLyflEuWAw+o7OVT4mccedW9bFJESJg92jZn
         xIKkf8HqeDblw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 89C28C43142; Sat, 11 Feb 2023 03:57:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217020] hp-wmi: Unable to change platform profile: Operation
 not supported
Date:   Sat, 11 Feb 2023 03:57:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luisbocanegra17b@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc rep_platform
Message-ID: <bug-217020-215701-R9vbDMyYXZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217020-215701@https.bugzilla.kernel.org/>
References: <bug-217020-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217020

Luis Bocanegra (luisbocanegra17b@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |luisbocanegra17b@gmail.com
           Hardware|Intel                       |All

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
