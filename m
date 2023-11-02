Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B5DC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 17:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbjKBRqI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 13:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjKBRqG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 13:46:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD234188
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 10:46:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6852DC433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 17:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698947164;
        bh=niOG2CgLhPKWKGpAD8dERSr9tsPDlOTQBk6RfMWoz7M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=puA36gnhbCafGDDnqtKWzJN4Qvn6ivk5VsUUmd8+XbqpfR+LScQAkWHf0fAkYs8d5
         l5TUBhuYRL60KlO1KhJ2N98E2lKbz5LsKgDC3WPg2Xo+KGrbrZ/cK+GbpgSJ8evd6K
         L4Lp1bV9grLgDUlfm1IgqwWn8l05cw0icNzPhUIvEbitsZOLtIBOkdAEeLn1wm3qN/
         UbMPnTADSVYhnvgvMCfMxGU8IvTpQgL02EOuqeonOzoTxQvmthjFX9ToOde/sWOLcr
         x/Oh6Vsogx9Bx9v2Md1Zu4xcRc6Fvqq7TVly2mLA891B08KITB/JZI86cqL/VvGR1a
         E79RS2g9dTwJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4BB26C4332E; Thu,  2 Nov 2023 17:46:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 17:46:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-2ro2ESCAK2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #41 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #40)
> Created attachment 305348 [details]
> fixed up config

I am gonna try with this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
