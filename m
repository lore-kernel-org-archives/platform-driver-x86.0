Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B30EC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Sep 2022 17:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbiI2Rqi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 13:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbiI2Rqh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 13:46:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E360E124157
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 10:46:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68407620E0
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 17:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC03DC43146
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664473595;
        bh=0ymde+MsGe6qDVA1V7lX58mdzelpp07oLqKvZI+7p0w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eKEoSjrCsOQGAesDOgQTkaM1OWFp1LNyH03bE1FzCF1tHT45lF5kEvMhCy0kaVkT2
         ohVoA5McRw1drQDK9lU5RUkAdqBg5Ir9gffuMFne4lkiOt6Jz97m6odxiIHNKOvACP
         kiyiy6oE1Ot0sg+I2Gg3ouGHO2eOr1t5rKWWCThn5Fdhln94mSbgumeq3iMH6qsMuE
         mEBM1szndtsk1EFEfZVKdusextiaYzdrPJqKQiHYKeokzVlpQBEdm8e5pq1hDj0gLQ
         gMJ6U+o35TjR+fL7b5pJa819nwHEXj+OPn5Q5glyhTtK/z9E52Rzj/CfhyPjEpALXZ
         cHQ7rFMFh+4tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ADEDAC433E6; Thu, 29 Sep 2022 17:46:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Thu, 29 Sep 2022 17:46:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: L.Bonnaud@laposte.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201885-215701-JrTA0BAGK1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

--- Comment #18 from Laurent Bonnaud (L.Bonnaud@laposte.net) ---
Thanks a lot!
I am looking forward to kernel 6.1...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
