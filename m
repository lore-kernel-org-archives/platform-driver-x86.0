Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A35C636CC
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Jan 2023 15:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjA2PU5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Jan 2023 10:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjA2PU5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Jan 2023 10:20:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D571557E
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 07:20:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F37ED60DDA
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 15:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57288C433AE
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675005655;
        bh=I30XcaFN8F37hWfviMOss4SgO74UcV+GSqYcunizzfo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YhBrKFD2lbza0wxaM2JgE3tC0P5+xrbcNh6BQKA2748cFxLGu/wBsXcj6qtcaF9jG
         w1FujRdjbPGVvcPYWPw4vxjElgbSK2qCbw7hN8l2EfagFtL8JBN8RUAHLIzb0ci0dn
         nNr3IRLRTUgoveL58wBh+W7oPYfYHFyuIEpgoq3Nrr+k9UyjnueE9pQxYB9wJFYt7T
         LSNTOTXYswa9NOe5AcDfxu8YnLfK9FzPZ6e5vNgSCWjTliVpyfaT1XUBACfk8RbmFS
         GjNSG+larwOMviWq+9XH5QCDJ3g0xR+AVhmXmf4VnT1wpLKujoYn7uIPZKuysSV6be
         g5QlnieeqhT3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 43F62C43141; Sun, 29 Jan 2023 15:20:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 29 Jan 2023 15:20:52 +0000
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
Message-ID: <bug-204807-215701-cetBx0sQQ9@https.bugzilla.kernel.org/>
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
 Attachment #303660|0                           |1
        is obsolete|                            |

--- Comment #290 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303662
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303662&action=3Dedit
Asus WMI for nct6775 v6.1.8 base (2023.01.29)

(In reply to Robert Kling from comment #289)
> dmesg showing:
>=20
> 2023-01-28T22:44:58+0100 kernel: nct6775: No such ASUS mutex: \_GPE.MUT0
> 2023-01-28T22:44:58+0100 kernel: nct6775: Enabling hardware monitor logic=
al
> device mappings.
> 2023-01-28T22:44:58+0100 kernel: nct6775: Found NCT6793D or compatible ch=
ip
> at 0x2e:0x290
> 2023-01-28T22:44:58+0100 kernel: ACPI Warning: SystemIO range
> 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> 0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20220331/utaddress-204)
> 2023-01-28T22:44:58+0100 kernel: ACPI: OSL: Resource conflict; ACPI suppo=
rt
> missing from driver?
>=20
> Not sure if I made an error, I'll try 6.1.0 when I have some more time.

Could you try with such one?

Change with previous one is usage "\\_SB.PCI0.LPCB.SIO1.MUT0" mutex. Note -=
 it
will be unsafe, looks like your board doesn't use/export mutex before acces=
s to
sensors and change settings of fans. So code just uses IO lock available in
dsdt.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
