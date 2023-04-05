Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E91C76188
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Apr 2023 20:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjDEUBo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Apr 2023 16:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjDEUBl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2023 16:01:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D6E7AB3
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Apr 2023 13:01:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 009A864130
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Apr 2023 20:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66327C4339C
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Apr 2023 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680724842;
        bh=l2Jq+tI69PAsRmikB/iZGUMLEuoTq5b5cJZT3Wz0VX4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BHXwsq0N+pnMBEnb7L0Mtx2pzpjdlwu37d5q2UQeROubEuDNQdjt3ssQ6662Z4yzl
         DMzSMbUZl7Nwd8q4jlwQpcg689rl0JoXyI1iZwQ4iAKvC6z6k1I0med1NiYb7pEK1p
         fythEq4hHOf+csJeasNwpikcx1JoR6NsVcRcVCe82AstWYeAPleMjFiW37ED11NkgT
         4XPHmVPD2Rk8zyQ9vfw6sb/jrx0SfDKwIZa1cMKo1i7cyjW1BdeiKwdT3I0Ka7Iy8E
         leB2Q3gj0Ks94KZnS++lt53KuHvEu4m5BgYmA4wDqmsRieHj0JNMA2HYf0ZK9R8lY5
         CQGM86pLaVVZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 57CBFC43142; Wed,  5 Apr 2023 20:00:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 05 Apr 2023 20:00:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-kRDJ0OvezW@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #304077|0                           |1
        is obsolete|                            |

--- Comment #325 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 304087
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304087&action=3Dedit
Asus WMI for nct6775 v6.2.9 base (2023.04.05)

Add more H310/H370/H410 boards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
