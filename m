Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A002C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 19:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiGKTOI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 15:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiGKTOH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 15:14:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D74D167E7
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 12:14:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C526061560
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B153C341CA
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657566846;
        bh=BmnZqAE3yx1Wrg/PN8h8dQbMKXGHrc1g0wJxLmBnuYQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jCxQ4JNHXA+SsmoLdcY++DUKAyW6dRJlm28Q0bdnMeyNHAZ/McPmsu1OkOFp8USEo
         8Cdv6NvjNV5p/njk2zrfP6w5/W05iqr5mpLfyF2i3rjJSCYPZYY6gu6f8vQvHPijnx
         EPCye83Hm6zlIzIvYe7AS8fRlniPcAQ7vXweJ010smJ/ZJGR/aVsadyV1wo2W0O2RM
         vk1g4g4epTymmqPWyAn72WQhfPgEvy53tMhfj57ATt73q3n1rgTzt5jrcUG0fXiQN9
         TzwijadEONH5xnzxxcllBKS9mgW2xp7LRMllztaO5x9kcbGW3HUYQAyBgCJJaMZanu
         NtkWuvYuzOS4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0ED0BCC13B5; Mon, 11 Jul 2022 19:14:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 19:14:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-5gvrzrRp8F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #13 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
It should be the latter.  You can confirm the statements were turned on by
grepping /sys/kernel/debug/dynamic_debug/control.

If it's not doing anything now is the right time to ask - you do have
CONFIG_PINCTRL_AMD set in your kernel config right?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
