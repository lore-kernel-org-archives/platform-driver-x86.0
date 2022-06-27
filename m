Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D756C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 07:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbiF0HpG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 03:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbiF0HpF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 03:45:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D088E60C6
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 00:45:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 831FCB80AD4
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B2DDC341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656315902;
        bh=YFKf1H5HhsmE70QoOSeGppSG+LTicaQgVhiLbbXyA2Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EvBfcYc6FCTLpWzmLV6MYt5Ns+WR5YZ5HZrAuIzUyuIvnjteM1LFM6n0hRsCWKMSD
         /kAwHIPn1ynEHNVq21VDuU8EWOAzF/r4BSivpEDFtp0fNwjH6ytYx2rw9jMaAI36Zz
         lsTgvfc4dvmEc6+hc6llx8RRn22f/MF4aWvKW6obxB8uo8O2NN17YAbfV2JjYVG8ur
         I2CLFv062ahga05TP55O2amLSKAhuEDZdchRtZmtByccHQTF0ntwN3uArpxYrAK8s9
         aDGS9oYIAm4CILaBpBibiVVFN1GK006oF26WAbQNvX4U05NSbXD/hZ4NainO6eRK82
         qMc6Mk8skvuAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 27556C05FD6; Mon, 27 Jun 2022 07:45:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215651] Battery charge limit is reset on every boot on ASUS
 laptops
Date:   Mon, 27 Jun 2022 07:45:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-215651-215701-60TNSBcnbI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215651-215701@https.bugzilla.kernel.org/>
References: <bug-215651-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215651

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |INVALID

--- Comment #4 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
> So, if KDE Plasma has a feature that allows you to set a battery charge
> limit, it's up to them to re-set it on every boot, right?

Right.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
