Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED92C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 18:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjCQSYe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 14:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjCQSYd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 14:24:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B29D65079
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 11:24:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1943B826AA
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 18:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74064C43335
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679077462;
        bh=6tgp/odAEUrc93yJW9hxiWJ9qO5E0jc2+8L2JYnQhAk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Nsm4SqQt4k8KBhVhNCO946r76n4iceoUQzii/uPoprgcsYClfCdwir9uX5C5O/ECp
         m4FTwBCs1VzS/9oYJhZOEZlErq2VR9o/o1b/ssAbnIexWFA0VLOTeUEp71KYTPo6jW
         lArGTuGLPWrb0DSRClm9aih5dGxcY/Fxg2RupVX4Yy1h00Jum6b8Rj4WG6G+sfyjEw
         w5qAR2X7zHuctfEoKVTjkQrkF9c17AqGspCIGE8KwfOyAJHhgnW/wZ1v80j1v4pWNz
         SgwHpD0pLQFsDJR6/vUByC7qtDo2vp2SJT4aBFwEtnDCxvUMdr1RoXWgAk/cd3d8f1
         1PqQsYGsAa/XA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 66FF7C43143; Fri, 17 Mar 2023 18:24:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 17 Mar 2023 18:24:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jeroen@beerstra.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-MkSjZFg95R@https.bugzilla.kernel.org/>
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

--- Comment #311 from Jeroen Beerstra (jeroen@beerstra.org) ---
(In reply to Denis Pauk from comment #310)
> Could you please check new one ? I have rebased patch to 6.2.7

Applies, compiles, and works just fine. Thank you very much for your hard w=
ork,
hope all of this lands in 6.3.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
