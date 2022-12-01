Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F16C4321E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Dec 2022 10:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbiLAK3U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiLAK3S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Dec 2022 05:29:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C767061B
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 02:29:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E122161F17
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 10:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56CA9C433C1
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669890556;
        bh=wxoszpmhJkG7BSJTb7AWbRWJDnBT7CEYfeCyKyG8J/0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IWCSXgrIV5OPIbxVxXZSfLLq5iAvHwiHP8gzRLVJ4CYsDzd/HXUff2S5Y75kBqwFo
         AyBCajlX/o8Ck0XxZSUeU/e/oMPBwwyHr/rnEvdaGfAI+BDFT3CxWHw2RmK2mQCXYJ
         xzKngcx82xE8wozbwFyvacDvvK8x5S9NxNioy2ozVcr4MPIWM2Xehy3B+lqCLlNsTt
         0kwYXYlfo0s2Wh1kLJUVQs1R9p9rnXK/1RRe1OxjQW8PGPIqdEcc86ymvzCs82tYWL
         cXB/3bcSq14GrehENTTbwVpf45ZHm3vtlHxNEaxeR+AnEIjPcXGIWzIFqz2sX6ZoXo
         kzwgeWVAnz7hA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 38803C433E4; Thu,  1 Dec 2022 10:29:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Thu, 01 Dec 2022 10:29:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oj002.hi@gmail.com
X-Bugzilla-Status: REJECTED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211741-215701-rC7upefgaz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

oj002.hi@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oj002.hi@gmail.com

--- Comment #9 from oj002.hi@gmail.com ---
I can confirm that this bug still persists in kernel 6.0 so the path submit=
ted
in 5.18 didn't work for at least my HP envy x360. The only thing that chang=
ed
since that patch is now that when running evtest the SW_TABLET_MODE shows u=
p as
an input device but the event never triggers when putting the device in tab=
let
mode.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
