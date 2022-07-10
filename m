Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA697C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 15:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiGJPaa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 11:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGJPa3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 11:30:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB3A10FF8
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:30:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC1216121C
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 15:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 409BCC341CB
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657467027;
        bh=cJ2VuCFQycvP9irwU0rIqW5FWIYAjzYSs0DTrvlZ02Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OuPBPt6MSL+EzD1NZf/bk2vd6NfXXnm59p6kEyxRWJGGclDEnv7ayJANFPyqJI23M
         6AC11vSXItTBhEniOUJe7SQg6Xedid6nHi+6sDydlJ86fjk9LjCWKVcQggMxLLz3wd
         IjFrMd1l+//ut7HypbyfWuYaY1/4lU9P0S4qKnYWm7ML29OpUvFQ1XY+EkBxS3FQh6
         WeovDL/SzqCNDSZZPHyrKwPapN1gjfzTcQagB1HpuqgEy/ktQAd6RswSdGObfRgOpt
         Z12XdY2BBEi+pB7oCtXCLhG5Khp9fjTK/nHzeIeKsmTgUEXz738Xz5Rfr18lUTLrXN
         XU8IfNKirBFCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 30C6BCC13B5; Sun, 10 Jul 2022 15:30:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sun, 10 Jul 2022 15:30:26 +0000
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
Message-ID: <bug-214899-215701-PnHqayKs6S@https.bugzilla.kernel.org/>
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

--- Comment #49 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Johannes Pen=C3=9Fel from comment #48)
> (In reply to Hans de Goede from comment #46)
> > Johannes, can you please test the 2 patches which I've just attached?=20
> > (these replace the 4 previous patches).
>=20
> On my system, the two new patches are working just as well as the four ol=
der
> ones did.

Thank you for testing we are discussing how to move forward with this upstr=
eam.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
