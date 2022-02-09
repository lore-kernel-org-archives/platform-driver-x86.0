Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A378CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Feb 2022 17:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238476AbiBIRws (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Feb 2022 12:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235315AbiBIRwr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Feb 2022 12:52:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EF7C0613C9
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 09:52:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8306DB82326
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 17:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43222C340F8
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644429168;
        bh=aoJdwrjuoCvTeX6xTP81tWTPTvN7t/5AVf8L89us7vE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cObtfpGh4N5tWmZbwgWCUm4OAiFlXwVCbZ/YHEV6ZHnQ4yvFNHzzVlPPlgt95OJeu
         Ea5errm4eC1W9oVkwJZeSgorzJa74kIsEwxel6HJQW5Zs/2sjPqLV5oqzLkdqiF8Kv
         tRR4YUXIcrY/J1eE/Nw4oET6qBBu96vv8a7wcEE2Rm2cmpzjs9788y45086X6QLDk8
         BfJWkueHa5REuCTn3lKsC8+oyxWAM6yT5GZ2qea6H8ZM9ZLTJR5F/l7gZTBWIT8JnT
         w0Dtkzj7GLk3fBB1AUoxE3t8AbURrYGjjRnNSqdFLjQeMEwHc8u/s0lfy3PMYv9hYA
         vrYFQs1OuBpdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3314AC05FF5; Wed,  9 Feb 2022 17:52:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Wed, 09 Feb 2022 17:52:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-bW7CymWPqG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

--- Comment #66 from Alex Deucher (alexdeucher@gmail.com) ---
Several fixes to the SFH driver from the last month:

https://lore.kernel.org/linux-input/578673a3-920f-25f3-c9f7-7f1812c3e731@am=
d.com/T/#mfbe03bd36befb510c347417aab9fecb911dec946

https://lore.kernel.org/linux-input/20220208122112.942471-1-Basavaraj.Natik=
ar@amd.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
