Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B4EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 10:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12EA960E77
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 10:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237602AbhIEKnB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Sep 2021 06:43:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:60524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230145AbhIEKnB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Sep 2021 06:43:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0C5FF61057
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Sep 2021 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630838518;
        bh=u9N5/8vRxP0OL2c4bthCmZnERyRTdlGt+Wn397gr+oU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RPJeuFtf0hB0CZMV8MR6/kAfSfiYEPYh5/xVGDoAVqCZMYNkNdWfn9UdLmghqHbaD
         V8PFZ6BP6t3YyjwZ5QzDF9vflZD4R97JmJcIz4/aAhtRqZHxh5zM9sSnMv7dQcJDah
         h4gX7YhkQFRRmvDKdNY5lPgw+nelYUdt/6AFSu2ZRFZBTyO4bA0S0HfJW06WvQAt8i
         13uPcNOFInZd/QzvowRVjchl53nW/LCz/oRe3wmpKWPzPKyF0kO8fwftFv6GfjbxZE
         kFWX/A2jPKF/x9ENiNx4TmUngYhxTUy4bUeYKg/nnVoWW6I8tHSw4yhn23ghdODvWQ
         ojaqrgvEeV2zw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Sep 2021 10:41:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pehlm@pekholm.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-AO5SKcrixE@https.bugzilla.kernel.org/>
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

pehlm@pekholm.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pehlm@pekholm.org

--- Comment #90 from pehlm@pekholm.org ---
Can you please also add my board: "TUF GAMING X570-PLUS".

Thank you for working on the patch!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
