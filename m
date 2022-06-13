Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683EDCCA47C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Jun 2022 21:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345190AbiFMVbT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Jun 2022 17:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352911AbiFMV3L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Jun 2022 17:29:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100119F
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 14:23:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9645461343
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 21:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05C67C3411C
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655155428;
        bh=ZfuNQ6lGxNOHx00wsaoKpf8OPh10/h00UD7ilxBTZX4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BlKoFQY2H5ZCOo68QRRAJbLyLdf8KPMZ4nHOZ1sqZDvht7OTHm8hasywILcJ4nvDK
         7uvMNqMHW7ZPMwreo73b4qHtWtqb9BT1GJDfk+xLmYFB+f7oQJAi9KbJjGpxZMEomB
         9f6uePmabRZIM/YzdvVJgWV3LISAKWcxnfKEWME1z3qFj5TlakfSv2t/DQs6T9svzX
         /3v5Sd8Niqbx42fv4MFLwXxQexQWqsq1xmUVTTptphRoFRVU3de7PMi8KhWXct6E/Z
         y+GmMbinmSllQf/5Yp9Pih+LpVrM2+39uE+BmpQcJcWcoSEI8EwtELIdS5D5ZWqgYI
         /yqNjnp5qUgDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D2AB8C05FD6; Mon, 13 Jun 2022 21:23:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 13 Jun 2022 21:23:47 +0000
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
Message-ID: <bug-214899-215701-r1daPOgvqa@https.bugzilla.kernel.org/>
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

--- Comment #34 from Johannes Pen=C3=9Fel (johannes.penssel@gmail.com) ---
I am afraid to report that the patch does not work on my system, even after=
 a
full kernel rebuild:(

I have also tried simply replacing \\_SB with \\_SB.PC00 at line 166 of
nsinit.c:

                status =3D acpi_get_handle(NULL, "\\_SB", &handle);
                if (ACPI_SUCCESS(status)) {
                        memset(info.evaluate_info, 0,
                               sizeof(struct acpi_evaluate_info));

But that did not work either. Neither did removing the code block that
evaluates all _REG methods.



Glad I can be of help! Regarding the mail address, I'd prefer
<johannespenssel@posteo.net> :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
