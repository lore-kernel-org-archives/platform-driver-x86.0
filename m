Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7F7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 May 2022 18:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240000AbiEYSCB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 May 2022 14:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbiEYSCA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 May 2022 14:02:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999623204D
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 11:01:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 492D2B81E9C
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 18:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E712FC341DE
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 18:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653501716;
        bh=TdxLmfKE3Z2q2UAYoGc96uf+8QBNATxfK8sEneSA/LE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MKG3M7y/7v85gYlh7oy1Vty9T5iECbhuxXo5zFhn00AHqJSvYiJQr4oDXyNCB6UW+
         RgaRfUA/jEinAFFqGHQH7EqjqQdN1nHrZ9UTJQeO5mLAcFakCJgxM1OankMyOuBx9H
         EQcMow7hEbAne/eG06s28upoo5dGSeSxVegMWRgX4wn7om5pZNEEWA+uc2n370WSpA
         GldhZ8lIfOo7wSV0i0ISjQA7bpki5pDw/+9fB719eft8YOi+sD0fRckpzUaoNYSVfD
         vuYQrTmdIL8Tm7ky6PPxrTIhFVKytarSDZBKO8ms5U7Yl5RVRmVvn4irleccTdxkRr
         6seP0IYN4gRFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D8186C05FD5; Wed, 25 May 2022 18:01:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 25 May 2022 18:01:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sa@whiz.se
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-1HdesuYWf7@https.bugzilla.kernel.org/>
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

--- Comment #247 from Sven Arvidsson (sa@whiz.se) ---
Created attachment 301046
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301046&action=3Dedit
Z170M-PLUS crash

(In reply to Denis Pauk from comment #245)
> I have made mistake in board name(Z170-PLUS instead Z170M-PLUS), could you
> please recheck with rebased patch?
Thanks for the new patch! The chip is detected now, but unfortunately crash=
es
after loading.=20

Crash log is attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
