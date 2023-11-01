Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A407C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Nov 2023 18:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233960AbjKASBn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Nov 2023 14:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbjKASBm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Nov 2023 14:01:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90716119
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 11:01:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 254C6C433CA
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 18:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698861698;
        bh=U9RV87Mv9Fop5uIDmYu7e/WytJq/EYYmvf6WXy3/FNw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZCrDBNNMYkYDJw2lOLRveXK1k1mbj+8qerkYQcsLxOmHXieAJsChLZNs/6QPkVLHk
         Cb21MtJgodDfPbOgNmMw+pEnu5aweBhvMtpkpGnawsD51CMGMyKKk8RF7CWkzyknnJ
         siT2+xnKwKR1VwmPVNbBiL1bZotPfZRnhF9DP+phH7tnx1I4rJ7Rhah5hQJpS8YpPl
         tdNOW7F3VJ868o5v8SDGiwaYytK5Y/ptCE9krZxUPqpZAqTkCf9xeXWUvi8+ArKoeo
         Ks9oqCB7LmMI03gS4JibNP5HfzTHlyTLgVjGVYyDdhasIbF0s/NGeZG7Tbjk4rqlC6
         ZaafDPdhsXSjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 05141C4332E; Wed,  1 Nov 2023 18:01:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Wed, 01 Nov 2023 18:01:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-BQoEoFmmDc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #17 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Okey, I'll try, but could you explain 7th instruction more?
Thank you very much in advance for your help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
