Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05218C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 13:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240808AbiAKNpF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 08:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240790AbiAKNpF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 08:45:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1109C06173F
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 05:45:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 94C9D61668
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 13:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08967C36B0A
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 13:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641908704;
        bh=LzOBaWUp38eN5kFiL2DZRfjkxIt7gUqwlEfgMrriEyQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RUFmFeBwDkx5UOTTqZD/+rHPQwkdp0cDOhlpXa6bN1Lfp3oGFe6+9aDxYOhAnik95
         ngWGDZGezKR6cYpYl0cpBXuaPrGse46i1SchJ1BHulJgtDv2V8UYa46g05kIPnE0QB
         r8n1F/fdrQ6VO27Rt0nSlHsJX8aCDog7F1fwrYZeQMTACk0EmbglotNR82bAPOdxjJ
         7eZyKOoYxX2VAR95Bq9ZvfX7Kh5hLOKS2NfADtyLXOMxbq7Uz7ftdvOwHkxDExh2Jx
         uU4n54wz9+P0yu69O7A8ctRCiZ09Qo26r/NmV8JbCpS0YzZvt68SsCFE+XTDiK0oVy
         UJktCZEkE7p7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ECE78C05FD5; Tue, 11 Jan 2022 13:45:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 11 Jan 2022 13:45:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: savicaleksa83@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-dgAx7J9Cin@https.bugzilla.kernel.org/>
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

Aleksa Savic (savicaleksa83@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |savicaleksa83@gmail.com

--- Comment #206 from Aleksa Savic (savicaleksa83@gmail.com) ---
Hi! I've tested my ROG STRIX B450-F GAMING II with asus_wmi_sensors. Seems =
to
mostly work?

asus_wmi_sensors-virtual-0
Adapter: Virtual device
CPU Core Voltage:        905.00 mV=20
VPP MEM Voltage:           2.54 V=20=20
+12V Voltage:             10.25 V=20=20
+5V Voltage:               5.15 V=20=20
3VSB Voltage:              3.40 V=20=20
VBAT Voltage:              3.29 V=20=20
AVCC3 Voltage:             3.40 V=20=20
SB 1.05V Voltage:          1.04 V=20=20
CPU Core Voltage:          0.00 V=20=20
CPU SOC Voltage:           0.00 V=20=20
CPU Fan:                  795 RPM
Chassis Fan 1:            813 RPM
Chassis Fan 2:              0 RPM
Chassis Fan 3:            555 RPM
AIO Pump:                   0 RPM
Water Pump:                 0 RPM
CPU OPT:                    0 RPM
CPU Temperature:          +36.0=C2=B0C=20=20
CPU Socket Temperature:   +30.0=C2=B0C=20=20
Motherboard Temperature:  +32.0=C2=B0C=20=20
Chipset Temperature:      +36.0=C2=B0C=20=20
Tsensor 1 Temperature:   +216.0=C2=B0C=20=20
CPU VRM Temperature:       +0.0=C2=B0C=20=20
CPU VRM Output Current:    0.00 A

Not sure what's up with Tsensor1.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
