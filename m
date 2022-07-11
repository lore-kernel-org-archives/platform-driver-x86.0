Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D1CCA480
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 13:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiGKNvw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 09:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiGKNvv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 09:51:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13E461D48
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 06:51:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45855614DE
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 13:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0F10C341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 13:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657547509;
        bh=yIt3dt1+jmQKzxWi4IRDA40hYA3Yv/XzJfG4SUo6kzQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nxypSeZ6QoasPrUGu4MMVEW0KI/eG9hzk+Yhxa4ZtMuTaH/TqJvSRqzXRFOU3HqNm
         /TrVSIC2XLx1INOXMH8OR8hydsTcmO6PKJrnKIJp5SIpwyVbskXJRYxcd1sG6IAOW4
         fSq0qSrG60HVL/nRza2wcy+PSBjrH27dhg8luw8Viig795hZAuwuOlQLHabPnzDPUi
         wD+O4NoW6WbFO9UzkbleCmtNWhYgR4nKBu173SqJ6LPftwEmE+BXCzD78EAv2dmSmV
         XWn4reTHvcSkLtlQ6FFuh3BUIZbVQsVHJjAgUU3x+sOOf/E0RxOIo9YE1jNRTgwKjH
         L/C9HCKjV6mVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7DEB9C05FD6; Mon, 11 Jul 2022 13:51:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Mon, 11 Jul 2022 13:51:49 +0000
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
Message-ID: <bug-215993-215701-JqcDYHX7AC@https.bugzilla.kernel.org/>
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

--- Comment #17 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Supasak Sutha from comment #15)
> dmesg after apply andy's comment#13

Okay, can you comment out these two lines:
https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_hda=
.c#L423

(Note it should an incremental change to all others, as you have done that =
way
already)

P.S. The SPI fix is on its way to Linus tree (accepted by SPI maintainer):
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-5.20&id=3Dcdb0cc9379f1b4fa5ea3e0492bacf8008f3f4e5a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
