Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFA8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 20:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239960AbiGHUw3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 16:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240250AbiGHUw0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 16:52:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF33A025A
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 13:52:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ECB19628E3
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 20:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51619C341C7
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 20:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657313544;
        bh=z87XqcEb96zTvt0OPjfoJIANiu3SppbmjSfaI0UoKOk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WBAosptZkBh04991FCvdCuXmDD5VbNyM/p67+CLyoI/1I1StSg68q4EBcreh9VQ/w
         EGJ29GWCkEVS91lhJl4bsY73mqZwWVvTEuxIbpoNtVZJz7Jgmj2kNET2ro7EINp86E
         uzv7MmSdnEsSlXEK+9qi/KwfzcK8bjW3PSE2wSFkh0gSjn3i0KMJi5b1leAb5HUV76
         J9uMGXfI5D4ujfzyktMgPE8nZCEVOy92pIuRv2gdLx4QEhbZGWsNZcgp8vfph8Qbcw
         zgAKdEQsTYAogQ6v2QCYV/DJd4e2zMfX++z9bKMvsC80DY+J/vw6L8DtCQE/V+4zOW
         ekcKlqh8wez0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3EE1AC05FD6; Fri,  8 Jul 2022 20:52:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 20:52:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215993-215701-G8ZiQ6INAa@https.bugzilla.kernel.org/>
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

--- Comment #10 from Supasak Sutha (blur.3rd@gmail.com) ---
Created attachment 301371
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301371&action=3Dedit
lspci -nk -vv

lspci -nk -vv

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
