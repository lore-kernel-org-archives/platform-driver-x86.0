Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37C9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Mar 2022 17:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235817AbiCXRwX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Mar 2022 13:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbiCXRwX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Mar 2022 13:52:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDD3986D8
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 10:50:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE218B82502
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 17:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85D05C340FE
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648144248;
        bh=+pSJiTgvHyh2SFRR0QP6q+M6KKaQbbkY6OxYYXFQyg4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=p4CAvpgCRjAx9Gfy3YnGkLTCISsXt8zGw9snYtRLxPsYmjVoXaJlMMLkTifDSFj8b
         7FOwdq7FyTCdBxUNOR8+b7FV+6FcptreXFLjOoCyY0b8Ji+OpMRbQYK4mCPxtnF7oY
         cHfuVfyu/On81AxbnXeLedVG5goLq3tamlaqA1HCppb0mXT92yKKzQWDUL8Oy0ekuS
         TaiSziiNwDrR7pvWn+OegdKXmyQ7fRwV41xWgn9j5mAj9YUMN0EeIG2Iyh2foSyD5G
         kBCuyBdQ71Wsm2ft9frsf5RF5TGKtFuNyqPWBGGN95j9Nqde8u1fg6u3z0a9sLc0JZ
         S3IXGGnVGFdYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 75A50C05FCE; Thu, 24 Mar 2022 17:50:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 24 Mar 2022 17:50:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greg@krypto.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Jy90imgR7Z@https.bugzilla.kernel.org/>
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

--- Comment #230 from Gregory P. Smith (greg@krypto.org) ---
I hope someone works on the big picture problem: Maintaining hard coded lis=
ts
of random vendor specific strings in the kernel source code does not scale.

The only solution for anyone overlooked or unidentified is to modify a list=
 in
the kernel source code and maintain their own fork of the distro's kernel f=
or
years? That is unfriendly and leaves most actual users stuck.

A way to choose which settings to use at boot and/or module load time (or a=
mend
these lists) via configuration external to the kernel (ex: parameters) would
avoid this endless "me too" string submission dance.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
