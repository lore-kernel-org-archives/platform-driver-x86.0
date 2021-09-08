Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2426C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 22:16:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B680B611C6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 22:16:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbhIHWR5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Sep 2021 18:17:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229997AbhIHWR5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Sep 2021 18:17:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 983096117A
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Sep 2021 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631139408;
        bh=3ZP7fl7cwor1TmWv0uAldx95LaiWl0aO71NL9LST3/k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dfQgXyV5PWFm/TCRsTU3qfb4TuJ26SlBIe7Vme4gxIYAQuvx5UcPB9k3jp1Ce0yS5
         DgaA5e/WLDl81qEzTf9ezh/0UPc75zpLjl65w9agBKqxrpSZfyPg3JVkd0hGH69lOj
         nNDZmhzEPFx5BQorUZ4ffZKZzwSoxg+fUxFPd1fM0/Jug5391NM63l2uk62xo/bVXX
         oFyKw7l0NYptxvlrvc4/R3/jiIDgKzoH9YIgblHTEu+HZi5m6DlaMw+FP9ouY8HCtV
         adzDzSu4+ZJXbu0KN5Gt+HzxEAF+jJywzx8Aeji7kerVllqGAOf5FAjiVbMQDs42Zd
         U2/Sg5eTqLaWQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 08 Sep 2021 22:16:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: napalmllama@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-X8IIVZoHXi@https.bugzilla.kernel.org/>
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

--- Comment #99 from Tom Lloyd (napalmllama@gmail.com) ---
That all makes sense, thanks both for the clarification.  I can confirm then
that the patch works on my hardware "TUF GAMING B550-PLUS".  Good luck gett=
ing
it into the tree :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
