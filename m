Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227C9C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 13:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiKGNUM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 08:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbiKGNUL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 08:20:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07A41B789
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 05:20:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 891E06104E
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 13:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3E68C433C1
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667827209;
        bh=jLFCt7W3SwAH8I/wxh6kIneWId4pIoMcLZvuWOTjWnQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bxUXbIEefekg0XGmeF+F1G06cm6YyPsarR3d7tuScrbLvFfm12lcXnXwu8Le73k1P
         dCyt5AM3VD/bBRV9nVfmGvpcQO0kAhrG0mdpfYQWLL/C3yhqdO28WI840M/d4XsvB2
         Bb72DYDXHVeEfR1W7otaczQHK3r2++fE7W1kCQn5r9zc+r3tklBgJTbfx6CzMBb7sR
         0wcGe216C7DdKqdBebPwboceaTF3+q+SlvM5fzCgIFLyzN11nFhRycZcrLe5B2ap6i
         f/B97zetrGvu5CmuGzUgqkfl6HKYghGK9PxosCphL4g/h5A3aKsuV8SHVmJ5cVTafw
         Tvt0MroOZDOWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CF148C433E7; Mon,  7 Nov 2022 13:20:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
 version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
Date:   Mon, 07 Nov 2022 13:20:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216468-215701-ifzT8lUJC9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216468-215701@https.bugzilla.kernel.org/>
References: <bug-216468-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216468

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #10 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
That patch was submitted to 6.1-rc5.  It's CC stable and so it should flow =
to
.y for all still supported kernel releases.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
