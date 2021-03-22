Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7CDC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 11:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 839CD61879
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 11:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhCVLGi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 07:06:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:60882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230465AbhCVLGK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 07:06:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8FBE061983
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616411170;
        bh=lvqXxUSveK0kA/aD1IqLhI8O6tvQuorZAglpeOUa5xo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aoYLsu/ap7W3PNmiUIZm4lG9OIjrsYoiklZodPnuvNI7AE60i0Jm7a62oyo4xV5V2
         a+U92KXXBGeV2S3G02dZDbGVTPzSMIOuoLoioarx6tpQ0jEVwxCUHuTWLPFrjW/7yV
         hVaOPDTKPKnczWhkGX6GvVuW9WyqzfXEmHs7hsXYpxB2PYTmeMR7DHWHn0DB555kMB
         PYm65C9nmJudajnoAV03pBNFIsvmyjKkqSp98Zc86p/5oHCkoCKc5dEYl8P5qNg0aA
         HHuhnm/34btppt6Ed4eBRnYNpnt/xG1AuaZTx2+eaiVIUjpc5GPVYF9q7/TsvGOzoC
         moxIfO3GEo+xQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 22 Mar 2021 11:06:10 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-OvE7U3qYf9@https.bugzilla.kernel.org/>
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

--- Comment #50 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
> Maybe we have ... kernel developers who can do that instead

You now kernel developers are humans too, so they need to eat and sleep and
stuff too. IOW they don't have unlimited time to spend on helping every Lin=
ux
user out there without any compensation.

Maybe you have a friend with some kernel-development experience who can hel=
p.
Or maybe you can find someone who you can pay to fix this for you?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
