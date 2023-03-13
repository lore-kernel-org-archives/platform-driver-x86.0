Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4C0C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 11:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjCMLoB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 07:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjCMLnp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 07:43:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FD166D17
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 04:42:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A770D6121F
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 11:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18E41C4339C
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678707717;
        bh=P7FwQQapdkHmtBfK7nB0YAJGx+za+tLEt7/8UepEdWU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S8DF/T0a0nKh9+6F5VnpBHKIzm5F1PI3wCkuHF9Uq9r5HifUSwsAwe5ofCmYtXvIc
         4TAyXs3i/U+X1KJwvEzI5BbgP0x3DvHjWvNtDlfpxBivIKtv4IIxORPcjSouN37yC5
         AjM/XV1l8hchf7WmSArM9qKDBRMUzIeDGBtIcaSaqXoL41IJtnsjGq/oz9dFVl2iwN
         C9ffUgpa8LinV9CO6zzI7dmwlcunbbUT0SJ6UePDFqVBS7HcCzJHK0hJ2C0WBZNdKp
         FAeA2or8SEfdC4YrMIS77AqtsVztkX+TyeakzsP60KQr3+JvBfeh85FTSzEdQxHBaE
         HNoR7yyzANH4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0A0AEC43145; Mon, 13 Mar 2023 11:41:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 13 Mar 2023 11:41:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: barfin@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-SMl3ylNuk7@https.bugzilla.kernel.org/>
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

barfin@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |barfin@protonmail.com

--- Comment #303 from barfin@protonmail.com ---
I'm Using ASUS H97-ProGamer motherboard and i still can't sensors on kernel
6.2.2 without using "acpi_enforce_resources=3Dlax", i haven't seen anyone e=
lse
mention the asus-h97-progamer motherboard but this mb is having the same is=
sue
as all others that were mentioned

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
