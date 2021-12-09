Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA97FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Dec 2021 21:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhLIVaW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Dec 2021 16:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhLIVaV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Dec 2021 16:30:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C56C061746
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Dec 2021 13:26:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AED80B82690
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Dec 2021 21:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6354CC341CA
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Dec 2021 21:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639085205;
        bh=OjxvZJWgD9zKyKicYKpfHHq7zJuAIzlSK/3yDh0QnIM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i1btPaXijLahKpawVUaa0E5dZWP4skU1Oe1Qcy+hd/ty6c4WDOSpa08JP7dMrCRNH
         VzBCC7FySm9saSqSSfv+hKh/pfut6RLq01KXhZTX2mN1AMwg7xNQWDyUkDGmZ7evjU
         qQlLYfK1prPUsKq7elwocc/G9+gOjQADarErNk6wugABqJ6Wuo/MDxgNwba9JhWAMP
         dA3vJ8wg8BCcBFCH/pZF6x5zZzD58Pre+9J0IYXwLlVADGjjeRBPCXL0MzXcQ7ZOp2
         nlFdhwuoTb2mKzDem5lMxIlR8M66MAxgMjU0OBE7dLxsUD2mcPq/bDhZKfIuRbeH3g
         2Ph5gd8FcwW3A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5031061005; Thu,  9 Dec 2021 21:26:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 09 Dec 2021 21:26:43 +0000
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
Message-ID: <bug-204807-215701-2zFBygIR9x@https.bugzilla.kernel.org/>
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
 Attachment #299887|0                           |1
        is obsolete|                            |

--- Comment #194 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299975
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299975&action=3Dedit
Add support for access via Asus WMI to nct6775 (2021.12.09)

(In reply to Vladdrako from comment #193)
> (In reply to Denis Pauk from comment #192)
> > You can try with DMI_EXACT_MATCH_ASUS_BOARD_NAME("P8Z68-V
> > LX", &acpi_board_LPCB_MUTEX), But I am not sure that it will lock corre=
ct
> > mutex or be safe.
>=20
> drivers/hwmon/nct6775.c:5443:56: error: =C2=ABacpi_board_LPCB_MUTEX=C2=BB=
 undeclared
> here (not in a function)
>  5443 |         DMI_EXACT_MATCH_ASUS_BOARD_NAME("P8Z68-V LX",
> &acpi_board_LPCB_MUTEX),
>       |=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
> ^~~~~~~~~~~~~~~~~~~~~
> drivers/hwmon/nct6775.c:5411:24: note: in expansion of macro
> =C2=ABDMI_EXACT_MATCH_ASUS_BOARD_NAME=C2=BB
>  5411 |         .driver_data =3D info,=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
> \
>       |                        ^~~~

Could you check with updated patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
