Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B74AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 18:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348993AbiEFSHK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 14:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbiEFSHJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 14:07:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC16562BDF
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 11:03:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6032B838B8
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 18:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63B6FC385A8
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651860203;
        bh=FDoUQ9KZ27fbYS2IFphO2zdIe4a9qkK48PbFyV0NoCM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gfzFDcIkJqwcNBFRMYbC5gNCCayqgIKNjZ995R0tomM9KcKrSfTNhjkNii2OMROWD
         XtkcUCUWcWBz/zqEWkHscwTQoOYwcYHGcDuwqZ552a9ht3aZL+5Xy+7yLmaN6caEfh
         vB8EDcWZWpEo5Zo8xjPiHeWFt5aql4dt4oMG3S3g4sCdVQ8UBr+7/J8hMNEDDvHdni
         lFSSKsLCITcDhIPZqxPOeEeSh3ZfvYy3FgH/ClqGN35edXQR4VxAIDV/taQJtKFHls
         OBoyy6dFnPg1xVWXlurZpTbzLgrbKvNkahoRpKn7TZknNxPl6HyaWsjL9a3o7k/ufP
         +wYygolt8Oe3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 52CEDC05FCE; Fri,  6 May 2022 18:03:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215387] s2idle offered even though firmware is set to deep on
 Lenovo P14s Gen2 AMD
Date:   Fri, 06 May 2022 18:03:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution assigned_to
Message-ID: <bug-215387-215701-7j0pH7BUJi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215387-215701@https.bugzilla.kernel.org/>
References: <bug-215387-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215387

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX
           Assignee|drivers_platform_x86@kernel |mario.limonciello@amd.com
                   |-bugs.osdl.org              |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
