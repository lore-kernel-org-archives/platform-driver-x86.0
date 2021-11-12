Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A8BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Nov 2021 00:32:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B24B60F58
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Nov 2021 00:32:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhKLAfP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 19:35:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:55566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233817AbhKLAfO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 19:35:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BEE94619E8
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Nov 2021 00:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636677140;
        bh=faV4KO7bbOIiy9DCKwCHcEQjFCphTCy8fhSOsLIg7BM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JhoHNZpvgKDgDiCIbSNrxfznr8QUu33IBnQKB3A+KjEhopk0U5QMu8HPjqEgxgneN
         RysJ9vRKm6EMNABd5LYlrLS6vC54T4C7gtgDegk3VSFDP/A4iGxM2/t7LZrUfBaGhA
         zl5bq3hXuevKrVjK4ApR61oU/4LQ97gAxespNEaoHXMKScvz9gcegiWibi/CjJBx0t
         01lfmtZja/m9LkFMlusa5VuWylh5Q7qh42lcLG3NZDtopB0fnQvBcyqtSgIbRpBsSM
         Tbt4XLpoYs87Clm5UKWoSGyB/Ju8ZpBEjpoOgXP92WTARsXtWHyaxhk2AaLzxuURt/
         bIr3ylhbJR5ow==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 12 Nov 2021 00:32:18 +0000
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
Message-ID: <bug-204807-215701-MMPxFUcrxB@https.bugzilla.kernel.org/>
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

--- Comment #170 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Denis Pauk from comment #169)

> Could you look to nct6775_data:{un}lock? Do you mean something like it?

Yes, something like that. I think if we hide that under a formal interface =
and
put in a module, it can be used in both hwmon drivers. And yes, I believe we
should query EC directly, because the WMI functions are simply wrappers that
end up at the same calls to ec_read(). Since we going to lock the ACPI mutex
ourselves, there is no reason to use WMI functions to access EC registers.

Here is what I thought of:

union access_lock_data {
         struct mutex lock;
         struct {
                acpi_handle aml_mutex[MAX_ACPI_MUTEX_COUNT]; // maybe there=
 is
a firmware where there is no single mutex to guard both chips?
                int acpi_mutex_count;
         } acpi_lock;
};

struct access_lock_funcs {
        int (*lock)(access_lock_funcs* funcs);
        int (*unlock)(access_lock_funcs* funcs);
};

struct access_lock_state {
        union access_lock_data data;
        struct access_lock_funcs funcs;
};

int get_access_lock(int flags, struct access_lock_funcs* res); // flags to =
tell
what needs to be guarded (HWMON chip, EC, or both)
void free_access_lock(struct access_lock_funcs* funcs);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
