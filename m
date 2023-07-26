Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBF7C001DC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 19:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjGZTMU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 15:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjGZTMU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 15:12:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818161FF0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 12:12:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F0B761C63
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7732BC433C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690398738;
        bh=JjBhCLEAKyeVEmrmfiiGG/ausyHlra0Gq0e1NlJ/fPk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aEPt4Y0ofR5AOiphrZIXE92YhXUe9j5bdgaCOWkFINuMmlQ6PNZJXaJdte3WCjYX/
         ewQZjVrxSkR02C++BSE9IFj99bNB4ADpqYQwC2llsfLacBwKHDHUTvA2oPaWBMbjBc
         NFRnq4Zk9Vb0AjwaGnV0DZyZZbMCNr4plTeuDm/iI6nx6kCr7w0bXbffFRazKrZzX9
         qwLnIntW1oGyR6p/k7OpqjnDRbXb5ziUgfNC562l3eDoC4BTm+A3i1I7gk8GFbUyri
         4Kxje3yDmYD8WGDkXqVy8b6SHpyq8cXURQDSw7l2rgRX7nIcNs6IFrfZnzHM1Or/PM
         p9sdH+7jUQr8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 58DCBC4332E; Wed, 26 Jul 2023 19:12:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 19:12:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-CQoVYnUVC6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #24 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I'm a Linux guy myself and I fully understand and appreciate your request. =
 As
much as I hate to play the "outside of my pay grade" card, this is the real=
ity
of the ecosystem today.

I will raise the concern with some internal people, but please understand t=
hat
it's not up to me alone.

I would also like to drop a really interesting link for you.  Some vendors =
*do*
let you toy around with coefficients.  Here's an example:

https://github.com/FrameworkComputer/EmbeddedController/blob/lotus-zephyr/z=
ephyr/program/lotus/azalea/src/cpu_power.c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
