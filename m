Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29151C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 15:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235224AbhLEPPe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 10:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235126AbhLEPPe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 10:15:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FD7C061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 07:12:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DA886104B
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 15:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68F91C341CB
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638717125;
        bh=pRg/epNeCbMVTxY2LQE+8KupttrmROq+GZHD1977zKU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FCYn1av1GcAFd1eAgX4EAbqDi42kBJFkw1RK4sYwFw+DieRJ9/EkvAOQREnZb5jZs
         t5rvFxUJMKPpo8noksIP/9OlmHrl7ZHVYhKywsg+wapCKnfmkRt22ICz/zVn8DrDlX
         4fWli4be8XxVxKMCG0CwjwewVKBgYBI+vCvD77fs6jo8Nvxf43u85qI2w43fbhFJav
         pvM+YEgZjkx5yZDg85FA6OEARta5YIlUmJwxueu4KjPhM3Y7nV4quA1YCM2mWR4b/A
         FgcQdbycHGG0yq/CIUZpvvXo2A3by4TCcrNw81UvLLnXRyPDsB0ZzPlzjFCppI+XKO
         +bYnUAt5qpu2w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5AF7460F41; Sun,  5 Dec 2021 15:12:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 15:12:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-i2fiPHWyAu@https.bugzilla.kernel.org/>
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

--- Comment #185 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
(In reply to Denis Pauk from comment #181)
> Created attachment 299887 [details]
> Add X570-I mutex
>=20
> Could you check with updated patch?=20=20

This patch is suitable for 5.16 rc3 right?

Reversed (or previously applied) patch detected!  Assume -R? [n]=20
Apply anyway? [n]=20
1 out of 1 hunk ignored -- saving rejects to file drivers/hwmon/Kconfig.rej
73 out of 83 hunks FAILED -- saving rejects to file drivers/hwmon/nct6775.c=
.rej
error: Bad exit status from /var/tmp/rpm-tmp.HxCCT9 (%prep)
    Bad exit status from /var/tmp/rpm-tmp.HxCCT9 (%prep)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
