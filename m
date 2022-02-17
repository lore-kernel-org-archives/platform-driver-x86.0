Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A27C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 16:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbiBQQM2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 11:12:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242939AbiBQQM1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 11:12:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E610151C41
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 08:12:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A42D61023
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 16:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8D2FC34114
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645114330;
        bh=ViAnvYQlY/iXuXjT46Q2jPkv9xlUTkwtoYodHx9q9c0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vKqS5pULyege5xaMwUdYANYNtKy0llYVedijrEghtYzOrCnpcPabMurswkfogPXot
         OrcZ8m86NYoRK3rNLyLlK6tc+C+4DFlfo2xlB7RpHb6DeNiZmayz2EVtVepWkvdXUL
         1uplDE5yWAs4n9DyCQZGhuiUfi9N8Ts8PhXD9kawj1v+IiQDIFHP/qUlCN0TeCr4bX
         UH6tCq+39L0FO8OgMzuSHnmptcwlY2ghT+yE4TQtJhGDmhV12sgC26rNa7sfQ0fNXl
         G/SdhplnS5wBb0epcQ2cbtsaUj3jLjxCPmV3+6CqJYQzICVfRhNny6zhjnIEx4wwar
         x/HzEcedyYeHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D63A5C05FD6; Thu, 17 Feb 2022 16:12:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 17 Feb 2022 16:12:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: 246tnt@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-s6erHw9gSx@https.bugzilla.kernel.org/>
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

Sylvain Munaut (246tnt@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |246tnt@gmail.com

--- Comment #219 from Sylvain Munaut (246tnt@gmail.com) ---
Created attachment 300478
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300478&action=3Dedit
ASUS PRIME H510-K DSDT table

So, I have an ASUS PRIME H510-K motherboard and was faced with the same iss=
ue.

Just adding the motherboard in the list wasn't sufficient however. Because
although the ACPI method exist for read/write of the registers under the WM=
BD
method, the WMI table listing the GUID doesn't actually list that 0xBD obje=
ct
so the WMI calls failed ...

I "worked around" it by runtime patching the DSDT table, but it's not exact=
ly
user friendly ... maybe a module quirk based on model to ignore the _WDG ta=
ble
and just calling WMBD directly would be better.

Anyway, just wanted to report on my experience.

I also contacted Asus and described the issue in detail, but let's face it,
there isn't a chance in hell that this is going to be fixed on their side .=
..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
