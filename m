Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C451FC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Apr 2021 07:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C8FE611C9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Apr 2021 07:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349784AbhDNH6n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Apr 2021 03:58:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231520AbhDNH6m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Apr 2021 03:58:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E6B5E613C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Apr 2021 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387101;
        bh=o49+5j/jkXkXZFQgCubvfQcxEomrMypgbF+Lxx7XaCU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lI5VTwQCK5BH/U7JFnfCP5uB1xIV21EAv5IDhQ2WgdVSBAE3/bHA71hjFGliibXMB
         bt/C/QzKS5v5DJzHVX9g5P8zmHgIWkF4r7pChT7D0CVSma3Qa5OKbA8QbJuBrBeMWP
         nxVk6NDmGgw1SOST7NuC2wUGOyJDpRhfhuMgkbss40qWFWIDZ718tgz8L4nOC9yUc8
         Q14TSWgSP+RJYzM2WrrSlfAgCJzgPrTb66pst9SO9ik6UAol/lwcFz4pNyG3xacKnL
         Thd95DmVL6vehA2tJnBVXcXsSAm3zf9a2P1XCW8t20SMUAa1l5IRjRDaSMkRUAvMX6
         Cb5QTC8FFDd1w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 14 Apr 2021 07:58:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-rXztDSSzGx@https.bugzilla.kernel.org/>
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

--- Comment #66 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Sydney, thank you for your kind words, you have put a smile on my face, so
thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
