Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7850DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Sep 2021 08:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E09961350
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Sep 2021 08:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbhIRI4l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Sep 2021 04:56:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234575AbhIRI4l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Sep 2021 04:56:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F79A6128A
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Sep 2021 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631955318;
        bh=z60hwv6zcHkoXroCw5tgaAxfZ59KoYfS8o07gl7Y3BQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Nd08FeEVuNxpjDq0p1i1I4Sep5z82kP4/7tFP3Q/eIBOSpWS9X1QVaZlD5FBPrNhI
         ugAePVgMOXEOyK85tjv4oT7WfO98tCAfzP1SwJrTpLP1/H8n5jDkCqTzNcnFoMhkHg
         5whWVFM3FeIGq0qResL6/4QbGSES/PpIlhk7HkQZCayVFAS6dcectO1FO7D5bC6yCF
         YabN/prFREXhBFvCKqaBkgMbGSOhYOmYPRnXT5FoFq2GDF31TPxFw/yukarFC/7BDm
         SmyvTCS4xXC76qpPhuL7hJOf0VtM3mVPei5j95bAg+hWvI9mgBBHZKCo+o27eNXNFc
         5Lmiz/N9aeydQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 18 Sep 2021 08:55:17 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-1tR1xfVV0z@https.bugzilla.kernel.org/>
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

--- Comment #114 from Denis Pauk (pauk.denis@gmail.com) ---
Patch series are applied by Guenter Roeck. https://lkml.org/lkml/2021/9/17/=
1079

Thank you everyone!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
