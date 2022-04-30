Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA134C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Apr 2022 22:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbiD3Ww5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Apr 2022 18:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiD3Ww4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Apr 2022 18:52:56 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B112457A3
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Apr 2022 15:49:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6C82DCE0F21
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Apr 2022 22:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86C8CC385D5
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Apr 2022 22:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651358968;
        bh=iWpOivR2AQvXwjsn84c360Vd0bphbgphsl3JByGKzYQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LAO8nZL7R7x/ZhGmeQVF0oXzfwVDOVqQqZGyQ0FrZ1BasQwObm7LgJ/rDLi7JwhbG
         M4Y7FHlrj+xh7y3v9LJsoI3cKv05+xv54TFYviO3UCHIAkkqqewALM9YWesTO3PPAi
         u7kITpArOz51o18Fu71M3JsiEUJU3c2ll2GOFzxUEDHMPB0stSIBKPaVz89WeHmKvX
         UgAhPxIGnX3TuC2p6jJPuWsKGuXCyGGkQmntS+DOXlWxFd/cM48u1ss9Cb4k+yFTTJ
         Yw3f+nlf3HQ8Y+7E6U6EBvoDrRC8+Qr2zAuUoVpJbwTPCF+UI6vbdNiyUwZcUWTPE3
         U/eapJaQb8YCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6F826C05F98; Sat, 30 Apr 2022 22:49:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 30 Apr 2022 22:49:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: e_dimas@rambler.ru
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-SegdQ8DaQH@https.bugzilla.kernel.org/>
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

Dmitrii Levchenko (e_dimas@rambler.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |e_dimas@rambler.ru

--- Comment #234 from Dmitrii Levchenko (e_dimas@rambler.ru) ---
Thanks all for the effort.
Please also add:

$ cat /sys/class/dmi/id/board_name
PRIME H410M-R

$ dmesg
[ 1685.886012] nct6775: Enabling hardware monitor logical device mappings.
[ 1685.886040] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[ 1685.886044] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20210730/utaddress-213)
[ 1685.886048] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

$ uname -a
Linux localhost.localdomain 5.14.21-150400.19-default #1 SMP PREEMPT_DYNAMIC
Wed Apr 20 08:32:52 UTC 2022 (d6fb753) x86_64 x86_64 x86_64 GNU/Linux

$ cat /etc/os-release
NAME=3D"openSUSE Leap"
VERSION=3D"15.4 Beta"
ID=3D"opensuse-leap"
ID_LIKE=3D"suse opensuse"
VERSION_ID=3D"15.4"
PRETTY_NAME=3D"openSUSE Leap 15.4 Beta"
ANSI_COLOR=3D"0;32"
CPE_NAME=3D"cpe:/o:opensuse:leap:15.4"
BUG_REPORT_URL=3D"https://bugs.opensuse.org"
HOME_URL=3D"https://www.opensuse.org/"
DOCUMENTATION_URL=3D"https://en.opensuse.org/Portal:Leap"
LOGO=3D"distributor-logo-Leap"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
