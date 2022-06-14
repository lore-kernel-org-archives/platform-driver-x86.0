Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E15BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Jun 2022 13:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbiFNNlN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Jun 2022 09:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbiFNNlL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Jun 2022 09:41:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B631E3DC
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 06:41:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C1B01616CA
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 13:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 290AAC3411B
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655214070;
        bh=4R7T1jbvnolo5xM5PVyYCKcp2L24rlH+TyAD5HAUHTg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bcOV4che2DYPEholeqqY8f/ZsVUqowk8FwDhxXIghVycT0RtWSa90uSiSWyJeQwd4
         LhIvId/WhDuSAQ0bLtAK8y1pY8vestxghz72fx+pV8avKd3Xq8aocM0e69GrRjRLyb
         7OL4/NV2fkmh8iEEh0kTJ7v1N14GVnvXZexpF81OFttiIbYrphTTjQdFo322mjXxCS
         sFE5La9oy3X8Y7/LApjReqWyJkle8oXCPiq5eWuP3GSUBibEltMt1Z05zfQMP3zBJS
         BzfMvPqJhg5JQKXKu9dCg7l02O1Hblc2tPjaSWseh6IpMSvDFQDbD2SZ9H0J+w4VYn
         HVrG+YEFfmQag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 04A65C05FD5; Tue, 14 Jun 2022 13:41:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 14 Jun 2022 13:41:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-h8vT0odQb3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #35 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I think I know what is going on here:

1. acpi_bus_init() calls acpi_ec_ecdt_probe()
2. acpi_ec_ecdt_probe() calls acpi_ec_setup()
3. acpi_ec_setup() calls ec_install_handlers()
4. ec_install_handlers() calls acpi_install_address_space_handler()
5. acpi_install_address_space_handler() calls _REG for Device (EC0)
6. acpi_bus_init() calls acpi_initialize_objects(), but _REG has already run

I've a plan for fixing this. I hope to have a set of patches for you to tes=
t in
a couple of hours.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
