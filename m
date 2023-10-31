Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6529C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 18:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjJaSii (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 14:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjJaSih (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 14:38:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018388E
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 11:38:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8577AC433C8
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698777515;
        bh=S8llvGPxIJtclsZASUaXC0z9CJpZ/qsQZAJH9TKFvyc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EO/8LYVD42uxWp2MoH7/7f2ZolV/x/l+qKrFc4BSKi1ufTeGvv/nMHBeIOvkvhBYP
         E/XxVsI9ItwXMmPQZUQNoOv1L+tHHoPxH24IfR+aAMtBYf7ca/1GxzrbJFQLLAYg/a
         JZGPoQByd6bjWPbC8sh4EPFGBWI5AbJmBpqB2kBWMmp1iJvxARZu+hp8uAGP+fInFO
         3Cby0ClOBTIb+34wa4RTW7mYLErZYsZC2d3y9iwGcMslnXk2b+Riw84V8BKXpxk72v
         JJxk5Y2W/Ig46ZpfCyB3mXi5+bRYuwT1kGBR+wkcT5O7xb087EqyiifmKwagFblYE9
         i34FKODi5yehQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 68F0AC4332E; Tue, 31 Oct 2023 18:38:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 18:38:35 +0000
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
Message-ID: <bug-218092-215701-2Wef3HHmf5@https.bugzilla.kernel.org/>
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

--- Comment #6 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Comment on attachment 305343
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305343
dmesg

I used "sudo dmesg" command and result:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
