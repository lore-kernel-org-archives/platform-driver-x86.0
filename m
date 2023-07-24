Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA922EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Jul 2023 19:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjGXTvH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Jul 2023 15:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjGXTvG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2023 15:51:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E420DB
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 12:51:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D599561357
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 19:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BF0FC433C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 19:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690228264;
        bh=qOdUfBVuAulGxIkpmgl/vZQgvPs2g8A0g6vOIm5p5tY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k69/jrgwxe7rILT0Z5750T/4cXwvdXWb7HkFdM5haDE/Gq63x93myNi3Tw+UlPXEt
         I/eO9Zg/UbmOFp1SqDugq6tT0XlchT5AUVIkUP+i4zSwLfHNsDhHMLsOmMxEnnAgfR
         mkNj2G/TxU7LTa/KC9knRW41iWfjaAzfu+QfJFEAIQpZ4wY1Bd/u30jfSXKc20XT/f
         U1e+C8cMHAijGKQZWTHPTzqae4XszHCW7FKAiD24pCnEPsbsNWXQLPoFItrJk/pIKS
         gbqKlL1Kmi+HA9/AIXqQUDCNpEFO57uMtzpqQ8RGZVB84ZOvrmW4IKMPVinNzTkygX
         UEkV1y/OhEnmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DECF5C4332E; Mon, 24 Jul 2023 19:51:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Mon, 24 Jul 2023 19:51:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-rxKhEVNv1f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #13 from Artem S. Tashkinov (aros@gmx.com) ---
Thanks a ton for you help and replies, Mario.

Applying patch to Fedora's kernel has proved to be an insurmountable task f=
or
me - I've no idea how to build it: rpmbuild --rebuild fails with a ton of
errors.

Let's get back to this bug a bit later if you don't mind. I have no mental
strength to build a kernel for my laptop just yet. I've always done it for =
my
desktop PC but laptops are a whole different beast.

It looks like the provided patch must work with 6.4 which makes it easier f=
or
me but again later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
