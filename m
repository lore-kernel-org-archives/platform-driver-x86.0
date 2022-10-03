Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD54BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Oct 2022 14:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiJCOeD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Oct 2022 10:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiJCOeB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Oct 2022 10:34:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2584E4DF2C
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 07:33:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 873CE61084
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA943C433B5
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664807637;
        bh=QD84Ziio0+VRsjH5dTwskV34QNYiv1y0CdV7HIJeKA0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FlCovZvMyONPsGROL0XaJ/Bfh8YbCmV04Hj4Fvb9cuu2Vhmv7yPaM4+SRzdJsuBg+
         ZWVvr/EJjg7CGHVfs+JsM30AEG0CG04y335K1CX3Lm0z8IVRLdJdZ9dW2rditE4+Nn
         +NRCt+opiLrM/5L1EY2r63oaOWPlCRwf6KAtG0fIvsDUIU1L0vJaMVpWc/jUw++8os
         P/NOFNn5a7BNIUfXdEeKD+1jtB4JLYju6/5uakvctUNQwDXMNeMWNLD6EPlynB67RI
         VC8KdAHvBa1ULmVFs/T6FwE3rtD3Hj2fRs7s5KVZ/znHoRW/QTVoZFU3DDl7u3Ri/h
         u2140HhlAB4sA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DA36DC433E9; Mon,  3 Oct 2022 14:33:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 03 Oct 2022 14:33:56 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-XPl0Y56Dpz@https.bugzilla.kernel.org/>
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

--- Comment #56 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 302928
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302928&action=3Dedit
[PATCH 4/4] ACPI: EC: fix ECDT probe ordering issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
