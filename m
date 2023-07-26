Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBC0C0015E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 12:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjGZMx1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 08:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbjGZMxN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 08:53:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139FD2109
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 05:53:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6469E6138B
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 12:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C49A5C433C8
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690375985;
        bh=+mpOsDZn6WRB3Ti9gjOTbLYM1BRkWcoM86teQUi9aPw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GODijF1YxMWPZWn0rmuq8i7G8QRpchXFOGa9SiHncGkdFhhtevYVQAclpBSYvx8Ap
         X3w8yasKHBP90cNYc751W0qYGgktnZpOglt1zIpcPHJJLiyxwhdZQyIXtmWnL+iNGk
         FfVVKoZr2IEk16MT4r6qSBbGQqOZTd06nuL1SDo1M9DrE9EHRYoRzPjkxzgbgAeOS2
         YPPCDKHqxax+fE+qf1WhjG0ZdkncO2Wr1efTyPIiSc4nZRJb8WkogUR0WnF8OrOAw3
         sNIEJPmp6pvMlITb653CglJbqB1Yf+c6pxZrjjcJrLphcbL5WsWXubJy6MSoYb66Yz
         C95cToqZ/rmYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A5F94C4332E; Wed, 26 Jul 2023 12:53:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 12:53:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-Xm0YVt90JJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #19 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> /sys/firmware/acpi/platform_profile which now contains "balanced".
> /sys/firmware/acpi/platform_profile_choices contains:
> low_power balanced performance

OK good news and bad news.

* The good news: this means the patch "works" and you're now seeing the ext=
ra
values for power slider notifications.

* The bad news: It appears that HP's EC doesn't do "all" the power state ch=
ange
notifications.  Some of it is handled by code that runs in the APU's TEE
environment.

> [45870.908318] amd-pmf AMDI0102:00: supported functions:0xe0c3
> notifications:0x10

There are some other bits not yet supported by amd-pmf in Linux.  Let's lea=
ve
this issue opened until that code is submitted.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
