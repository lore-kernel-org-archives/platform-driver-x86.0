Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF27C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Dec 2021 21:28:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhLNV2g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Dec 2021 16:28:36 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52888 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhLNV2f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Dec 2021 16:28:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4AC29B81D31
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Dec 2021 21:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 031D7C34604
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Dec 2021 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639517313;
        bh=Q7iyG9cQ6RXqEzzBwdVAHeUvJdUELkztp12X0zqOoBw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=luOYl2tAxEMX1h70F8fQwsfsJZSuxLfTv+h3ICZywGCcX2JitNMyQhTfBATskVr8E
         +lzR3XtOP5i6/NzMfp7QAvH0+EpZ1qIj0aiXL+ZyMWvFY5TRp8s2szzE+S/ygOlMql
         F26xyd8068kvBF4xEYltWNSL213t8JdCBLhsUvYVI0Uggi/sfFb9t0t+mZDvLOQCw1
         1MFxiBS5odqdAWWAE6k/H3lbVwqR8Afq0iv1QvTFwURHDO/LXueht+aDG1vm8nCDho
         VenUUvIwyQkuN3bX4/A79Lyt2FU96PfyyLOAXTtBT1Za5/G73r2QdM5l5N5SIsRSiH
         CiqVsAHEXSdEQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DE08361106; Tue, 14 Dec 2021 21:28:32 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Dec 2021 21:28:30 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-dlqkwbfOkQ@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #299975|0                           |1
        is obsolete|                            |

--- Comment #199 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300029
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300029&action=3Dedit
Asus WMI for nct6775 v5.15 base (2021.12.14)

(In reply to Vladdrako from comment #198)
> @Denis Pauk
> Fixed by replacing DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER
> INC."),       \ -> "ASUSTeK Computer INC."

Could check with updated patch?

(In reply to Jason Oickle from comment #196)
> I've been using the oct 10th version of this patch on 5.15 manjaro for a =
few
> weeks without issues. Amazing work by Denis and everyone else involved!
>=20
> I was just wondering if the patch is included in the 5.16 kernel or does =
it
> still need to be patched manually?

Thank you.

v5.16(nct6775) will have support of:
* "ProArt X570-CREATOR WIFI",
* "Pro WS X570-ACE",
* "PRIME B360-PLUS",
* "PRIME B460-PLUS",
* "PRIME X570-PRO",
* "ROG CROSSHAIR VIII DARK HERO",
* "ROG CROSSHAIR VIII FORMULA",
* "ROG CROSSHAIR VIII HERO",
* "ROG CROSSHAIR VIII IMPACT",
* "ROG STRIX B550-E GAMING",
* "ROG STRIX B550-F GAMING",
* "ROG STRIX B550-F GAMING (WI-FI)",
* "ROG STRIX B550-I GAMING",
* "ROG STRIX X570-F GAMING",
* "ROG STRIX Z390-E GAMING",
* "ROG STRIX Z490-I GAMING",
* "TUF GAMING B550M-PLUS",
* "TUF GAMING B550M-PLUS (WI-FI)",
* "TUF GAMING B550-PLUS",
* "TUF GAMING B550-PRO",
* "TUF GAMING X570-PLUS",
* "TUF GAMING X570-PLUS (WI-FI)",
* "TUF GAMING X570-PRO (WI-FI)",
* "TUF GAMING Z490-PLUS",
* "TUF GAMING Z490-PLUS (WI-FI)",

v5.17(nct6775) will have support of:
* "ProArt X570-CREATOR WIFI",
* "Pro WS X570-ACE",
* "PRIME B360-PLUS",
* "PRIME B460-PLUS",
* "PRIME X570-PRO",
* "ROG CROSSHAIR VIII DARK HERO",
* "ROG CROSSHAIR VIII FORMULA",
* "ROG CROSSHAIR VIII HERO",
* "ROG CROSSHAIR VIII IMPACT",
* "ROG STRIX B550-E GAMING",
* "ROG STRIX B550-F GAMING",
* "ROG STRIX B550-F GAMING (WI-FI)",
* "ROG STRIX B550-I GAMING",
* "ROG STRIX X570-F GAMING",
* "ROG STRIX Z390-E GAMING",
* "ROG STRIX Z490-I GAMING",
* "TUF GAMING B550M-PLUS",
* "TUF GAMING B550M-PLUS (WI-FI)",
* "TUF GAMING B550-PLUS",
* "TUF GAMING B550-PRO",
* "TUF GAMING X570-PLUS",
* "TUF GAMING X570-PLUS (WI-FI)",
* "TUF GAMING X570-PRO (WI-FI)",
* "TUF GAMING Z490-PLUS",
* "TUF GAMING Z490-PLUS (WI-FI)",

v5.17(asus_wmi_ec_sensors) will have support of:
* "PRIME X570-PRO",
* "Pro WS X570-ACE",
* "ROG CROSSHAIR VIII DARK HERO",
* "ROG CROSSHAIR VIII FORMULA",
* "ROG CROSSHAIR VIII HERO",
* "ROG STRIX B550-E GAMING",
* "ROG STRIX B550-I GAMING",=20
* "ROG STRIX X570-E GAMING",=20

v5.17(asus_wmi_sensors) will have support (board version from 2) of:
* "PRIME X399-A",
* "PRIME X470-PRO",
* "ROG CROSSHAIR VI EXTREME",
* "ROG CROSSHAIR VI HERO",
* "ROG CROSSHAIR VI HERO (WI-FI AC)",
* "ROG CROSSHAIR VII HERO",
* "ROG CROSSHAIR VII HERO (WI-FI)",
* "ROG STRIX B450-E GAMING",
* "ROG STRIX B450-F GAMING",
* "ROG STRIX B450-I GAMING",
* "ROG STRIX X399-E GAMING",
* "ROG STRIX X470-F GAMING",
* "ROG STRIX X470-I GAMING",
* "ROG ZENITH EXTREME",
* "ROG ZENITH EXTREME ALPHA",

Support of others boards is not merged/reviewed yet.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
