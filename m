Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F4AC07E9D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 18:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiI0SFM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 14:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbiI0SFJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 14:05:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9469217079
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 11:05:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 445D9B80B98
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 18:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7CB3C433B5
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664301903;
        bh=XaRqS+ZNuqCBhVS4764ur0P20QG1oGqXM5EEecMfPZw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=V7LobbVVl+xwVlWK07i+UocvjM9b2rktAw/mPTSWqN/mgeob4yl4CyRnsbz/v71Kl
         drzexjGv+lSgWuaf5JDIs4h1dtVOVFcymd9W9pAf9TVnbFhAPA5X0PI3Mk53fHZqq/
         8bbeaB18QJcDjjhVQZ35n843Sajcqo49r336XwxVNH3mLnzXOueNsnsGw0jK1mYARv
         8wITcBSdZto0P/sbokYOSDC7JeRmW/cqbw8mefSvow8Tc6J65d6QjnB78xKRXU8X3b
         Aqb4u0/9PDzo5Dp7SOEIINTBiX+IzIk71uRcPuW/j5es8Zan4dQEdi1j2gzVBDT4d2
         e1idgAcuZiNww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A142EC433E6; Tue, 27 Sep 2022 18:05:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Tue, 27 Sep 2022 18:05:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-X7FghtwU6h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #17 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to kolAflash from comment #15)
>=20
> But I also still the idea of using S3 (especially because of the very low
> power consumption).
> ---> So I'd still like to see a fix for the commit initially mentioned. Or
> maybe not a fix, but a kernel command line option to disable that behavio=
r.
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/
> ?id=3D7123d39dc24dcd21ff23d75f46f926b15269b9da

You should not need to reset the GPU for S3 if the device is properly power=
ed
down on suspend.  The reset on suspend was to workaround the case where sus=
pend
failed and we needed a to put the GPU into a clean state to resume without =
the
GPU having been powered down.  I think the reason this helped you was becau=
se
the platform was not actually getting properly powered down so the GPU was
never powered off, thus on resume the GPU was in an unknown state.  SO you =
were
not actually getting proper suspend in the first place.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
