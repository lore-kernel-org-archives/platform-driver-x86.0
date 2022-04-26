Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A89C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Apr 2022 12:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbiDZM74 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Apr 2022 08:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbiDZM74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Apr 2022 08:59:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172C41CFD2
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 05:56:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5B1561983
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11713C385AA
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650977808;
        bh=FdNvIsa4Z7L2ZV2rS1O/Hj6PsfVm/kTKO0/rQHCAq98=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=p8H0xiUWD6RXtCKyUPxCr/NJVY8xpG2nhFzLN0a1sMtgJRMqCiwDRSKc0D37se+Oa
         JVgVE5e5yE3Llp7mtgohGrQLzKTzy5zw864kxeyZfqqxNiv1zoAUWT7/JuP+H6mVZg
         vc6lJn5iG3eoWad3RmduXbCy5JEMYle/iycZ/yRZ8yGYN6UpbVxjy65gxdNgG7mesN
         506tYQnzmu9RW1RMuxouGw11bnj5It+UhoPXsqodXJLrfSnHWsg5jAe09CX0P18iQB
         tPq/0YFKIlEFcRjmMFDzZCAbL2bjQIoJgV6Fg/zsWOZLaXBbT61haplyaigmX0h9z2
         i4v37UIaKlRug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CFBDCC05F98; Tue, 26 Apr 2022 12:56:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 26 Apr 2022 12:56:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-fj0wnKOGuO@https.bugzilla.kernel.org/>
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

--- Comment #24 from Johannes P (johannes.penssel@gmail.com) ---
Created attachment 300805
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300805&action=3Dedit
acpidump BIOS version FHCN64WW, GPU enabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
