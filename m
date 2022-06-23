Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7735C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Jun 2022 12:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiFWMCn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbiFWMCX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jun 2022 08:02:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694514F1D8
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 05:00:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E3FA561A53
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 12:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5401EC341C0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2022 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655985651;
        bh=MXrdDOgdqmbQaWzQU76kS7+eJfGoKN1PhCuAjqAn7g0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VJ9aX7PPtlPrOIeNrevn6AjXBNyj4Ykfm0OJ7cKP7SpMo8yUmCVNFhXoUbIPDi5Im
         O5sShtiHKyaAiXq02VqsOov4TEc0peAJNNYETLH+VVk6deR90Qq02Jzu7C80LvlQ4B
         nbc5mYHoK6vF4ORQmQvftTsIA3SsCuOT7fnKAaCdEDRpvDM+b16VLnukcAG83afpIa
         SX1N1qxioA+CAivE88J8oYTMa1w2ib5m6H5uBQAmsF43d1NqjE2uX0+VvCcK1RmEGm
         80OeU1Nh+mWDObV2M/qYkwFShxKzrWLreGc/NM2P4oOUfjwjmMhKbEJ4nxu8jWZNnE
         eMiKAjaD1bFyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 39F54C05FD2; Thu, 23 Jun 2022 12:00:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Thu, 23 Jun 2022 12:00:51 +0000
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
Message-ID: <bug-213297-215701-QCtGPrOClM@https.bugzilla.kernel.org/>
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

--- Comment #10 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 301262
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301262&action=3Dedit
[PATCH] platform: x86: ideapad-laptop: Add allow_v4_dytc module parameter

Ok, here is a patch adding the discussed module parameter. Please give this=
 a
try.

If platform-profiles work after enabling them with the parameter, please al=
so
provide dmidecode output so that your laptop model can be added to the
ideapad_dytc_v4_allow_table[].

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
