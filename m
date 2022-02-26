Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA2CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 26 Feb 2022 09:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiBZJUy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 26 Feb 2022 04:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbiBZJUy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Feb 2022 04:20:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0FE263737
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Feb 2022 01:20:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 59E99B819F7
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Feb 2022 09:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10BE9C34117
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Feb 2022 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645867218;
        bh=qWFhvrY7SBe82xUh0n5WOvadl+100QxBNALmmi7Yjio=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fNCyB214SgBpNsgfkwQsEP7Ea28MH5BRQAn55aIgvOzIiYGSQ8Oo7/w3ttP8oa80U
         Vwta6/gBhgo0ytg1ksdmRvLtMz9JJQMZI5p+GDndOtIiUiTnuFORug5UtDWIsNozgR
         2lVFvlLwwc6/mwZKgAlrkdyhJCOPWajXnZ/ikWSNBTtcAz01h48l46+DN3gVQiXEsq
         s05nWlW44abfu1VUfm2DmSvCFbGi+fWhY67/K0cxlmUhISlzPnpA2B2wQLYzzAcPPW
         qxQXowGCSaTan/yu3MwKvQ+DLZvj8HkifqNbWgthmHRue7exstkt1QnVNmVV3eVnpF
         hdXyQerQdce+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 00B8FCC13AD; Sat, 26 Feb 2022 09:20:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 26 Feb 2022 09:20:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-HECghJXl2X@https.bugzilla.kernel.org/>
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

--- Comment #221 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
I use kernel 5.17 rc5 commit 5c1ee569660d.
And my M/B is "ROG STRIX X570-I GAMING".
The driver nct6775 not automatically loaded for unknown reason.
Demonstration: https://youtu.be/NyTqxwshE-s

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
