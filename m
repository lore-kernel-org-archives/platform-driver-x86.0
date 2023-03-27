Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF86AC76195
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 14:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjC0Ouc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjC0Oub (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 10:50:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FDD30F8
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 07:50:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E1626612B1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48D7BC433A1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679928629;
        bh=23DHi+iYUQgvx4fC6y0qTubCXvDYcg+LDQ83tmbA3GY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lnSLwEYN6ue6uULVdBt9PWxugLttupdiNWyJCj1owgerYf5QbdUs65ZKTigMSaP8E
         8Poc3B5ZYtcPoGhVxFCS7TaJJElMaEV3gX1jdI9q1Ngg138pYcdt7yQ3xUgeZeHQac
         4mJlPBwPBkBP7ISLJ1MpiggluhHAcxdlMExDoIdhuOVa+ap/+21cKTIa2v6uLsuSpC
         tPxOPih00bvI8bLFcc2k4V9hlSwU/5ikTiYmkgbe8uodEMlg79uBAbkOFMfbfeWYSx
         flM4i8X7Z89aCzWnTR17DSHJzyIIIlSgYVCSLIyTwfUAtTxTj7cjfuAH8MwMAwvuGL
         5Jv9LOcwYtNXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 28096C43142; Mon, 27 Mar 2023 14:50:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 14:50:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-Icv0kJVnAa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #24 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
(In reply to Hans de Goede from comment #23)
> I did not see your earlier comment, no need to create a pull-request sinc=
e I
> just already did so myself :)

Thank you Hans!!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
