Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C977C7EE22
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 May 2023 20:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238921AbjEKUPo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 May 2023 16:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238053AbjEKUPn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 May 2023 16:15:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938B62720
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 13:15:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 23238651C6
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 20:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82BE5C433A0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2023 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683836141;
        bh=wWxc0t1mN4hkhVPkNZfiDbKWm39VaZOpVaLWU0+jLMs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IUM4WP0i/hXcwEjnnXqrkXAiSMe8MkzVDceMiMoQGZEhvbYErXofwq0sIoCzWUGyx
         BUi04vwH+zwksRIX3pxKCh6qDN/RYg4D6/veDMgzDiZpAOm2Kcpvx9lclRyjsoJMwr
         /cGspOkuJVAjmZM3NWlxs0hNo4uYRjgjB/F+6Cor41uY8lGhWMr53dhbhHarEszdzx
         zH9I14yRCvQ04FIJoFYPelsp2FRwTUrJWTDcxEJc/GvLjVcxzYK1KVOafnegXZFcoW
         Gm4H3Frvve8aUOR8gTJh5H8VDgXoLPATaFHjk6pZQMbOnQzx0I8aWozQrQKDnHnU7I
         GNgLBFnvHkzfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 719CAC43165; Thu, 11 May 2023 20:15:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 11 May 2023 20:15:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jannik.glueckert@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-Cb7a8NzBRy@https.bugzilla.kernel.org/>
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

Jannik Gl=C3=BCckert (jannik.glueckert@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jannik.glueckert@gmail.com

--- Comment #328 from Jannik Gl=C3=BCckert (jannik.glueckert@gmail.com) ---
Created attachment 304249
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304249&action=3Dedit
ASUS TUF B650M-PLUS WIFI

Hi, is this the correct place to also report issues with the new ASUS NCT67=
99D
support in kernel 6.3?

I'm on an ASUS TUF GAMING B650M-PLUS WIFI , kernel 6.3.1

Trying to modprobe nct6775 fails with ENODEV, doing so with force_id=3D0xd4=
28
works:
[ 1600.922632] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[ 1600.931439] nct6775: Refusing to enable a Super-I/O device with a base I=
/O
port 0

However, all sensor values are unlabeled.

Or did I misunderstand, and NCT6799D is not meant to be fully supported yet?

Attached are dmidecode, acpidump, and the readings from sensors.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
