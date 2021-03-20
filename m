Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDCCC433E1
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 15:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 091B16195E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 15:33:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhCTPdV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:33:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhCTPdP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 11:33:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0D57661970
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616254395;
        bh=Wp9RrPXmiq3xZP3bzUqObAXluum4gt/+hrGLXLPKXOs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o9NxXtXFORv2/QzLrwm9G6MprqudjHdUMDF3a0aGORzsDawHPvlC0JNBGY5EL9MOe
         feZb1fWgCK6iIcR3dr9RakcUvHNqv12jHrmuqsqbZji7lCvDQLGNDkplfz1eoo/iNC
         O5cXV4x2bNBuOjpbKUWORVY99kfm+JOvlpf8n3NniXJCbQSIMg0mOMZqloRdCthrYH
         RtTgVo9IhpIwdtGQfjUGQ9oux8v8OZpdrYcN2xYuwrfMgiSX1ZaRTC7WW2073pP6w9
         IZKjLsFpamOXMVHnc2s0z5fZ7reKCZfkGFJmF1yPORYbNj3aR84F/ArbARVD/LGO7R
         WGgIwEqzB+ZPQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 15:33:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-18QQ5XeLpw@https.bugzilla.kernel.org/>
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

--- Comment #43 from Artem S. Tashkinov (aros@gmx.com) ---
A small correction of my previous comment:

linux/drivers/platform/x86/asus-nb-wmi.c

/*
 * Asus Notebooks WMI hotkey driver
 *
 * Copyright(C) 2010 Corentin Chary <corentin.chary@gmail.com>
 */

This is not related to lm-sensors in any shape or form. I'm really sad how =
this
situation is getting handled: the bug has been known for over 1.5 years,
affects literally hundreds of thousands devices and you're saying that this
kernel option might have unintended consequences yet _everyone_ in this thr=
ead
has enabled it with _zero_ side affects and Windows seemingly has it enable=
d by
default, as no such messages are getting logged in Windows Event Log either
when using HWiNFO64 or vendor specific monitoring software.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
