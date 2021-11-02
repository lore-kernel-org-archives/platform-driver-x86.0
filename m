Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B35C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 147D8610EA
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhKBOcx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:32:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229557AbhKBOcw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 10:32:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1495D603E7
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Nov 2021 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635863418;
        bh=QriS2hnceiyfuDixNl9T4WS2r/S6TsUK04JMgPE4Xhk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Yf7fpgOKKDkGcW8QCXIdFLkauosTzvmamivmwxe43Mjm2FZrNoc4PINP/HtBHXdxP
         jr83nGYuwRHEjCzBezDVHzDlTLZvIuB0RXvMiuXgUSQnaNH0Ea+/r4M6R4orZ8Yygg
         Z1OyGoE08K0d/6EidFn4I/mb5/gXzF8gox6McuZSYFjtADg5jsZDj89FEZMrAR/QjB
         pTddTXthxJrl6iTu3M761fJbsgzODHWGrtiwXBZmsFwP9eDzz3XVsRR7y/luzJMa++
         bSONjdyUc0iYEQGd5tvdM3N807kcNKvvxqgx7NuvRNDCMb9dHyzsBlC2FrMEgDu6Q0
         bfGIvxugy5sVw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Tue, 02 Nov 2021 14:30:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-ILDhoe81HZ@https.bugzilla.kernel.org/>
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

--- Comment #13 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
> Still nothing but grave silence from the brightness keys though.

Ok, I suspect that we need to enable reporting of events from them by some =
ACPI
video call; and that we will then get events for them on the "Video Bus" in=
put
device.

I need to do a deep dive into your acpidump to see if I can find anything
there. Mondays are my "look into odd bugs which need more then a quick 5 mi=
nute
bugzilla reply" day, so I hope to make some time to look into this next Mon=
day.

In the mean time I have one last 5 minutes idea :)  Let me attach another p=
atch
with some video-bus debugging added.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
