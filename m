Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4824BC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 12:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiJNMWq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 08:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiJNMWp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 08:22:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71311CC3E4
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 05:22:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A8B061A94
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 12:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94DD8C43166
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665750163;
        bh=dxwWozOl77pJJsEm1nL9PMqk6PodFFPcWLImFDpRkfk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BKpqUVcC1K+MyrE8O610Mo/16+S9zr1WdE1UwZ9uWdqV+nwmh8MoFRuCk5l4kWzfX
         62zxo0NCiRLCm4kS17RxDVgpxqBCbmYZVlV4yPrvtEmX7Pq6qH8sHru+n0dOm/rvbo
         s1X1cPYGVPNZ50awILM6b24tKHoaPjY4lato/CjCC3Ic8+Ug7g1KFOC2q7N67sY98O
         Po1NLiEm5UatROJCrEvDTo3nBCrqHkZmcYgmrc/4ittxTemCRIFWQXo8AfaT4gXwiZ
         w2mQE+kfzpCo0IuuF1NLxKzbbUV0yi1aqidlP2+G8rHv+pAJ/nNuVN5aXcO3cR/lUE
         IyRQrkqpv2c6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 85DFEC433E9; Fri, 14 Oct 2022 12:22:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 14 Oct 2022 12:22:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-egdJZgComt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #258 from Vladdrako (vladdrako007@gmail.com) ---
@Denis Pauk
Something wrong with the patch, it has only commit headers :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
