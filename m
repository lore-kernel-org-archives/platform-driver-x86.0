Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65057C43334
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Jul 2022 05:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiGGFjO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Jul 2022 01:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiGGFjN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Jul 2022 01:39:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AD82F02A
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Jul 2022 22:39:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 777B5B81A69
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 05:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0155FC341C0
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Jul 2022 05:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657172350;
        bh=KqGhUZv/vmYKrRnDoGHds0VrnTUPEmpTvhnxeuzM97o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MiR4CwDZzFr/Eqsk0HT2Sp49r5kyhZXjQvxSad9QNAgoHYiKGhl9DF/tnT+rJNEnD
         J/9ctlaHzmcG58vJDKz4I5AqSpmczwyfMZ9WHGa2vM8kgYl8oRWR0XLjYJO4bnmF5i
         DAEQ8VWRXATSPQ79owFWGW68M/tatu7uPGwTCUXb2k5FP0d4cp6rDMHm1yIpboDVVk
         tRX9WN3ye9WhfisaXmJ9UGzH+BENdHSxhEzQQl+uW5jWAt9uM2BG/wxn5Zdiah1z5v
         gp1zcfiLUirWaSUeFZeyayTOR8lQJPxwINNQLV//fuTGG7nivmtucxFDNYZ4HYFI4x
         B0dHIDRqa/lcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D58A4C05FD6; Thu,  7 Jul 2022 05:39:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Thu, 07 Jul 2022 05:39:09 +0000
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
Message-ID: <bug-215993-215701-3xZsCh6uqz@https.bugzilla.kernel.org/>
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

--- Comment #4 from Supasak Sutha (blur.3rd@gmail.com) ---

Hi @Andy Shevchenko,

I cannot boot with `v5.19-rc5`. Got black screen even with debug and without
"rhgb quiet".

But I try with `v5.19-rc4` and got this.

[   15.224358] Serial bus multi instantiate pseudo device driver CSC3551:00:
error -2488: failed to allocate SPI device CSC3551:00 from ACPI: -2488
[   15.228652] Serial bus multi instantiate pseudo device driver: probe of
CSC3551:00 failed with error -2488

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
