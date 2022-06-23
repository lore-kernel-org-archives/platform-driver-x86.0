Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE52C43334
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Jun 2022 15:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiFWPPA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Jun 2022 11:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiFWPO7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jun 2022 11:14:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D221A3917F
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 08:14:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A35961EA6
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 15:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D96CC341C4
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655997297;
        bh=1UR7Bv+lQ1vrET0Q732tLaa577SmPenbPhG0PLKXdm0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ArhQz//VfBZHhYNEGNXo0uTiijq7Xo7QGQq8LGOBGfnO9MCF5d1WcOjLS+mNJlAgP
         LK6AqjeDa7NewmczVHr66NZLU0YLOk2V91j7U1/PFT8cNDbik/nQmw0hHLKeCmMuxt
         qB75mvxIpSnj/ajVpfct5APM3NQ6c4Tu3LCVUURprId/y5VSUV5i63uj+uxPW7hxal
         CuX+axrSvO5wY8olMukWcR74dJ5lHKr4PwEBNqf2VF1ayBjMQElwh38Bo/n5tGFkuh
         S4PfISSNi05djs1V35gQlF0lSOToKJKryXjQBQVffXl03hhlDkNMu7nJiQ9SjUrywz
         J0uXaC2SA/cmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 79F77C05FD2; Thu, 23 Jun 2022 15:14:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Thu, 23 Jun 2022 15:14:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lortegap@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213297-215701-4ISP11b9WR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

--- Comment #11 from Luis O (lortegap@protonmail.com) ---
Created attachment 301264
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301264&action=3Dedit
dmidecode of the ideapad 5 15itl05 laptop

Indeed, it does work! Thank you! I don't know if this is ok to ask here, but
any chance for this to *also* be included on the stock fedora kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
