Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F2EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 03:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239206AbiCWDfl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Mar 2022 23:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbiCWDfk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Mar 2022 23:35:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0F87087E
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 20:34:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0025B81D01
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 03:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BC4EC340F0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 03:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648006449;
        bh=K6lGjvvUE4HX9WzIlapITUjTyUXHPxeCmdmmsjBw1yE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ihTxUViHN3vhISCzgwtS9zE69u6Ddm8ilqNvYrnaBxdVcKQ6tbpXzrSwbATz+fmbX
         Smsjmuq05gqgSkdINHddlH4qUeLOakqFnN0x3gfvA22xoFaiDD9zDxIAPzJNQIfz7O
         MGaZV9PnxLsMfacEMAJT/rACkGzxRLIAdwD667DVGq9y4Wn5hObN34FWLHtpBektsb
         oNTuy6S84fj1+8hmuvycrMniBtjQJNKOSIxg7T3VhliB+I8l2zmltcXfrd1/D7ihsU
         HmELuvFvCqTOAAY7A01+0PvVF4R5hdeRVGqmd50q8Y6JCRdDCs0m9o+wt97KlFFR58
         FmdeSlpqLEoyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5AD85C05F98; Wed, 23 Mar 2022 03:34:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 03:34:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215730-215701-4rxYQpNY7y@https.bugzilla.kernel.org/>
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

Matthew Garrett (mjg59-kernel@srcf.ucam.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mjg59-kernel@srcf.ucam.org

--- Comment #1 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
Can you attach the output of acpidump? It's unlikely that this is down to t=
he
CPU, but more likely that the device ID has changed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
