Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A069C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 May 2022 19:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241475AbiECTKR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 May 2022 15:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236659AbiECTKP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 May 2022 15:10:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB432ED5A
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 12:06:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57A0561940
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 19:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA5BAC385D4
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651604801;
        bh=rtdCDzhflyv/ndef9Tnw0l/VCZzdoXJY5YEjb0gkPvo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RP54sX6JKUOKmmEMKBvGGtovrvDSFUD6Y64B8jHRBBjil+i0DwE8FTmyXC3TJ+Fm4
         PV3lbZQQCrMSkPU2l2q2b4hkpTLieKxIopvvx1pJU3pGr2frtPej8jlldcm01fWXHB
         9tnvlx9wZ1oFalD6yyh2I/BQAGYo15MU4jA4rFnm04MZCjNMGeZ7nXH1lrSiOOn8VI
         TbEpZyODYIyu8UnlvhNxHoAHkesNtCDehzgCzEbotUSs56DezwIuH2Psz0+HCDI3jC
         XHYrSI6G1SbP8THAU5w74/2iKGwKi3/2yRLtXJb8QcxqZTAVosz9W7LINXyJIpUeRI
         HsRZ3b3ImF+Hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AA34ACC13AF; Tue,  3 May 2022 19:06:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 03 May 2022 19:06:39 +0000
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
Message-ID: <bug-204807-215701-NjOT8ebSI7@https.bugzilla.kernel.org/>
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
 Attachment #300687|0                           |1
        is obsolete|                            |

--- Comment #235 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300872
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300872&action=3Dedit
Asus WMI for nct6775 v5.17 base (2022.05.03)

Added support by WMI for:
* PRO H410T
* PRIME H410M-R
* ROG STRIX X570-E GAMING WIFI II

By ACPI lock (will not be upstreamed):
* ROG STRIX Z370-H GAMING

Code is fully untested.

(In reply to Dmitrii Levchenko from comment #234)
> Thanks all for the effort.
> Please also add:
>=20
> $ cat /sys/class/dmi/id/board_name
> PRIME H410M-R
(In reply to Hubert Banas from comment #233)
> >=20
> > It can be part of 5.19+ if patch will be accepted before start of the n=
ew
> > merge window. (I have not sent patch yet.)
>=20
> Sounds good. Thank you.

Upstream contains rework of nct6775, I have applied all commits but can't c=
heck
code with real hardware for now. If everything works for you, i will send p=
atch
to updated with new boards.

(In reply to Emmanuel Mayor from comment #223)
> Same issue with Rog Strix Z370-H Gaming, which has Nuvoton NCT6793D
>=20
DSDT does not have required WMI interface, board support can be implemented
only by direct lock of ACPI mutex.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
