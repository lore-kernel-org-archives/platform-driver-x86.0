Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4F8C001DC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 19:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjGZTfn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 15:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjGZTfm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 15:35:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAB6E73
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 12:35:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3D9761CB5
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3853FC433C9
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690400140;
        bh=UMLF5ThtR9I624raHV7VA0W7JjN0IjQL7lsqykOqbxQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eHkLdfgqBJkqPI/z8FYPaTBbQ21fRlWAgz24V5l2DfZ5TKIJyKPWzcsojQI4JplzB
         723VSIbxS0F2bmuxQMooh5NaWl96T/XsF+OrBaUIxU4WUH7F804tMr6npKAnrd8uNj
         dU04f3N8RXrIPX0DPJDi+5DLC2cbUdCKwFrmp1x3NOpYmYJ3GzybUNLRcgdhvR2zDk
         4tMKTE1nAnETyX9ufiGQAreFKmB1ai6S14dCLSJOf88mA2FG7l5nLQ59GcOzSfASAe
         14k6szsnzUIXMM2B8cz7HTPgKoEqqsfs9ePeOu++QlmZiSail6PZ1C0wJArCZ8mXvk
         y8S4fhr7iUB8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1E0FFC4332E; Wed, 26 Jul 2023 19:35:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 19:35:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-qdKiozENkd@https.bugzilla.kernel.org/>
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

--- Comment #25 from Armin Wolf (W_Armin@gmx.de) ---
It would help if AMD could publish some sort of official documentation
regarding the interface used by the "Ryzen Master" utility, because then a
proper driver could be implemented. For example, the k10temp driver once was
able to monitor voltage/current sensors on ryzen processors. This feature
however was removed after it caused problems on some systems and the regist=
er
locations where experimental at best. Without some sort of documentation, t=
he
risk of causing an accidental killer poke is too high.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
