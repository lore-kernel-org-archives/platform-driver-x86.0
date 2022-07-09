Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0314EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 16:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiGIQp5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 12:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiGIQp4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 12:45:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640F712098
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 09:45:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0184660F40
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 16:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5388EC341C6
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657385155;
        bh=7rgfj0bvoBJF4wgFq2WTgituc37cEYbb4hhm94doMi0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UiYpp0o3tn5bADKW7UpCzabjUxSYxDSwHwWPVHPC+hPqV3Q5Oa1tAjZbxamia66ka
         PSaZ5qVRfB7JJpB+Sz5S+xFIiEzjNZ2Dm5/hEd0kHovk8w7c1R1IKWHdaHEH4gKoxD
         ThuJye8ytwmml+aLquGtFoB1wGFYUhWzioHJoDaALyAUVpmPzFn10LWGXxlAp6aFof
         zuBxdTHIFLptFiB3mkp10sGCIVzBZXveq/XNv1mCmWBMNAWxn4qUBEZCXW0ZlQLoaQ
         OJ7E6IpFn0QBuxV3+cieqffoqiPuIefdRnE6qjmUs+OZYFNdw9evjHPVrRm/wnAtlg
         GxJ64EeVxgIYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 37C44CC13B5; Sat,  9 Jul 2022 16:45:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Sat, 09 Jul 2022 16:45:55 +0000
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
Message-ID: <bug-215993-215701-N79tOAH3Ug@https.bugzilla.kernel.org/>
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

--- Comment #15 from Supasak Sutha (blur.3rd@gmail.com) ---
Created attachment 301381
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301381&action=3Dedit
dmesg after apply andy's comment#13

dmesg after apply andy's comment#13.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
