Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A91C38145
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Sep 2022 18:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiIGSnK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Sep 2022 14:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiIGSnK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Sep 2022 14:43:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E09599274
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 11:43:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E85FCB81E07
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 18:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AF3DC433C1
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662576186;
        bh=Ipixr4x8kGDMRP5mGKjCvIigjNY+qud6LlGxMt5Kg8A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VsJ+DJCHOBN+TmOwHi66et/k32xsYfL77q0cpB7A9MhvCZiwDJxaerThuRcG9QyJ8
         itG9BMrDxrKeBGYjJIEz/i73XFe/cgsSsfh4b47ppfUt+YYLEZRpYa59TDYPxWBtE6
         vsCFoxBj3JRJ2wFO4hpmZQKePoh/5Yj+HQ0daH5hm52eyOBKIsVNmPTEq/3XwtwoCL
         qZ+rB33X/NDijYN0Id0EPxKBxyQZG9yAdvXDsGSOuoD1HSu4+j6O/mOvuUk/9DoNZG
         NTBBmDuEU5gIv+KqH6UbuoZWHJWBoxBoQHijxqbcj/OV77m+Nh18C9uiikhmY20dIb
         pMv+s4sjQNTyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7B326C433E6; Wed,  7 Sep 2022 18:43:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216460] lenovo-thinklmi doesn't export a 'type' attribute and
 doesn't populate possible_values properly
Date:   Wed, 07 Sep 2022 18:43:06 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: markpearson@lenovo.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-216460-215701-z7yXdiCKkP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216460-215701@https.bugzilla.kernel.org/>
References: <bug-216460-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216460

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|drivers_platform_x86@kernel |markpearson@lenovo.com
                   |-bugs.osdl.org              |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
