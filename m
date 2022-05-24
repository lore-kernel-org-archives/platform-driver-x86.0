Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D183AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 May 2022 15:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239011AbiEXPoB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 May 2022 11:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbiEXPn7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 May 2022 11:43:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CB9980A9
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2022 08:43:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 248BA6175C
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2022 15:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BDA7C36AE5
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2022 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653407037;
        bh=8qdHbbozewqPi82+QeUV99nR7idaKq65Sd7v9jw5XAE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UYoHVGgK/vO6lMTtR7D3NkBoIwwxQH0KmWPUeaT+I9TkSm7McKK9EGNWzCUPxP7D+
         OIwPKkrmVIkU/+13p0MTC4NIla+SzwJLr14thAbPYxIY9Jvlj8gpNk83/vJDHVgsPq
         9c8puDNv2kLu/Y/UNYi/EjMBGwXfjU5XmHT4oaeMZeOYdb0Hgzzo3mX8vPJsQ3RXdk
         4t+7bZBXr8UkJbbvGS+ysnylm91nnAOWloU0vPDhT2FMJEzzjRe3S1pjrsI8L8897w
         1Uvv8cwHVyLmSX+aTvrGX51aYAs0/e3ZcqJSwDLA7gguD2f2n/XDORwR4aEsZHk/Fm
         j00AB/BT2D+Qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7A80DC05FD4; Tue, 24 May 2022 15:43:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 24 May 2022 15:43:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sa@whiz.se
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-ivWlYiQeeM@https.bugzilla.kernel.org/>
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

--- Comment #244 from Sven Arvidsson (sa@whiz.se) ---
(In reply to Denis Pauk from comment #240)
>=20
> Could you please try with attached patch? It provides custom lock method
> that is unsupported by upstream driver.
Thanks for the patch and your continued work on this!

Unfortunately, there's no difference on my system after applying the patch.=
 I
get the same warnings about a resource conflict and missing ACPI support.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
