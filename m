Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0372EE7D241
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Sep 2023 06:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjIZGyz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 02:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjIZGyz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 02:54:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC4CE4
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 23:54:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D222C433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 06:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695711288;
        bh=LujIdkqCGfUUsb4UReHQVypUlcxpYFCghCGObNh00L0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nbH1jxwr5nWmhBm6v4L6Sartm7vDUsisRYfz1f+L/BYMtida4jJ7HfHoAdcR0deUW
         iUvX3NJmMCX1qZGHEiUJdhTpqg4OhMuz4GRD6T5ZrVMy3OWPdU9MkNYUt5Nbn4ja19
         Ig+2+PJi5a+eczqxqe1IpiLUnPuztw8FDm/QM8/lnLHqL1CtfK/sXpq3Mu01uXAWYu
         6SyWF9pANSawH+XxdvIzFNDKlo/NhWo90BipdobSvLY8pVuEtVau9eIe2DMIIq6oMH
         lfCyro582a2NOLq/z4eHByMzzwtKk2noxIyS4k1TD3T+YIetPT3g0ru3Q0L8FDvkHP
         1has+8LIA52JA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 21399C4332E; Tue, 26 Sep 2023 06:54:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Tue, 26 Sep 2023 06:54:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jirislaby@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: see_also
Message-ID: <bug-217947-215701-q693IVrYZe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217947-215701@https.bugzilla.kernel.org/>
References: <bug-217947-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

Jiri Slaby (jirislaby@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |https://bugzilla.suse.com/s
                   |                            |how_bug.cgi?id=3D1215602

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
