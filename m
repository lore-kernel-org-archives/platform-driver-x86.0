Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF33C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Apr 2022 21:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbiDIWBK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Apr 2022 18:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbiDIWBJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Apr 2022 18:01:09 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36681216A78
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Apr 2022 14:59:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 36745CE0DBE
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Apr 2022 21:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A614C385AA
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Apr 2022 21:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649541537;
        bh=DIbwyVKcmhoseMnXi5G0yi62il/fpzfnR4l+k+16r0g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fMRWLZO4bq64YJG/z6tTpcDkwy397a1Bw1a3dnF0NEq0Yvym9rZPCfF/h+biOmz2f
         fa0zb1Z5KHXPBTzMTi4HuAHmdGZosYaNRURTifTJajpxWkQEqa4nD0+zQS1ERksa+9
         b4x1y17g2ClDinb1xfL+IaFIfP9CLqtttibz1h9rkmS+XMpbtBeRGJTxVO4PNopRBg
         em/IDD2+vlgESmbrOQJsvmLlvUpha57Wtw+UMjQZWwuQHhcGf137dlZ9QhtljEqz3U
         VNzPy/ipa08nNBgpYLeSxLnS9K57wzmt2z3izKESQEQ4NpvZLmtPIRYrDJqMdNb5aB
         8jC7cwQdXeNIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 66207C05FD5; Sat,  9 Apr 2022 21:58:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215825] Dell Precision 7750 - can't change keyboard backlight
 timeout and brightness
Date:   Sat, 09 Apr 2022 21:58:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bp@alien8.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-215825-215701-EGF5sgd594@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215825-215701@https.bugzilla.kernel.org/>
References: <bug-215825-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215825

Borislav Petkov (bp@alien8.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|platform_x86_64@kernel-bugs |drivers_platform_x86@kernel
                   |.osdl.org                   |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
