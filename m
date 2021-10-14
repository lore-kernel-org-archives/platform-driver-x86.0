Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05713C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Oct 2021 19:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D431761216
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Oct 2021 19:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhJNT4l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Oct 2021 15:56:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232821AbhJNT4k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Oct 2021 15:56:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D9AC610CB
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Oct 2021 19:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634241275;
        bh=uGdgQ9UC9IORznU6oxQrWU2cdqcjvpXTxciucP2PFJE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qjZ8xbnbt/96/PJw4ggJHy0s+elcMniw4N5rgJ5wQ+/qyrnDL+lnfAiWWCNXGSMqC
         t78o1Iz557AGiQF75vXwm0Zg0CPBp0PK2dWg08TINgCbVCe4phE7HPgJt6nXV37pWC
         NZFKw5Xweu/XsVMTk+w61UV9QpAlXfmc3aGyXTjlmP1hDLb2FthJlkZKjwVU+3jrmU
         siN/blt1WRqH7R9xQSnYlYVQZN0bSBBnoXTQLG4R8QyihdctfyMa+Ni3GtwVzc1T+M
         Kqn7Wm7ILb+ZY2o3RhruNCc/7w/MDbDjr8022kuIEFdYlS58G3RNHx/RA+K0FJlEr7
         VaE51Fd8qYY+A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 14 Oct 2021 19:54:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-xYEgiKwyjN@https.bugzilla.kernel.org/>
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

--- Comment #142 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Feliks from comment #140)
> Can someone add my board please? It is an Asus PRIME X570-P, I guess the
> sensor should be, if not exactly the same, as the one from an Asus PRIME
> X570-Pro.
> I cannot use Linux with my board since the CPU fan is spinning at maximum
> speed making an extreme amount of noise, due to that module's sensor
> readings which are wrong.

You have to test yourself before anybody else will add it.

(In reply to Eugene Shalygin from comment #141)
> I would like to ask for an assistance to understand why reading EC sensors
> takes so much time (1 second). Could, please, users of boards with sensors
> published in EC registers (we currently aware of the following models:  P=
ro
> WS X570-ACE, ROG Crosshair VIII Hero, ROG Crosshair VIII Dark Hero, ROG
> Crosshair VIII Formula, G STRIX B550-E GAMING, ROG STRIX X570-E GAMING)
> measure how long does it take to read all 256 EC registers in their system
> and report back the time and the board name?
>=20
> # modprobe ec_sys
> # time cat /sys/kernel/debug/ec/ec0/io > /dev/null

It won't mean anything. The each register read separately may take a long t=
ime
since EC is a separate uController that may be interrupted at any time by a=
ny
higher priority task (to be sure you have to have a look into the firmware
source code). So, I'll be not surprised if 1s in some cases is not enough. =
Not
I'm against the shrtening the timeouts, but somebody should really know what
they are about and why.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
