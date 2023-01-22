Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0904C25B4E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Jan 2023 21:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjAVVUn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 22 Jan 2023 16:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjAVVUn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Jan 2023 16:20:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3C512870
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Jan 2023 13:20:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D218D60CFB
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Jan 2023 21:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40180C43338
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Jan 2023 21:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674422441;
        bh=ntdXDuXpfgekq3nOdW66DZBY0/U80qV0W3gEEf0F+dI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Q30eTe8fXocHetwUGc/w6RyB8oqiJiFSHVK7dhQrqxy2EAx53tOy851ZVKMDi/3N4
         2ojU4oXAmqqXhOhNNByYvhtY4z9zGWTD1ogJ3FCoMBEqYoAJ0UOHg3oCX6Od0g1PKp
         hJVUVf5BBNnE435RbBZz3jehTPhUGCSXBKaQuJZUBuBfs9ruKe+BtJhwxd5FyoywTG
         kyMpfMZEXjJ0/Q5IICRCDhsiFxmv8uXh2aYeeZ8b5PTfHw3+bVU0LlP6KukHzFa7sf
         wIzFFZA6XzhInKiVfkmkMYM0wkiQ5SZMCB2IePFJvudzpXaYPNLjTmC0vnKHcp6rGn
         bwq4JNCAg61Ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 32378C43144; Sun, 22 Jan 2023 21:20:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 22 Jan 2023 21:20:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nikodll@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-o0qmsNCOxY@https.bugzilla.kernel.org/>
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

nikodll@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nikodll@gmail.com

--- Comment #284 from nikodll@gmail.com ---
I have the same or related issue with Asus Pro WS W680-ACE IPMI motherboard.
The following dmesg output is produced when I'm trying to "modprobe nct6775"
and lm_sensors do not show any PWM fan/temp values from this chip:

[ 1001.509854] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[ 1001.509868] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20220331/utaddress-204)
[ 1001.509880] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

$ cat /sys/class/dmi/id/board_name
Pro WS W680-ACE IPMI

$ zcat /proc/config.gz | grep -i asus
CONFIG_USB_PEGASUS=3Dm
CONFIG_TABLET_USB_PEGASUS=3Dm
CONFIG_SENSORS_ASUS_WMI=3Dm
CONFIG_SENSORS_ASUS_EC=3Dm
CONFIG_HID_ASUS=3Dm
CONFIG_ASUS_LAPTOP=3Dm
CONFIG_ASUS_WIRELESS=3Dm
CONFIG_ASUS_WMI=3Dm
CONFIG_ASUS_NB_WMI=3Dm
CONFIG_ASUS_TF103C_DOCK=3Dm

$ lsmod | grep -i -E \(wmi\|asus\)
wmi                    32768  1 video

$ uname -a
Linux calculate 6.1.7-gentoo-dist #1 SMP PREEMPT_DYNAMIC Wed Jan 18 12:31:42
-00 2023 x86_64 13th Gen Intel(R) Core(TM) i9-13900 GenuineIntel GNU/Linux

Is there any way how I can assist in resolving it, testing patches etc?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
