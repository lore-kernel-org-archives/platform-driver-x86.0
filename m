Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF9EC74A44
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Mar 2023 08:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjCNIWF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjCNIVm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2023 04:21:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA95984C5
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 01:20:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C0C5B818B9
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 08:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 777B8C433D2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678782026;
        bh=cs02UyB8KDl4XIkg7BihwYaX9HfhFNOvKAUjIs4b6wA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Su76XtaU2/8eunHU/PQWn8gUVb4y4UZgoTluSj6R7gGeyMBVg+7lHJ3awIu9Kl+wj
         WnCzI6Vd+QqVEepkOkx0Bwyvq1Jhd5L7RoMB+T1h1zR9kRdxZqW/amvbTxQf4WDhnj
         NNHZwEQNVqxMnoXzNXgz6i1rIVdGiE6UOhXCPNE2TxDceNdJjj4b57jSKTzisFujbx
         0/R6Z3FsH90QvpaQI/GhoWFHOpmNtaKBscx319Of1BxTLbIH4GPM4uBXWpaHkaeCZo
         pNsJhWhrlArTzce18POID+2bLRw12/rrfNhM/tv3rk8Ms9ZMhxUNWOj3LzjNH+sc61
         8aslGhXuUhNgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6887AC43143; Tue, 14 Mar 2023 08:20:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Mar 2023 08:20:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: barfin@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-OJgPJRWLAc@https.bugzilla.kernel.org/>
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

--- Comment #306 from barfin@protonmail.com ---
Created attachment 303946
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303946&action=3Dedit
ASUS H97-Progamer sensors output with acpi_enforce_resources=3Dlax

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
