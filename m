Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2EEC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 17:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbiGKRen (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 13:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbiGKRem (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 13:34:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00B227B29
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 10:34:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 197FE6136E
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 17:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CC9EC341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657560880;
        bh=EUv39Tb4Z69UjkF2XGNND1LsF85vnC5Z3l00SKEPT0s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rqf+3fbS50igfI5+WwAFT2Ga83c+dY220WR5BtiJUOrknQencB7vpromI+GRXxQ+J
         GlSRnljw1IQRlhXtHeieeWpCFSIbMo24i55wlHol5wmwJVbuCGhA13t7KobMFFbRyY
         eRylU93NDBFFV4xstFqCt1Rd/a/LswGD+ENMJoaPPCbgv4NE2hDsp8H2rMuJuJrLeG
         w8to/jlq1Ke+OZz3s5ipixbDhIR18Gt0ZAjYur+7LHdoNZmWUUdXOA+R5w1d2br1i7
         v+UQW6TWTWWsYq+LaBQsPHw+Pu8a3F4utW/V/9fjB1vnfRbSJMQsvtOe+CoWPmSx4d
         RBw/IeFlGf5NQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 69841C05FD6; Mon, 11 Jul 2022 17:34:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 17:34:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216230-215701-BjnXky5Wx7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #10 from madcatx@atlas.cz ---
Created attachment 301392
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301392&action=3Dedit
dmesg withpinctrl debugging

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
