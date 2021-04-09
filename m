Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B041BC433B4
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Apr 2021 17:01:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86610610E5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Apr 2021 17:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhDIRCK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Apr 2021 13:02:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233332AbhDIRCJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Apr 2021 13:02:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9BDAC610E5
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Apr 2021 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617987716;
        bh=h/JL5QTZ7r2Y+IRKHIyqdyK3nOSxzQZnRR26sTTgqgY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tc/9GVRsQpp7j2F9o95YGX5n5J1INnG4KMmqh7JuXJ3UHOot6hB9R4bZKj7myvgyF
         pphaeUK/A/6iXv8ZlYq6fbz4si9uRRrk2n0YcnxbCny7xG4frksYXmrcDzrhUymr5M
         HYIr+vizI/5BKE7F9/RpzPSLrHvDt/JeF9gpaollispnj9sjdz2VEUufpt/DQg/KBt
         YkcunKY0WkCPt136Tqcpdfky/I2/kd+CWA6VtZ8I9azuSrcCjO8S1hhZXNkQcNzv8R
         PEbEFKl/SIdLdpZHD2YOqbpAqo/GubsS3+UO8YbABiA8fEhjn8AcTnznx4o+bSC8qj
         v5NWuuvv7LsfA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Fri, 09 Apr 2021 17:01:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pterion@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210457-215701-27SS80QlhS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210457-215701@https.bugzilla.kernel.org/>
References: <bug-210457-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210457

--- Comment #10 from Daniel T. (pterion@gmail.com) ---
(In reply to Hans de Goede from comment #9)
> (In reply to cfr from comment #8)
> > On my machine, the issue seems to have been caused by a firmware bug, w=
hich
> > only manifested in symptoms with the kernel update. That is, the firmwa=
re
> > was the same for 3+ years with no issue, the new kernel triggered the b=
ug,
> > but a firmware update seems to have resolved it.
>=20
> Thank you.
>=20
> Can the other reporters of this bug please also see if the latest BIOS
> resolves this? ThinkPad BIOS updates are available on lvfs, so they can be
> done under Linux through fwupdmgr.

The situation is NOT resolved / the same for me after the recent firmware /
BIOS update.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
