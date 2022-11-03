Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFF5C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Nov 2022 01:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiKCBmJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Nov 2022 21:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKCBmI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Nov 2022 21:42:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635DC1114D
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Nov 2022 18:42:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0250B61CE7
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Nov 2022 01:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62024C43144
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Nov 2022 01:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667439725;
        bh=uMwzNvBWqQ8aizFHYrFGOzHs+W22p98GJ4gNa7nzKxI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s7Et2Ek4kF48aecg+oOL6aE13XpqznIJWv3cnNx9E3biU1rn1J5nU4gALt1qOh8Qy
         JJtXAgp7yxb6Fc+iuDzfcR06RT5Rd6JSBOcNEw181CbczSaBWTRy4hn2UTxKdBcPu7
         s2Xg1xkZ51zzDrt1QZ6IbRZ1cVOJMv6ANgkYWGL2Z7sICNdURR1ziSpiiyxOtX93Xg
         pZFQIss7G4AROgLqqkIfDQ810d+Tu2Unua1LK/99BrJ921j1nR95awQpx9dRmhEh0c
         K93+etzcTjkEhFAfHNjLp0oYJKo0lHMH9+BovsuMyL65glw8++GhhIpeHYRwfOFqAo
         gzf1yqhMc4wkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 50412C433E4; Thu,  3 Nov 2022 01:42:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204913] LG gram 14'' laptop extra features
Date:   Thu, 03 Nov 2022 01:42:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicomu.net@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_x86_64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204913-215701-Og8u06AKJs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204913-215701@https.bugzilla.kernel.org/>
References: <bug-204913-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204913

nicomu.net@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nicomu.net@gmail.com

--- Comment #4 from nicomu.net@gmail.com ---
LG Control Center on Windows now has 3 fan modes. "Silent", "Normal" and
"Performance".=20
Linux has just two, "Silent" and "Normal". It would be really nice to have
"Performance" mode too.=20

I'd like to add feature myself, but I barely understand how ACPI works.=20

I think that calling

lg_wmab(189, WM_SET, value);=20
// from (/drivers/platform/x86/lg-laptop.c)

would toggle performance mode, but I am not sure, nor I have tried it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
