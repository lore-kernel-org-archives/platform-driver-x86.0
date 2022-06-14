Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47321CCA47A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Jun 2022 18:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358370AbiFNSzE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Jun 2022 14:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358379AbiFNSyu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Jun 2022 14:54:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4743E21817
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 11:48:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FE0561862
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 18:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0B94C341C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jun 2022 18:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655232486;
        bh=8hp9GpLyUTJ3Ml9e809ilCxEm+XCpyBO67DgTJUNSbk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=P6GUL1KzevpYeKqnU0LRII70TgbqKYfPvNTeUdSINKTQG9apoIr/KrAUCw1bdr8pG
         mjCFe+mGziyiLA7vFjQRSv7rV/KoyN+joL+9KhxLa9/g8QIgzV3fbFAysa1BIrsBTI
         e8PgHFUuvsNUs4VNlWubPcC6c8eQMig8F1S9k9H3em7ez7J5lgN3qqKTRJm9ZUoECs
         hK9ATlpoJKYIjKDTDyfquxtBp+UEl3zxBoD7lw2saaVGEmluS/B3DooU45hrZEZp/W
         kLCzx5RROzaz0hk0DstlG5ougs0lyhEHXwiqAda90CWn2ckhaJIID3YWkJ1YITyf9V
         8cH0/a5L/Z+KQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C0C88C05FD5; Tue, 14 Jun 2022 18:48:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 14 Jun 2022 18:48:06 +0000
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
Message-ID: <bug-214899-215701-Voja9B7mYE@https.bugzilla.kernel.org/>
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

--- Comment #36 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 301177
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301177&action=3Dedit
Attempt 2 at fixing this (3 patches in a tarbal)

Here is attempt 2 at fixing this. I just noticed looking at the tables of my
X1C8 that this series will not work entirely correct here, since those depe=
nd
on having the EC OpRegion working from \_SB.PCI0._INI. So this needs more w=
ork.

Still if you've time it would be good if you can give this a shot to see if
this early version does fix things for you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
