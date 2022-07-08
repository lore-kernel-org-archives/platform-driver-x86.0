Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6BCC43334
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 23:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239055AbiGHXTk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 19:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbiGHXTj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 19:19:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C017841990
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 16:19:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76AC4B82A19
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 23:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C205C341C0
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 23:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657322376;
        bh=1jyYhfandcygOHEMgUX2pS4FBr+yyfxYTgSzmLq4X74=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NqjH7UcnXyoolLh5ya75w28f0CUvtPDr0KSgd5oS5kuaB9uN1xHcP0IHXgGClUwva
         WCFQSyDw+2AoAt8aAgHXbMrwBRNK0TY+h9TbwzNdB31IMHa68NM/emD6REf7ypqG2a
         Abtw6ltWUHptWMzvvQ7EvBNuUOZaU1YulOO6Ze4NKExAd6V66zUy9cfcGLG88bwGS9
         8Mee+NPMos7gJHtnXuNpulJiJd7ggU6GkPM9e55QiNn2Z46pnhNmZyPyHpK3OXC4wy
         xXxxrKv9ZiXdxSRl/yliCp3Nr0SQetOp6WeedG8v3IW8y6wvzgqJhc8h4dPzdoOuwl
         SxghCepwgvrEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1BDA9C05FD2; Fri,  8 Jul 2022 23:19:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 23:19:35 +0000
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
Message-ID: <bug-215993-215701-mNIxvUMSaW@https.bugzilla.kernel.org/>
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

--- Comment #13 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Supasak Sutha from comment #12)
> May be it's not reach that function. or I miss something?=20
It maybe a clue actually. Can you replace this -ENODEV (should be failing l=
ine
in your case, 2404)
https://elixir.bootlin.com/linux/v5.19-rc4/source/drivers/spi/spi.c#L2401 w=
ith
-EPROBE_DEFER and tell me if anything has been changed?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
