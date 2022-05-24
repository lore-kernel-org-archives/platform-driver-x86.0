Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155CEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 May 2022 19:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240984AbiEXTmi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 May 2022 15:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239067AbiEXTmi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 May 2022 15:42:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D39A674D4
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2022 12:42:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD0946171C
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2022 19:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CAFCC341CB
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 May 2022 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653421356;
        bh=yFAsONw200Nx0bz5E9fyrEJfbH3CHvmwOm1wyQZxQpc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tdD3gUuPAsCTmZVzKNAfkraXg86y+8JEPnpVX8ttlHjabSdaqNuTwnlzpNTatC15v
         z3pGIWHi+3oL3pK0Ywqv7QXISZ7zVH7oOiaTbhE/84iM3j/6stoUIcM0oKFMWcjr6F
         4O1kCgUKMYz/G0qmueMvNZxJXPjbx4mt4uI+C/dpMjBPMW8KhlM7zzU6NH68wnxZ74
         stb4kX7fBhn0l/Tk4aNt1B4CsOvhqrwztAaRxUAh0IifIlwE6GAFFWlzKkkNb4DCeM
         eYv6YFyjsdnacBMl3lk6ku6CbAugqNVjCj6i8Vtk11KmeYYFXXgUm5cZ6YqR16KXvF
         nI2dBBD+ZdXQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3AF7EC05FD2; Tue, 24 May 2022 19:42:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 24 May 2022 19:42:34 +0000
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
Message-ID: <bug-204807-215701-cbnxcuxyDy@https.bugzilla.kernel.org/>
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
 Attachment #300963|0                           |1
        is obsolete|                            |

--- Comment #245 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 301030
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301030&action=3Dedit
Asus WMI for nct6775 v5.18 base (2022.05.24)

(In reply to Sven Arvidsson from comment #244)
> (In reply to Denis Pauk from comment #240)
> >=20
> > Could you please try with attached patch? It provides custom lock method
> > that is unsupported by upstream driver.
> Thanks for the patch and your continued work on this!
>=20
> Unfortunately, there's no difference on my system after applying the patc=
h.
> I get the same warnings about a resource conflict and missing ACPI suppor=
t.
I have made mistake in board name(Z170-PLUS instead Z170M-PLUS), could you
please recheck with rebased patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
