Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77F7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 20:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKAU7I (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 16:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiKAU7H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 16:59:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F231AF11
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 13:59:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B467B6173A
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 20:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1567CC43165
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667336345;
        bh=+QeNvsC8Vv3BCAgmQKJcypCpq0sE/1QxYMs07kDDzyc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QgT6Huj5MM4vf0TlMi1jRgTQ9RwCqaeWEj9avwX/109sLv2KapjsGe2s4J/wUnJRl
         bZs9Ny9WvESU6XKt1hi9zXQHR02pOLYlJ9Zz22l94tj1N6fv+aD3iWfsgVOtUhU770
         njmd1Z4uPzzX6pDexPsQ/kSxEwijGnOFNbr7SPI2/j3GsRDe63e6xf1SbkjQdDGL0T
         gqJiv5zz7jXp2PpK/wpZrl+2dCK6c7Y0aFw4fQAC48z29ppW8UHjSLBuvsUu4pi+Ph
         km/C3J4f9toH9tSy57KIiAP5nrEbgFHOQMhfW6vlBKFR4CmMnK9OIqnuCnw+Ef0hJx
         hlaHlI6N4iwHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 04F6FC433E7; Tue,  1 Nov 2022 20:59:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 01 Nov 2022 20:59:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-9SZu0xSNLW@https.bugzilla.kernel.org/>
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

--- Comment #265 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to zykr.caswell from comment #264)
> Created attachment 303116 [details]
> DSDT - X99-E-WS-USB3 - Decompiled
>=20
> Same or similar issue with X99-E WS/USB 3.1:
>=20
> nct6775: Found NCT6791D or compatible chip at 0x2e:0x290
> ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 confli=
cts
> with OpRegion 0x0000000000000290-0x0000000000000299 (\_GPE.HWM)
> (20200925/utaddress-204)
>=20
> I've been trying to make sense of the DSDT by reading the ACPI spec, but =
I'm
> not having a lot success. Built kernels 5.10, 5.19, 6.0.2, 6.03, and seve=
ral
> different versions of nct6775 driver for each including "Asus WMI for
> nct6775 v5.20 base (2022.10.20)", both in tree and as a custom DKMS module
> to no effect.
>=20
> I'm rather reluctant to actually try using acpi_enforce_resourses=3Dlax, =
so I
> don't know for sure if that would make it work or not. I've attached my D=
SDT
> as pulled from the latest BIOS update for my board from ASUS. Could someo=
ne
> take a look and confirm for me that I likely have this same problem?

Could you please apply patch and add line with you board and recheck? Change
should be like "DMI_MATCH_ASUS_WMI_BOARD("<You board name>",
&acpi_board_LPCB_MUTEX)," near "MAXIMUS VII HERO" definition.

Name board should be from /sys/class/dmi/id/board_name.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
