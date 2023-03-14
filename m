Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857F4C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Mar 2023 08:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjCNIYJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjCNIXn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2023 04:23:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B5910267
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 01:22:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C91D261684
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 08:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E9FAC43322
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678782094;
        bh=JMrHXP6Yzi42JA1kaTcG/94hI8Uv8kJFLEv2zFbjKDc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dj1Hb2PgSR3adrkHGe5MM2NzB2a1aAevqnQz1TSGn8GoN3BAts3gzJC5yAs9oVUDZ
         ILd7xyfXpU1PpDxgONtN3iAQ1TBGwjrdqgGA5Zsn1KfnMt2XuUNfgfX7IpxwOwYGPx
         PgDeb5AvayGyE6w9yxoUGN1YAnLSLHWS+tl7G7q0u6/b5fGQetRD1Bq+gJcsznhp/b
         FmKmd8DjMi3GosfJwCmT699zLMWIdH0nw8/S0Oe9M8WXThEnHsTJvk0aZQfdlpybu/
         XmfB1FYr7Ln7IkSeow2HEhHFZ/uGGFc327A9Magyus+vRSmLyIR080lg981sxcUQA4
         z/nVKGhkJZypg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2E07BC43143; Tue, 14 Mar 2023 08:21:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Mar 2023 08:21:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: barfin@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-i6xRWAnnEz@https.bugzilla.kernel.org/>
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

--- Comment #307 from barfin@protonmail.com ---
Created attachment 303947
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303947&action=3Dedit
ASUS H97-Progamer dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
