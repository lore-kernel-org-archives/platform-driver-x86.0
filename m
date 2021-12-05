Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F163C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 17:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbhLERMj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 12:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236466AbhLERMi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 12:12:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EBCC061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 09:09:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49F14B80ED3
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 17:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE174C341C8
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638724149;
        bh=Nvehoh0/MHX5CfKgB+b1zZnEAqopQsKL9Dxl01ArqeA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AZO+uv/+A/FqaecifkCnke24z32fMIKb7q55CIQdnMJYfhQBbxg/1HrW2QdbJ3++Z
         bpkgX2/fI5DHpSoaX8petab6zAK2pyXMQGO14unzItDT41COV5HavA5jR4JguDFcYE
         FsTxoMziDkFZwhstSxYh+A2rt2mJidM4jVWJiLvHnF5GUojWpFXlxunYecg41SNdvW
         beNBNLWj3KuJPevVr/U1U/jofoomJI0gHLpOV2a/+EoM3RCzR+fFBFxvPnDbz3EXhg
         qwANpyU/AQ8GUEtOEL8w1JB92VTcSUVGGssWVXgdTbjklw9SFfXSXBvVfwp89zKmna
         zGe6vP33Mep4A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DF1E361130; Sun,  5 Dec 2021 17:09:08 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 17:09:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-VYedFsdeuo@https.bugzilla.kernel.org/>
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

--- Comment #187 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
(In reply to Denis Pauk from comment #186)
> Patch is based on stable v5.15 kernel version. Could you check with v5.15
> kernel version from kernel.org.
>=20

Hmmm...

Depmod failure
depmod: WARNING:
/builddir/build/BUILDROOT/kernel-5.15.6-200.fc35.x86_64/./lib/modules/5.15.=
6-200.fc35.x86_64+debug/kernel/drivers/hwmon/nct6775.ko
needs unknown symbol wmi_evaluate_method

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
