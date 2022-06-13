Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF89C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Jun 2022 15:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbiFMPoE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Jun 2022 11:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbiFMPnG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Jun 2022 11:43:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB91140863
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 06:17:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 729E1B80FB5
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 13:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D61C3411C
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655126259;
        bh=NCsW1q+poUfcfUEsIAw7IKa0Js0mUpf3NPv8BWqitvs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OCVGj6gd35zAHy0g5NJ486IS4BPDQwr9R66jVFTTpdpq0TbajktNrQiKPBC4a409F
         9OLppmTRBAYLJ7/MF6Xr72tdqs2+9FXga4WKsJCAyyp2nG2mfBwlpZiMdvlWuhVT8E
         vwjm4tIQ+NvS2TsDhaBBzDOM40/bB/wJVmOKtDu/+eiwdmC2JMtIY7mA2oAQbIyqOK
         iEA6RUUzGWfCrxBr7uG1Nn0XZAaorquWlhSsN8BuexvX3Z1Hgl7NDWptq6CGhOZCVD
         uWip/sKHYsN3J9bT/8TiXPG13JhSxtfbKGcNnIz6WN9MvH3TLEe9Gskm5oXKJkx8v7
         Ii6CV8+KVUhfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EDFB7C05FD5; Mon, 13 Jun 2022 13:17:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 13 Jun 2022 13:17:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-DMsqWkU1GN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #33 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 301163
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301163&action=3Dedit
ACPICA: eval \_SB.PC00._INI and \_SB.PCI0._INI before running  _REG methods

As promised here is a kernel patch which will hopefully fix this, please gi=
ve
this a try.

If this works, please let me know if it is ok to add the following to the
commit msg:

Reported-and-tested-by: Johannes Pen=C3=9Fel <johannes.xxxxxxx@domain.tld>

But then when your real email address. Note this will expose your email add=
ress
to the entire world (where as here in bugzilla it is only visible to users =
with
a bugzilla account).

Alternatively I can also give you credit using just your name:

Reported-and-tested-by: Johannes Pen=C3=9Fel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
