Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B053C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 13:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbhLENyk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbhLENyk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 08:54:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9F7C061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 05:51:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE964B80E66
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9CE9C341D6
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638712270;
        bh=d5iu06b9vmb/Xs9QPBxSDsi2ojiIzxZGFzG2RdtN4hs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cef5rz4gquNiv3Yp81IsqXBRxeuyzMW1aJUxjc59i/n1llS+qgxjQubIleC242+ne
         brOwNyCjUCUNvrMAqkzXf6N98JQQ317/6UGeBJNbJkTB9JPIw9/9QgTsxEn2jNyCFB
         q83LCPCge4TJ/mhn8sFPgpvy8Rz05oXHW4l5w0/yoWfDITyhYqVz4fEh21DxYYv5Ns
         hvkg2H416hbU1KPbw3CSRkyO/hCFGsyPpiVBiJ7Ykk+PwDwoRJ4PXDXJKxv/mUG2Za
         q6vqr+7WEPO1JsOOL3KgLJSwWkRI6OzwFeqvxetMypIUAK9NnVPng1fYkMRXs6/Hep
         HlNBJPr9i2p2w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AB3FD60F41; Sun,  5 Dec 2021 13:51:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 13:51:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-E24XYy5k1b@https.bugzilla.kernel.org/>
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

Vladdrako (vladdrako007@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vladdrako007@gmail.com

--- Comment #182 from Vladdrako (vladdrako007@gmail.com) ---
Created attachment 299891
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299891&action=3Dedit
dsdt dump p8z68-v lx

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
