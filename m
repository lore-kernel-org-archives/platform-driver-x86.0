Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95D3C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Aug 2022 15:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbiHJPDF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Aug 2022 11:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbiHJPDB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Aug 2022 11:03:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8484B75FFA
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 08:03:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3A0EBB81C97
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 15:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFC92C433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660143778;
        bh=cHmQpAaGv3d5zJP2PsLpQrnavoLR0fFzio4cf743rkE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Vc1V5tc8a/8JA8axf8dOAODLmmjB0tFWAjlgrFPT2AbQYaUhXs5rgOER11BbmN8uX
         dMtuDoz1jxcUxH5ZfOPn5aWe/pBPzq7riE9GLhxSNjAX9KKiYyPjNXkO77Wszq3azR
         PGeCj8hefrqPEswrAL93/s6mXHsdlqZbtK1TK2+tJuCY73WhSnHhE1Vs8L8VWmaS35
         5tjuuMDKY9UFow8yVGD4imvL5rSiHzH+19uCfE1FDudMTIwnkstByEi85gkm7gyAQZ
         O+/jhl2fyUiS58uoFU1J12RGehHoiTf8KCm3bgK/78EjI4U1XVYJOwjf7uEefef/i1
         6Oy6SuOg1m+Tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D32D5C433E6; Wed, 10 Aug 2022 15:02:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216347] ACPI power profile keeps switching to "low-power" on
 ThinkPad T14 Gen1 (AMD)
Date:   Wed, 10 Aug 2022 15:02:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216347-215701-FUZeb3egXY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216347-215701@https.bugzilla.kernel.org/>
References: <bug-216347-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216347

--- Comment #2 from madcatx@atlas.cz ---
I don't have PPD installed and a quick look around didn't reveal anything t=
hat
would mess with the power profile. What's the expected power_profile value
after boot when nothing touches it? I can try to boot off a lean Live distro
and check.

I tried to remove the power_profile toggle from the script I trigger through
udev rules to check that it wasn't somehow misbehaving but it made no
difference.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
