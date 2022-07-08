Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C29C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 07:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237224AbiGHHkv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 03:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237191AbiGHHkv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 03:40:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5369D6B25E
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 00:40:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E307EB824F6
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 07:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88021C341C8
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 07:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657266047;
        bh=sh3XUzbNTF/BQYSz1Q9L6VA7vuXkW/S5ogjqMjiGB+4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CEK2VuLiU/5ufTUZnUIARCduTYQtjxTgnrNO7cZ3UuCX4vPHZYgI4q93FQkdiXPE7
         MGaxDvCKkp1FN2v0G3g9EwVhBoPQdg0JE6CT0PlyovzgLXWT3habPkSl8nAkvTJh4G
         eI2V4yKyxu1FaidgqUCqpInoIRiDgs5DZkHJN2o0s4hFWlo7UY5WzHtB93cXSEraj0
         DyHT4UaXErx7FpS0BP1F8TqrUUIOKPmhGcmDm3A+Bl0Kqr/VsdBjVz4ca9b5G7tg8t
         jRZvC1vrnG/OAma6E/BBll2mh2P0m0zHz85rsG8Y0jq+zz3yaWY0prMife643CBKyi
         8EM5dTNWq7zJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 60615C05FD6; Fri,  8 Jul 2022 07:40:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 07:40:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-fxK0eM99dw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #5 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Okay, now you need in addition to the above replace -ENODEV by ret in line
#2488 and try again. (I will send a patch upstream for that, but it won=E2=
=80=99t fix
the issue, just helps us to debug)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
