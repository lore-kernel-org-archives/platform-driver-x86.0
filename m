Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE682C04A95
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 16:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiI1Q3O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 12:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbiI1Q3N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 12:29:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46779F74B
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 09:29:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 88BA061F26
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 16:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E23F6C433D7
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664382551;
        bh=rtYyTcgTZa9FMl5KLrJG3FntRZwBRjCjlWe4hG0K1yk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HCAX3gN6L6yVL0qWUp4ZILfwGwbxzvu04MnHaAYqtW6SewXEBI6MhU2i6UgGdv9Rs
         IiQ4IGkRAd+JuT4zxobaxqilElEEfI6goJsQhJPGI14Ad4hzmzXdD3eZ9Dkp0/gfTe
         tdfCEh0exfgTz+CLEPNMQAlsZUQal1R6bbIV/NHtqC+P3rJQaM6rMSgmhBKOEQ+Wg1
         yXv0lLwtMkQGkEXsmzGbHpzOPIxOS/BHSrB2r6WySFMfPBr+UX0XeQFTyK3rw58FVv
         uRvYrVqDbcqtjCIIrK6zSHwntSb/NK+LHWooX/tc4bbPsa256etjOmKrMsJaa9YNxJ
         iS+6D+QCoVS2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BF6B4C433E6; Wed, 28 Sep 2022 16:29:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 28 Sep 2022 16:29:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-5kazGomxyW@https.bugzilla.kernel.org/>
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

--- Comment #20 from kolAflash (kolAflash@kolahilft.de) ---
2.
I did some tests.


Opening the lid or pressing keyboard buttons (e.g. shift) is exactly the sa=
me
as closing the lid. Also varying it's behavior on the state of
  /sys/devices/platform/i8042/serio0/power/wakeup


And unplugging the AC power also shows the same behavior.
If
  /sys/devices/LNXSYSTM:00/LNXSYBUS:00/ACPI0003:00/power_supply/AC/power/wa=
keup
is set to enabled, the notebook fully wakes.
If it's set to disabled, the notebook just stops the "deepest state" of sle=
ep.
(notebook can be fully woken by pressing the power button)

Note:
The EliteBook 845 G8 has two power sockets. A classical one and an USB-C po=
rt.
But the wakeup behavior is the equal for both.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
