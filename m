Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC75FC433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 05:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiJNFOS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 01:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJNFOR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 01:14:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE3D1946F5
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 22:14:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A128C61A30
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 05:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D741C4314A
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 05:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665724455;
        bh=G8zyb9YLlunpHeHnnX+9oqPr8MOD+moXNL0WADVRiv0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=W+0MR6cWOXyt7dkuQandZkMCdy3FzUC4uSQfuCk4Pn+T0+hIPPkdosiWM1f6pXnLG
         5Kvcjp90eSVhTpa7I1dWoInukgu17W7pQHTLQaVDcqEOUZtJJAwIBwLyGUWPyFcvqX
         fOpmL7offUrUPYJzz7HdxMu23Esyd0tCVzKQYifWKHiHHWogZ8aq+QgbamcKmzOqRm
         ZeoogiVLBMH+RdCVKrqyVvxliCZDyoP+88q+iWzffRdKHNn7vSGSGAkjIl+X0jqjKN
         Fy96XE9RC/PatVIy63GUbo7imHkCWgv98LNGMMHvZgR+bVZJ7Qv7qvRaFfCwDA9HS7
         5BBU1sO1FEXYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F0E50C05F8D; Fri, 14 Oct 2022 05:14:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 14 Oct 2022 05:14:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-OVxG75Po3d@https.bugzilla.kernel.org/>
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

--- Comment #256 from Vladdrako (vladdrako007@gmail.com) ---
@Eugene Shalygin
Can you create patch for the 5.19 kernel, please?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
