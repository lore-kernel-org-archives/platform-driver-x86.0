Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C82C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 17:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244126AbiDYR6w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 13:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238183AbiDYR6v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 13:58:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA6918E07
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:55:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04BCE615B5
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 17:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EF1EC385A4
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650909346;
        bh=ctqxbI316Sr/acCiHGx9wkERFMiKvn9/u3585bbNf9g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DroamuAUp8eOKoch8kWfL3S8z/QJSXoLmsCHc8oqgLLajLHSv1Yzuvo1t+PtxOLbL
         IwWml7OFMSsGX30DzWuNhdL3DUbCtvmwfa2Bw1sy++kx+xUI94bnnNwhwRcekxl11V
         mm7RT0BXziRHjf0vkk6y0X9FVeUpz2USYiTJ1dwfMW+Iw7YAqEWvK50F76i//BwVtL
         sXHM0UihDK+K9P5+WMdj0K6fgkhu4QX/MLz8y7PWSOazFMUTQT91k1/0YFOVBYbNag
         lnA7oBvlXCpX2o4XTK8N0zCdHK+XqmnrdHCKkWbUbm8AUrlRHDa4QlGLZuwTskvCEi
         nrzU+Jw4xQLfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2945EC05FCE; Mon, 25 Apr 2022 17:55:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date:   Mon, 25 Apr 2022 17:55:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: taigi100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215883-215701-PIzrnYJhRf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215883-215701@https.bugzilla.kernel.org/>
References: <bug-215883-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215883

--- Comment #2 from taigi100@gmail.com ---
Kernel: 5.17.4-arch1-1 (tried on 5.15.13-arch1 or something like that, didn=
't
work either)
Distro: arch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
