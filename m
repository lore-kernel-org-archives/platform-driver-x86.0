Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B234EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 08:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239162AbiFVIwB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 04:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355474AbiFVIv5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 04:51:57 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2366337A00
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 01:51:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8DC76CE1DC8
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08039C341C5
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655887914;
        bh=JKKG6cnX9+5Z+/w+JtlTXtl72PrjoKhtNfGHk58PMAc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mt9b/kKB5lkpSWjZ0enbsh6/vUF2ViXGF6rT6y2OEvi6P6mVFfBvzIG9ZFJb9F/r4
         73jYB+JCuS9ey5dbQUpcNafA6DS/P6ADEA2932DEytvuMsMqx7vXOVuqnqsSOw//dT
         Vq+QZIP8DNtDzqKaBhxhc/PAzxxYzPrMbHrM674WvbBQN0fl3sn7CO6DsPfVrbIBji
         z5lvx3kDHEpeBGOFYbiZEbDUzqJEIhuFXkE2drUvYH89TMBYaHDun/LCkSAJjMKGyz
         VrU+RvfeFocOspHWWq5lPyFZwOkx2FmMRwNqxXVev6eIwk/C7aPtG28/pEHeGwEOoh
         IJDRItHsOJo/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DEDC4C05FD2; Wed, 22 Jun 2022 08:51:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Wed, 22 Jun 2022 08:51:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213297-215701-Hv63W0JtKg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #8 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Luis O from comment #7)
> I came across this issue, and I checked the ideapad-acpi source code and =
for
> some reason it now allows DYTC version 4, but only for 1 laptop model.=20
> https://github.com/torvalds/linux/blob/
> ca1fdab7fd27eb069df1384b2850dcd0c2bebe8d/drivers/platform/x86/ideapad-lap=
top.
> c#L871

Right, this is done because we don't know if DYTC version 4 will work on all
models. The ideapad platform-profile code was based on the ThinkPad code
contibuted by Lenovo and that was for version 5.

So for now we only allow using v4 on tested devices.

What would be good is to add a module parameter to allow using the
platform-profile code on v4 devices for easier testing. If you can submit a
patch to do that that would be great.

Or if you're not into writing kernel patches, I can write such a patch and =
then
you can test it on your model. Note this will require you to build your own
kernel from source.

And if the testing of the patch also shows that your model works correctly,
then your model can also be added to the list of devices on which using v4 =
DYTC
support is allowed (and eventually if that list becomes quite big we may ch=
oose
to enable this by default).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
