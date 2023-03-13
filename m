Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C24C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 16:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjCMQcT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 12:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjCMQcR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 12:32:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1DF26C16
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 09:31:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 39AD16144D
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 16:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BB6DC43442
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678725036;
        bh=ixBzQm8AiN7ksqCUsV7DS0wnUV9VTtjQ0rUX5oF93lY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CX2MYVGjSG3JkunSdmIWsnK47jWaYtkCC7RBxzFfpBtHdC08ijOEzZliq4QIEqUg4
         X+O+g8MYhFI9y1v1M+hePE81FtAXQg9noCEY3eyoIyKPMdAmM3mN5ecrzCPBU1vq55
         Kr81EPKLx/3RM5oXgh8Xy2M+LpAQA3crdqAthrTsUG9qdUhEOe4nrOxS/05IY2yUja
         ImUK7cqufJl8jqtCqrB4oGjUhtqo9bt2y6Uf6K8Q8k5dmqQ/9gWyaGEEPtSgf0+a8M
         4bczWcH5KcY+KYuFK5Qyo1hxFMgshFm/i5UYFvm/Jrt7msCYdwCKaMb8MZeC1tFSth
         K7ZuwX8DbrYiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8C1B5C43144; Mon, 13 Mar 2023 16:30:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 13 Mar 2023 16:30:34 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-nur02BGp85@https.bugzilla.kernel.org/>
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

--- Comment #304 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to barfin from comment #303)
> I'm Using ASUS H97-ProGamer motherboard and i still can't sensors on kern=
el
> 6.2.2 without using "acpi_enforce_resources=3Dlax", i haven't seen anyone=
 else
> mention the asus-h97-progamer motherboard but this mb is having the same
> issue as all others that were mentioned

Uefi dump of H97 board does not have any known APIs, Could you please check
what sensor is detected on board after "acpi_enforce_resources=3Dlax"? it c=
an be
showed in dmesg/sensors output or in dmidecode output.

(In reply to Nick Owens from comment #302)
(In reply to A. M. from comment #299)
Thank you, I have found issues in my script for detect available port
definitions/methods in UEFI dump. I will send patch to upstream with new bo=
ards
after fix issues and rescan board dumps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
