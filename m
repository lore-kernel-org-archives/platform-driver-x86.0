Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D100C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 20:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 797436187D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 20:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhJEUeR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Oct 2021 16:34:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhJEUeR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Oct 2021 16:34:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0B72F615A3
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Oct 2021 20:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633465946;
        bh=MoLM8oo09rn4jLvfMK8ERZuUJMBVB5/qQsP615MxoGg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WNS67FxV/Ke9lmfRWqSYN9ZsjeM27dqH6ut7PBA/IIwm+IKjnTbDmBjMV22obrcw3
         VPkoS0J22y/CsR018NlGucgsLks+6io3aVtf047pv6DV0v5ub1sJ1wQoL1hJZj2NLB
         5LSNgn5TfCbUJlVUtBX2xK1hGZ2bUbhl6RauLWvwwHz23lRPfKjAA7loo+QiweW4Ry
         gFyE0RBXP4pv6PY1Y0CgXINW0gIIiIlHDLISrxNJp8tcMJqfCtsQhi4w3MoId99RSx
         GdcHVUW+7PRlbslQRjVv87AZHsSdfp9wvj+/eu7t9KlWtI4E9mXLAxgcHo70/IEwgc
         LnCMR0zFMYf4g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 05 Oct 2021 20:32:24 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-64aZDCLEl7@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298971|0                           |1
        is obsolete|                            |

--- Comment #133 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299111
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299111&action=3Dedit
Add support for access via Asus WMI (2021.10.05)

Patch with same list of supported boards, additionally applied changes from
review https://lkml.org/lkml/2021/10/2/189.

(In reply to Kamil Pietrzak from comment #130)
> I confirm voltages defined in "static const u16 scale_in_z490[15]" are
> applied correctly to my motherboard "TUF GAMING Z490-PLUS (WI-FI)".
I afraid next patch will be without scaling :-(
https://lkml.org/lkml/2021/10/5/707

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
