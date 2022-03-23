Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C29C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 09:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbiCWJiD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 05:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiCWJiC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 05:38:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8699475E57
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 02:36:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 307BDB81E69
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4E49C340EE
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648028190;
        bh=P+LD2JMqIij12YlLA0VIDoh7QInWfGRPHcqg80iMbzA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FH8SMdnkVLIVvmeiNpBYRPpy+TRg9X0m38y+wgvgHiT0rrdTtG/aJ4k6lM1isiJdI
         dAeFSpQtJ/MOeVwwc33vyiSfhu57b13yVNYQsaXd8jJhPMEO6yNJxgIoghSu/K1Tdg
         i/FeluNHa9vcgHdwYdfrubujsO746Z+bD9XbldOVO54nzyfPpaD9Wd/rE9gbP6mVRy
         z+gpH8WotzBtDA+I9lVzfNQJgCBvAJeIbCwqMakMizXcsV2GwtSx3tYU0XkY2r5+aK
         UFycfx1Lifxx1BSccRn8xtTXeNNW5NjcMA8VVz6UgQgfARCtLRx1awkDSZHiyKf06p
         GOpRltM7VNfgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A6867C05F98; Wed, 23 Mar 2022 09:36:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 09:36:30 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215730-215701-4vow2hjmPt@https.bugzilla.kernel.org/>
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

--- Comment #7 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
acpi_bus_register_driver passes a set of supported ACPI device IDs to the
kernel. In the case of toshiba_acpi, it's:

       {"TOS6200", 0},
        {"TOS6207", 0},
        {"TOS6208", 0},
        {"TOS1900", 0},

If your firmware exposes any of these devices then the add method will be
called. Your firmware doesn't expose any of them, and so it isn't. The driv=
er
simply doesn't support your hardware.

What functionality on your system is not working?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
