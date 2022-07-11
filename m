Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04CCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 13:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiGKNza (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 09:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiGKNz3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 09:55:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F5657E04
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 06:55:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D0CC614DA
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 13:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B627C341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657547727;
        bh=v910ObWREsUxS8CDgQBsS45m4v4Ns+zMVXEvwIbw0t0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XFuibFnAQ7JbhpYgCpT0L6eCXjIjM2+QuBaA0yUSCiE/l8gbpaM2PXVEYJIutdBAp
         Kl0XPsTdS0sN5My3RhgZNC5RSP8LI3WqApAnvpcWg26E3IiAMP6X+XNaWEt3gj3WwJ
         s1jpvNxuio1zaseIj2AWO4s1enNV9WZVzDovse5ngQa7I+Hy4cYIJcSzQ+SkMY+ii2
         0OGo471VabG9sirKkH8ldgT9jvIoNI5eKEpzg9wMUupy47PCq1uwhgrU5pCgsRyHw4
         M66xjuD8cpoD6M8TB9mOfICmpepkkloRM5fzjJOXIWlbIyPxze8EfyDd5NVBeuySKU
         oAKKkhdFY7qpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7375CCC13B1; Mon, 11 Jul 2022 13:55:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Mon, 11 Jul 2022 13:55:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-MzBsKavlJL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #18 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Andy Shevchenko from comment #17)

> P.S. The SPI fix is on its way to Linus tree (accepted by SPI maintainer):
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/
> ?h=3Dfor-5.20&id=3Dcdb0cc9379f1b4fa5ea3e0492bacf8008f3f4e5a

Oops, wrong commit, here is the correct one:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-5.20&id=3D9c22ec4ac27bcc5a54dd406da168f403327a5b55

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
