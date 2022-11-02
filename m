Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30951C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Nov 2022 00:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiKBACO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 20:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiKBACM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 20:02:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A35E1F9D5
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 17:02:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0EA9B80D2D
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Nov 2022 00:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C13DC43164
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Nov 2022 00:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667347328;
        bh=qLZqIEXqmbzVKeXbYWw83b6+PtsYn93pUHqLG3PyBdM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aCly7vStZk+oipWltb8U7NITb8jVFOPTzTtJtZvASI4Fi6b50UPVDY6fCs2oXfE1m
         8rllAzUI/jgoRRZB8T3A4XHj+PGOU3qFki9yXqQOSf4XEBridEgecv8ou/r+8WIWot
         egeeFldB3fwdd8AYwVeBwPWtuJb7G7odRD6a8PiQG8cn+FysqPC0eU+Kt1IT9iLMvz
         34dDwMgyjXt8kRvNHkTo3C4hhRuZKpSMYE+JWbUO/R1OB1DDP6emorBRIY6JWmWlJ+
         sZTBKhPkU2YbXFNgMyR8HgJvZwhFboPwBdbEgaRyZd//Hied36yFQgr4YAIG+Tjf0t
         C2KMh79YOxVzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5EDAFC433E9; Wed,  2 Nov 2022 00:02:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 02 Nov 2022 00:02:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: zykr.caswell@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-O8daaCAo6Q@https.bugzilla.kernel.org/>
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

--- Comment #266 from zykr.caswell@gmail.com ---
TLDR: B-->0 and it works!

Adding the board to that list, which I'm feeling a little embarrassed I had=
n't
already tried, gives this:=20
nct6775_dkms_platform: No such ASUS mutex: \_SB_.PCI0.LPCB.SIO1.MUT0
nct6775_dkms_platform: Found NCT6791D or compatible chip at 0x2e:0x290
ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts
with OpRegion 0x0000000000000290-0x0000000000000299 (\_GPE.HWM)
(20220331/utaddress-204)
ACPI: OSL: Resource conflict; ACPI support missing from driver?

Looking at the DKMS, I don't have such a Mutex, but I do have one under LPC0
instead of LPCB.
Scope (_SB) --> Device (PCI0) --> Device (LPC0) --> Device (SIO1) --> Mutex
(MUT0, 0x00)

Adding that in results in... IT WORKS! I had almost given up by this point =
and
was main continuing out of stubbornness rather than any actual expectation =
of
getting it working.

So, thank you, thank you very much. I'm not sure all of the values are righ=
t as
the temperatures seem rather high, but I will try to confirm that now.



ADDED:
+    DMI_ASUS_BOARD_INFO(acpi_board_LPC0_MUTEX, "\\_SB_.PCI0.LPC0.SIO1.MUT0=
");
...
DMI_MATCH_ASUS_NONWMI_BOARD("P8Z68-V LX", &acpi_board_LPCB_MUTEX),
+    /* SB_.PCI0.LPC0.SIO1.MUT0*/
+    DMI_MATCH_ASUS_WMI_BOARD("X99-E WS/USB 3.1", &acpi_board_LPC0_MUTEX),
+    /* SB_.PCI0.LPCB.SIO1.MUT0*/
DMI_MATCH_ASUS_WMI_BOARD("MAXIMUS VII HERO", &acpi_board_LPCB_MUTEX),

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
