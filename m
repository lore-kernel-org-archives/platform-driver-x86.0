Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7D0C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Oct 2022 18:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiJLSEy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 14:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiJLSEy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 14:04:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215ED3337C
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 11:04:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D62AFB81B99
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 18:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88C8BC433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665597890;
        bh=fnYo5D77EaMlBBd1YA8iP+CaT22yTYYY4PdRs1jgRs0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BeWyhF9eomzcCTvZOUwzDcgSFBuIjUt8uIRMkqTJ4HTt6wmRMHhO5vZBG70/ttRZG
         UJRBHS1UVtn5M+n1xIF3J1a7n8xtNl/CABYh1a6A59EkPwCX0+1fd7WvKXl3MRMRNd
         e3t2ot+MFASRF6YDXH9VdLpZmKeH8pTs3VAHebEgj7b0m7fShl2hK/Ww6FamnyWDeg
         12RrL8f8KGW1hjpSN0+32QrwT7+5LlLJhGMBnsgJSf93GA7kyivQDYkSjCEwblWVC5
         8MiYEyOHXJfoEtOvxLIvxlK5sFsiN/rNXF93+q900bPYaHFRa/5nxMXowSPZIwbcOp
         h1fIfMgj9xHRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 668BDC433E6; Wed, 12 Oct 2022 18:04:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 12 Oct 2022 18:04:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-asxB56zqrF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #36 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
BTW AFAICT upstream is dead for "s2both".=20
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D954061.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
