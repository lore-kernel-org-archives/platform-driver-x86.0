Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0CFC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 19:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiGKThN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 15:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiGKThN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 15:37:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715394D80A
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 12:37:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0A5AAB811B6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1955C341CB
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657568229;
        bh=BDwZNkasv5D5sFUbcCLoiGiBtLfgYACxxDTLj5FlfZ0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NnNZbhjWdgTNUL8SPdO7IK2gAIJtqV9RIVZwpjPJdOHvGBuo5fAxoDAG1S8ezTRCR
         TH7ib+n02VT+rtutbsICdGbkvuAOzPyB94Bblu3tabeyVdo8MNS4AmCNrB0/K3TfBX
         Po33vpzHMdGS8xBMs9M/eU8DADIQ3hgdQHvsupFpFeWzxEVvo3nDcjWaA/Cbs/Q0qk
         chHPXvRZu5OWt5C+VzFJemunE8RcflDsmiAyiE7j/o91jIPOJneRwRzWeZLdfC3w5s
         /djibQaX/0gAsUUmnRP0csz8NvRkDIvgfOgwgzsXMWE0ge1lqG9/IlZ6KqxYGxCl/u
         AbqNw7cziK/Lw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7CF19CC13B0; Mon, 11 Jul 2022 19:37:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 19:37:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-s4gZpqUryp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Try using this instead:

dyndbg=3D"module pinctrl_amd +p"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
