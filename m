Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E54C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 09:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240390AbiBEJNG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 04:13:06 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:59854 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236403AbiBEJNF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 04:13:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E17AB839D6
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 09:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B63B0C34110
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644052383;
        bh=Fhvr7cwrcJ06pCFdNIFazcbpCblkh5Q757NksKgzHEs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iTY7huGybqda7dHOBYOU2Gi7adtMJgwdM4wK9qv/BpMuyewp+yM1acGNa+mCq7nzW
         yaY8JM4f6x2GzpzThg8Bg6vGeCaLYKGRnlEMTKKOLtUnRpyM708rK6Vd3c6uWXumoU
         zEA2HwMnvRVwr8u5vlUHJqR1tGCXVBRZfbUusroSA/qgHtQtTbG4oz+8XTT200mX3b
         xAUz6m7nQVs0p6OHJ8cAtOpfu3QYJztJJgiwKvcf+SPdLzuOzM9PQJheQ2FYzZPW0w
         st4qYiK6PxXey7/XNzahUGH6nJMXscwvmDXml0ls06NAEIqeHJ4L/1CURvXE/JFbYN
         3zJJU1QsgHLQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A6FC9C05FD6; Sat,  5 Feb 2022 09:13:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 05 Feb 2022 09:13:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaap.dehaan@freenet.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-rAoKKV0DCg@https.bugzilla.kernel.org/>
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

--- Comment #215 from Jaap de Haan (jaap.dehaan@freenet.de) ---
My Board happens to report "PRIME X570-P" instead of "PRIME X570-PRO" (what=
 I
saw in the source code)...


> sudo dmidecode -t 2
> # dmidecode 3.2
> Getting SMBIOS data from sysfs.
> SMBIOS 3.3.0 present.
> # SMBIOS implementations newer than version 3.2.0 are not
> # fully supported by this version of dmidecode.
>=20
> Handle 0x0002, DMI type 2, 15 bytes
> Base Board Information
>       Manufacturer: ASUSTeK COMPUTER INC.
>       Product Name: PRIME X570-P
>       Version: Rev X.0x
>       Serial Number: 200569769502586
>       Asset Tag: Default string
>       Features:
>               Board is a hosting board
>               Board is replaceable
>       Location In Chassis: Default string
>       Chassis Handle: 0x0003
>       Type: Motherboard
>       Contained Object Handles: 0

I have the latest available bios installed for my board.

> BIOS Information
>         Vendor: American Megatrends Inc.
>         Version: 4021
>         Release Date: 08/09/2021
>         Address: 0xF0000
>         Runtime Size: 64 kB
>         ROM Size: 16 MB
>         Characteristics:
>                 PCI is supported
>                 APM is supported
>                 BIOS is upgradeable
>                 BIOS shadowing is allowed
>                 Boot from CD is supported
>                 Selectable boot is supported
>                 BIOS ROM is socketed
>                 EDD is supported
>                 5.25"/1.2 MB floppy services are supported (int 13h)
>                 3.5"/720 kB floppy services are supported (int 13h)
>                 3.5"/2.88 MB floppy services are supported (int 13h)
>                 Print screen service is supported (int 5h)
>                 8042 keyboard services are supported (int 9h)
>                 Serial services are supported (int 14h)
>                 Printer services are supported (int 17h)
>                 ACPI is supported
>                 USB legacy is supported
>                 BIOS boot specification is supported
>                 Targeted content distribution is supported
>                 UEFI is supported
>         BIOS Revision: 5.17

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
