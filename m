Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4F5C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Mar 2023 18:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjCWSJE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Mar 2023 14:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjCWSJC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Mar 2023 14:09:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962331688D
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 11:08:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20C5662856
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 18:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 884C6C4339E
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 18:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679594933;
        bh=sDONsiutLxBywPEtl6OGw7CvIpM2ybbZs7Up9uUkDms=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IGhbeqXIU+U8/SowTwFwlsbn7uEA0kpauVMJt7Cn8KrmZRFxP9hXPLmWmtVy12TQO
         SqBJuCnB/oQ+GEyfhxuLG8W7RcbguOOKaOjZXhV9B3nlNpd6nwRhsXmnPqy+DtuHNe
         mb+jGnMUPGPRIUPtu0D3Vn+baRprRvtd7ruQzzAfd/H7V4bUxW2IZ8fOXg4nPSyDO+
         iKgkJ3F/zEVkKthnoI1PUZXIhbWqcAFgIkyzZHH9EyiiWZVcOwgJNxE0cuI24dIMhv
         PSCBmPo868GCI4FXnM+WXXV8O+JyfW1EwNznmCFpH/b8ARp6e9HaaVUNoYu6KxQq2m
         Yd2i8LFEcy7vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7A268C43165; Thu, 23 Mar 2023 18:08:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 23 Mar 2023 18:08:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alejandro.gonzalez.correo@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-FWu8ERf9Uj@https.bugzilla.kernel.org/>
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

--- Comment #317 from Alejandro Gonz=C3=A1lez (alejandro.gonzalez.correo@gm=
ail.com) ---
Created attachment 304010
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304010&action=3Dedit
ASUS PRIME Z690-P ACPI table dump (acpidump -b)

I'm attaching the ACPI table dump of an ASUS PRIME Z690-P board. As far as I
can see it uses the classic WMI method, so it should work by adding it to t=
he
asus_wmi_boards list at nct6775-platform.c.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
