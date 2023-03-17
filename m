Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E5BC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 17:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCQRal (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 13:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjCQRak (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 13:30:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41F031E3F
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 10:30:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02DE3610A7
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 17:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69106C4339C
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 17:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679074234;
        bh=0nzOTZKlOeyuyozVrRSPL52ErES90rzz/lnrGvi785A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sO4j+e9PSBed1WoVTRkmSutV2b2waEWAD1Xxnh7B6bW3pTcsQSLreCwafs9VYj0b5
         TZZW+04MAXoTtVJL4NsMB/gLIsDnggvHi/j0ZAHvoVnPaMRpsBf08dTHbL6qr6BofW
         Muq3QrtUAVwS/kllv6WqTjxAnAF8w1H1GMRGrXIj/WoDgu9TX0tCsCG/FfyumIuqqv
         YHj2ODCLMsAlisvI+C7/9y9yGTKxAhiyEEcehDnfD+WMZwO50fi9AZLMS3/s6ppG0k
         W2zdkw9E3r11fXfsabys2RXYUHOXKfaplyyUyeOxgPsOUO9qWaxlg8VXifQz9U2f3o
         yIJ42kAVOIogw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 59A0AC43145; Fri, 17 Mar 2023 17:30:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 17 Mar 2023 17:30:32 +0000
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
Message-ID: <bug-204807-215701-i465LQqv6F@https.bugzilla.kernel.org/>
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
 Attachment #303968|0                           |1
        is obsolete|                            |

--- Comment #310 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303973
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303973&action=3Dedit
Asus WMI for nct6775 v6.2.7 base (2023.03.17)

(In reply to Jeroen Beerstra from comment #309)
> (In reply to Denis Pauk from comment #308)
> > Created attachment 303968 [details]
> > Asus WMI for nct6775 v6.2 base (2023.03.16)
> >=20
> > Clean up previous patch, add more boards.
> >=20
>=20
> How do I apply this patch to 6.2.6? It reports:
> Reversed (or previously applied) patch detected!  Assume -R?
>=20
> And not all changes apply :/
Could you please check new one ? I have rebased patch to 6.2.7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
