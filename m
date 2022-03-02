Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F2BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Mar 2022 12:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240469AbiCBMOR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Mar 2022 07:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238422AbiCBMOQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Mar 2022 07:14:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509152CCB3
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Mar 2022 04:13:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E50FCB81FB0
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Mar 2022 12:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A5E9C36AFB
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Mar 2022 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646223210;
        bh=5YAVoAE+q9yC1vK+eTu+st5PudCj11NA8G67N6iIPj4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KWkRi6+GGug1NhSU5fOFjp/sioe8r6fuw+WdRrmqysTfiCLrW/hdmjEKRK0wbTsSF
         JbNXLZ/AZL6vMHLw8/JQSXpOVgPIEJacfohqbMvEzndXRUF2FDDNsz9kd53GeVeoxE
         z0qy9w94h+uUjNGay+dAlTbZX1hYEbt3pv1EwPdZYM1y6FXqD3EBn9p1lNnutLtpU2
         vUika3PgDRifed/N4LViOKxQEdEexE470S8R9UsN5RzHThxzn6m3LJnlNxNGgEURwe
         s8omL3FYSKOt6C+rl0sT4PZVo57OuwggsTMWL6Ctx9eINzC9ccD62Dqinv25/duOHn
         kGMYOaFWMU2CQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8B91CC05F98; Wed,  2 Mar 2022 12:13:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 02 Mar 2022 12:13:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-RQfQ0m5n6U@https.bugzilla.kernel.org/>
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

--- Comment #222 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
Denis it's a normal that nct6775 driver not automatically loaded?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
