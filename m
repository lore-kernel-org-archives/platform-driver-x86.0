Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7023AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 15:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbjKNPNs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 10:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbjKNPNr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 10:13:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0283BC3
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 07:13:45 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E958C433C8
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699974824;
        bh=nIBkwSM/9Xy2+HGJgAbkCqPKdcnx9WiirBWBNQ1v9vY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CX7pWjn1yv4iGVksI4GkRksDZQz0em6F35lIihwDsgbsefR9EK5z2GDyJbUsDqEFH
         be0MobtSr3b4okysCWYIXFzZYU1GJVvUm0hfV9NdBzLA6iQAQyAVhANa/rQ3zOfmTg
         GUoRBVjt/6uWUO2M/xPwxN3nhlHLujdhlJ5fuqTKuMElVQZVKHJxI5vtTutPsXMauf
         zv274KZmRWIhDnqJELfeCUAmeewCRvcUcMoiGoQ3dwpZEKiI31f7HFWbl/Xliim1G8
         Z4QZyqg8JsKzBmvoGIjB7nhZ+9IhEXTCxKx2WGlIUyyyrrkPRov7aZnT1M/Bj/Dvxs
         n4xmufzx3hL6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 59C87C4332E; Tue, 14 Nov 2023 15:13:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218143] platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Date:   Tue, 14 Nov 2023 15:13:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: david.e.box@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218143-215701-D0jCKDAKqW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218143-215701@https.bugzilla.kernel.org/>
References: <bug-218143-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218143

--- Comment #1 from David Box (david.e.box@linux.intel.com) ---
Created attachment 305404
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305404&action=3Dedit
Remove GBE LTR ignore

Looks like your NUC is using a Comet Lake CPU. Please try the attached patch
which removes a workaround for an issue that blocked low power states on the
CPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
