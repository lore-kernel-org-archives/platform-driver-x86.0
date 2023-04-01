Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106D2C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Apr 2023 13:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjDANKE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 1 Apr 2023 09:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDANKD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Apr 2023 09:10:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A555920DA1
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 06:10:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 494E360E05
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 13:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5A87C43442
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680354601;
        bh=MTJIpzMj7+F59T0CmzNWKBJHjtRXloICwZBIAkNYHac=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sZUxLqP+XRq3IJ2mWfAOSdxygZLj3l220HmPU332LpSiK1GqK4cUCUoik/wJm1HgN
         uiq92WFDT7CSvwsHSz/fBkie4tEb1TuyvhcoffAL8+MlowOOXMayjcyblJGF+bPyRo
         faBTCWtk0/p0QuooBvIohMLXPus9OY+YluhdBfif3iRB7FtSuEM4dqfp7XJLV1LGut
         mUSQYCkLtYbTtAVGUzd+tVhC3NgEr9DcJ59xC7PGdCZ+uSquSASX5bccpAiTReXuP8
         ozGUD96gJ+UsJxRBojoyM2AH0iC77IDfeAlzaQVqF2Ke+DdIHtMOK7Nqiq5OzTOxSs
         5HavZLlhJMWSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 96873C43141; Sat,  1 Apr 2023 13:10:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 01 Apr 2023 13:09:59 +0000
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
Message-ID: <bug-204807-215701-mvAQtSs6sA@https.bugzilla.kernel.org/>
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
 Attachment #304011|0                           |1
        is obsolete|                            |

--- Comment #321 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 304071
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304071&action=3Dedit
Asus WMI for nct6775 v6.2.9 base (2023.04.01)

Updated patch version.

(In reply to Micka=C3=ABl Blanchard from comment #320)
> Hi,
>=20
> I wonder why the board B550M-K has disappeared from the final patch
> integrated in the kernel sources. It's somewhat the same board as B550M-A,
> which is included.
> Moreover, it's in the list in comment #278:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D204807#c278
>=20
> An unfortunate omission? :)
>=20
> Thanks!

Do you mean "PRIME B550M-K"? Both hwmon-next branch and patch have it in
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/tr=
ee/drivers/hwmon/nct6775-platform.c?h=3Dhwmon-next&id=3D8a863eb1b1162653d13=
3856702e13560f3596b85#n1076

Do you have some load issue with new patch?=20=20

(In reply to Jeroen Beerstra from comment #319)
> (In reply to Jeroen Beerstra from comment #311)
> > (In reply to Denis Pauk from comment #310)
> > > Could you please check new one ? I have rebased patch to 6.2.7
> >=20
> > Applies, compiles, and works just fine. Thank you very much for your ha=
rd
> > work, hope all of this lands in 6.3.
>=20
> Same for 6.2.8. I did notice these warnings though:
Thank you, should be fixed in new patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
