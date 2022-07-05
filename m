Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A274C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Jul 2022 18:12:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiGESMs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Jul 2022 14:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiGESMr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Jul 2022 14:12:47 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F751C120
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 11:12:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6AF33CE1C8E
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 18:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79EA9C341C7
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 18:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657044762;
        bh=xbbhN4RyABGPCxG98YT3ui2lUX+ULOwammCh+rvnBaE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VyF5FRMb5QEBmNoIZyNTxK5IvplUCJ9pCRGAbJ2W0fW2GJadgD/Bv4pSaReRJdKkI
         TboyI/OgM0TBqF96wDOm/0Ds+0e1yu5G5Bap86Lmalg5Z5ehsRqWDdvxVAWWC6gU3s
         MparqthEf7bJfx4R54HtRXrIUghuauooK5EHKY/79/oZ6UlPjU6GHpyXTx/MYmf6OJ
         xN/wk/YieAQNSrifgzHra1JNl+JBPNvwK1MVPbieSniUwSZyqHrSWC6l1yLA/g0OZo
         RmuNKx/Rglui2pxbU7+ouvFo65/9JF0JwK0/z+8Jm8r1A/+6STwcURADhuc/DiJXuG
         HQHlOgNUzM8Hw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5DE3CC05FD6; Tue,  5 Jul 2022 18:12:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Tue, 05 Jul 2022 18:12:42 +0000
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
Message-ID: <bug-215993-215701-2IWUEvxYNv@https.bugzilla.kernel.org/>
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

--- Comment #3 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
For the debugging, can you add these to lines

#undef ENODEV
#define ENODEV __LINE__

to drivers/spi/spi.c _after_ the inclusion block (all of those #include ...)
and compile and try? It will set an error code to the line number, so we wi=
ll
see which one exactly failed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
