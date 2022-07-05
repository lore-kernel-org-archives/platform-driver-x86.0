Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC888C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Jul 2022 07:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiGEH7e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Jul 2022 03:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiGEH7d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Jul 2022 03:59:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0753F37
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 00:59:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 815B3B815FA
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 07:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E88DC341CD
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657007969;
        bh=E5PXYF36HqcNU6rFnOBH1mKNO7uLz9cpKyG6J6F5I3s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bx5H+zh6K6z86UShcePoAxEnhQGLfv9EUFaZAVqfLBm2UvM4EocyiCFu4kZdsqkvk
         xIchfAUdkjTHOMOCXmZcdPJdWGWOXPYfcy+KZ6cDizKGDHHvP4rpkhLNirMMZ42PFy
         rq02ql/xmaoeUl83H24jrQSP1SK2jTSsFppqcL13RYYko8zEpR4SQO4U/rekw/2Xwu
         kLLaU8Zg4oDVUeqd9m8Hpczs3hgYGxtX+E4whO1/X34a1OOiGa9rFUJ99Oym4BSRFt
         pxiOFtjsl12HE3PLEZNDn6/jM7llMBCmj49m43HqrqVrEhco7LT1HGd0PvopTZfal2
         pzOcPGsFweSrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0E4BACC13B0; Tue,  5 Jul 2022 07:59:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 05 Jul 2022 07:59:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-68CC2vyF3u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #48 from Johannes Pen=C3=9Fel (johannes.penssel@gmail.com) ---
(In reply to Hans de Goede from comment #46)
> Johannes, can you please test the 2 patches which I've just attached?=20
> (these replace the 4 previous patches).

On my system, the two new patches are working just as well as the four older
ones did.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
