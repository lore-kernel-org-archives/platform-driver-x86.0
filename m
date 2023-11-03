Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06CFC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 16:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbjKCQcA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 12:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234342AbjKCQcA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 12:32:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63FA1BC
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 09:31:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C521C433C7
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699029113;
        bh=Zg9LudCYK+l/R86iJ0Tv+/pbPXxrKsjG92zcyfH7bB4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=asbQqU07/EBC7NDPf0AwYtYipv6EyCuT8m2dK9csauB7c247MyTdj7xqTOgQ0V9FE
         DFHwrhUSUzztX8pDxjT3IyUhOE2QLx/1Tzdm9tYMpauI+s2cr3OWbsIiepCqjdGZ+3
         8tRvdEVBK8F1LNpMgdCMUs8tA+JekVGK8Z+Sn0bjiSzf5/ab9wAFQQuOW5Da+WEW7l
         9C2pdnbX95Z8rm4KFZDAhE+89X/U68IlKadjwtfbrPylBdo8tkaJplbPk7/59fXxYE
         TqiBQAQcMkak3PRyZvJQ+TWBr6Y4Gm+XoZHd2bXRmvo68MEgTFNYcz9D8I9EnU6kOT
         ZIequt0gxMeBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 586D8C53BD0; Fri,  3 Nov 2023 16:31:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 16:31:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: IOMMU
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_iommu@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-218092-215701-KJVU1tUjiX@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |IOMMU
           Assignee|drivers_platform_x86@kernel |drivers_iommu@kernel-bugs.k
                   |-bugs.osdl.org              |ernel.org

--- Comment #55 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
No; if the BIOS doesn't support it you won't be able to do it in Linux.

For now I suggest you keep using the kernel command line option that turns =
off
the IOMMU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
