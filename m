Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0625FC4321E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Dec 2022 04:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiLAEup (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 23:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiLAEug (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 23:50:36 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BFD9AE1A
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 20:50:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E4030CE1BE4
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 04:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06A94C433C1
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 04:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669870230;
        bh=MM/80blopBbrYZfNjqK08LzhSZr1Z4fOPFyeTR38/kI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Szp/GM1QNdsN29srsMLvfNrIf/ScAAEdZAg2GWv+coepiwiR8D9VyfT82Df1HaPVa
         GfUJhH3kNx4h4MPJFSNFjwONvIeGSeJYvqkGkkysfdNYBCUv0h1WGMNUnR4hidWEPR
         UARRE6imp8DzLC2ps+8pVHCPBYJfrzwJ+3f56CgByruWhjacwdBqxUeoHIkBl1sfaE
         fsmhDb/yC5UwlBCUFODfqQjEDTBcxBPPR+ZtwUfS6VyIT+Q3pA1jPFf2Tdb0Qs6dPd
         gA89pgi8nl1uFtBexVs8ar9cirUz+QG1r68G0qij249QPuVpr5z/r80ROFiiYBqaK8
         us1Ez7evaDlig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D34DFC433E4; Thu,  1 Dec 2022 04:50:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Thu, 01 Dec 2022 04:50:29 +0000
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
Message-ID: <bug-216647-215701-sqjGLPBznP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216647-215701@https.bugzilla.kernel.org/>
References: <bug-216647-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216647

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you please better describe the symptoms of the failure you're seeing wi=
th
"platform".  I don't see anything immediately obvious jumping out.

You can try to take these two commits and see if it helps.
https://github.com/torvalds/linux/commit/4f2bea62cf3874c5a58e987b0b472f9fb5=
7117a2
https://patchwork.freedesktop.org/patch/512917/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
