Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC6CC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 08:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236098AbiFVIdT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 04:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354016AbiFVIdS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 04:33:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAC418396
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 01:33:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7284AB81B21
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28A4FC34114
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655886795;
        bh=bwErlo6/QT5OB1Az45LqSWRJTj9zfAyp7z62xX45spw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nzb1kIoI7r9urM5tOXFyTU7x4OlYYqs1sGEt+H66V00Z5427qHk8EZvwyg8yHZot/
         MjDnekjqqUKVpFsvtZqVeujuJplmM80MrBjvda2ibDAsXF5qGfkdbgLPwslkjDrOGy
         tH/ldhJNbROkw/my8rpEQ/csK7gEBy/Zca4tptq9oO0E1aJnGSB/H+xr/h5PKkaI8T
         zH0iW38g5JoP04B6VrzH3cmoKx2D3PjvFXFel7fKOS4TPMlrnIvlkh7J55VwRhoJdy
         +xwu5yT3XGOBxqSO4+kmg22oB6u1UvSlnus9Dm/+91g8Cbg1oBYta+HJWNZbUrKIQM
         /OYbPh2pBpi/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 18DCDC05FD2; Wed, 22 Jun 2022 08:33:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216163] cstates: intel_idle.max_cstate=4 required to eliminate
 flickering of the display on the laptop model 3Logic Group Graviton N15i-K2
Date:   Wed, 22 Jun 2022 08:33:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kovalev@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216163-215701-rN6Wx5vbvD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216163-215701@https.bugzilla.kernel.org/>
References: <bug-216163-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216163

--- Comment #3 from Vasiliy Kovalev (kovalev@altlinux.org) ---
Created attachment 301252
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301252&action=3Dedit
lspci

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
