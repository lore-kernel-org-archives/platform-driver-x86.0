Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43171C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 18:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237755AbiBNSbE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 13:31:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236950AbiBNSbC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 13:31:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9FE65174
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 10:30:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9BAC4B81623
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 18:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49945C340EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644863452;
        bh=3O5cooafUExzRGPMXvju4+VDyA0pOIKDV5vg7MTls3Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n+XrOSI3LbxB2WfOANcrYeZ2gfB+RrI0kjowxh5jc3zpd2NAYpLSD1lTSOT+lOTK4
         ulUMvWLt4tsmewYicIplp9LSHdPgGmLWaYd4jpe5jM/EDy7LRCvrA1t9FpiYOGu6ay
         MRR9hU/4OBswrtpXhjqoluiAAyO2Kz9HmpvZaWaZD0ENQfFn1SukL1MCmy3mTuaOHZ
         eKyzEHjz+4jbn3C8MHakpf782vw4x9fQB6ZDSJs+NmMsLZTx8q6MmeHQXBsudFZdm3
         AdAT2Zq3jKgfl5qktXjyr6Pstcf4pyuk/kwNZwx3QY5S6UM3YQVEwIJDrfUEQjIv7s
         4ti1Qx2V5fd0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 22BA5C05FD0; Mon, 14 Feb 2022 18:30:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215531] Lenovo charge limit feature stops 1% short of the
 configured limit and says it's still charging
Date:   Mon, 14 Feb 2022 18:30:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nate@kde.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215531-215701-kzMBnuaHKI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215531-215701@https.bugzilla.kernel.org/>
References: <bug-215531-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215531

--- Comment #2 from Nate Graham (nate@kde.org) ---
> the capacity in % being more or less equal to the
> charge_control_end_threshold(1) value

Does this mean that expect userspace software to say, "79% is close enough =
to
80%, consider them equal"?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
