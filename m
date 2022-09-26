Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2ABC07E9D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Sep 2022 13:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbiIZNQt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Sep 2022 09:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234879AbiIZNQX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Sep 2022 09:16:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA6D60514
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2022 04:44:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78959601D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2022 11:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D73E7C4314F
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2022 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664192572;
        bh=0/77N75cm3M0Ql2ctuHuuNouAcM6dlld7x+CoRACrZs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uccrQtd/1cMv9Gaxn/Bhl3RCKUYLWQ9f7dLw85IW8sJDaQa68P68qumMDEcTwOGlF
         mZtHZbF39yHJmFYYypMXxS6EdusSUqxVWGF1zv9zjOr0fzGWT6xdIY49/TBRNzwcmc
         tkrnC3Cpu5/AlqvOsYYoY+xDuMy4Dvi4LzUUVvS64m+U/ZrdwI4azzvqhRF0tTbpvY
         PsdxtTpcbeQVILULUNxWHlwZA76wMGPN85D8kT6WcvXS9ZjCefjYCx+9oFogyiU+Bp
         I8YCe7gEA5VDSIKfWGUhWkw+AKd/MnEnNacFdxliv4tjWqBNSlrx3gIy12vkVYPzSu
         Dlx8Owo/iOFsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B3EE7C433E7; Mon, 26 Sep 2022 11:42:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Mon, 26 Sep 2022 11:42:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: s.fabri10@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203191-215701-9vd7PfLost@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

Bhack (s.fabri10@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |s.fabri10@gmail.com

--- Comment #11 from Bhack (s.fabri10@gmail.com) ---
I can still confirm this bus with Linux 5.19.6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
