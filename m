Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEF2C43217
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Dec 2022 05:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiLAFxP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Dec 2022 00:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiLAFxO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Dec 2022 00:53:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C19D9493D
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 21:53:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C8302B81E19
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 05:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9535BC43470
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 05:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669873991;
        bh=d7LfRyMa1z0IY2auzD/Ip1PZleTuJddB7bnwq8FDhck=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i5pkdqJi9JtJM1n+UbdqPZHuMJ2g5K2hTsto4r2D4i56N+wHjMDV+COrQm6UDJwKx
         45FipAHUNy2Rnxs4Mvs1wpsJKU5pt+TDhepOltN9o1HfpgNAEEu7tM7DcQ23EMXgYM
         lixlRPaywmGH9QI6I05IuCVBRZ4b7LWV9HAP1IvZ+iCyfHFC2BCsWyX0VlWcNenc3U
         0QjOvjAcgnXgyRz+3dBAa4hXmTwYPNojZoD7La2//vGjPnpPl1cIHaV6FyV0Af3gq0
         mStozx4+nr3NGIqnuQHsw9LFhlIyZMZAOVtcBgyRIGFfNT3djV4guCS7DEB2UK1Jws
         OliPjIYaQhNOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 86223C433E7; Thu,  1 Dec 2022 05:53:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 01 Dec 2022 05:53:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-YVGHWQ02W2@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303161|0                           |1
        is obsolete|                            |

--- Comment #276 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303333
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303333&action=3Dedit
Asus WMI for nct6775 v6.0 base (2022.12.01)

Added:
* PRIME B450-PLUS=20
* ROG STRIX B660-I GAMING WIFI

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
