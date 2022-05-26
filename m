Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3851C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 May 2022 22:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237704AbiEZWjp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 May 2022 18:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiEZWjo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 May 2022 18:39:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392FE70374
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2022 15:39:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 98F60B8221D
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2022 22:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5978BC341E1
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2022 22:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653604780;
        bh=XA+DzDAQTqvg84enCfzxaqlde+jod4T3Q6LlbLJ96gU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LkPcJOLgumHOCAGtoUgHg2e4KR7MLcJrKKfqH/SNluwUTPEg5TYtGq8SJhM7wlu3T
         bXEpgxmW0GkapevwFtZY1D3mdsBp8SyThSnjKJ3Iqz5BePK2Z+3r6ZtmfphbuGQq9O
         gxEfaVd8RHxksLvSB4vU2pcg1+AGkRff4XBeKqcxzPPfW9NhP0o6tvJhtMafK2irwN
         qX2lSQlll44BEBHr9jHZMvX3ic9fRRmfmAcjXBXaIXER1zYJfRR9tB8LAvwTZjHNzg
         M6yuor2pp/M4IivIFbrZuN0+wfXRlK2NVUTE6T2WknkI1Pf43ATtSb1h3tMJsMp1aw
         6xP0TUzw76rTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4AF43CC13AD; Thu, 26 May 2022 22:39:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 26 May 2022 22:39:38 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-wXJvhbEJxN@https.bugzilla.kernel.org/>
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

--- Comment #249 from Sven Arvidsson (sa@whiz.se) ---
(In reply to Denis Pauk from comment #248)
> Welcome! I have added small fix for init, could you please try?

The third time's the charm! Everything is working fine now.=20

All the sensor data previously visible with the acpi_enforce_resources=3Dlax
option is there and PWM seems to be working fine.

Thanks for all the hard work you've done!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
