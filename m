Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE86C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 19:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbjJaTZa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 15:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjJaTZa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 15:25:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0FBC2
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 12:25:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6647BC433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698780327;
        bh=F9b2RE7fIs6PMuoK4Njrm5dVRNiUah3K/LJUcHKOsCY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HYiT4um5CRkLacQ0tiSVhTDABO2L7JUGdc86aheWw0/r/AFflZbo3Hyj8hlGnWynm
         n3hy+SJAVcKJcyhgT07/q4fuq9LpQ3I33evyCClYCdn5n3yeMafMMUXnf2Czde3cbW
         a0h1dCMyNbgviK9a5mebAf81uQ1OdVDbcnQBJyfeCheQe9TN1jydwnjVov6GC0vYx4
         wofAmvc29jDHwNou2/ueAXY1jQazBR/8ocPOWx7g1Mu+8tIzpr88iMhilk6POFBVyv
         6IqAXP5PydQbBiegl+txn+GGvomsyiUIjuh/y4gO6pmnLOGvo/IPhgVhGZmvnsYJh+
         eJV2tmgkMl9/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4AAD3C4332E; Tue, 31 Oct 2023 19:25:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 19:25:27 +0000
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
Message-ID: <bug-218092-215701-DWWSQJKjnT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #10 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
We can try doing that same quirk as the other bug with the Lenovo Mendocino
laptops to see if it helps.

But it needs testing for us to merge it.
If I got you a patch could you handle building a kernel for it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
