Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621A3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Mar 2022 19:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbiCFTy7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Mar 2022 14:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234152AbiCFTy7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Mar 2022 14:54:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141A03B28C
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Mar 2022 11:54:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4EA960FCF
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Mar 2022 19:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 119DFC340FB
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Mar 2022 19:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646596446;
        bh=0hKZPJwhyOqQWiNr1VuRNoSzlOxwNF/ZLYb48qe5QUA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G9ynr8FPzT4vXvAczRg5PfnJYwIXnFIdFlTHH7IVDdJUXZBNk4dIbDlhwlR2HLSRJ
         T8T0qrHI4Fwg+NhhARQQ9qS+uuOCc5QjPikt029gBubq44yHQ+10aFte8b2hNYmqdP
         TY0tVdqxTlD4V13VJzNTJCgIMCQOmf7O49MKmE+JTNJemA5liS32Tu8Kem+IH3N7Je
         uLxZfLTpa0HJh3RvuqtP8TuA+7+UxltqKTUg9F760xU/y+3Ua2zizLayGIfexMjy3X
         orgp4eY82Bg4WeGJu9WkEMkzoguD0nNnMrKnhftokbh1izvx76xSbHFTFS7Hcp8hie
         FWJThBq39/S2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 02430CAC6E2; Sun,  6 Mar 2022 19:54:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 06 Mar 2022 19:54:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hubert.banas@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-lmpr6sHcjS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #227 from Hubert Banas (hubert.banas@gmail.com) ---
Created attachment 300540
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300540&action=3Dedit
DSDT dump - ROG STRIX X570-E GAMING WIFI II

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
