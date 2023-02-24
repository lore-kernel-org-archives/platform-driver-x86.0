Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451FDC6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 24 Feb 2023 17:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjBXR6j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 24 Feb 2023 12:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjBXR6i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2023 12:58:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172FE1ACDF
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Feb 2023 09:58:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE6B761924
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Feb 2023 17:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 165ECC433D2
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Feb 2023 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677261517;
        bh=tyJe0t07ngkcK41dCNwbDX8GIJgn2yXS09mJ3Fty7wQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iR6XMej2F2NM7nL5CQTIh7rm04kGQZ9Z+b0Q/N603VT66bnerPMI4mUiJxiOjXUpP
         SAUC/T1SV6kcAOJNyglLz+uW/nEjHO0ENeGc25NaNDwxbk7mxiyCEPCpGeNWGn4Qyr
         0EUtuLA429NH5RRGnHy2yihbWU1iPPaNu8h26Y4N2MAAx4LHKMLHLkwjr9BxRWWUe2
         b6AAi2/CbDQX4xdKtO757Co676sBBfVDp2of434cB8LqkW5AB0exsSheRIxB9Xxbj8
         Gai0MGpTpGt0bmw3WyUOBD8ZN785A+umB6lv6+uL1prHXWZpvimFdELMkTzdiGMSlM
         BJuj4F3MOKC8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E659FC43142; Fri, 24 Feb 2023 17:58:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217057] Asus high CPU temperature / low fan speed
Date:   Fri, 24 Feb 2023 17:58:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jacobecc9@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217057-215701-hfKfPIcPqV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217057-215701@https.bugzilla.kernel.org/>
References: <bug-217057-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217057

--- Comment #5 from jacobecc9@gmail.com ---
It seems some Asus laptops can change fan with ec_probe which isn't probably
packaged=20

In ASUS FX504GD model setting the fan speed to one of the three modes uses
these register values:

# ec_probe write 0x5e 0x80 # silent mode
# ec_probe write 0x5e 0x40 # balance mode
# ec_probe write 0x5e 0xC0 # performance mode

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
