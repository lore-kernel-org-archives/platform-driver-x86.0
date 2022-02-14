Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF3CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 20:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiBNUwp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 15:52:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiBNUwo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 15:52:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE9E185540
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 12:52:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF23C6117F
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 20:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D7E1C340F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644869859;
        bh=dC1AG0tzPW89phZJ0/FLlVmpSLyrs/rUzwkzoyxBhrY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dn4ZiHc5jyIf9x3ka52EHgeH4O4t8ZhzeLikOoiNXK3kQidlpmbkNxuOI2uUPsoZ/
         c4uhecIq/eODNiiBzd7WTUICHtXbX75eX5ZzulqjDjWeRo3IRkW9/59he0yOXm9JoJ
         wc5i2+eBWKdSvrJOk6fJ+dWSxooMomZWr91+2RelGaKpDwqOoW1gjGLy3QrhuV5AxT
         amVpxGO1hQjY4bkWf9YclnU0nw2ngFCU6WtZRkIej2RUhg1lc4voEFjz7H4P4cENRi
         1F1LN3zZY1ZF/U8qgN+f4z3tOYS6J+uHPdFcOkuGem0aei04jfGArsh1CSHXzj9nD5
         rnfnwpFoXJaVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 070D7C05FE2; Mon, 14 Feb 2022 20:17:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215531] Lenovo charge limit feature stops 1% short of the
 configured limit and says it's still charging
Date:   Mon, 14 Feb 2022 20:17:38 +0000
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
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215531-215701-Uhr25JBT40@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215531-215701@https.bugzilla.kernel.org/>
References: <bug-215531-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215531

--- Comment #5 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Nate Graham from comment #4)
> OK, thank you for the information. I will adjust our code in KDE Plasma
> accordingly.

Does KDE Plasma not use upower for this?  This sort of low-level raw kernel
interface wrangling to make it easier to use for userspace ideally really
should be shared between different desktop environments.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
