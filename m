Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAD9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C01761267
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhKJWwf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Nov 2021 17:52:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:35812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233569AbhKJWwf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Nov 2021 17:52:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4247A61284
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Nov 2021 22:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636584587;
        bh=E1phnNry9w+U5/g/WTo3IyO/fjlCt+qeVHnbfk+ls0M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MXpOorat0C69oRY0npHe5XmJiBJEUadKxmFOJe0CPwZDHpGyrFH41lmGGCFbC9uwZ
         20Xj5MZVDVQfWAoCcU1+/HQbbSK9Ava3uRXEHIOAnK9/oLnLMJsovk8UqluJCYSuGR
         ZyJr0mPWa93Y0jLn/FUettgOmdtzSQaINgIMQywCw9lTh8D6iVusLJUxRABd9wfEmX
         zglYd60rUianJ0SCvqeWXIqnCVemEGvndTnMmV7+ID3Ezh7YKe+mrYwcDiy38XoutD
         TKR6Ax3jkGBqL9Tj+MxTHXSMxGCubIZ0xmTFI/tfKo47BnigyuAQL3cOTqn2uQEaNK
         /MVQx7sSRGI2A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 10 Nov 2021 22:49:45 +0000
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
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-lYp8Tv5IrT@https.bugzilla.kernel.org/>
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

--- Comment #165 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Eugene Shalygin from comment #162)
> (In reply to Denis Pauk from comment #159)
>=20
> > It looks as different for different boards, B550-E uses
> > "\\_SB.PCI0.SBRG.SIO1.MUT0" as mutex name.
>=20
> Then we are better off with a platform driver that provides these mutexes=
 if
> required and known, that can be used by both nct6775 and ec sensors modul=
es?

Maybe we can have asus_wmi_info_table from patch in #163 as shared file with
description of preferred method for access, acpi mutext name, devices on i2c
bus, ec register address to sensor type. What do you think?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
