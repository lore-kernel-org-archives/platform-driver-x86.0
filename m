Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC068C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Nov 2022 22:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiKWWMO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Nov 2022 17:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKWWLr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Nov 2022 17:11:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEB1129C2B
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 14:11:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7392DB8254E
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 22:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29ED9C433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 22:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669241502;
        bh=ht+Ia9DSFGvZdeCdfwe2nY6IroPDh0Kmc34JbuT9xFk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=en3UhiAjHBq9a3eJOoAqS4d/dOr6PoQTsA99XUgrzZ3v4r6jBTaYGUWEAgr7wtQbF
         akTIkKm1zXjhps4t5MBxDH5XYs0wWhZNdYf1fkgzt66FVr3t0j6pwH+0V4IL1yTX9X
         otmlycqQaAGlbxF6rSFffgfKQnjO8JGPsw/ulMvNKudDc55ARkqK1RqFF2yVd8Ghyg
         dDEv5FgUDZZ8mebRkJM1yjry4d5eD2Cp+2oWwM3QXij0p21bZQ8w1F0idvqL6SWziK
         HkSmf9HVnoiYUg6bR1Gka7uOL7VBMfcuu5okj2nM9/nW33Vzne4HCvWMHeUax+AFKH
         QzxlfhrPzgblg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1BBD4C433E9; Wed, 23 Nov 2022 22:11:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 23 Nov 2022 22:11:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sst@poczta.fm
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-rQt5Z1Z4qd@https.bugzilla.kernel.org/>
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

--- Comment #274 from Slawomir Stepien (sst@poczta.fm) ---
(In reply to Slawomir Stepien from comment #273)
> (In reply to Denis Pauk from comment #272)
> > (In reply to Slawomir Stepien from comment #271)
> > > Created attachment 303265 [details]
> > > Add support for ROG STRIX B660-I GAMING WIFI
> > >=20
> > > This adds support for ROG STRIX B660-I GAMING WIFI into the "Asus WMI=
 for
> > > nct6775 v6.0 base (2022.11.12)" patch.
> >=20
> > Thank you! I will add your code to the next patch version.
> >=20
> > Just for recheck, could you please share error place on init when you a=
dded
> > your board to asus_acpi_boards(x670 generation methods) or
> > asus_wmi_boards(b550/x570 generation methods)? Are both of methods of
> access
> > failed?=20
> >=20
> > I have hoped B660 boards have same access method as x670 boards at least
> :-(
>=20
> [93233.798384] nct6775: Can't read ChipID by Asus WMI.
> [93233.798386] nct6775: No dmi definition `ROG STRIX B660-I GAMING
> WIFI`:`ASUSTeK COMPUTER INC.`
> [93233.798446] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> [93233.798449] ACPI Warning: SystemIO range
> 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> 0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20220331/utaddress-20=
4)
> [93233.798452] ACPI: OSL: Resource conflict; ACPI support missing from
> driver?

But if I add the board to the asus_acpi_boards, it works but with:

[93515.558164] nct6775: Using Asus ACPI to access 0xc1 chip.
[93515.558166] nct6775: No dmi definition `ROG STRIX B660-I GAMING
WIFI`:`ASUSTeK COMPUTER INC.`
[93515.558229] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

So I guess this is a better approach for my case?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
