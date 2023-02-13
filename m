Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A085C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 13:57:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjBMN5W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjBMN5V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 08:57:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44754ECF
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 05:57:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 508AEB8122D
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 13:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7B18C433EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676296637;
        bh=hv+iOIU6ElCzJZwLB4UfGhtZwSX8GweH09Kfn/uP1So=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hJcqVDw4fo92e77UJj5FknRMy1KDnLOfnRCWTs+wsiDitQ3O2SzhTZklkloaBbP6I
         PQ9MR0xmwK94ZUxsUavkl4B9pzmOYx56YLPl2Hr2Xk2ZPetPuijb7N8borWGzuOfXd
         viA4TCxp0gSYFf5baQ9E6Mha3mUNOMfMCVswhSDO1XgLqNfgcFAcA6VD9IeblUKUro
         pk5PZKoZynwPPevx5sGUQvu1CyfNdPoC94AuqMbkrHdTH9eUZq81GRD+CVeq2Wil66
         On6cpr0wRc16Acclj2QxpIcj0LVnhEUsrX2YsPeJFrGf548lqJxsHw+IIoWzurCvOw
         bfopR2TeTHGCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C4345C43142; Mon, 13 Feb 2023 13:57:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217028] CONFIG_AMD_PMF missing CONFIG_POWER_SUPPLY
 depend/select
Date:   Mon, 13 Feb 2023 13:57:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217028-215701-MX7ouG4N6b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217028-215701@https.bugzilla.kernel.org/>
References: <bug-217028-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217028

--- Comment #3 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #2)
> Thx for this. Quick question: why is there no "CC: <stable...>? This seems
> needed (see docs; a fixes tag alone is not enough) if this is something t=
hat
> showed up in 6.1.y. Or am I missing something?

Good point, I've added the Cc: stable now, new commit-id:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dfor-next&id=3D3004e8d2a0a98bbf4223ae146464fadbff68bf78

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
