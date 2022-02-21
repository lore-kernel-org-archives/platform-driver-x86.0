Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66518C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Feb 2022 21:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiBUVUN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Feb 2022 16:20:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbiBUVUM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Feb 2022 16:20:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A00AAE74
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 13:19:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EF5DAB817A8
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 21:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA48AC340F0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 21:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645478386;
        bh=P4yhk4Vz1VKMRqTb1dh71OEJKeh3lNBCYQi+23UdHgQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tTqwM4L0gLDG3mQbn6hYt58A49iRzICRY5dl6MirzODD8rPYtuvNkkSUZToipxH3E
         lHDzCozaGxVnFJ+hC/zyk0IfeLBzMIyE7pbeg4JAVbXFKKpmlqN6pOU5eGTIzRojRH
         8ucKGYP9z+JC6GbwFo/bMBQ5frMnc+S3EWSSXL/+v3hO3olnXsJkUahSQQ4dGvt2cA
         EoKiDn16Y7TfuDoiHfb967NA0udjxk6xV0ZFvQ6UdIHY/BJRJdbeXzMrlLLCCBsLSL
         pWNVZom2iwMKGpCpet0SaJlC7cJ045HQ2N6bKqlonD3YnZfSUT8MO13hexLJF7RnRf
         r2CD+Vsl9fWrg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A9E7AC05FCE; Mon, 21 Feb 2022 21:19:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 106031] Regression in 4.2.x: in airplane mode each time I open
 my laptop lid
Date:   Mon, 21 Feb 2022 21:19:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: emmanuel.grumbach@intel.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-106031-215701-rNeB7Oym8m@https.bugzilla.kernel.org/>
In-Reply-To: <bug-106031-215701@https.bugzilla.kernel.org/>
References: <bug-106031-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D106031

Emmanuel Grumbach (emmanuel.grumbach@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
