Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7B0C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 22:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9757561175
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 22:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhEDWJX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 18:09:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231733AbhEDWJV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 18:09:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1928F613E1
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 May 2021 22:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620166106;
        bh=8z3jfY3D9gfGcJDMi5QqKzu+kumRx/CcLkVOR45nMHw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=apcoKlqZ1n4eRD0qbykqGP3RP5myne0QTUmFIKmcszOCXfBLuyEz8CcYZD9Vh0WkE
         Sph695BW3C2skRbj6/A6NGLlKbDw1gW0gMU57FunVWvk4wTtaQsNoVKAcQnJhaZ/mq
         ll0jq3P13aXR52jbNVcrgcmAVevzSWwWvjCYwcWPcPhwhDBGdrmDr1B0tT/j1SKVGJ
         k6s93Xr35R9Nm+ev51KTpZG+gMc1kV8vMhRT1ez5F0GZYI4P5Aq95YDgxJmzSDb0ce
         Q1uHM7f8mVcaxkkcYRWTEG+c7iGOErF0XbX7Kiopf2cTVHKmVFyTMiyR1Znx74XUIX
         LMITsa6KFFbag==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 04 May 2021 22:08:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@bernhard-seibold.de
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-K5tmgYoH3M@https.bugzilla.kernel.org/>
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

Bernhard Seibold (mail@bernhard-seibold.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #296529|0                           |1
        is obsolete|                            |

--- Comment #75 from Bernhard Seibold (mail@bernhard-seibold.de) ---
Created attachment 296645
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296645&action=3Dedit
Add support for access via Asus WMI to nct6775 (Rev 2)

Here's an updated patch that also accesses the Super-I/O ports via WMI. Ple=
ase
note that it also adds an ACPI resource check for that IO region. So it mig=
ht
actually make the driver work on less hardware, although that check should
probably have been there in the first place.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
