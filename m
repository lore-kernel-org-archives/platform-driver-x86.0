Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA457C433B4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Apr 2021 12:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1A6661350
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Apr 2021 12:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241100AbhDLMkQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Apr 2021 08:40:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238587AbhDLMkQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Apr 2021 08:40:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A0C961357
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Apr 2021 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618231198;
        bh=uediFeXfAiAMinCXBui3SXlrl5RL5BAw01MeX/FlwSU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FQ3biws1eRZxQToAraD9O3tiihi/VsLltwwkFu67wMKtjzNI1Hvb/6yt3yKaFB84E
         sWGLdeKMliysdvWxVHgxIXboM1b7DDjeR7Xa+kV9FvHi7MQUimFjrvLsPvFpt7+wcT
         GBlKDsEQuKqqBJDOPD6tHP/13caeFgRvR/bmBzMjLT43OoqMv+s6FjRESVf8kABH3j
         JpEMcRkXHBwji4q6PCFWJegkr+qnqoQg7aiP15TZmV4GTATQsO4G6JfXw5fTYtz9/T
         Tt/F/uJ4GWa/2bkPLFwfNxO2la37MvpdFMTaXUnELNNgHrn+2N4Np8DmiJrdpE7uBh
         gMwcjjjojrahQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 12 Apr 2021 12:39:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-rLK2I6Wtef@https.bugzilla.kernel.org/>
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

--- Comment #61 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Matthew Garrett from comment #39)
> As noted in https://twitter.com/james_hilliard/status/1373178256615211012,
> there's actually a driver here:
> https://github.com/electrified/asus-wmi-sensors/ . I did a quick search
> earlier, but managed to miss this somehow.

From its description:

Note: X570/B550/TRX40 boards do not have the WMI interface and are not
supported.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
