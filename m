Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078D8C4167E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Feb 2022 22:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386712AbiBHW0m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Feb 2022 17:26:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386891AbiBHVRc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Feb 2022 16:17:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D751DC061266
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Feb 2022 13:17:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6660761638
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Feb 2022 21:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDF1EC34112
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Feb 2022 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644355050;
        bh=ik8/ptTW8oCLlpBEmESVcw3e1UpTeYVYNC3Es5/0G8w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KCGOpw67ocz81aDxeeB6L9oMoJGcgjqSsaA7S6+YRf1uZ/0/wuXHg0f8aCpnsQVpD
         W6dOFI4cK7O314sIfRnHfCHqYyx+Ri1+F1lCwb5p+LmnJV2ROuGNcTKcFa3NQpLSu2
         /4w5CzgnhDGKlJ4ea2ct62z32dMqdfu6yYPYsaGB21aSKELQYnZc4qQwCIM5QU+2fO
         xfk9AYy+mKEA1DHFtp0eG2GuiWytFZDRFlhw4UYYcJCi0wWh5eyEdcrn4JA8zAgu5S
         7cjjpL5JCMAhmOcZEnAm5WDc7jMcOor+5WxcfAcH7d5RWZz5ax1H8DcB+n6DFvf05N
         tvfVsDoDJ/nmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BDE99C05FD0; Tue,  8 Feb 2022 21:17:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 08 Feb 2022 21:17:29 +0000
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
Message-ID: <bug-204807-215701-n97g6yBgcY@https.bugzilla.kernel.org/>
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
 Attachment #300389|0                           |1
        is obsolete|                            |

--- Comment #218 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300417
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300417&action=3Dedit
Asus WMI for nct6775 v5.16 base (2022.02.08)

(In reply to Eugene Shalygin from comment #216)
> (In reply to Jaap de Haan from comment #215)
> > My Board happens to report "PRIME X570-P" instead of "PRIME X570-PRO" (=
what
> > I saw in the source code)...
>=20
> They look like two distinct models:
>=20
> https://www.asus.com/Motherboards-Components/Motherboards/PRIME/PRIME-X57=
0-
> PRO/
>=20
> https://www.asus.com/Motherboards-Components/Motherboards/PRIME/PRIME-X57=
0-P/

Updated version of patch with asus-ec-sensors CPU core voltage patch from
Eugene Shalygin and additional support in nct6775 module for
* PRIME X570-P,
* ROG STRIX B550-F GAMING WIFI II,
* ROG STRIX B550-XE GAMING (WI-FI),
* ROG STRIX X570-E GAMING,
* ROG STRIX Z390-F GAMING,
* ROG STRIX Z390-H GAMING,
* ROG STRIX Z390-I GAMING,
* ROG STRIX Z490-A GAMING,
* ROG STRIX Z490-E GAMING,
* ROG STRIX Z490-F GAMING,
* ROG STRIX Z490-G GAMING,
* ROG STRIX Z490-G GAMING (WI-FI),
* ROG STRIX Z490-H GAMING

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
