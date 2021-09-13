Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9334C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 18:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A78E461165
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 18:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346430AbhIMSJP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 14:09:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:51484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235056AbhIMSJP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 14:09:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C4586112E
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631556479;
        bh=nUet55smiIdAA7L5l/8qhGFDfaU8aDZAHPuZkGCBEDE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tcTiuQgGG/6Dmw4R8I3j2AeL0Wgac2UNHkgEut9567z0/4U/3HmI7hdYvn7xn7TBo
         SluXnM+OtgKUENfHaGyey4w9u7Uumj/QAxgqOu0LNmzsWYhJ7oKxL9/XoWyIIbNuND
         w2wV8Esc4/kIUUZunB1Imgcl9wjarNxz+RZvBl15rQNvsm4IU0S18unISORbTxspTC
         tdjWfVl+r071hGIaaXsZUGrTkSPnzZh+0zJK/AIcsC1E1opuVV5KPC+1nuCIFAuSIN
         W93TwWk15O1dzuPqYoAATxfDryvV1FzPs9EB1XQ0kZen3pSq5aJWT9M/mK9Njp9bfw
         6SKEGmRZjbI3Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 13 Sep 2021 18:07:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greenbigfrog@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-tbpAOHyAdB@https.bugzilla.kernel.org/>
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

--- Comment #103 from Jonathan (greenbigfrog@gmail.com) ---
Hi,
(oh. Could've put my comment in the attachment comment... duh)
I applied Denis Pauk patch today, (how I did it described in
https://gist.github.com/greenbigfrog/26f948c9d86f1cb2fd23bfeaa23ca068 ). Wh=
ile
I'm not sure if I did everything correctly, I can see nct6775 pulling in the
wmi module now, so I'm fairly certain I'm running the patch.
And yet I'm somehow still getting the acpi access warning, and no further
sensor output.
Did I do something wrong?

System: Asus TUF Gaming X570-Plus (Wi-Fi) with 5600X

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
