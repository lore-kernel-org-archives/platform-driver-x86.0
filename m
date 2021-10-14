Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10BFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Oct 2021 18:42:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8301660F23
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Oct 2021 18:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhJNSoK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Oct 2021 14:44:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234004AbhJNSoG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Oct 2021 14:44:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F265C61212
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Oct 2021 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634236921;
        bh=i0x7V3SAdZCDsjqg8eYxNIbf66k9Vz38mozSV/VvQro=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LlnB2Y/wNsRnqD07dXxs4vebnvR6VkDcqid8lxx2uMk5Aw85srAShBbMdoebzZHnA
         ZT8xH8uJ8A9eWDOikQyIMUOJl5pfXuiQqUlywXze41u+2Wud6JvaKqcpelKf1YxKYm
         6k01FqsLw1Dc0FlhW2fsOLtAKeb9xgVymLsyJydBFNl84pQyv82xNYme4YXrv0j6Y0
         enhsN61Z0cSWrC89WXSqKO1HhVw11nUSezAvx/HFlwM2+KB8RjwMS54xHg8GWVHJu6
         mfKJNBF6knfV3wSDeMn3TsHQ46giq99hItsiGdBnOX9+INRuUm3HS1OG/H0qSVAJRl
         /O8LyNSZMcVlw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 14 Oct 2021 18:41:59 +0000
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
Message-ID: <bug-204807-215701-dYzpy6zVAe@https.bugzilla.kernel.org/>
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

--- Comment #141 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
I would like to ask for an assistance to understand why reading EC sensors
takes so much time (1 second). Could, please, users of boards with sensors
published in EC registers (we currently aware of the following models:  Pro=
 WS
X570-ACE, ROG Crosshair VIII Hero, ROG Crosshair VIII Dark Hero, ROG Crossh=
air
VIII Formula, G STRIX B550-E GAMING, ROG STRIX X570-E GAMING) measure how l=
ong
does it take to read all 256 EC registers in their system and report back t=
he
time and the board name?

# modprobe ec_sys
# time cat /sys/kernel/debug/ec/ec0/io > /dev/null

Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
