Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1545EEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Jul 2023 18:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjGXShI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Jul 2023 14:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjGXShH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2023 14:37:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331881BD4
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 11:36:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19D3E613B3
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55EB3C433BA
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690223800;
        bh=RDLzd4tyXD3l/QfWDpmlYRh1LVw06uKUEom9WtTAwTU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LF7rTNyMjoOp7rtlksWLNS519F4b5pZXvKddfTAjltQVTPH8I0yfxyDB0e/9n2pIq
         T4Mbuf+qdkv5p/XfGI0eGRWyZTe48QGJA98OtCuqsw8Obcs578WeMHwBNRTAoaUco9
         VR0bVOD77S2xqcGQXU12P2SzwGUbgY47xix8YY302rkjASG/QkmhetkmuLUNJOVnju
         tXiHfHaclhaFKneLnd8jJFE8ry1Js/XBKlqs9bu4wYqECYakVxPolEVF9ALSS4gSxq
         3cO1sCKpmdVIED8iF9q7hyPFh3V8Zc7oT04sIdTZAMHFH9GHxBDuzoZ3NPDnmSm03A
         CIRde067BCmrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 36379C4332E; Mon, 24 Jul 2023 18:36:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Mon, 24 Jul 2023 18:36:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-or0atMowQ3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #10 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mario Limonciello (AMD) from comment #9)
> > [  205.216161] amd-pmf AMDI0102:00: registered PMF device successfully
> > [45870.908318] amd-pmf AMDI0102:00: supported functions:0xe0c3
> > notifications:0x10
> > [45870.908366] amd-pmf AMDI0102:00: system params mask:0x3 flags:0x1
> > cmd_code:0x0 heartbeat:60
> > [45870.908375] amd-pmf AMDI0102:00: Sending heartbeat to SBIOS
> > [45870.908461] amd-pmf AMDI0102:00: registered PMF device successfully
> > [45933.040354] amd-pmf AMDI0102:00: Sending heartbeat to SBIOS
> > [45994.483802] amd-pmf AMDI0102:00: Sending heartbeat to SBIOS
>=20
> Your system is similar to the bug report
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217571

I've no problems with frequency scaling. Also it looks like the OP uses
amd-pstate and I use acpi-cpufreq since amd-pstate is not enabled by defaul=
t.
Under the specific AMD driver idle power consumption without RyzenAdj remai=
ns
very equally high.

>=20
> It supports PMF FN8.
>=20
> That is these two patches may help:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x8=
6.
> git/commit/?h=3Dreview-hans&id=3D25e3e5ba62e55b156ec0077211451241256ccba5
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x8=
6.
> git/commit/?h=3Dreview-hans&id=3D747fb5141bb12f271b528a2ef0d25e50f85945bf

Is the second patch queued for 6.5? I wouldn't want to compile the kernel j=
ust
yet but I can check Fedora's 6.5-rc3.

>=20
> They will enable SPS for EC notification.  This turns on ACPI platform
> profile support as well.
> See if that improves things when you select "power saver" in
> power-profile-daemon.
>=20
> > Please check the attached screenshot, it says it all.
>=20
> I'm sorry; but it doesn't.  PMF works as a coordination between many
> components not just the APU.  That's why I wanted to see the dynamic
> debugging output.

My laptop hits a 4.5GHz frequency wall under Windows 10, Windows 11 and Lin=
ux
despite power consumption or temperature which are far below this system li=
mits
~51W/100C. I've now tried to open five support requests with HP but they do=
n't
even want to confirm the bug. I hoped you would ask me to provide certain C=
PU
registers values to confirm it's a firmware limit. A HWiNFO64 developer ref=
used
to confirm the bug citing the global CPU frequency limit confidentiality/ND=
A:

https://www.hwinfo.com/forum/threads/frequency-limit-global-for-ryzen-7-784=
0hs-zen-4-phoenix-cpu.9044/post-40967

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
