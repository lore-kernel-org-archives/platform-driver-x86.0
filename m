Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F456CCA481
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Jun 2022 19:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbiFZTen (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Jun 2022 15:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiFZTem (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jun 2022 15:34:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038B555A2
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 12:34:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B1B70B80D10
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 19:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DD3CC34114
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 19:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656272079;
        bh=4n1/LK78tkjdu4+4QlR2B/wF/1vqrfE2/6iv622zAGg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RSJ4mnr7OXmUmccaTJgeYSZG+hMbnktOvoz+m9xrqUumpkeKe18reCyROK0704PMk
         WBINj8AWR4JRuXZIdvjYXkj0aCoO1mmxQj09rdttc5e7CjRnlaYMLpPs5PaVczmeox
         cYKgJNYYuQtutpOFhynP6xcghBjdgf3J4Qt2Cq0Yu/zvLwsDrA0jjHkVC0NfY+hJn4
         7YUfAkEwoWFZGdvVm0gz8eoUt7afxh2dbur8Z+ZzTxIZ6kl9yGynTdczYLD5TZ+hHu
         hDAvmN4C2kLgay8YNCaXKak+YGGXvOAUSTI6sL1QPKxKoC5u0sgNjx8g3lxN702zXY
         ZzOwSN8GCiUHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 66222C05FF5; Sun, 26 Jun 2022 19:34:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Sun, 26 Jun 2022 19:34:39 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216176-215701-DcOmjrjkLW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #1 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Link to arch wiki page?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
