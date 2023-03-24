Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4F9C6FD20
	for <platform-driver-x86@archiver.kernel.org>; Fri, 24 Mar 2023 14:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjCXO6m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 24 Mar 2023 10:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbjCXO6h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Mar 2023 10:58:37 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A94B760
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Mar 2023 07:58:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C3FCFCE2640
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Mar 2023 14:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1518CC433EF
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Mar 2023 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679669912;
        bh=vDf/naBXyRYkIM8kw1cbSz/oE6WXCNdOn14p31mAcCU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NEA+T65dsXlBJJv5Hm2lYkEeUQnzgPizLFwNCMzOOHRbd+L8gjJE6LUnCjNtEVMtQ
         Lmmcnr4kmtOxCXqC0eRg4FQ1bciSAVY5v/bJ3Zm6BB+b92eom7hkKKK6IwH9Twrqn6
         NjU/XZAgs3mXOJX8L+Wp00+0P996cUED9FYG5Z4d9Aytaa5VGnW1Sa7vF4d0KxsSOf
         hOrCV3WZ1SqyiHZPAVJWZjCJD5faAyieiFU2vXqEhiNHPvB5JJYH156k5pXyz4lG5e
         IfJzbHTqTeGiHgc03dNjDsLdFSLXZJm4UIuOTYGQ85YrwL3nOa6IAx3VFqXFlhtwSV
         SDtNAtlPenWZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0591EC43142; Fri, 24 Mar 2023 14:58:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 24 Mar 2023 14:58:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jeroen@beerstra.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-n23RhbCYlk@https.bugzilla.kernel.org/>
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

--- Comment #319 from Jeroen Beerstra (jeroen@beerstra.org) ---
(In reply to Jeroen Beerstra from comment #311)
> (In reply to Denis Pauk from comment #310)
> > Could you please check new one ? I have rebased patch to 6.2.7
>=20
> Applies, compiles, and works just fine. Thank you very much for your hard
> work, hope all of this lands in 6.3.

Same for 6.2.8. I did notice these warnings though:

drivers/hwmon/nct6775-platform.c:1325:21: warning: 'acpi_board_0LPC_MUTEX'
defined but not used [-Wunused-variable]
 1325 | DMI_ASUS_BOARD_INFO(acpi_board_0LPC_MUTEX,
"\\_SB.PC00.LPCB.SIO1.MUT0");
      |                     ^~~~~~~~~~~~~~~~~~~~~
drivers/hwmon/nct6775-platform.c:1319:31: note: in definition of macro
'DMI_ASUS_BOARD_INFO'
 1319 | static struct acpi_board_info name =3D {                          \
      |                               ^~~~
drivers/hwmon/nct6775-platform.c:1324:21: warning: 'acpi_board_LPCB_MUTEX'
defined but not used [-Wunused-variable]
 1324 | DMI_ASUS_BOARD_INFO(acpi_board_LPCB_MUTEX,
"\\_SB_.PCI0.LPCB.SIO1.MUT0");
      |                     ^~~~~~~~~~~~~~~~~~~~~
drivers/hwmon/nct6775-platform.c:1319:31: note: in definition of macro
'DMI_ASUS_BOARD_INFO'
 1319 | static struct acpi_board_info name =3D {                          \
      |                               ^~~~
drivers/hwmon/nct6775-platform.c:1323:21: warning: 'acpi_board_GPEM_MUTEX'
defined but not used [-Wunused-variable]
 1323 | DMI_ASUS_BOARD_INFO(acpi_board_GPEM_MUTEX, "\\_GPE.MUT0");
      |                     ^~~~~~~~~~~~~~~~~~~~~
drivers/hwmon/nct6775-platform.c:1319:31: note: in definition of macro
'DMI_ASUS_BOARD_INFO'
 1319 | static struct acpi_board_info name =3D {                          \
      |                               ^~~~

Since they seem pretty harmless to me, I didn't report them earlier.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
