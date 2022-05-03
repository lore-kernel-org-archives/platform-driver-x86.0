Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D53EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 May 2022 14:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbiECONj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 May 2022 10:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236729AbiECONi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 May 2022 10:13:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A1D38DA7
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 07:10:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF912617A4
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 14:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AC4EC385A9
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651587005;
        bh=cGs+/DKuqXHylKN+trICoqkqEYlKJrbAN9ch8pzLZ5s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lrJ5ToFsLdQR976U85XK4yaxOy4fma+qM9HDYO9OgIDzo/dGzf4/8QRvcWaLcU1Be
         7qk281mQFNIG2Pp4LfOQtBqDrHIzLjh2oMdIt9CfKvwWDbh4FCorKXNa3f1bEjaCNB
         OXCar/llZzvajvIWvpzIoMWymYEG68Pl3Gt/9ptFP+rYCawB6AuYbMnHh8wHDLM+qn
         bLfzxOX43SPdjH3sDkP6l4ZFrn5h9G8dN8YQOKAXTGP9sjPZNpuoLvcWCfqcnZ/CIH
         UvqAQ/tl7RJot0CkpKJvLc46YNPQpleakZgTdH0IPHswlbjqVPp2tL4pWH5TYR1KuT
         F8ZrXnhd4fTpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0A60CC05FCE; Tue,  3 May 2022 14:10:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215387] s2idle offered even though firmware is set to deep on
 Lenovo P14s Gen2 AMD
Date:   Tue, 03 May 2022 14:10:04 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215387-215701-CAQkrF1bfl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215387-215701@https.bugzilla.kernel.org/>
References: <bug-215387-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215387

mario.limonciello@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #1 from mario.limonciello@amd.com ---
We decided not to stop exposing it but instead have some messaging if a user
tries to suspend in a bad combination that there will be higher power
consumption.

https://github.com/torvalds/linux/blob/v5.18-rc4/drivers/gpu/drm/amd/amdgpu=
/amdgpu_acpi.c#L1062

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
