Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F0AC4167B
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 14:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377860AbjKCOE0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 10:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377932AbjKCOET (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 10:04:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE57D66
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 07:04:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D016C433C9
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699020255;
        bh=lN7YMmdS9GiRVczwWt+EsPSPgFOcImOnvDUlwulFW5U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R1YSfG69dt5Sbf4ZSjlZosOIYVNyeZMHcKpJqD7FHPD06+Cx4x6/yTmgTI1bLo2kX
         Z8rNVShwqDbdELSfet3McwHDONt6p09OxG1nLTqPhth0VJXi4HHVItKLDXbReQOaT6
         1v9tMJJsSeayoXvkjSp3eb7TaViSTu9iidPE1r7Hxl0pqmIH43kRjV8py5F5mIOsMv
         QVegt1l9JOzRDvIw6iw5z0keS5MY6pnGRi2Iooc6HV1kf03D1r7PgeceWTo3pp/4As
         SYjJu7B/UynWeuclTgs+iNX3FJ7WJySktJ+Bntv1UlnTljGnXM1FDLr74he55zyXg1
         zdK72YUlRFMtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 80D18C4332E; Fri,  3 Nov 2023 14:04:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 14:04:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-ysFKxB81zq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #52 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Bagas Sanjaya from comment #51)
> (In reply to Ertugrul Uyar from comment #50)
> > (In reply to Mario Limonciello (AMD) from comment #49)
> > > The patch doesn't work for your system this means.
> > >=20
> > > > ertugruluyar@ertugruluyar-pc:~$ sudo cat /sys/power/mem_sleep
> > > [sudo] password for ertugruluyar:=20
> > > s2idle [deep]
> > >=20
> > > From you above logs your system uses S3 by default, so it's not
> surprising
> > > the patch doesn't work. It's only for systems that use s2idle.
> > >=20
> > > So there is some other problem than we have observed in the past.
> >=20
> > Okey, then, should I change to s2idle or remove the kernel that patched=
. I
> > am on tuxedo's kernel by choose on grub menu. What do you suggest to me,
> > should I just add amd_iommu=3Doff to my grub config? Thank you for your=
 helps
> > by the way.
>=20
> Try that!

How can I change to s2idle?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
