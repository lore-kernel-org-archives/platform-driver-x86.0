Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6CBFA373D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 12:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiKAMCc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 08:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiKAMCb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 08:02:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0493D2F4
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 05:02:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3BAAB60F83
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 12:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D60FC433D7
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667304149;
        bh=8YOJW/GAHfy1yWPwdFQvqcpjJx4rUtG07gLLZzJJdP8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=epUMuID78H0+afQv732dy4XQeNaGu7Dcsj69PNh0Y+/qzbfZfPcjxBWHFk/g3wBsQ
         grOo/7LaWLYGF4Cz/EmoHYqQrNpePvMV55Ao63OWCOoOfoSTNFcM959FUStdooy5Ft
         rcajg8JKj9JNBEkpdzt9LKoaE9uocubN5ibSD1PHPyVB1b0BlKZjm7LZLtbpkkzJqH
         zlSbYYNxZe1jzKgC9reqIGk7waWzatTA6QnaAswqGGoT/Z2bDCWK1WxElKtPJ0mkFx
         F1CkjSOLaFfiwSeZvN8sYnqnQcnEYxJ2OyYKnC2+82wLjvnfqKtHmwtHpr8i2qz36a
         qLF2l2Eh96DUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7CF16C433E6; Tue,  1 Nov 2022 12:02:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 01 Nov 2022 12:02:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: zykr.caswell@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-ojUEEaR4tK@https.bugzilla.kernel.org/>
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

zykr.caswell@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zykr.caswell@gmail.com

--- Comment #264 from zykr.caswell@gmail.com ---
Created attachment 303116
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303116&action=3Dedit
DSDT - X99-E-WS-USB3 - Decompiled

Same or similar issue with X99-E WS/USB 3.1:

nct6775: Found NCT6791D or compatible chip at 0x2e:0x290
ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts
with OpRegion 0x0000000000000290-0x0000000000000299 (\_GPE.HWM)
(20200925/utaddress-204)

I've been trying to make sense of the DSDT by reading the ACPI spec, but I'm
not having a lot success. Built kernels 5.10, 5.19, 6.0.2, 6.03, and several
different versions of nct6775 driver for each including "Asus WMI for nct67=
75
v5.20 base (2022.10.20)", both in tree and as a custom DKMS module to no
effect.

I'm rather reluctant to actually try using acpi_enforce_resourses=3Dlax, so=
 I
don't know for sure if that would make it work or not. I've attached my DSD=
T as
pulled from the latest BIOS update for my board from ASUS. Could someone ta=
ke a
look and confirm for me that I likely have this same problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
