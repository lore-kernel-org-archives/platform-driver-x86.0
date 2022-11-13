Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0483C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Nov 2022 03:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiKMDiV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 12 Nov 2022 22:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiKMDiU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Nov 2022 22:38:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806FF13F35
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Nov 2022 19:38:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6C7E9B80B8A
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2022 03:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBD9FC43162
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2022 03:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668310696;
        bh=XMxQ5urXNeWuROzQhBu2yMuQU3tMkkFf1I4TMRZ2Tfs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JK1SSmzM8be+Pmm0AHEhZSd36/N8mHmqtBqBy/AyvYw+otAe+p3ta344oWx+R8eY9
         7jrcBVUXmM93KVEHwRq3Vu27X/kG+kLI3QQlwpBt70xA7++cIuZcHOUl+3R8sHrYDC
         LB4VurHsrWsEFydvgtaSxOf12JRRInIFC0htPSY+4QW0XQrogOBhdAJ2+8a/iqqGHe
         zFv79fKOLvlLrQjHYnJo6JNFgqVfposiIJ6aDrKDqdePJfyyO0H4oJxGgzVHcAAyM6
         5gac5B8Hdxn1OZcIj04w399ceiOig+prTuCotnNGi+Y/ABX2z7wvLhhM6GF0AI7fJU
         2e6EnPh+znuxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DD8DEC433E6; Sun, 13 Nov 2022 03:38:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 13 Nov 2022 03:38:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mundanedefoliation@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-piYKEICFWu@https.bugzilla.kernel.org/>
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

--- Comment #270 from yutesdb (mundanedefoliation@gmail.com) ---
(In reply to Denis Pauk from comment #269)
> Created attachment 303161 [details]
> Asus WMI for nct6775 v6.0 base (2022.11.12)
>=20
> (In reply to yutesdb from comment #268)
> > can add support TUF GAMING B550M-PLUS WIFI II?
> >=20
> > I tried add parameter acpi_enforce_resources=3Dlax, it works.
>=20
> Could you please now?

thanks, it works, only compile hwmon modules, without
acpi_enforce_resources=3Dlax parameter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
