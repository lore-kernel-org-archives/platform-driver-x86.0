Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01428C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 22:02:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1D4E61880
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 22:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236738AbhJEWEh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Oct 2021 18:04:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229974AbhJEWEg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Oct 2021 18:04:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8E56A615E1
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Oct 2021 22:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633471365;
        bh=jwjM/4+DVzcqeoCBFyR1Im7Tx7f8ShF3cVuzSLWnGAo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TlQvq6eBP5CtQ5GB1sh2PKuSVU+U+sU4M3Q4HMX7WYQGS3iQO9VcJ+MXg8NaDtHpL
         1F5LdPM4sYVbFBcMqfrXSuOyykkA6D65P3UXN6TXADiYvbZQvlCaBwRz0avQIAakUb
         aXUsFhgu+b5+Fad16e/BADdLKHFDVZqR4sUDQY9iWaJsAxzCVgLoESpX48sjMtTKC4
         0ifJctyMiFXZYuvNdYkRPke57Uf4ZUE72VHtctuxor9zHtn6pdvjA+5gfx/N3frUdo
         DkDhR/hLv/Ae/sxLbPq7/xCaOk3NGPkLFqgnooofWM4IIFYyd+cYtbjuJDPtSqZlR5
         oGz78Mu19o+xg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 05 Oct 2021 22:02:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kpietrzak@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-ssPToQcuuC@https.bugzilla.kernel.org/>
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

--- Comment #137 from Kamil Pietrzak (kpietrzak@disroot.org) ---
(In reply to Denis Pauk from comment #133)
> I afraid next patch will be without scaling :-(
> https://lkml.org/lkml/2021/10/5/707

I am not kernel developer but I also think per motherboard voltage scalling=
 is
bad idea in terms of maintenance. For the same reason hardcoding any of boa=
rd
models in module code is rather bad idea and personally I would prefer to u=
se
for example use_wmi=3Dy module parameter or similar when resource conflict =
occurs
on module loading.

With regard to current voltage scaling factors for nct6798d chip, they are =
most
likely not correct and probably will require future changes. For example I
can't see +12V and +5V is sensors output when using current voltage scalling
factors.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
