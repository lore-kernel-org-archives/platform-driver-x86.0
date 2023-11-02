Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434BBC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 16:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjKBQsm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 12:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjKBQsm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 12:48:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D091C128
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 09:48:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 767F9C433C9
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698943719;
        bh=vOphEPwpzB2nfF9finSM35jl34xOrH1ZAnjEOHvjCrc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Uk44ZxCcS4fxjMldpvQ/SV7N8ltIMKSR9oC6S1EjHqd8fRSD/GsCjyJi4fg+ifK8o
         tk8qSGH+T0qyYq9nZ8W7gSLWrGvcOvg7fMIkBXh4g+1WhZe9M31eD9CJd8xmnFbkzD
         iBiGS9DW2zF+0Axj1j/vCm8aKIaqdnjsxkqv8+Dy9FQ7mjITt4iECpkF9F3Xx2M1dh
         HkKvwAxYYmxylldoo2H5bU0MP6zsO/YJFLjWV7NWAVu30I0u6A36RmduvSLDY7NXLa
         qIgVoaOUTloi6hbOAXz3qU38ATKXNSvIvH1okK0saVFMmd7EpWQLKCwDxzBZkTbpuX
         B2zTSYpObmcPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 61006C53BC6; Thu,  2 Nov 2023 16:48:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 16:48:39 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218092-215701-Q7tBDj3ocl@https.bugzilla.kernel.org/>
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

--- Comment #40 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 305348
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305348&action=3Dedit
fixed up config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
