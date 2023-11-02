Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0059BC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 15:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347525AbjKBPwJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 11:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347648AbjKBPwI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 11:52:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48E6D44
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 08:51:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 443AFC433C8
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698940309;
        bh=tYLyX5ArfV6ywIlepV2IZRaDgKNzfIKJ9eJAp8CSz0A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pcagetmHZf45Ge7xcrIbvS5mtvZa3lyVkf4LMfD2E60GBPedVdjzXbGZd6eVAhne+
         9u+KSdtub+cTkvNdsSRC2OEA2pxSk/v+NC1essXBBV9UXlS24geO4B1fXdoj+WhaW5
         WliC2hos1kgKFrGdXvHp24KQFTylMRjBluUP+SSOTfpyA4F6RIjYUTWKwK08v9a/Zv
         Lyi4VamJwB+yLDMJ6NWCX017ky44AETixMFK/zG75TTyr5RbDSBMqYTJS52eakjE2N
         MOzyWG/WtSeHKAeiHkkRf886ejODCGmYKoIxEESxfDyD8QYng3ayRtHthDgxgk/gPN
         ADcDHnHECmWPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 27C5CC53BD0; Thu,  2 Nov 2023 15:51:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 15:51:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-eQBnlKP4WB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #37 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you share your kernel config to the bug?  Maybe one of us can figure out
what needs to be torn out for it to be able to build.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
