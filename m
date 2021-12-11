Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E022BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Dec 2021 19:59:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhLKT7x (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Dec 2021 14:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhLKT7q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Dec 2021 14:59:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86138C061751
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Dec 2021 11:59:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0B12FB80B41
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Dec 2021 19:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AECFCC004DD
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Dec 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639252783;
        bh=Ws0rmepiRTS4RUyg1jKcll2pWwcweF4/ffv3wqf4ubE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n/qQpjNcua5oYsSlbzcqQXyXwPMlb5lqm8II5mtQyruPl2L5zaKCVTO3NxuaFSRuE
         rvMuVmqqbJ1DQaJ2NSFFZ+orBXwdLXBGuzUuhre8Ur6UO+fHDOqkHuOPXwTcnTPzjO
         6nXhn9HTBdIeAc8YLK9/xgfuaJGNhPeF2yeiMSyMy8gC7HeITQQREldbLQegFZ+vVL
         esy48y8hHS/EpqlrR/6aqNJ9y/icvQ9Yu7oQM+t/8kdiQo5JIA+4QHAUijcrsxXTRZ
         iG/0IA36nN4ZF+WcQL76x0nEmhbKnYUGWxfrzLt1BdFbBm41UtiUlUGUgwZL1bLnIN
         5zajAelrno68w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9E16160F51; Sat, 11 Dec 2021 19:59:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215075] BUG: scheduling while atomic: cpuhp/1/21/0x00000002
 when going out of sleep S3 state
Date:   Sat, 11 Dec 2021 19:59:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Process Management
X-Bugzilla-Component: Scheduler
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component product
Message-ID: <bug-215075-215701-Fzp9Ipf0FA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215075-215701@https.bugzilla.kernel.org/>
References: <bug-215075-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215075

Lahfa Samy (samy@lahfa.xyz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |Scheduler
            Product|Drivers                     |Process Management

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
