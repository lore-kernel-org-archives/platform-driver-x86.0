Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC57C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 06:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348332AbiAKGy6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 01:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233846AbiAKGy5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 01:54:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7C6C06173F
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jan 2022 22:54:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A31861534
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 06:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5635C36AFC
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641884096;
        bh=CyMhh+dSwrL7XUMRji6KXgdndxDpRwReRTppdp858PE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qRHm8d8fPD4zN6+8NR7ayBPyqSek3Dv75Cc8e9Ufjl6bQPDMsCeJXgD7N1FTEErO2
         kB+1aQ2N7w1+98wKJFyJPGILdtkyHI7HI70h4ugny5kABEy2i9cl7kP1MXpDhu7mV3
         q2QSh7TLjcTGGwB8Q/5fgms5ps/6tI7s+wYswqRszkoa9Y05o7bx++awA3cdRvc6sE
         WS8HUL0Moe5K3aaaVltH8xGmzXk3bH40e/PxWVd5MMcTm0Hy88tV3EtEgpQo+fK46h
         jOZm4oOputam6XsPzPWzufvFDmtPtMnBnQ0XFVTMVbvocFgzOP02Em4HQxipcJTuOK
         WIeBCbh/CmFbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 95F47C05FDE; Tue, 11 Jan 2022 06:54:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 11 Jan 2022 06:54:54 +0000
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
Message-ID: <bug-204807-215701-8YrTNUnTG4@https.bugzilla.kernel.org/>
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
 Attachment #300029|0                           |1
        is obsolete|                            |

--- Comment #205 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300253
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300253&action=3Dedit
Asus WMI for nct6775 v5.16 base (2022.01.11)

(In reply to Jonathan Farrugia from comment #204)
> cat /sys/class/dmi/id/board_name=20
> PRIME B550M-A
(In reply to Gregory P. Smith from comment #202)
> The "Pro B550M-C" as mentioned in #c70 also appears to need to be in a li=
st.
>=20
> $ cat /sys/class/dmi/id/board_name=20
> Pro B550M-C
>=20
> https://www.asus.com/us/Motherboards-Components/Motherboards/CSM/Pro-B550=
M-C-
> CSM/

Could you check with updated patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
