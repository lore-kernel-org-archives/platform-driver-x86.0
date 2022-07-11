Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB9CCCA47B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 17:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbiGKRkj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 13:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiGKRki (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 13:40:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CF36715D
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 10:40:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 81505B810F8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 17:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29639C341CB
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657561235;
        bh=oPIPaKzim5vZ6n5+9wDD5Avhdya8kejwHHseg1Qp3A8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rJXTuJNJBZDy2/ruIGa3ODLJJikcKETV0ekAECSZgBtUETls/mLUB6OLb4OiaYZWX
         DJsnpZI8HqlZQB0Io9/M7WJfPW6N9++k24GTU/qsDYwDszu/9+BTt70CJlqMF2dMvG
         TqUMflnM07WM4PfzwPCW8UnpGwlpb7H5J4T/RFUIdYFSdUZ+OUoRzIPuB/9N12ZNxd
         gK3UMD1vNWwq/NvvfTIizfpF2jf+8w60WFXG2vQxpNlMVw/30R02xp1HMquy13hzr/
         AssBszy1B/x7FPhwQZ2uku7so8/RlY2FHJL3yjME9EvzfCHmHsYU1wsIpGHCymd/RS
         uu51UsqVdxO9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 079D1CC13B5; Mon, 11 Jul 2022 17:40:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 17:40:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-FOUUA8Tbyz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #11 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I think you turned on the wrong pinctrl debugging.  I'm looking for the tim=
ing
of these statements:

drivers/pinctrl/pinctrl-amd.c:1061 [pinctrl_amd]amd_gpio_probe =3D_ "amd gp=
io
driver loaded\012"
drivers/pinctrl/pinctrl-amd.c:655 [pinctrl_amd]_amd_gpio_irq_handler =3D_
"Disabling spurious GPIO IRQ %d\012"
drivers/pinctrl/pinctrl-amd.c:632 [pinctrl_amd]_amd_gpio_irq_handler =3D_ "=
Waking
due to GPIO register 0x%p: 0x%x"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
