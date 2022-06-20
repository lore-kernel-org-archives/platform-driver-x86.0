Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B759BC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 15:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242656AbiFTPLW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243092AbiFTPLH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 11:11:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABFD2DF5
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 07:59:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0C4E2B811CB
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 14:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87BFDC3411B
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655737178;
        bh=1ZKc8CjhbJX7zAJq4+t6uWvFbARAjQ40HWmpgJII4w4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LO4lKxwdDz/M0bh3hMA0y6/TP7Sj4x0LqZf7QY1fBJy6xwfGRvLPZnDPn5Il8yU8Q
         gQy94oFuEAKBB/F0bwJ2iunj7kl7DHWsAuBWuCzZs+YdiXCDI5TxcxRZ+NWOctSxd7
         2gpIbyYXnYopjHwf9AOoWG2Q6pWev/YfLiD62w2vvPXzpj0Q5vtiZ7MLoihIlooIqH
         1AsmEiFNxCmeiKn6mWXKeb0Y7EmiWBV5lIcNAAInNgzhvAPrEdVAfmgdi7baVx6sHD
         i3T/hb5lrJITKjdIJ5ynEQW78fBs8fQ717hTZUIjBF1E353fNPiuYtbi5y8rXmrXLS
         Wb1ioInrMSO2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6AFC1CC13AD; Mon, 20 Jun 2022 14:59:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216150] ideapad-laptop exposes only two keyboard backlight
 levels, instead of three
Date:   Mon, 20 Jun 2022 14:59:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216150-215701-kfs1RTnqqL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216150-215701@https.bugzilla.kernel.org/>
References: <bug-216150-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216150

Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pobrn@protonmail.com

--- Comment #1 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
From https://bugzilla.redhat.com/show_bug.cgi?id=3D1979909:

> Hi
>=20
> This is a limitation of the interface. The device I tested this feature on
> also has three keyboard backlight levels that can be changed using Fn+spa=
ce,
> however, the Lenovo Vantage software on Windows can only turn it on/off,
> because the that's all the interface is capable of. And since I based my =
work
> on that, this limitation is carried over to the Linux kernel driver. If I
> recall correctly there is another interface that has multiple backlight
> levels, but my device was not compatible so I didn't attempt to implement
> that. Curiously, the backlight change notification is still sent.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
