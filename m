Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACF9C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Jun 2022 20:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiF2UEp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Jun 2022 16:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiF2UEo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jun 2022 16:04:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9F136322
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 13:04:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 159F0620CF
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 20:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75A7AC341C8
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 20:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656533081;
        bh=Q3fepfn3vzOXxK+wr3u/Qxtq1GetF4geHp7Fgtuzras=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YQ4759UO0ObhXe3HOt2lV+S0q0rllU13N6rWdO4p3KrYCEx7+7GDc3s/YuDudjexy
         /cQEkfeF90P//rMu6pV6I+DYiBPw++cWAXXlnkUC4uKqEDwOwg7Er1ovcHGDIVxaLz
         8mG36oLsqIwfpstlZYdN5LeqbUfnQX6OQ5lWLoLd0J4pCW9l/FWzKYu9FUA6R+2HRY
         hhT70lc3/JkBgJAu8uNzD63Z+DewMRPGCx6L5E5K8x/AIFWJOTpayrc/+7yaKbzQSP
         O+pKE34jGJD6KbANEI5IbBT85s5nKMSaWukqT5hSaEpakaDGTWkT7HkUC0anmj7/Ot
         4DPHp2ykZX1Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 640F2CC13B0; Wed, 29 Jun 2022 20:04:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Wed, 29 Jun 2022 20:04:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216176-215701-o9oF18anq8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

--- Comment #6 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
My concern is that there is already a "charge_type" attribute which can take
the "Fast" value among others: Unknown, N/A, Trickle, Fast, Standard, Adapt=
ive,
Custom, Long Life, Bypass.

It might even make sense to wire up the so-called "conservation mode" to th=
is
attribute as well ("Long Life") .

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
