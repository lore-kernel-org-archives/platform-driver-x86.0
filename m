Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D737DCDB465
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Oct 2023 20:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjJSUHQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Oct 2023 16:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjJSUHQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2023 16:07:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B34124
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 13:07:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97B5DC433C7
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697746034;
        bh=n15fx+fIqM7j7vHWEIhPKT/Pz6xzRybOluwFrRf/k8A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SAegF39kTVODhvovHUHEnAkz3oLIvyED/ESktYDPwyhxqC5fDLtlQH5wPSmd628Yv
         pZzeupPNk5Z5mIEd/5bV/hYDTQo3lcOXD7lEFt4Vq3MqzqDuaX/NR5B6UUUxjtiQyO
         B3vPCod8jTR6gcXFCj6vOtxrtgABNO2nIFQzMaS6RD5ManVWyKcGsRp2DzoYb8Ij8W
         Tg9sJoiIxApd6b5+oFIYGnuUnE7ol439CbLTPmUTUoocbbrrxj2npluenwzq9K4mQG
         j0gwjht/XZBa7D0xMyn1yLbRcJWIrFgjvEkSoboDp9yNoXmpML37torznH+PaHrRSW
         0yR5qGrcfPmvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7BB10C4332E; Thu, 19 Oct 2023 20:07:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218024] broken suspend to idle on Lenovo V15 G4 AMN (and
 related laptops)
Date:   Thu, 19 Oct 2023 20:07:14 +0000
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
Message-ID: <bug-218024-215701-uUqRiGLew7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218024-215701@https.bugzilla.kernel.org/>
References: <bug-218024-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218024

--- Comment #12 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Happy to do it, but it's my first kernel patch since the early 2000s, so =
I'll
> have to read up on the process first. :-)  Any pointers greatly appreciat=
ed.

Thanks!

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
