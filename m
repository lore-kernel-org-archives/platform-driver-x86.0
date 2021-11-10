Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E08C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:54:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3F4D61264
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhKJW46 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Nov 2021 17:56:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:36470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233569AbhKJW46 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Nov 2021 17:56:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2D41B61506
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Nov 2021 22:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636584850;
        bh=slJPvLinnKQdYp0BbyVddLpvnsPBsBsXjuyB8m0VUW8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VjjLUNOyT+equg9IK2MkCXZXbIduwwjo7muY3WWuQlnd65kHG1hCtEO+P6+JA3SeE
         acRmIYDrSN66hB3y5hWXV3S/ufd5dO5tadlV416Wd+W1re7ELrpQLIwKMoQyRgtXrK
         LDLWtxCVJzfh7TLZojWyE7MsqKz430003QrKczFeYibD4gdFs2coBDdUCfUErSYA4q
         Z75J7Jqidbp6lW5zvHteD37BtNIFyOaZtKj9DvZWFC5mSMAWKs0tCnSu3quyF+ADHg
         MiFwru+hqDzKfNqPPiXoEuWcLtbdlIDrk3Oq3Ab1Rm23DKDz9OgS4HoZYXmuK7BCwu
         XWk2RtlDf1EEQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 10 Nov 2021 22:54:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-4jk4Psrc9A@https.bugzilla.kernel.org/>
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

--- Comment #166 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Joel Wir=C4=81mu from comment #164)
> Another board to add:
> Product Name: PRIME B550M-A (WI-FI)
> [  105.876155] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
>=20

I will add as part of next patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
