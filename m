Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2F5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 20:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CDB4615E1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 20:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhJEUtW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Oct 2021 16:49:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231387AbhJEUtV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Oct 2021 16:49:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7089561505
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Oct 2021 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633466850;
        bh=s2YGnh8gK55MYWUG6KbHBsc8CIPYH8N2HTte2rFppYA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CoSipUk8cskYzR4hsa2i/OCbJ5CyXikHx7LxXomGrpTnKR7fLf9lq7RHvnP8YqDZe
         E/e/8kXRmmtqunzksCYeH0kGjhyr7DD0+R/3+oQIL5ih5awl07RWyhqiA7cWtRFWVy
         EeP+oPb7pbwXz0O9Tul46nhIk+EabiBgsc9ZRguK08zDwVcscQUCZiMhxgivGK40c7
         gnpd9y/wygjVTl/Sas0g6G/c9xTvZgc9X+CLNpR6lQ/heB6wYAGBhlsOK9GoFuGpPJ
         /vYR85NGlpA9/T7/xipHw0lkbaPT/+KhzGe7dXVO7/LKuSPq/9balu4bxwYZKvoEuY
         uul0wHqXR7jBA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 05 Oct 2021 20:47:29 +0000
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
Message-ID: <bug-204807-215701-dnDQfl7Ylr@https.bugzilla.kernel.org/>
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

--- Comment #134 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
Denis,=20

thank you for pulling the new changes!

Could you explain, please, why did you merge the asus-wmi-sensors and
asus-wmi-ec-sensors drivers? As far as I understand, asus-wmi-sensors can f=
etch
data from all available sensors, including those provided by EC, but the WMI
methods it relies upon are removed from the new ASUS boards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
