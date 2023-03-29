Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8607CC74A5B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Mar 2023 22:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjC2WTJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Mar 2023 18:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjC2WTI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Mar 2023 18:19:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E2F5B82
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Mar 2023 15:19:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09F78B824C6
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Mar 2023 22:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8E61C433A0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Mar 2023 22:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680128341;
        bh=6gI2qYvVYg3Mz3qUe3PYzACnQc3i0Ok+Z8US9u4EudE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oVk+g7HQzBSXMEGUOlam9M+2P52a4VjDoqj50MXrB+FSnWTWlkfdTyTM79Imn+ZSa
         thWC/jchmUzGf5ijYZtxZjOJbj6Drf/TfXLMJ4oDnQz58WUhiY1+cEIC/+BaaJzYp2
         JJ1HwogF7UTMxem7IbSpWT66Gz5Kkb7dxzC9dr+I/eztti1wnA2lA7Hr3rgrvPfSvs
         ai9njpfTrY4FTLwXJAdzg4NIfSAsTmS1iugOiyv5RoPAqZLc4nMcfKXm5yBHQF5ein
         oytM3fOCbrgscGKXlS5658zgaMAL0i1ORSTmRZZj2CTUxQEvGdy+9fXMrzc2eIGy5b
         j7OLZkyR+xb4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A1EB9C43142; Wed, 29 Mar 2023 22:19:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Wed, 29 Mar 2023 22:19:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: walter@derwalter.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203191-215701-W4aF1fX8jK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

Walter (walter@derwalter.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |walter@derwalter.com

--- Comment #14 from Walter (walter@derwalter.com) ---
Just wanted to know it this will come or not,
my ThinkPad X201, running on 5.19.0-35-generic
still produces the bug, after sleep only heat,
fan1 shows 65535rmp but isn't moving.

only resolution: shutdown, remove battery and
power cord, wait, boot.


dualboot windows shows no problem with the fan and sleep mode.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
