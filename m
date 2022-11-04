Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A2AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Nov 2022 00:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiKDAkr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Nov 2022 20:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKDAkq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Nov 2022 20:40:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B0D64DA
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Nov 2022 17:40:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8156461F93
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Nov 2022 00:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9409C433D6
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Nov 2022 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667522443;
        bh=vJKxYhCaJw9l1oPCSU35Bx2MIbwVw6aZQ4B9h2220x8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=g98Vhj76FDh+ThvMpEeiMT17jE3WqtWnFGmrv8W2H0AtBqqsvo6JjTmX8WN1Fnnff
         1uGv4YmTQ1ZVLopbBO+IWVS5iJMOYKJONwRtv+6BHxkCs7XjcCRHxsX2MVuJp/mywL
         vMw+YlmHmSDTWJ+3imEwP84LlDqPuAUyaUlOkiezgc8ZxD71raROlD2nDNMhWIEjhZ
         zHU08xCrJu+67ip2uWm3N0Wd9i9tHI8xZydcXGPz9o7+WEnfl21r48HVYTU7GIoZYT
         dz3Wv0XHrjPkO2qqn46KvnAd63kpVHIHumveBsEwuOpuAHqh0RGERK1vli8rF4hreK
         YCVCNUEF47BEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BB384C433E6; Fri,  4 Nov 2022 00:40:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Fri, 04 Nov 2022 00:40:43 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216647-215701-6PGk1m6PAn@https.bugzilla.kernel.org/>
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

--- Comment #2 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Please try the stuff listed in this comment

https://gitlab.freedesktop.org/drm/amd/-/issues/2213#note_1618476

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
