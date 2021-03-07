Return-Path: <SRS0=OtHb=IF=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CCBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Mar 2021 09:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B76264F6D
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Mar 2021 09:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhCGJhG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 7 Mar 2021 04:37:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:42590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230303AbhCGJhF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Mar 2021 04:37:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BB9D365012
        for <platform-driver-x86@vger.kernel.org>; Sun,  7 Mar 2021 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615109824;
        bh=wph4rOJK71zkTEjot4mw66XXFGmsRP8KIEJck9qBLu4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WShdzNxANGAZnzU9fXLI1DIhQ91g6bJYLk7k08/xZTQpLsb3nezjmKVFIncp5vDom
         Jt1VkAbuuKAT8WS3CYe2t7RAH4F+Ze03Coy0HSuBx/OjOTiK/TaDCESzA+rPCkDAuC
         2uYlKI1fa7hQC7ULIfiKeY/V9+OjV61vSDPQomvTzGOVDTSQ+6bL8D5brYX+AV2VPE
         SCqMY5u29PUOqwc760/PbBPRoADZxvK9eE4lpW5PuruPxf0ti3OTIqk0Jfxfz86YJX
         ZTrPRM0S9fbrMwzkz6n1wWHpJ/AembKKGOoQxDq8vMRxAiYmI6aysj9mh5Lxb3iKYT
         aTMUZuwGjQqRw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Sun, 07 Mar 2021 09:37:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211741-215701-ujzOlWq29G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

--- Comment #1 from Luya Tshimbalanga (luya@fedoraproject.org) ---
Here is the hardware information:
sudo dmidecode -s system-manufacturer
HP

sudo dmidecode -s system-product-name
HP ENVY x360 Convertible 15-cp0xxx

sudo dmidecode -s bios-version
F.48


It seems some modification inside
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/platform/x86/hp-wmi.c
is needed when using with the recently landed AMD Sensor Fusion Hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
