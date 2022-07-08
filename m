Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9B8C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 17:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238533AbiGHR6K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 13:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237887AbiGHR6H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 13:58:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C615A467
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 10:58:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 35600B8291C
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 17:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6444C341C7
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657303083;
        bh=x10ME1e3wPG9KD6sgMgUYbONej4q5vcYcG/1n++/clA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o16DFPRrQZ2sd1ABFk2hii35lohM9U1TthQkfM3bypWfKvQgofxqp8krSWYoo3GXF
         SsvEMCyNEFx06siKLsFmwJao5/k/C+W38yCB+MMxhSjE44TMYgQGtVFjdikrtVNzFC
         R5EbygRr18Q+12asGyyHmz69atHDwK6AXS0vLjqHGevK2n26mqRG1dzZrAGlxH0jg1
         nVNJIEImDvNjyyB8xXjvYoM5VTLDCXT9L9/TiD8ug8O2nIP1RJCShAniPXsWsgXgMM
         NnJF2KUEFOfSuiJp7meUEvr0zYO7gyoyR9FaJyFHrBb0+kDbJYzPSUKUzZCayT9VV+
         rp9biUKGiCIpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B1D93C05FD6; Fri,  8 Jul 2022 17:58:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 17:58:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215993-215701-VBCthsA2Sc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #8 from Supasak Sutha (blur.3rd@gmail.com) ---
Created attachment 301369
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301369&action=3Dedit
acpidump

My `acpidump -o ux3402.dat`

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
