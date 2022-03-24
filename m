Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78BAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Mar 2022 03:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240382AbiCXD7w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 23:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbiCXD7t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 23:59:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C1B7CB09
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 20:58:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4A741B8222D
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 03:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0967C340F8
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 03:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648094294;
        bh=zpshE/Eo2DNoJimjzhtOSreqR4OrBxgc8nh5x5Pu0Ec=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=g4jeIf/DT5GpDG4dzvBVrBnJqTLIBJhF4sH0dtqIk82D/jUkB3zVea1s1Togu9tE+
         53/QRxquZJOcXKRPHaKccpg1p6s1un/C3wvSy1M95DvV9JzaVvYGi+cVZkd14rXKL0
         sLCyBid2zXgRc/4iWYp3yMlY+5k63HwVn9uwCc+0v+U8aukGUTyNK0LqN0Ze29K855
         34seeq6qAD5ZOZKFagquOH2dqaUU0qdqRqzjyjkjYSf727w08DyoT3ycfzt5W1WM2M
         w0f9xAxEqW4BDjpIi/9INZVMU25VF/X3NYYPx5uJCiEDuDrP7+eD3f4trVXq8xAnTo
         YKcDnrPhjyM2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9FA92C05FD5; Thu, 24 Mar 2022 03:58:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Thu, 24 Mar 2022 03:58:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215730-215701-JbDiaU3dNt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215730-215701@https.bugzilla.kernel.org/>
References: <bug-215730-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215730

--- Comment #11 from xuemin (xuemin.wu@dbh.dynabook.com) ---
*** Bug 215724 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
