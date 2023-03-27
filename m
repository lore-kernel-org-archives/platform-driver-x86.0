Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93195C761A6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 14:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjC0OG4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjC0OGz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 10:06:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8D75597
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 07:05:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D7ADA6126B
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45BE2C433EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679925949;
        bh=sRTgTwVIWA3jsaLvwjwBm6Fq+tSCkmZV66xgxrx66Pw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b//RaSDefDo8qrTs7ZlroM3Za4xd4PSjW940JevvweS2bEbXtM8flhxR6Uylbk9As
         LontC/biKtSVKDwA386WaYkSTOAmbDhU/mlsjhJY+uCda0VeWDVEMTwW02eFaB6WpQ
         ckSZ06wkgdvkIwVuyXC0ibLqBKhQ34sjQwJK0MVGt8Zfrec+diuGr9lhYkhzcokyg/
         q1jQ5sbi6VcWjhjuHqJ6mR7HcBHyMTw4mlbpIa3SwBh7Z4RagRAKe2ZlRvudltO9mC
         4wN614XYkwxJDVEOVZQQzWwr3geICoMWfZQ9/45Qh+4RI77r5BzKcDduJzRzNs/l7s
         ecIzLhmlcZgLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3345CC43142; Mon, 27 Mar 2023 14:05:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 14:05:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-Q647sIAnU0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #19 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Ugh, I got it wrong, the new line should be:

 KEYBOARD_KEY_76=3Df21

please give that a try I expect it will fix things.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
