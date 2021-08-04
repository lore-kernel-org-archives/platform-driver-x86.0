Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FACC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 20:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 802D361040
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 20:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbhHDUyK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 16:54:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:37058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237866AbhHDUyH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 16:54:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 03DFD60FC3
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Aug 2021 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628110434;
        bh=GM5jOK+yqHKsIAgXIBKNIEDpgSz+lbx4z4NesYYdDzI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sK9Pqn2Fb2u7JUCPuMTLGEFu3LODq1pb8kjKhFILR68aFL7lW0pVscF7l+MIuYBaa
         WBM0Rq+1sulySeYExLZTcluNVcduEr/dKzfb6K3bxFwJvFwy66O7EiosSmbbhOQdRj
         ccNgQTYne+KUiBfvxU8jx6yUBwKbNohuy1X7nyKWmvqSu4Y5FmGi7C4YXjwvWxEcJe
         8EDaH8jzjmTPc17o9j8RKBcc6ZwORjKC+luhHa2cIQU3XngPq5ya8lUgijJIZYckRd
         YPJbpuXmaNljU1LjjOtcxkf6Yk30JURZ3TbfIM8a4v5keWeqdrU8JmgrIHB2p3NwpN
         Dj47qHnSFZZ0g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213977] Unable to lock HW IRQ 44 :: TigerLake Proc :: Clevo
 NH58HPQ
Date:   Wed, 04 Aug 2021 20:53:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: death420.x@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213977-215701-79sz4Ii1nZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213977-215701@https.bugzilla.kernel.org/>
References: <bug-213977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213977

--- Comment #1 from Ben Long (death420.x@gmail.com) ---
Sorry, please close this out.

My Response from the other thread.

Hey Again,

So, yeah, I didn't patch the kernel, terribly sorry. Been a minute aince I =
had
to patch something and I was just running -bb flag, using -ba or -bp and th=
en
-bb fixed the patch issue.

And with that, I can confirm that this is fixed on my Clevo NH58HPQ.

It also fixed another weird bug where the keyboard waits for the screen to =
poll
(a little horz liine would go through each line of grub) and keyboard would=
nt
be usable until that got to the bottom. Keyboard works fine now as soon as =
grub
starts.

Thanks guys! Cant wait for it to hit upstream.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
