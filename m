Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9065AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Dec 2021 21:55:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237671AbhLHV7F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Dec 2021 16:59:05 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60470 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbhLHV7E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Dec 2021 16:59:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 00743B82313
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Dec 2021 21:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CCCCC341C3
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Dec 2021 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639000529;
        bh=6EGNV8PHZ1Fpwy5tWu5BYnxgqomGn6sELgs4WeDx4Qg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UOAQoH6GFbzvhMmf7vit6cTIPaqSlQasDmB5pp0YHdQkudXUtBDSuup5C1t1n1VEn
         ibX9dX4CBPJSiXM4DxxV5QBIxZE9o4ST56WSoL52asnYyqxnCYCUYI0JKDGmsrGYk7
         Q3wQ6tLmCNjy7FJIanbWlUrAZpgjGsz55NK95cSBYLuZlb9H8sk8O1iaJw8d2qm2j3
         fWzZCW3Xl/Dm4/IFIJz6vBDVBtJrcyghzTtTdaKJDXkrcpcuB3PJUYB9qzPR7Zty4D
         PrVSJ+SjgH9J8bh8g8dbtjToDNEZFFASsHqLPV9DfQeLyY6mFq4g5QXcOfjge04iMS
         yaAPfRhGzGbnA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7CA8260EBC; Wed,  8 Dec 2021 21:55:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 08 Dec 2021 21:55:27 +0000
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
Message-ID: <bug-204807-215701-wLFOzQz7up@https.bugzilla.kernel.org/>
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

--- Comment #192 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Vladdrako from comment #184)
> No changes with the latest patch on old ASUS P8Z68-V LX. (sorry for post
> spamming, newbie here) Kernel 5.15.2 Manjaro.
> Attached DSDT dump and dmesg.

(In reply to Vladdrako from comment #188)
> > P8Z68-V is not in the list of supported boards, could you try add it to=
 the
> > list (asus_wmi_info_table)?=20
>=20
> Added DMI_EXACT_MATCH_ASUS_BOARD_NAME("P8Z68-V LX", NULL),
> Nothing changed.
>=20

I am afraid "P8Z68-V LX" will be unsupported. I don't see any Acquire locks=
 in
your dsdl related to 0x0290 region and all calls made direct operations with
superio chip. You can try with DMI_EXACT_MATCH_ASUS_BOARD_NAME("P8Z68-V LX",
&acpi_board_LPCB_MUTEX), But I am not sure that it will lock correct mutex =
or
be safe.=20

@Eugene Shalygin Could you correct me if I have missed something?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
