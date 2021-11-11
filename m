Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44308C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 16:54:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B4CA61354
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 16:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhKKQ5b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 11:57:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:59442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhKKQ5a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 11:57:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 83CC9619F8
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636649681;
        bh=5zL43joCDPkuBordy+mSwxEUeQh0X5+SrdrEB7i07js=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JarYh8l1/PX9NK66+s60XZ5vW2KK/dnmR55ysSya7pprh8nuKw7EoAVX+hC2b8gVF
         mtvm22nId3P7tCHFiUha19we8WWgFDX4ScOJkluB2i5SIJVX6g/nNQ5eAqYAax72WO
         wFWItOTOizxBnPAraMGs10IhkwftVUbsc+Yh/66+Lv4d/kO1vqgkHaMCe+1Wp9tDPY
         +DQrxW/QcQeF9tHCePBi93GsMcoYoGU+FrRHPZkFA0agOt3NAaAC+OmMYyCIDv21Zm
         i5pzV7d9omIiuQvh2qvkOVy+heeXVHsblyrG4SdDDq+uJb+0T6sv6dfsDLWyTM83WE
         dfQ9+eCZhFnzg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 11 Nov 2021 16:54:39 +0000
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
Message-ID: <bug-204807-215701-xeFbqHSb50@https.bugzilla.kernel.org/>
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

--- Comment #168 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Denis Pauk from comment #165)

> Maybe we can have asus_wmi_info_table from patch in #163 as shared file w=
ith
> description of preferred method for access, acpi mutext name, devices on =
i2c
> bus, ec register address to sensor type. What do you think?

My idea was that the mutex for the state lock can be either the regular mut=
ex
or the ACPI mutex, there is no need to lock both of them simultaneously. So
that the module can return a structure with the mutex (ACPI one if known for
the given hardware or the regular one) and functions to lock and unlock it.=
 I
just thought that would make logic in the actual sensor modules (nct or ec)
simpler.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
