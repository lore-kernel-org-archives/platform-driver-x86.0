Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A056CC001DC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 19:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjGZTzm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 15:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjGZTzh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 15:55:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D292D5F
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 12:55:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B9CE61C0A
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6498C433C8
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690401314;
        bh=13z3NJygF0gGGvGJuXG5CCEhHExdCR4KkdIuO9UJMVo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GdYx+rhNK3+FNSVdD8yMF92eJ8eDygaIHPBGkJGEhmJP3BeRBE83omDbm1AwX9v5h
         HDlAR5SOYoKnF1SLtzHBkPjbMTtTI8MDkoE/rZAjZkyPdIpwZGfQq8T7luSZfSyQBH
         YuhhxZpfKUWJFka2uxYlb6dxaHeQM3CtJLuQOUAHTb51U902YRNud/kQvNpXGfa6NQ
         IAPhBbSrNDELYaxbnzZEdwJ8gmU7Ug9bu1oTMbXJH9FHJrp3usHI4YLTVIE84tv8xw
         705Jui0yvNOyfprXV8xQDB120hDYke8KpZD3dr09sideFUDDGQQi7eMqgIxcObRp58
         6QvkpMO3/DD7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B1333C4332E; Wed, 26 Jul 2023 19:55:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 19:55:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-s8CefVHSlh@https.bugzilla.kernel.org/>
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

--- Comment #26 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Armin Wolf from comment #25)
> It would help if AMD could publish some sort of official documentation
> regarding the interface used by the "Ryzen Master" utility, because then a
> proper driver could be implemented. For example, the k10temp driver once =
was
> able to monitor voltage/current sensors on ryzen processors. This feature
> however was removed after it caused problems on some systems and the
> register locations where experimental at best. Without some sort of
> documentation, the risk of causing an accidental killer poke is too high.

Unfortunately, it would probably take as much effort to prepare appropriate
documentation for public consumption as it would to actually implement supp=
ort.
 Comes down to resources.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
