Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD2FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 May 2022 20:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbiEOUxf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 15 May 2022 16:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbiEOUxe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 May 2022 16:53:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02562AE1D
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 May 2022 13:53:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 88FDBB80E41
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 May 2022 20:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F9A8C3411B
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 May 2022 20:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652648011;
        bh=0RydJ7i2rzL21WZIFftcBxNUoOBX1xITfJHO/p3BuBM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j2zBu1lG8ieU7VhPXZEcTqXDN/TKFFS+wCLux/icp7z1BMQ0Xs4NT5DBS2ZylX5EG
         ga6q6YmtsBwcJDUVcz3d0TmfL8CtKINinoABwttxACcyD4/Nsr1xonB3RIc8DF2zRC
         Uy1dhG2ZumK4NijUgPd6HK188D2C/ncZyjNBnu6rjx0S7jzTB0nHVra/7JYBB06Gdn
         dOX/djdJkGI/UkRPbA5xkDk8rdWGAVXTscMytwaywH7WEGBf+T8CvS7LXreun20PZh
         90QCD/MWRIqTjciGU3cR905k42yD/EHzX6ey28nKkNMuC+gqyHNr3XpsiaCvUxvmHC
         zhk3BeA/61YoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4052BC05FD5; Sun, 15 May 2022 20:53:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 15 May 2022 20:53:29 +0000
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
Message-ID: <bug-204807-215701-q1xKwSLhmo@https.bugzilla.kernel.org/>
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
 Attachment #300872|0                           |1
        is obsolete|                            |

--- Comment #240 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300963
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300963&action=3Dedit
Asus WMI for nct6775 v5.17 base (2022.05.15)

(In reply to Rob Miller from comment #239)
> Created attachment 300958 [details]
> Asus Z170-DELUXE dump

(In reply to Sven Arvidsson from comment #238)
> Created attachment 300932 [details]
> Z170M-PLUS dsdt dump

Unfortunately, your motherboard does not have any endpoints supported by
upstreamed drivers.=20

Could you please try with attached patch? It provides custom lock method th=
at
is unsupported by upstream driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
