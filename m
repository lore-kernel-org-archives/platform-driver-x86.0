Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D091C001B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Jul 2023 18:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjGXSWS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Jul 2023 14:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjGXSWR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2023 14:22:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B5A10F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 11:22:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 614736139D
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82A3BC433CC
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690222935;
        bh=b7xy0BSR+r1v/O0QVDa8Ll4R9qzGjgwCU8Vbwx2sDjs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N4w7bVF0SCv+Xk/UOlzlINHv8pT2H69xzqokSUwun2qR6V+Cv90FMEfKwUT6g8zTX
         NJ2c90rqOcJ6wVnovrT+0VVSFarVkkAXjHymQtArZH235CW1NG8XyPnh5TSf4wYhXi
         NWY72YNmnX7ES2XRA+4rzkOgzJ8obHNkV95mVNxncg27RiZJUpSOocBZfjbox35lxb
         aN+3vqNucDS8f7rg1xKuKNfIfc4gevUKcCCdi6Fi/sMzyUZPZsqCkrdct8dTpIG9ai
         PrG8v6dA1VCkxQ4ATncxB4IRkU+7BA8fo4LJWvLvv0CIY4TgE/xSkfZZhN40UpEQ4q
         9lxwnh/nKlCdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 736F1C53BCD; Mon, 24 Jul 2023 18:22:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Mon, 24 Jul 2023 18:22:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-217696-215701-bLuZPtI8af@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |shyam-sundar.s-k@amd.com
          Component|PCI                         |Platform_x86
           Assignee|drivers_pci@kernel-bugs.osd |drivers_platform_x86@kernel
                   |l.org                       |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
