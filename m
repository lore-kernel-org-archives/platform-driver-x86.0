Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786F5C38142
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Jan 2023 09:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbjAXJcr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Jan 2023 04:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbjAXJcq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2023 04:32:46 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EFA1A5
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 01:32:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DC3EBCE1843
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 09:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC7D6C433A1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jan 2023 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674552759;
        bh=KlDqMDB5A1JvK38Jq1XzVqIZl+mfQ0kflkzK9FPGees=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b1zcVOY/nqKq6YXGvjYZqfKHrWbzSQeMCBGLKNeie1MxsVtqF/6rBYxHws1M1a7Xu
         4RIJhAqN/wyNQVddtBMTtQL+VSwiiUApYnsz6Abw1J6QWwmv3Z6GkerkPtvZlxoMR9
         hfHeI9A2ZGA9WZjRKaPaPpuudO1XHUJ83ZrsDp0ZatLcC7LEOpopDrojhRZpeRZ91B
         iMvcox9T98nEBfeObC59fXnsNSRUS3Go/7rGo7cmvHP9fdjoh+VHHBGLaFbvyKqiWw
         071lpsRT9L7XuQfSye4As1Yn/f0iqJaivxWONIMs49Ay4AC1FbrudGgLs8AV0PcMr9
         9HSwg9QcWrBLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D84B8C072A6; Tue, 24 Jan 2023 09:32:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 24 Jan 2023 09:32:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214899-215701-Mql4DnmIbF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #62 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Hans de Goede from comment #60)
> That is good to hear, we are waiting for:
>=20
> https://github.com/acpica/acpica/pull/786
>=20
> to get merged and the fixes should land in the mainline kernel pretty
> quickly after that.

The fixes for this have been merged into the 6.2 series, closing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
