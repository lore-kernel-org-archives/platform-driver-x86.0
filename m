Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4F3ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Fri, 28 Oct 2022 16:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiJ1QNh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 28 Oct 2022 12:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiJ1QNW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Oct 2022 12:13:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD0F58DC3
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Oct 2022 09:10:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 077776296B
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Oct 2022 16:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67934C433D7
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Oct 2022 16:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666973404;
        bh=M/tyFvcjflE/Ac7ni+7bdr+46GqKuO+zAMeDxgJK7xE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VHG/YCr8UM2xb1X0oPs/tMCmYFUkAbysEcRkhU+iv/NxWpAVwMqJrcDxce2DBNBat
         cqdiTlp9XvkDd+CjjpYIF1mI5kSFJWz/3P2AQB8vHUbdT4wJcbm/wUx12SZYyVDjTW
         s8WMtWZgMwHYbIfMM99VKR69dA2v2AF/udAw6lJjHZohE0NzS87gpNJEUPWD6I9N3Q
         Al3E0LItCMMxFLqyshKvelpc3Yg7EKRj57RpZDWiSocDu/EqNU2YaYFJiImgkkOCse
         k1qdCGXOb07OmiC7kphPN/cRkVcIt+fFL6t4DDIzBs0sNwtvWKeTscbk2qDSYzHooz
         QseUJdtmFoQRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 52927C433E7; Fri, 28 Oct 2022 16:10:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
 version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
Date:   Fri, 28 Oct 2022 16:10:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-216468-215701-ilOQk40xsd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216468-215701@https.bugzilla.kernel.org/>
References: <bug-216468-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216468

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #9 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Jorge submitted this patch to solve the issue:

https://lore.kernel.org/platform-driver-x86/20221028155527.7724-1-jorge.lop=
ez2@hp.com/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
