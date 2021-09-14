Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691F4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Sep 2021 17:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BB4260EC0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Sep 2021 17:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhINRcu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Sep 2021 13:32:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229526AbhINRcu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Sep 2021 13:32:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DB47561178
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Sep 2021 17:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631640692;
        bh=zonsHUHgS6CklXbebewEWMcpXlQr4fsQ6cT47KJjIys=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=suZLZKewrB0eytXrNbUsIdFzgZ5QE7sgw0aneVn0GXcp9Ikndk6MDuzMA3aOTKpCg
         nRxyFNyhG4MYmA7UsyOUpGpJb6my7ta0h9/EgrGWct1f29cF6xQoTASmt2L/0w7SAg
         7oUK7bjEMxR2HcHCBR+chqrKHD1vkLZAo/PE8Fr1+5iHm4mZ2ec57zixXc/8Kcw4Ay
         XxyXvXYedgckGBA0xswQ+UHhGyCNVSqI99W74HgxEB7169TKbtCXYDNjeeSZpUNcMf
         ndFeNGJ7zoCXhs/9QfH47o7Q+fvK2XZYeuCCnQ2Vk929vT/zCAUhO12XorZncAIma4
         Np4Bd6iCxIjyg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Sep 2021 17:31:31 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-V01SLcaKRE@https.bugzilla.kernel.org/>
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

--- Comment #109 from Jonathan (greenbigfrog@gmail.com) ---
Created attachment 298799
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298799&action=3Dedit
dmesg for boot with Denis's patch applied

(In reply to Jonathan from comment #106)
> (In reply to Denis Pauk from comment #105)
> > (In reply to Jonathan from comment #103)
> > > Hi,
> > > (oh. Could've put my comment in the attachment comment... duh)
> > > I applied Denis Pauk patch today, (how I did it described in
> > > https://gist.github.com/greenbigfrog/26f948c9d86f1cb2fd23bfeaa23ca068=
 ).
> > > While I'm not sure if I did everything correctly, I can see nct6775
> pulling
> > > in the wmi module now, so I'm fairly certain I'm running the patch.
> > > And yet I'm somehow still getting the acpi access warning, and no fur=
ther
> > > sensor output.
> > > Did I do something wrong?
> > >=20
> > > System: Asus TUF Gaming X570-Plus (Wi-Fi) with 5600X
> >=20
> > Could you please check with original patch from Bernhard Seibold?
> > And check what is value in "/sys/class/dmi/id/board_name" ?
>=20
> Sure. I'll try the "original" patch tomorrow.
>=20
> ```
> cat /sys/class/dmi/id/board_name=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
>=20
> TUF GAMING X570-PLUS (WI-FI)
> ```

I've tested both patches now. I had trouble getting Bernhard's to run via d=
kms,
so I built a custom kernel. Worked flawlessly afterwards.
Out of fairness (since I'm really not that sure if my dkms attempts yesterd=
ay
actually worked), I also built a kernel with Denis's patch. Didn't change m=
uch.
I've attached dmesg for Denis's patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
