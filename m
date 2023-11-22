Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39333C61D97
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Nov 2023 16:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjKVQvd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Nov 2023 11:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjKVQvc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Nov 2023 11:51:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2670197
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Nov 2023 08:51:28 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E2B8C433C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Nov 2023 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700671888;
        bh=LFEbs3GdcwMGGhHnWBuV6834rGudbVT0q70WDl+wA7Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DYUDknS3Gl9DinauKsXDwZiyYHbBNFS5kz4wcG3OoCT/kQGO7e7BnIUFvG00k8bpp
         KzJG5hNeCBl1eBB7517S4VOnSfeUBgkWkTF0F+AnPPKl8hbC2tJIi7g0Wzed3BGhFK
         FpDq+rLvsQrVhliiIUqq1niLim0A614Dbk7qLx3C+DcDqgYWFYufSzhAfJLjlJM9iI
         xUw04V3mvRE7vjMKcUkvDNCC6GUu98WM9vNY6I4/MiM0SsdOkvxJW2TB3jQ5SIC2Pw
         Z90+T540b+STbCOkAU51NK+VXwUgf9exZCPIE32x/RBpMeXfGd3DOu8vzjG/4Uwizs
         mdLZPqWYOY8WQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3A8B2C4332E; Wed, 22 Nov 2023 16:51:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218143] platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Date:   Wed, 22 Nov 2023 16:51:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jahutchinson99@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218143-215701-pS7tWZ0qKC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218143-215701@https.bugzilla.kernel.org/>
References: <bug-218143-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218143

--- Comment #3 from James (jahutchinson99@googlemail.com) ---
Dear David,

Just to update that I've been running your "Remove GBE LTR ignore" patch on=
 my
Intel NUC 8i3BEH for a whole week and all has been stable.

Tested-by: James Hutchinson <jahutchinson99@googlemail.com>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
