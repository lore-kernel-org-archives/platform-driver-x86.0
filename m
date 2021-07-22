Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A90C63793
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 08:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCC2A61287
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 08:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhGVHmG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jul 2021 03:42:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230048AbhGVHmG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jul 2021 03:42:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7533061285
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jul 2021 08:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626942161;
        bh=fFN35FnGQPKDR9dnr0RrLYCO7LjqX1J1v5iU9tRAywk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=efXcNovV7dsn6LSw/jsVinl+4HUKrrw8rsOtV76ZNxs7w8lZwLpqbUConYY0jIuGX
         Zkbl+ji4aqJa2dJcz5G0esK8uaTJkSdHxkyIqenuvqeoeMnyMQNU6oo0IYuA4n+J07
         OGu1It3vJ05vklSsP8h/xPCGbObNgy192DHNJ97jA5lIepUgnzVUNVsDM9h/ZzgnZZ
         RnzsGXZXB3RwVnyVnXYkQi8dg6YWQ7xhj6VIUvLy12e3SjjfhNd2TOcKceuma9ifPE
         4YQkEZbf3HdFe50GRrV7ZDTVGFAmgU9qKl1TN0WVQsQthNqpNRg+cxxzusLgCfmdHM
         UeSVsV9QBAvmQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Thu, 22 Jul 2021 08:22:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-nZ7QuE3SqN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #36 from wse@tuxedocomputers.com ---
From this:
TP_I2C_CLK -> BD21 -> GPP_C17/I2C0_SCL
TP_I2C_DAT -> BC22 -> GPP_C16/I2C0_SDA
I guess it's the first one I2C0

Thanks I will relay this and we hopefully get a fixed bios for the Tongfang.

And I wish good luck for the people Clevo devices also. I hope Clevo gives =
them
a positive response also.

But I wonder now: Is there somewhere in this gpio code a quirk list, like i=
n so
many other places of the kernel, for redirecting misconfiggured firmware pi=
ns
on specific devices?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
