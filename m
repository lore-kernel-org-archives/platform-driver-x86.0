Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E65DC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 18:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiGKS31 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 14:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGKS30 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 14:29:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9581C1276B
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 11:29:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C504614A2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 18:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF9CC34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 18:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657564164;
        bh=fJxXBxiIf16B2SQUEVVidVjfQwK7cMT8q4+zixIKT0k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EieTmwrtSJdmH84H/zezzhoddlbGaUle1Fuemmnu3rlu28QpsUQbsgp9UK1rFrtOu
         dJVzbumaU7IuyEQVCmkwSo3+4ivzBdmKpvFKjoRTY6UZwLuJwqcm28M4sz2eGyUqed
         S0UOUl62SyHpS7wM+li8MdxmJWplkiNO+sWv7va39aQdk1yZP+F73oBvfIziE70Ks8
         Slshh3iO7KlEXrg5gmc3uEeec61uCjEcZaP1Z2znQtChb8P++bK181D2xWezO1YfR8
         fevSRAMcfNmIMjsjQgLBXrS4yBwY6BJsQ610EKtvLb3hJNyB0/hAJrB82qE6Y0KchP
         OpnPZQ+R06t0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6BB57C05FD6; Mon, 11 Jul 2022 18:29:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Mon, 11 Jul 2022 18:29:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-tPKrCBzL7W@https.bugzilla.kernel.org/>
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

--- Comment #22 from Supasak Sutha (blur.3rd@gmail.com) ---

>=20
> In this line, try to replace 0 by a) id or b) id + 1 and see if it helps
> anyhow.

No luck, same result.

> Ideally we need a PCB schematics of that laptop. With it at hand it will =
be
> 15 minutes work to understand GPIO mappings. Any possibility to get
> schematics?
>=20

Where can I find it? Is Asus normally share this schematics?
I can open the bottom case and take some pictures if it's help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
