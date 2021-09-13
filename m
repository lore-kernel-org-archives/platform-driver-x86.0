Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20BBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 22:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74E8A6115C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 22:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242577AbhIMWbC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 18:31:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240592AbhIMWbB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 18:31:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A3786113E
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631572185;
        bh=mJarsf2XRXYc8XZQhgo+jI7Bu5nKS2CemMuIbO0H+PI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AeYU5/Du2KXOCkXvTstjgrZN+pYDr4GRPkPEwVJGr0AdP9UUcgct+mhOQFfWT0BUR
         rZE0zYGk0NrjKMjRtZnVqpHJ2Xcez+s0viC659tSxbV2BjPvq3eTGJ+/sttbt028BT
         q2ERqNUKYHvnPBiu33+f3oq2Q7dQfyll5lq46K4iwXgQPq1LpTQNjcIbdpMfO+Zvya
         J/I25hWooGBiuaFMDf4PO+Z20tGzq9qzTJuCc6kY0CEFa512+7cKOImb75+vmQI3Tp
         gom++xkCpS2bM7flU4F364xs2XQ5nUsNWo/21VG40WKoK1FMd7hb8qvRbsOSTYH5Wn
         M5kb3p67y/Jew==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 13 Sep 2021 22:29:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greenbigfrog@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-TredVAG2Rb@https.bugzilla.kernel.org/>
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

--- Comment #106 from Jonathan (greenbigfrog@gmail.com) ---
(In reply to Denis Pauk from comment #105)
> (In reply to Jonathan from comment #103)
> > Hi,
> > (oh. Could've put my comment in the attachment comment... duh)
> > I applied Denis Pauk patch today, (how I did it described in
> > https://gist.github.com/greenbigfrog/26f948c9d86f1cb2fd23bfeaa23ca068 ).
> > While I'm not sure if I did everything correctly, I can see nct6775 pul=
ling
> > in the wmi module now, so I'm fairly certain I'm running the patch.
> > And yet I'm somehow still getting the acpi access warning, and no furth=
er
> > sensor output.
> > Did I do something wrong?
> >=20
> > System: Asus TUF Gaming X570-Plus (Wi-Fi) with 5600X
>=20
> Could you please check with original patch from Bernhard Seibold?
> And check what is value in "/sys/class/dmi/id/board_name" ?

Sure. I'll try the "original" patch tomorrow.

```
cat /sys/class/dmi/id/board_name=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
TUF GAMING X570-PLUS (WI-FI)
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
