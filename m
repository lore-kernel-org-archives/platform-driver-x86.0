Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17957C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 20:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbiFCUUK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 16:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbiFCUUI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 16:20:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A77438BF6
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 13:20:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDCFE61B05
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 20:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2478EC385A9
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654287607;
        bh=BHvwuHRnnb2dTDi5vX3sd+0ukgribYzmukiJ9Tv+Mdk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rwwY5WifSwceblEVCgeJNtiDVSE3jfGPbz+VCEyM5eWVIAZs1gcyvaX0yYLAhL2Zz
         URiEJXBptcpD/w2Gc5uX+wpFb1slaZCd7wwy41QdKkzhWFSpf7GWm0wk9bXAUH5x0g
         RUiCDMK2YNHxClbj9a1Gjw4MWZpJgUWk0G+LFJq1MyExCRiJTnsl1U6sBzMTeSxu7w
         BnHjRALMzRTuGt7sDDNckVOYRmIEE5nOWH4YoEzjKLVdqu9Y6dIEQNwsdKNS6lmTAb
         eCI1yX+cXAl+g5w7hPhoZogiPvuoT9BorwswjZlgMMiuBLtgIvZ0mSowuSOqTv699y
         QXJLY/bVqFHrg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1114DC05FD2; Fri,  3 Jun 2022 20:20:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 03 Jun 2022 20:20:04 +0000
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
Message-ID: <bug-204807-215701-IpNxpZ6zdy@https.bugzilla.kernel.org/>
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
 Attachment #301047|0                           |1
        is obsolete|                            |

--- Comment #251 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 301099
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301099&action=3Dedit
Asus WMI for nct6775 v5.18 base (2022.06.03)

(In reply to Rob Miller from comment #250)
> (In reply to Denis Pauk from comment #248)
>=20
> > (In reply to Rob Miller from comment #246)
> > > > > Asus Z170-DELUXE dump
>=20=20
> > Welcome! I have added little more debug information and additional check
> for
> > different name of mutex. could you please try?
> >=20
> > Other possible issue can be different naming of vendor: "ASUSTeK COMPUT=
ER
> > INC." vs "ASUSTeK Computer INC.".
>=20
> 1) Using second patch, again sensors doesn't work without the 'lax' boot
> parameter, and there is a new error:
>=20
> [    3.469698] nct6775: No such ASUS mutex: \_SB.PCI0.SBRG.SIO1.MUT0
>=20
> 2) Aplogies, I did find an error booting with the first patch:
>=20
> [    3.501711] nct6775: Using Asus WMI mutex: \_SB_.PCI0.LPCB.SIO1.MUT0
> [    3.501864] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290

Could you please check?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
