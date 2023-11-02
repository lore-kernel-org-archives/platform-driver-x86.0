Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DA9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 14:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjKBOqV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 10:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjKBOqU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 10:46:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CCF133
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 07:46:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEFA8C433C9
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698936377;
        bh=GAzZF+OQeAKwjjDSi/vCoFE4L7wCD7twK5f3LRnTqz0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gxwcf5lLyBZQM1uqZ1Ae7RG4NPIxYqzeHWNCo9GKk8Na7+zudrL9efCTz/3w3uigA
         xEdgzW1GWycMkpmxrCbBBbkIKZ1P5Z0Dx0nSs3/FkqGUJJ2gNO4tm9SwBK6dKqSO9B
         LRDbSijVxcGhGaLyRr3Z51ydRfXoSQNDYheqgfkuv33JliBbWyb3eTFB6haiB3ZOdA
         Cf7y144l9rmenOHOvLewX2NcdMjtymQaz5cVGGKINn+x26b0ZKPUq61v+qxdTJstT1
         Lv2YOEuDCJ2hNyv69OwqASRqrc66VPoflqTVrie1IbcB+SU78JJr1RNK95G+i4BoNk
         fhS85kwGlmwpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C8BE0C53BC6; Thu,  2 Nov 2023 14:46:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 14:46:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-J3Ux2TyiBr@https.bugzilla.kernel.org/>
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

--- Comment #34 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
You'll need to scroll up and look at the error to find out what's wrong.
It's not in the tail of the stuff you shared.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
