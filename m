Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2DCC77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 20:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjDQUlk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 16:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDQUli (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 16:41:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7E52702
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 13:41:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6B0A62356
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 20:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 518F1C4339E
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 20:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681764095;
        bh=2hMb5RrPi+1znXmel5JmqPKtC1mieuOuXv65uC0Vgso=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=of2cK7MvC5iSrCklIaClCHqFvxX2lZdqg+hN5bWNxFETNykf4kY7rF2TBPUmU/BZl
         3qEf/MFrlAM4Ip25a3/Db2vsGDFHJdJUOu52QBTTqWZtT2CNb5s8Dc9bLd37ICdpLm
         wUDfhUpRItQLF2Jb4eiub4ZD7Z/KnRdNngErq8g8H/4QIw5LtSF6I9JfywrhWgm8R/
         df0vaIzxt1tqwDWFbHNVEDylWPxVgwrVqX29hCE8e1Kuv7eWNhXRfTm8Do/Dr+vTfP
         McxP7wniLAAJiWQ0ZNU/iXMigJaKLwm1kRWxQDq89txkdcasTy1RVrgpRE39i5F3KG
         V0HueGREy2pdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3AFB8C43141; Mon, 17 Apr 2023 20:41:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Mon, 17 Apr 2023 20:41:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: charmitro@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203191-215701-uPVTlDFdOx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

Charalampos Mitrodimas (charmitro@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |charmitro@gmail.com

--- Comment #15 from Charalampos Mitrodimas (charmitro@gmail.com) ---
Confirming on TP-T470s, kernel version 5.15.0-69-generic.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
