Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22414C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Oct 2022 03:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiJMDBN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 23:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiJMDBM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 23:01:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A65E1326B5
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 20:01:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B8E7B81CF3
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 03:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA77CC433D6
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 03:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665630066;
        bh=0wT+M91Qg1CEoJVstpDVG0JiI/Udp+jYtsRqP1e+d2c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YPOO06381nzNGAA46S/VL+W0o0SaV16x3f02OLPnNVSwkCKzgFQD7QxC5qJok6VW7
         AVQ90z10mnyOdhpnnJWcseAdWzRz2AFfRTMhT+GHcaBO7IX+k4BH1iT3EBNOD+PlS9
         AD7HBghy7TUagXGFpsBK4ctBbEcGNFP/8KYgjc8/q/cRRJIPg3Ivj+zhDHkb7fuA1C
         wIzVUMPp8KcAwXhn7QPc0QkABsdYdj172Fm9bHxLX4iWgh1gTecdK4OO6LaHMIJTCj
         bj4sfwZ33aCRm/pHSqYdPZxZK0G5ZgkgEwaFxrCIbgW2dh0+rGB8GWY8wo/9kljo03
         J13KJ/63P0n1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9FF65C433E4; Thu, 13 Oct 2022 03:01:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216574] Hybrid System Suspend broken HP EliteBook 845 G8
 (a.k.a. Hybrid Sleep / s2both) (s2idle Notebook)
Date:   Thu, 13 Oct 2022 03:01:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216574-215701-uKoEefLN6w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216574-215701@https.bugzilla.kernel.org/>
References: <bug-216574-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216574

--- Comment #2 from kolAflash (kolAflash@kolahilft.de) ---
@Mario

Your patch works like a charm :-)

v6.0.1 with your patch solves the problem.
Hybrid System Suspend works like intended.

v6.0.1 is still broken.

Do you need anything else from me to submit the patch to master?
(and maybe to stable branches)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
