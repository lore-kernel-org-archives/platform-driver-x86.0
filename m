Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73348C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 08:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354950AbiFVIgz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 04:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354942AbiFVIg3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 04:36:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08C538D91
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 01:36:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7642BB81CEE
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 429E7C36AE3
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655886985;
        bh=n8VaxCezu5y8NmWn5dmYPbi+s47Ub+rDJHG679RGWvE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=F00HOh4ytNsc/ZZcAsffsGnMh3YXIG0KezdLHi+HuecFmn2d2rVI6bsEkNUgnGbrd
         mPeVlRSEUvbflk0IMzZ54UrJlZjQqLeBBJCgEn4WtSWGi3jKGJ2e/0Xk79JzXP+IQX
         83QxAXyXFIBnvtHCNxWzbQPOMRYellCdpUWX0keZM7hv1aMjIKBn8QNQfnuzuCSeg/
         rushZegmqxCCG6VE0Pjwm0v6zoVnV96tqaZfGdAJXUiwJ65Do2OsMV5F9UwFofartu
         Liqo99Qk+eCpDlRoE5oKy1MgCmSNl2HS3vyshLKlmIiVAtLXXe6NiC5eNA5gsRnQQF
         UHAypyxGer8gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 26B52CAC6E2; Wed, 22 Jun 2022 08:36:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216163] cstates: intel_idle.max_cstate=4 required to eliminate
 flickering of the display on the laptop model 3Logic Group Graviton N15i-K2
Date:   Wed, 22 Jun 2022 08:36:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kovalev@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216163-215701-mLShjBB7pr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216163-215701@https.bugzilla.kernel.org/>
References: <bug-216163-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216163

--- Comment #4 from Vasiliy Kovalev (kovalev@altlinux.org) ---
Similar problems:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1506339

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1958191

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
