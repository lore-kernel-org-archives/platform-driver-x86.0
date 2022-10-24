Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F09FA3740
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 16:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbiJXQrR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 12:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbiJXQq0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 12:46:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD68E1A20A8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 08:31:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0953DB81611
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 15:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9967C433B5
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 15:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666624584;
        bh=ymes8GvakiyoJMOI+kvxCmq5k5dgt89A1aHaweykJj8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xs/Sr70x1tjWzi1HGS1jQLDei3wsivOFIyblWeyYodEJXEN9tw2SBq4ut2ZAhsZ5S
         qs0d/p4ZrWZiCmGcN2hy+I7JF25BvOddOGk4NstbSbNc9C9SMc2FeN1EN4QmxHRVoY
         c48ZxPwZYmz3Z0hITa83YwV+H1vm/uICNpOCYQa2aPnfyBm85d3W5fu8H5nlsNaFRT
         fTLxp2dAH9VrD1Ez15p2rZJf+8YmTUqcGXr64I2ZSqqkeE+Ol9QPpQfUYbWPx9r9LQ
         h2R2bdnnfYap038KsPvWCgL9CC1Y+eO2viG1tER7yfInFHi53IqWF/kVVmmJ0TcUtF
         Q95U6zUcJ7EvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8E791C433E6; Mon, 24 Oct 2022 15:16:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Mon, 24 Oct 2022 15:16:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203191-215701-1mAkbaAcxo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

--- Comment #13 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Stefano Fabri from comment #12)
> Kernel 6.0.3
>=20
> - cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon7/fan2_input is alw=
ays
> fixed at: 65535

There now sometimes being a fan2_input stuck at 65535 is a different issue
which actually is a kernel bug. This is fixed by this patch, which I will s=
end
to Linux real soon:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dfixes&id=3Da10d50983f7befe85acf95ea7dbf6ba9187c2d70

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
