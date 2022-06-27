Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17F9C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 14:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236956AbiF0OXU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 10:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237273AbiF0OXN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 10:23:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E912213E38
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:23:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 97B1BB817CF
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 14:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53998C3411D
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656339790;
        bh=SweuaR17cvVODV1VfuMNfwffh5UJhApS6+zNcz4C3Qg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jsEtvgp2FNbg9g7L/D7Z3yoRfHa56HEmOjiuLOd5Vq7hY877ppc2BEb8XooIxLUVq
         J8HYOUxRa5y+qDqpTRseIm4AbZpRpt9UEtlbqXKirRY833J53w/NaTtxdLDg9svGjN
         0Y2/UxsEGD58F8bcp562/4fv4Rtpy3evqZPSziwle9WVYFzkADIAnMxR2HYQYwQEnU
         NvKlHWhzG2H7pBqOZXAKwD45c0bdKi73YQO6AD6/t8hYZaHkaWw+mEHy0haHtyd9ax
         lU4QOd0eC9aNBasobEvvwjzGg3RkfcRj6UA9uptmQK9kC0HNW3JQCpEPvyw7KZ+8IO
         WBLnZrvL9Gn+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3C905C05FD2; Mon, 27 Jun 2022 14:23:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Mon, 27 Jun 2022 14:23:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213297-215701-WpZMCEv9ht@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #12 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Luis O from comment #11)
> Created attachment 301264 [details]
> dmidecode of the ideapad 5 15itl05 laptop
>=20
> Indeed, it does work! Thank you! I don't know if this is ok to ask here, =
but
> any chance for this to *also* be included on the stock fedora kernel?

Thanks. I've also written a patch to update the DMI table and I've added bo=
th
patches to the plaform-drivers-x86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/log/?h=3Dfixes

I plan to send a pull-request with these fixes to Linus soon, once this has
landed in Linus' tree these will get added to the 5.18.y stable series soon
afterwards. So these should show up in a Fedora 5.18.y kernel update soon-i=
sh.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
