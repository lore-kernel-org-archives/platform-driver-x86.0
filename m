Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC960C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 13:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhLEN4H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:56:07 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:45936 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbhLEN4G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 08:56:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AB294B80E64
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 683AAC341C5
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638712357;
        bh=aRSOe0RUTtaDbx6sYkGQ5HqKb0V83R1GE7l+wpP/bvo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RVHXZz6gGpUnqtAgI0O3ppHD57IAdVHJOUzNXjYTQTnig/K1hqMyWWo5hzzSBWBAb
         zyIXVosqPP6D54VPHm/XeH38eY7xuxxK8Cb9Mi2z/SlzV6g/LYnkUylDUoBY+gpWAU
         0Qsrs+B1nCDagKJdIR8fNs7OVQ3ZObk5kNpl/1qXaLOlvSwCRYcuoSdU6dMzqiYyuL
         q1XWCcXEZLHW+AlIGFPw2bgVYM+ekWfpzjVceIBTg+/j5QrORXgnx9qjjXw3hNsgzP
         kVIfBleUvGRdu3xff08/RltDM/WsraziXSJ6tFojUe+ELLNCkocVSHq+7MQAj8sTb6
         j5HBaX9SJGTIQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4FADB61182; Sun,  5 Dec 2021 13:52:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 13:52:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-MguAeBO6cP@https.bugzilla.kernel.org/>
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

--- Comment #183 from Vladdrako (vladdrako007@gmail.com) ---
Created attachment 299893
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299893&action=3Dedit
dmesg p8z68-v lx

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
