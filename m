Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C300C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Nov 2023 09:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbjKAJLS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Nov 2023 05:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbjKAJLR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Nov 2023 05:11:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00B8FD
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 02:11:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DAD9C433C7
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698829874;
        bh=X03GF3HvJVO6u93ztcqD95bTNtIXJ7jqFZVauwLIp1k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qR4nZLL8SI9DZ6jxqeC+qiaypR5wrl8AsxqINd2XLfr/X9A/M531vOJTu8i95Eh9N
         Oht2GYrPTvRcOCMvDDDVtnLmlff1KpUkoMtDQFBLFYobUYvzczaVejrMP0n5URWtbG
         dhRVvqF9jIZNdSJ80ZscitAX3c6kYgrlbpoVBFiVZtDoeJavzTfwYllkCDbHURSnZh
         0LeVXm+TEDZ03NM/OFYFAM7Eh/0sLkM5ilfIHMv1j4oZJnHoaXv2vbNc9iZY6hdPK3
         W7pLa1Mki8dDUEq7u1k3xHyLJue38KBkwUdJlfphonJY1om/VWAoW337Of8G98PBwD
         huWRrefsW0vxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1FA69C4332E; Wed,  1 Nov 2023 09:11:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Wed, 01 Nov 2023 09:11:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-SRQThjgTnm@https.bugzilla.kernel.org/>
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

--- Comment #14 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
When my laptop booting, there is no grub screen, it's loading immediately. I
think, I should change something to show this screen or press a button. Am I
right? And I also have to remove amd_iommu=3Doff from my grub conf too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
