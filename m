Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A923C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 10:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349100AbiFJK6o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 06:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349530AbiFJK6Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 06:58:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08D565436
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 03:56:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A8CD6208C
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 10:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09293C36B00
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 10:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654858596;
        bh=wVO+mvlnQcSPGAxYJG5P5Q23NypfzQ1cYvFF35UH1PQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WhS7dowV7zt7EHEY2tURmPtBhkS/Olr61FhC5mO3wd00VT1qnbAaRzuu50+/RxWUF
         nWKSKrhKffSuyyNcITh15VX2Om6U2s5/Wk0afNWNj36qFa/oZf/sVcLKmBkfWT6prx
         AkBkvApY5Ql383IiJIvQJHMmE80BH6HEN48OKqmLB9jLaZmjdRVFL2F24iZf9D/0aC
         BujjGSK660kqi67RvqR0ZMtU+6wtbcsGsa4hUV8iaQJiY1b5yyMI73Gstf7kTTzbxn
         /5fImRCCGvCvsoOf2+WlMu1vIDxed1CKk4IolayUSnBiKvZc+cCLorRZphClZNCWcf
         uwLB0HETfFk5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ED10FC05FD2; Fri, 10 Jun 2022 10:56:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 10 Jun 2022 10:56:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-tnZTIUxHy8@https.bugzilla.kernel.org/>
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

--- Comment #254 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Michael Carns from comment #253)
> Created attachment 301145 [details]
> Add Maximus XI Hero
>=20
> I have an older Maximus XI Hero (WiFi) that works fine once I add it to t=
he
> appropriate lists.  I'm attaching the patch I've been using on top of the
> existing nct6775.patch.  Hopefully, it can get integrated into the next
> iteration.
>=20
> Thanks!

Thank you for the EC patch! To mainline it we need to check the HW mutex na=
me,
and there is a mistake in the attached patch: MAX_IDENTICAL_BOARD_VARIATIONS
needs to be increased for it to work. Or, if it works as is, there is a mis=
take
in the asus-ec-sensors driver code.=20

Thus, could you, please, register a pull request or an issue at
https://github.com/zeule/asus-ec-sensors to resolve that and mainline the
change?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
