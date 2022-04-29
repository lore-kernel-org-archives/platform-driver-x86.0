Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49DCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Apr 2022 16:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237502AbiD2Qdk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Apr 2022 12:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379569AbiD2QdN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Apr 2022 12:33:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221B9DA6FA
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 09:29:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C133BB83697
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 16:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A03DC385A4
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651249790;
        bh=OumnbMQh7Fot7HsGHlykKiwcnX/2+YmuuhkmrUQDS0w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IWYnOZWlex/Gya77+zd/1ynX87Z6Wn9ODZfzf9YpOKgN8rv0vCquTEFko9FhCS9+9
         N5vDdn0C6qPTAMROp5xVJpQXhjUxS256E/W921zo5WtrZaAwBUgnaQIe+OKETeMJJz
         ZayqBmV9Br/Kyx7ox3gMkGM0nkQDTBDMc0NW56GK9jQ2YJRGcGB62J7TUIBfVmQGKz
         xBlEOgVqeFt4qRo0DtHhnln0AT/eVle51eP1pjMnCZYusjI3aNtVMnUw24izpIEMYk
         ZanJDReQaOfrQ12/4KnvdYYFrR4ZWgaU0utxZJ2X5gCEDVB4XgnvFqhisyAv5V5p/l
         mcBURv0LmnWiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 78149C05FD0; Fri, 29 Apr 2022 16:29:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Fri, 29 Apr 2022 16:29:50 +0000
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
Message-ID: <bug-214899-215701-9DFaNfZLPS@https.bugzilla.kernel.org/>
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

--- Comment #27 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Johannes P from comment #26)
> Blacklisting ideapad-laptop seems to have no impact on the brightness key=
s.
> Pressing them still results in the same register change outlined above, a=
nd
> nothing else.=20

Bummer, I'm afraid I'm all out of ideas then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
