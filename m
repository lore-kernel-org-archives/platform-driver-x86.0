Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB27C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jul 2022 11:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238940AbiGNLfE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jul 2022 07:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238969AbiGNLfA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 07:35:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98430599F7
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 04:34:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 259FAB824A1
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 11:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A96A5C34114
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657798496;
        bh=hrIk+PrubEjSfXN2qfapKp/3mVJ0T5+BJzx1Gj3NL2Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Hha7075smeK1EuEqoJPTjuCjzntBwoZB5pSMsBVbK+FItKFNOVwZivsks5/Yi41ra
         VfGTqIeGkBzL812HTkkqekMhPKG9XJM0ypc/gwVESQHlnrd1+LntN48GZkrr6v5Kux
         Kj6K7CTCmRC83xZqrfoZvBTI79edYipdLpXEnLJsbrwZfH8/M0XO/1xw22v15ocjez
         Iki6Gx2dQr9kB83LnVAq+mCUwDzFjEYhe0ToCxOiFWwe6UY3L/SGrl9ucsfeJbQrf0
         lRrjh8w+KfS2HAa+WtPuQ9lKiutldsNypyUen50KHSVs4gb+Frep7mkhm2oTD8wKdH
         e+8JPdRShixfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8AC7DCC13B7; Thu, 14 Jul 2022 11:34:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Thu, 14 Jul 2022 11:34:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-mwf51FUMwn@https.bugzilla.kernel.org/>
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

--- Comment #22 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Were you still using the initramfs method when 33000 came through?
If so; please switch to built-in.  That should allow the driver to load as
early as possible.

> Thanks a lot for all the guidance how to track this down!

Sure!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
