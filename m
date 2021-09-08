Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF41C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 00:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D07A61163
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Sep 2021 00:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346025AbhIHASC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Sep 2021 20:18:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:60802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233183AbhIHASC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Sep 2021 20:18:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AB11461151
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Sep 2021 00:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631060215;
        bh=Bd21Jc1TmI41Zdh6RqyMsHSYcjBz7a6YjS7OWhgyvj0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R006QSYtm9OEJ42tSGDN0mhKVoO4tY5pw8Y6HV+gKOIP2Vhxw0dVzpNwzsovCgtQt
         /70cFX792UWJkh7uDLKv5aSDm6KLI06mCEw4rntmhdH8Hb+n3cax5rvL0il3K4S6dr
         sL6qdLiKBTmSrmaLRhc8DlsGWckA0O0FWUhd771lghVrKNiF873GX30Pc50ynJZnF8
         KWUVlVsclm5/Lhlg67FbP48mYj5+/oOc6b9MhW8cC47dbU4NqFiV5SOZ9BnogbEd+H
         MM03nIlWjdx/GvXSlevtzQlbeP7CvvVGhUZWNVHoWGdTyGxSnWjl8kSS0MaJF2SIvc
         dtLdq5ZUymUiw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 08 Sep 2021 00:16:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-YhMAymqQAa@https.bugzilla.kernel.org/>
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

--- Comment #95 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to dflogeras2 from comment #94)
> Thanks Denis!  Can confirm the module loads successfully on an Asus PRIME
> B460-PLUS with the following:
>=20
> [608513.608260] acpi PNP0C14:02: duplicate WMI GUID
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
> [608513.608293] acpi PNP0C14:03: duplicate WMI GUID
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
> [608513.608355] acpi PNP0C14:04: duplicate WMI GUID
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
> [608513.608404] acpi PNP0C14:05: duplicate WMI GUID
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
> [608513.609331] nct6775: Using Asus WMI to access chip
> [608513.609437] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
>=20
> I'm not sure about the duplicate warnings, maybe because I am still runni=
ng
> a kernel with acpi_enforce_resources=3Dlax (did not reboot before inserti=
ng
> the patched module).

That's bug 201885 which is not related to this one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
