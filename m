Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A703AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 19:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73E8661941
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 19:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhCUTPD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 15:15:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:50734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230064AbhCUTOr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 15:14:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5A46661959
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616354087;
        bh=8DUfJ98FIHjmO/R5FOHMmWUG/QfM6ifz7WWUM548uzM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hf/o+TwQAQOelOk78+97kgzChJBlSzk9F5o3Lj0e8jhTk0pc1QP7VFduyNvY3BGAg
         BsGG0z0WCafhBFP11p9Ez9rdQALhgu0kQhPodbfDl3VWYDfcZ5+Ob1mFpA+zl6T2NM
         3i9AGIbvmAIouNV0wcjzaVSbgKPM2mQbOiXf9k1EZ2xU8X/UcdM86WFWQy5yxy5hAR
         VJ4w59QNpZKirfH3YLPtgWzpdQFjqELfshrQvqyxyoIaZlRw+K0rf9vhuY6vr/xuCa
         akxF07tQ/TB3fmXKeA7pUVNOwcmZj0czDoSEYSDTeVx9iy1HIKtYXSOmmDee6i9czS
         7WnjyA91jJ3QA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 21 Mar 2021 19:14:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-qZM8yLwbua@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #47 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
So if someone is willing to spend time on making this work, then here is ho=
w I
believe this could be made to work (for the case which Matthew Garrett
analysed):

1. Modify the nct6775 driver, adding a set of nct6775_register_ops to the
nct6775_sio_data struct and have any function which sits "below" the probe()
function only use these ops to do register accesses. Combined with having
sensors_nct6775_init() set these register-ops to the currently used superio
register access functions (so that nothing changes for existing users of the
driver).

2. Move the nct6775_sio_data struct declaration to a shared header somewhere
under include/linux

3. Have a new WMI driver which defines register-ops compatible with the ones
expected by the nct6775_sio_data struct, using the RHWM and WHWM methods wh=
ich
Matthew found (note these should be called through their WMI wrappers) and =
have
this driver instantiate a platform device, with its platdata set to this new
nct6775_sio_data struct, allowing the nct6775 driver to access the registers
this way, using the mutual-exclusion mechanism build into the RHWM and WHWM
methods.

As the drivers/platform/x86 maintainer I would be more then happy to merge a
clean driver for step 3. To me this seems quite doable (to someone with some
kernel-dev experience + enough time).

Note I believe that this will not be a whole lot of work (but its not trivi=
al
either).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
