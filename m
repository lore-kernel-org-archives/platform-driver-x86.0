Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DBAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 14:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242311AbiDKOIa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346942AbiDKOI2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 10:08:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA04329B6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:06:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AF734B8160D
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 14:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E8EAC385A4
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 14:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649685970;
        bh=+SYYRwK1aZ/58oOmn6X/rajJvW9q9vkjVsdC1u+GdcI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JBokAwzE+rfVPeTsCskNindFDzVgdayOI9LGrCh00wwofjaMOYGgb+0uuxWGGTzL5
         PF5/Ha8FQD+dcozoj3xE8DJ7K331cwi8zPLtOKI8Wfgg22STXVmqgXHjvDFformthc
         AsYDapt5dR8J28SgMGHw4QY8Tz93NOe41nCbtnLnTmynHc7bJvCqAXfqm6L87uCBE/
         hxP3WSuUnuYauio7+f2l2ycfswnsYsBk7dMDtUeJD0CHb8WTu2PxxtAzcWgSr0+VfI
         s2GAXgu6sbgq/XhgyEExGTPG/2+T1A/kb59ron1pakc+UHp7oUm3MkjT/QVgH6uB6I
         YlDG+qSBx0UbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 42178C05FD2; Mon, 11 Apr 2022 14:06:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215825] Dell Precision 7750 - can't change keyboard backlight
 timeout and brightness
Date:   Mon, 11 Apr 2022 14:06:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215825-215701-TWFMOe1NHR@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #1 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Error -5 is -EIO which means that the firmware interface for this is not
behaving as expected on the Dell Precision 7750, likely something has chang=
ed
in newer Dell laptops.

I'm afraid that there is not much we can do here, unless someone figures out
how kbd backlight control works on these newer devices. One thing which you
could try is to reach out to Dell themselves and ask if they can help.
Typically Dell is supportive of running Linux on professional laptops like =
this
model.

You could e.g. try emailing Dell.Client.Kernel@dell.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
