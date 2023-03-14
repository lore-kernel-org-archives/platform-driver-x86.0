Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A90C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Mar 2023 08:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjCNIS1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCNIRw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2023 04:17:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB5D6230A
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 01:17:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5FD29B818BA
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 08:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21A31C4339C
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 08:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678781848;
        bh=9s5FVrXdX3NVpEl3F7292oeOP0XkG4Fswg2LC/k83lw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NjCwz65gxF3PMQ7n2QxZBv+fNYUeT9a90fAhAGqk3gp9xs/mk/d7+9aT+XBTHGGip
         FYHnrWuYS8pbuKL0Hq+TdHk2qT8QXbV6nghx2pbRUcjcHwGcmt0ApLXExGnOZivHoh
         qi58p8id2R18aINs8bX4+A9HW1R6b9LbjhazY0CcBXkGbdB67JVPwtPst5EZSo/Bv3
         KQ2km78+xd/YlFnq3GYXn4PpHm19hm0omS9JjaJ/fJi+aT4DG2Xa90gyCIe9xRuiua
         uCXasFo4B/bDNvxHcOYw4Lqa31QO1mFGHtjVGYnkFogg6NE4/wDauyLF9o4ngLtQOn
         9W50inAy+1LIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 113E4C43144; Tue, 14 Mar 2023 08:17:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 14 Mar 2023 08:17:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: barfin@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-RwdGnOTpjx@https.bugzilla.kernel.org/>
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

--- Comment #305 from barfin@protonmail.com ---
(In reply to Denis Pauk from comment #304)
> (In reply to barfin from comment #303)
> > I'm Using ASUS H97-ProGamer motherboard and i still can't sensors on ke=
rnel
> > 6.2.2 without using "acpi_enforce_resources=3Dlax", i haven't seen anyo=
ne
> else
> > mention the asus-h97-progamer motherboard but this mb is having the same
> > issue as all others that were mentioned
>=20
> Uefi dump of H97 board does not have any known APIs, Could you please che=
ck
> what sensor is detected on board after "acpi_enforce_resources=3Dlax"? it=
 can
> be showed in dmesg/sensors output or in dmidecode output.
>=20
> (In reply to Nick Owens from comment #302)
> (In reply to A. M. from comment #299)
> Thank you, I have found issues in my script for detect available port
> definitions/methods in UEFI dump. I will send patch to upstream with new
> boards after fix issues and rescan board dumps.

here's all the outputs, the file that have "_lax" at the end were captured =
when
acpi_enforce_resources=3Dlax was used
https://drive.proton.me/urls/8S727K80A4#MdPfNfkyxSbq

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
