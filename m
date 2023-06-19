Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21566EB64D9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Jun 2023 07:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjFSHjA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Jun 2023 03:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjFSHi7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2023 03:38:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB26B1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 00:38:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9D3760C49
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 07:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1036CC433C9
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jun 2023 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687160337;
        bh=FV6wqRMtBFl/uQb2lTAxpDlz+Rz9j97SlAKtOI2O5AU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=I61gawYJPOoKm0P2psiQy5VuWtYdoKzd17qNdTuJXPnBvMaMLlfCjKqrGQ/pqJ6lI
         eIDYpFlu9ZkXq4ReKDcju88NjktDfmxDAFRulACLOiT0aY1DaYpa7bv0Ei/sqb3gV4
         oFiJf+rbPgyQVv/cC3RwY/gx2HPZHoTARSOs6j2fO7hFvekrhD+NxKwLpzFCFY4VBD
         nAOjcDKj9135vgP63y9alxIrQ/WE5CF63j4/EyPY0tKvYeV3siJb698msEmqiqQGLo
         9+HF/zlhAdnU7ICXexZmJhbZcb/Hz01tDdX33sAaC6njx7h+ZxqXdllREqnFifvQsH
         QSiyeq/e4bg0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EFF28C4332E; Mon, 19 Jun 2023 07:38:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217571] amd_pmf: AMD 7840HS cpufreq locked at 400-544MHz after
 power unplugged
Date:   Mon, 19 Jun 2023 07:38:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: allen@atr.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217571-215701-Vh2af5JXzL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217571-215701@https.bugzilla.kernel.org/>
References: <bug-217571-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217571

--- Comment #2 from Allen Zhong (allen@atr.me) ---
Created attachment 304452
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304452&action=3Dedit
dmesg w/ options amd-pmf dyndbg=3D+pflmt

Attached is the full dmesg output from a boot without AC supply and "options
amd-pmf dyndbg=3D+pflmt" set on the ArchLinux default kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
