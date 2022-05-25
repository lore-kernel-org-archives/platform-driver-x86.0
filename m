Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79268C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 May 2022 21:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbiEYVIJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 May 2022 17:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbiEYVII (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 May 2022 17:08:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8299EBA57E
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 14:08:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05EC3B81EB1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 21:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB5C1C34119
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 21:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653512884;
        bh=9Hqcu4kmdfUSGVS4UHSm6gs9XCSJbp1hLB1sHWlhgNg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k8bI4Yds0FqdJ2tUE4hrK39m3Fj0VcmWbjooCDEx2Fr064F6qP67XMn/YeAb2oePt
         NB0W7LX3ejrMm3wVH3UUlGNgXeaQiyy4pisqeil2qk+lpt+iuZCKwvvH6kiblR7MUP
         0WKa2xUzvlP1zCzB9qXwWA3PVJCSgxOo/0Lzr3Rx2lLkj7iNJVYv3AExvsiMRxvDPL
         k8GdzBIUjf58+xCOPGVM9T6ujdJXCeiyuyH8wGGa4zEd2CohGXAFcUZK+YnD4wSCZn
         uRkQgjvdvsOVA/M2WDVxruVocb9dGZhsAPVWpP4MaLdlwia8ogHICrJLnNuQBQngtT
         LLpriLyJ1TvYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AC4B1C05FD4; Wed, 25 May 2022 21:08:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 25 May 2022 21:08:02 +0000
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
Message-ID: <bug-204807-215701-uJUshsgVfd@https.bugzilla.kernel.org/>
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
 Attachment #301030|0                           |1
        is obsolete|                            |

--- Comment #248 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 301047
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301047&action=3Dedit
Asus WMI for nct6775 v5.18 base (2022.05.25)

(In reply to Sven Arvidsson from comment #247)
> Created attachment 301046 [details]
> Z170M-PLUS crash
>=20
> (In reply to Denis Pauk from comment #245)
> > I have made mistake in board name(Z170-PLUS instead Z170M-PLUS), could =
you
> > please recheck with rebased patch?
> Thanks for the new patch! The chip is detected now, but unfortunately
> crashes after loading.=20
>=20
> Crash log is attached.
Welcome! I have added small fix for init, could you please try?

(In reply to Rob Miller from comment #246)
> (In reply to Denis Pauk from comment #240)
> > Created attachment 300963 [details]
> > Asus WMI for nct6775 v5.17 base (2022.05.15)
> >=20
> > (In reply to Rob Miller from comment #239)
> > > Created attachment 300958 [details]
> > > Asus Z170-DELUXE dump
>=20=20
> > Unfortunately, your motherboard does not have any endpoints supported by
> > upstreamed drivers.=20
> >=20
> > Could you please try with attached patch? It provides custom lock method
> > that is unsupported by upstream driver.
>=20
> Thank you for your continued efforts on this.
>=20
> I installed the 5.18 base patch and was able to boot without the warning
> messages.=20=20
>=20
> The nct6775 module loaded without issue, but 'sensors' command did not sh=
ow
> all the info for my device as it does booting the Ubuntu 5.15.0-33-generic
> kernel with the 'acpi_enforce_resources=3Dlax' option.=20=20
>=20
> nct675 reports: Found NCT6793D or compatible chip at 0x2e:0x290

Welcome! I have added little more debug information and additional check for
different name of mutex. could you please try?

Other possible issue can be different naming of vendor: "ASUSTeK COMPUTER I=
NC."
vs "ASUSTeK Computer INC.".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
