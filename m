Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE4DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 20:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238564AbiGHUFo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 16:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiGHUFn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 16:05:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6063C15817
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 13:05:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A15EE62865
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 20:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0434DC341C0
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657310742;
        bh=7nip0fWICvlLP50TlcdBRyRmtz83S2uI6w434zlmnlc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aNY7KhGRJSZwu4qyM/UlNUS1bcmcXy4fEq2zm1sw14SVNzrml7as1a3wYE5y5eWKt
         czJ84m4KKudO53YV97JrnhVF6uQmVJuBihpx5f43oEZDrPUZwVd750m//oZ6ZNyCsY
         LwX9mKKP2u6FmFQFkqreJfGp2EY1jRXNWr/z3FTDsbNOOPDccy48kfgWmbXkWSnXeH
         MO0fH9Js6ymZgh0ecwnXAE/7kLuEUVgy5f1qLXPnrf/5M3ajBTUzN6bF6Us19fFvEd
         bBfPJDdaE6i3v670aywnULPoimOIJfS05Hy1jIJMn/3k7/WOXRdtns64LG4yc0mZvk
         GnFKH90xd0X/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D7E5FC05FD6; Fri,  8 Jul 2022 20:05:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 20:05:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-EL5h6UXJM9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #9 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Thanks, two more small files would be nice to have, i.e. output of:
1) lspci -nk -vv
2) grep -H 15 /sys/bus/acpi/devices/*/status

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
