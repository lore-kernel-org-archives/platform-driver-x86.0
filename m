Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F60C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32163600D4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhD1VrR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:47:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229942AbhD1VrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:47:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F17DD6144E
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Apr 2021 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619646392;
        bh=jYcIN/h5oxgBFdlU4DXZfsNWgfiFSe4Cp8KT8/dNYiQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c8nONA7gkXQe0SK67sdCyMIh1KAKaUOevjacpUXC79vnIJBsfuwZ/9QuAXMvMZ6zq
         cGKfDiMtKPBWERC0jBGjfZvQKv8cweYaK5rJ/LsV0TzlYP4LY4VtvJstBy3DjqNOC6
         klyBOK2RIe1l6QBd1w7GSepuAJR+6TrsWuBQqc2zLMb3X1gCtm/GNsw7qzVgIbIjXW
         74dMOGZBe0TCibJQ36D5SZIme7xtzx3BOxPjQfOxpTkjS16MWXRT/lqdqAXJtS+JqO
         /bzPsqALa9+cxpR+AVUaLGh3Ovz2bHcwLE0PTj0+1iEuIG3ozQom8hpyz+F81k0CLV
         n1ittm2o4uZfQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 28 Apr 2021 21:46:31 +0000
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-p5nS1LcwXy@https.bugzilla.kernel.org/>
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
                 CC|                            |mail@bernhard-seibold.de

--- Comment #71 from Bernhard Seibold (mail@bernhard-seibold.de) ---
Created attachment 296529
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296529&action=3Dedit
Add support for access via Asus WMI to nct6775

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
