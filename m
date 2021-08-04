Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5947C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 19:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8146661037
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 19:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238185AbhHDTzd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 15:55:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237593AbhHDTzd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 15:55:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 63CF660F58
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Aug 2021 19:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628106920;
        bh=0K3Vcwl8OgNNAw3973uMUCUyRyEsi1fnNPQfVKTR+ME=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Z9Gx6MNBJo+fQqZUZT9EoUF1EA7RzUtdiaZGAjTJkvpWfoYG+PPcTKKoy73YYOFWp
         4b1P6BdIxn0igo3x4h5znP2Pkzm5GPZtovRvWT91xbbf6wZjlu5R5e+atz43l2ihgm
         7bD/yX1fWbHbE81ArOgIO4kkArOSRrKi8x/GxQnTkeZlgJ63dVrjEVrLIkMK9CdbmL
         i+TI2ymqZ16u4c5BVopPMb48JSPF52reRTNwrnyX5oTUbwiAtgl7pLalJF1CbLUsBI
         FLLCfh6s44gl1FqoMACtWf5v3nXlhVN0x5ee5WXIKFPfRy6aMNgf47n54pdt+x634C
         wAOAa5AvTlPWA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213977] Unable to lock HW IRQ 44 :: TigerLake Proc :: Clevo
 NH58HPQ
Date:   Wed, 04 Aug 2021 19:55:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: death420.x@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-213977-215701-kRbKX2NEL1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213977-215701@https.bugzilla.kernel.org/>
References: <bug-213977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213977

Ben Long (death420.x@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Unable to lock HW IRQ 44    |Unable to lock HW IRQ 44 ::
                   |TigerLake                   |TigerLake Proc :: Clevo
                   |                            |NH58HPQ

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
