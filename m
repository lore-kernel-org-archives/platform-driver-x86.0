Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34361C433E6
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 11:54:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9A1D619BA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 11:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCTLxz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 07:53:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230080AbhCTLxn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 07:53:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 925FB619A1
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 07:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616227057;
        bh=NAp31nW5bLeoQTN0a8Ix0b1aNl5K2fAfTdJ9RZmORZE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Luf0b04EUC4zPehMhYD2Hfsz8wYAUut9f81X+YvKppukRCslYzAruhsen5CczUEHp
         qdHvBo7hzsUi3uYyiwZyKBdwkTcGu38YjFkZks0f5ZoO+z9nlkZZ+znIxaLc+LvbQl
         I6c9eH5VCOPHJohkr9rxowTqNU3yX4yoNgLpbC4FLArnWrEtvJnBiY1mtprqD91OB4
         4xXHEWh0GW8wxp4VMVkYk9CxpCtrGX5wa2FTRa04yPZ8/cmvVLxVDKSHT6TnWV4cwC
         0mBs9CzgtXKGcFEfrJxC+Q+sX3RL0za9lplVQoOrA0FBS7fks3UiuWlyJst81TQKLX
         Dn7DimgvsRHwQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 07:57:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: myhateisblind@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-yX6p8fWCmQ@https.bugzilla.kernel.org/>
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

--- Comment #40 from myhateisblind@hotmail.com ---
Are you sure about that driver? The github page says:

"Note: X570/B550/TRX40 boards do not have the WMI interface and are not
supported."

And those seems to be the chipsets of all or almost all boards reported in =
this
bug.

20 mar. 2021 8:51:07 bugzilla-daemon@bugzilla.kernel.org:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204807
>=20
> --- Comment #39 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
> As noted in https://twitter.com/james_hilliard/status/1373178256615211012,
> there's actually a driver here:
> https://github.com/electrified/asus-wmi-sensors/ . I did a quick search
> earlier, but managed to miss this somehow.
>=20
> --=20
> You may reply to this email to add a comment.
>=20
> You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
