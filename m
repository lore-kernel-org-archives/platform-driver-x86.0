Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A307C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Nov 2022 13:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiKVNmh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Nov 2022 08:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbiKVNmd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Nov 2022 08:42:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E4F117D
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Nov 2022 05:42:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2D5BB81B41
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Nov 2022 13:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61807C4314D
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Nov 2022 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669124547;
        bh=9oYKSrT5tJhT7ZFiVFym6cv0iFe8YcP6QWACFkztq5E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=je2jO9CNYJfeV8xVeKBHuWyZ4TK8LJ3PAatjom/3fCcpNizbNh2n54HN+JrHLMcWj
         rtN82MRAGGThU8yG6U5YNVHwTitfJEATq0qNgkdUgDQMq6HhAZ1ygFtIO69yxdNzZS
         DLm6mXzDddepBupDro/pklQWwO37c9ynnVl/5UEy9SZK4ws2r58t+uKWbAa+tCC02e
         WNUKCtijamCveXAUsn4h+7JxWkubz/QaZj757YpJI48UyYOEs+VhVQIGGsnm5LvJX6
         4asnWsVQnjIgrA/rwmcFP2V8Uks/nkdqSUp+lVz1CBnCGMNuzavt2Gt1Dg7h8Bz2xC
         T+H67AY5wT7iA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 51EA6C05FCF; Tue, 22 Nov 2022 13:42:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 22 Nov 2022 13:42:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sst@poczta.fm
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-VdBpt4ODZl@https.bugzilla.kernel.org/>
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

Slawomir Stepien (sst@poczta.fm) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sst@poczta.fm

--- Comment #271 from Slawomir Stepien (sst@poczta.fm) ---
Created attachment 303265
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303265&action=3Dedit
Add support for ROG STRIX B660-I GAMING WIFI

This adds support for ROG STRIX B660-I GAMING WIFI into the "Asus WMI for
nct6775 v6.0 base (2022.11.12)" patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
