Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17577C636D4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 13:13:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBMNNM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjBMNNL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 08:13:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E95E196B6
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 05:12:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E87F3B8119D
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 13:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3E53C433EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676293975;
        bh=a8lpNKaO0NdyRS4FMceLJs8LspySJ/4f0eBB14kG0TE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YeoSCm72L8tdSW5sIHRSEBdh3I2QMvWUmQn8DEkJ6WPPwxMi67YI4TEkClZPXhJER
         dLFeBVk7dnUSOJK6sFt05wg2K7GNDG7pt31ZOIHo8UCucZKeH8bKqx0edGiszTsRah
         JuJMhiyXbJs+FXecaC32QywVNJg38GYSvQDSJVX/ifxVT1Ux+yUT4Ke7EFacruLQUe
         1hcKvea3Yl2WsYF/lXeutg+Acyld2hjzk3u/48LbrS0esdccCl/dJDpZLtraZ4tKrA
         9FdjI+hpxqalg45JUXLFraAttHxbei8hFo54g7G/E0GUcUvxs0191BvZq2kOqrrlQc
         JYBGK6IRAFuSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9CACDC43141; Mon, 13 Feb 2023 13:12:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217028] CONFIG_AMD_PMF missing CONFIG_POWER_SUPPLY
 depend/select
Date:   Mon, 13 Feb 2023 13:12:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217028-215701-3d47LwRNbJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217028-215701@https.bugzilla.kernel.org/>
References: <bug-217028-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217028

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Hans de Goede from comment #1)
>=20
> This is fixed by this (just mergd) patch in the for-next branch of the
> platform-drivers-x86 tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x8=
6.
> git/commit/?h=3Dfor-next&id=3Da2f9d361e3d70fcd8c53612034be7dae4f586d97

Thx for this. Quick question: why is there no "CC: <stable...>? This seems
needed (see docs; a fixes tag alone is not enough) if this is something that
showed up in 6.1.y. Or am I missing something?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
