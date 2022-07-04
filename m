Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E39C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jul 2022 10:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbiGDKPI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jul 2022 06:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbiGDKOu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jul 2022 06:14:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAA8E0EC
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 03:14:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EFDC1B80E80
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5542C341CE
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656929646;
        bh=WF3KH8eDoTkUVfsc7L0fhbbXeXasIO0p/WjXjYvzOsw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ujbCztxwgliA1nzVJDTgSUDqw8nyLuRqvOn1rt1WH1TczPju8U+7mupqR9/Kpbwfn
         ehqSBby1sr8NAOf22iPqz0zQ6BIrqG822BqIvUhK8+Ewq4d0M4QaWdftCAJNqwPC7/
         hpdgHT6twkdbRSIny3CCqO9Xiz8jvqMiYncnQGaXd88In/DL07DYxdQeFCrEydIc2v
         HaldyT7BSPBoMrgRsKpMK9/x/CNmNNQSpQUMycWZdmcGqSQXzGWyV4XSeP7Emb5DAu
         6p/MeLVwS3irxECHac1skvXTOjOzBbLmP+TMpc53F+c4neakIkFEDqGBx2Hfgd9NbY
         /HV6NNQN85OwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 93086CC13B1; Mon,  4 Jul 2022 10:14:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 04 Jul 2022 10:14:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-rtjEFeFOrO@https.bugzilla.kernel.org/>
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

--- Comment #46 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
The Linux kernel ACPI subsystem maintainer has requested to solve this in a
different way.

Johannes, can you please test the 2 patches which I've just attached?  (the=
se
replace the 4 previous patches).

Philipp, if you can test these 2 patches too that would be great.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
