Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A662CCA473
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Jun 2022 09:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344514AbiFOJkE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Jun 2022 05:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345740AbiFOJj2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jun 2022 05:39:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57270419BF
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 02:39:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 07B8CB81D26
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 09:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91D26C385A2
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655285956;
        bh=qWqtdQ0b7YFe09+udtv6FDWj87G5vQ5QReli3QtPAcI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gcXiXaY5sC2Njq3RP6o7lzssy7hxf626Cb7W24WNUWtmAtbaNPR91NScGmtT+Yp7w
         zN33EPEKpvAqT4vcN33wguREBQlGgSsNrE4Tec4mKD9BrNQ1nOHFqO6KtC4bFLDqtN
         kjEGJHzapXAxCF5Nfdze5SEU9Xr9WKQ2WHBzR+CNe/fw1THFDzgtQ205tHCxfECSZO
         D3S00ss5NU5BUxKo+n7cmUyw7kVifmYiPBkl/kk5tFy+yb2GdVDilEZN7fHks0TZ5Q
         RpZw9cYCFNZSvjBiWxMHvHIvAvrelcUBIb6LnxzOr0Rzo5aMsUBCxGD0QrrK7B2DlS
         euDNp5odAQF2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 76438C05FD2; Wed, 15 Jun 2022 09:39:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Wed, 15 Jun 2022 09:39:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-FHfpjem6IS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #38 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Hans de Goede from comment #36)
> Created attachment 301177 [details]
> Attempt 2 at fixing this (3 patches in a tarbal)

I would propose, if it's feasible, to evaluate _HID/_CID (to be PCI host br=
idge
compatible) of the first level of \_SB and evaluate _INI of all of them. The
listing of the names seems a bit fragile, while I don't believe there will =
be
many new entries. That said, IIRC, \_SB.PCI is also present in some DSDTs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
