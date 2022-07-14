Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD1BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jul 2022 11:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiGNLbH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jul 2022 07:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbiGNLbG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 07:31:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55185206
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 04:31:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E263560F35
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 11:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48C5CC34114
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657798265;
        bh=m/5Gt2nnCO+nC9ueMmBeqqRHa1zWnORML2j+zfcAA7Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WhuG1MmuVQzqPBLUle0tjBOR7/vn6WcH6mTYD37oNXtb2MfpdYF347rqdBLsZDiEe
         ycMLIlVIisubtegpj13ebJYJxKgiFEtaufdTqEHTGQEzwPHbhd2ze8AJHXGJ8mCfCN
         zfP34yJElUfI9LiZZtq9fZkvnlFSZf9I+hjznNwLKi+xGmmsdFoANPb15GQvyyhjgh
         uOsJKSmQ6bWAr77hvkUPuC/oOC7+0HLV5LY9ci/EzEw5lc+lSa2CGwLCjvknVmY1D2
         +hhy3gsP4riI1QHQZDQP8cl9jfeI0ggj22GeM9eVyP6DIMVTPwuxIYi8Cq+rlQZJXc
         jjXCxMN11paew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2A664C05FD2; Thu, 14 Jul 2022 11:31:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Thu, 14 Jul 2022 11:31:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-OMwP3RAXX2@https.bugzilla.kernel.org/>
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

--- Comment #21 from madcatx@atlas.cz ---
Just FTR, I just reproduced another case where the problem most likely would
have occurred - almost 33000 interrupts before the driver took action - but
having pinctrl_amd loaded early seems to be an effective solution.

I guess that Lenovo people may want to look into this, 33000 intrs is sort =
of
cutting it close to the kernel disabling the interrupt regardless of the dr=
iver
being available.

Thanks a lot for all the guidance how to track this down!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
