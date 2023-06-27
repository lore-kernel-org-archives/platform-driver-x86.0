Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7196EEB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Jun 2023 18:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjF0SPD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbjF0SO5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Jun 2023 14:14:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D48910D7
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jun 2023 11:14:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0BA5611FD
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jun 2023 18:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A555C433C0
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jun 2023 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687889637;
        bh=apVeWoSKbo2Ht2tFWUt870rOmidSB8xlNSZkBXwUHIY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HnWDp57fCwR6ljtUpVJCkAenEfdUzXTgQRGjyXUWj0jDlNxb92Bm4aedeYvznzVSt
         QU0jSPlaNE43axAzJzNHAoAWmeEBBtJnFIukF8rr3XcKq3MKpFpoeGaVuZOysgvJ1q
         hzknKYCEC1ZFr5PZeuLbchtXDFGoLYH+QTFeC31nZsMUBym3Q3qbXc3vPFVqC0ETyb
         +H4gUUUeVv2sRHJ/cLNdoMoaaXa4owO4aFRgHZKrY5lQw4o8v9PX75L7ngiwOMxyAt
         lHoruaef8CDXM8MBFoA2lpiLsg+Nh0h8A6WfV9jm/Zuf0cVVD5m8fYNE+3x8tHkj8z
         h89WJaV/pWn2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1B237C4332E; Tue, 27 Jun 2023 18:13:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 27 Jun 2023 18:13:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: zurabid2016@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-fenN2uS1lC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

zurabid2016@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zurabid2016@gmail.com

--- Comment #331 from zurabid2016@gmail.com ---
Hey, I use 6.3.9 custom kernel on Gentoo GNU/Linux and it seems that my
motherboard is not (yet) supported. It is TUF GAMING B460-PLUS. I looked at
6.4.0 sources and.. voila it is there. Will wait for the next stable releas=
e,
then

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
