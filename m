Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF7DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 20:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240486AbiBCUrn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 15:47:43 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46430 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbiBCUqn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 15:46:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09FC9B835A3
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 20:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCCCBC34111
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 20:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643921200;
        bh=MtHBkHsOArCddNWe2Iv24UdlBaykJaEoRxByKOxaRc8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jZ/gDnvmcjLaUP/s2RwUbI21GTO9+AqfN531VXNizDOkM0eldwSxgCy7bpvg8028k
         R/0xhF6FdOmfphmhyc4YMc5jEKLr859CbT1xJeYsVGhSCQvGarWKQwycjGFR+vnDIF
         LxZ/Z//kA9nkOm7iqlX7UTGGxPbvt7TTY5phClcuBjhBq3zbV9Sm8dvp73SM6ONj9m
         go9EPRDEA1eznAIrTftAQWd29L3sYAiAXYN33vhkcrlwsZU5Ep3ZI+Mvp/ugoxgVuB
         X7zF8n2YD+MMoHQ1MUeSdPgssP2OFIilefoaWMURFoAXqiSg2xrOhyTlFRbgXSp2ge
         L/Bqmw3A01kqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AB539C05F98; Thu,  3 Feb 2022 20:46:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 03 Feb 2022 20:46:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-lwOTSHl5tZ@https.bugzilla.kernel.org/>
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

--- Comment #214 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
> Added SENSORS_ASUS_EC driver.=20
> Same as SENSORS_ASUS_WMI_EC but much faster.

BTW, the WMI code works awfully slow in most of the kernel configurations I
tried, but with my custom kernel (Gentoo) it works OK. When I use a Fedora
kernel config in the same environment, EC operations via WMI become slow. I
tried to unload various modules but to date do not know what slows down the
kernel. It would be great to find that out.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
