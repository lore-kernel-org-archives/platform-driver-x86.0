Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E61C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 15:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbjJaPt0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 11:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbjJaPtZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 11:49:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E238F
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 08:49:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B53FC433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698767363;
        bh=NdzIHqA7pVcWp40e0vJPZMN0mLAes8rXN909V52fEYA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nrkqXsxUdL4eh5/ZIMOZ5cpCSGw0MgaREntuV5N9hU17KilLPN6SUQ1AMD1NHCd59
         drHwfUmiHW/LAEQqo8MLZxU30KrHd27c1ha6USB0hUHG+h38no+vnchgFxMWc2V6PT
         sXI5sDC666kQoG/Glm2aiwJYyWtIetnJZTfsoqJljQAWHD4xv1Aq9M/NCigDwEAJnj
         DoLpIIHnTK96mQEYPrFmhDhBWX3KrstzWlHxBebKO9YclXKCH+IsY97HnTgk1PbZ4M
         8RRofwb/nF7kblIUQwIcbB7dQx8/a0kO8b/ErvhBG//xckGzJXUVa7NbV+JTdkao3u
         J23JuUVHZLT1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8B37AC53BD0; Tue, 31 Oct 2023 15:49:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 15:49:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-qs2t6osWQA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #2 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Also; please add a full dmesg and your dmidecode output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
