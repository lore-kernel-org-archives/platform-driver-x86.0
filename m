Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625C0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 13:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240914AbiAKNqu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 08:46:50 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:43596 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240678AbiAKNqu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 08:46:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38E876165F
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 13:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F361C36B13
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 13:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641908809;
        bh=StP8K7UQr/ITEbQjryYnjCMgg3vhjVg/m/hm6WUVLnw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S6i3vG90Lfo1aQqCgc3ypg7J9vSFEJS6b0NDG218m5Tgz5bZZ0npMLGf0ObIVvgYx
         ZVgpBrfkO1mYfK8AtSQFxkuNSK7w5ID9v8KzhbNctKcwGwPZ1laIsk0hbtyoC2yN4Z
         CxhBlKgp5jYqRCX1gxNzn5CmdLk9/l7tj03nqarwszkdbuIPTN4iXQod6IfgLxtQtz
         CPK3p0BTrTD/wDQp3pss+xJ4DV2fhCrDp31XibDffxCjHoLkZ1BhyyOFmq9vANWyuk
         fGffTb8s7HdpMDuekCbjcrmPMYCN8dKuZxsziSZDQY4ZzwHmWZYPZsxnCGmfTdeu5Q
         V9Pmy3+Tapb9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8DDBFC05FCD; Tue, 11 Jan 2022 13:46:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 11 Jan 2022 13:46:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-3zZyn2KRKO@https.bugzilla.kernel.org/>
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

--- Comment #207 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Aleksa Savic from comment #206)
> Not sure what's up with Tsensor1.

That's the blank value.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
