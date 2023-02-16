Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF62EC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Feb 2023 11:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjBPLER (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjBPLEN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 06:04:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02F65648B
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 03:04:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 573ABB826DC
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 11:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F204C4332A
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676545447;
        bh=WQPOJHOS4jbaTgnhQdiDSHwiufNZqbZwGjnP7q1EDBA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=duDwbKT4jmvzXwQ7vndvRnKdNLhBaFSJQzDINyFHSUNFiWawAxrAgj7GjMA/Dpz3N
         U+Yw/q5PillsXWHvhRQ6p25qrDc9zIBhU1NgriiMqdFP0mJDRqXLSWAQ0n5hYWUt91
         /mXDV8MC4nkYM6jNApz2UZKYZh6TOgTrWfWHaBSsR1DHtu0CX/bF03Yvx4hPOXNCJw
         cX3+R+5d8v9uTbPrbcqhtksjcKql2datdKXmc0MYvwu3tCB4HwLoDozCXpqrp1hCHX
         kiLHt54ZZOE9U7d31wA+RLQGK6BgxEYRiGYnD0nMq+Cf/YZfl/pbpLUD6gIWu4UG/9
         qTC+ZfLhrqFEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0F41FC43142; Thu, 16 Feb 2023 11:04:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 16 Feb 2023 11:04:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: de99like@mennucci.debian.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-A6uHK5sYBu@https.bugzilla.kernel.org/>
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

--- Comment #296 from A. M. (de99like@mennucci.debian.net) ---
(In reply to Jonathan from comment #103)
> Hi,
> (oh. Could've put my comment in the attachment comment... duh)
> I applied Denis Pauk patch today, (how I did it described in
> https://gist.github.com/greenbigfrog/26f948c9d86f1cb2fd23bfeaa23ca068 ).

hi I have updated the gist to compile on newer kernels >=3D 5.17=20

https://gist.github.com/mennucc/2a322744612a7e21debfa001e987c15a

this gist does not patch; but anybody can add their MB to the whitelist eas=
ily

thanks

a.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
