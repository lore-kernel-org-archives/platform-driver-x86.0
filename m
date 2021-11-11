Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352A6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 20:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11FEB61A04
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 20:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233760AbhKKUyE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 15:54:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:46202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232666AbhKKUyE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 15:54:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E17CF61A02
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636663874;
        bh=3jR/Hxyq0pM8c49MTgiP+ae9s9sPOukqf9Ghd31+LFc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Izcuym2f7jFPPIYtu/go7JQJlc+GwKIaR5RZTCMxn4RQWXtBnXk2U4khxMK7T2rvJ
         bxwA8rRm+C159RInNA4agaLe7RQF7iW3DcT7Nwu0cnbB7RwhS1qbwVkK7bBFGeND60
         GEkoxDQ5epnypcJSIONkG308ZiWcd8uHXNqbjQXlfAcmVGArf3msG9mJMPC/KDaGGx
         Vhpy46XaWTxBNPPc0KVHFqZ8h8DB6RDvATJ5K+6Ag2AOW1aBFcCqagzwouUKoqSQ4K
         ySubdIfOpUl0OevHTtFwKHWaAodYpr7TZc5EK72L/mTZCrOmBYRADe9UF5UqbRzF6X
         KiMCjSyMTPM6g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 11 Nov 2021 20:51:12 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-RgepwtE809@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #299517|0                           |1
        is obsolete|                            |

--- Comment #169 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299537
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299537&action=3Dedit
Rebased patch with fixed board names 11.11.2021

(In reply to Olli Asikainen from comment #167)
> (In reply to Denis Pauk from comment #163)
> > Created attachment 299517 [details]
> > Rebased patch with all asus_* drivers and i2c 11.11.2021
>=20
> Thank you Denis!
>=20
> A small correction for MAXIMUS VII HERO, the board name is actually "MAXI=
MUS
> VII HERO" not "ROG MAXIMUS VII HERO".

Could you check?

(In reply to Joel Wir=C4=81mu from comment #164)
> Created attachment 299519 [details]
> attachment-16225-0.html
>=20
> Another board to add:
> Product Name: PRIME B550M-A (WI-FI)
> [  105.876155] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
>=20

Could you check?

(In reply to Eugene Shalygin from comment #168)
> (In reply to Denis Pauk from comment #165)
>=20
> > Maybe we can have asus_wmi_info_table from patch in #163 as shared file
> with
> > description of preferred method for access, acpi mutext name, devices on
> i2c
> > bus, ec register address to sensor type. What do you think?
>=20
> My idea was that the mutex for the state lock can be either the regular
> mutex or the ACPI mutex, there is no need to lock both of them
> simultaneously. So that the module can return a structure with the mutex
> (ACPI one if known for the given hardware or the regular one) and functio=
ns
> to lock and unlock it. I just thought that would make logic in the actual
> sensor modules (nct or ec) simpler.

Could you look to nct6775_data:{un}lock? Do you mean something like it?

(In reply to Andy Shevchenko from comment #157)
> (In reply to Eugene Shalygin from comment #156)
> > (In reply to Andy Shevchenko from comment #155)
> >=20
> > I use acpi_acquire_mutex()/acpi_release_mutex() for the ASUS EC sensors
> > driver
> > (https://github.com/zeule/asus-ec-sensors/blob/master/asus-ec-sensors.
> > c#L417), but there seem to be no other users of these function inside t=
he
> > kernel sources (checked 5.15.0)
>=20
> Looks legit. Object is passed by handle:path.

Could we enable create i2c adapter for all direct access cases? Connected
devices(RGB leds?) should be in safe conditions by default without read/wri=
te
by this adapter and code reuses same lock as monitoring code.=20=20=20

What do you think?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
