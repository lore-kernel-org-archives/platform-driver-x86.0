Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDDEC433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 10:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB01C61461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 10:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhD2KJz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Apr 2021 06:09:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:39692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232629AbhD2KJz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Apr 2021 06:09:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A96E6145D
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Apr 2021 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619690948;
        bh=RwhEabep2upaurHVj3CTbNG76GgzhYTQCmjvoKOD4N8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mVDktkrqWoAiul56sKFjoap1gNalJXaL1PCaht2D/8yiwxQq3PjZzw+F0duGPArTv
         PeJ4xVU+zMd0/Ae0S6MeIy6Yo0AP6WcpwW9ygWkbpGow6OVo2bb/mhIuweOcoGUHno
         TVDWaMdcTQL+p24yEpJ7tcv460dAzpvMNHyaI+aJ2i4AxvNZMfcSAtWN4cPduWtBGB
         7D4AFbcoXE6Fezy+GEAiN1hI0S8n2BbXyn20IkT1+XWK0DJJqLC3FQ732Zn4G7kGrp
         Tps/Yibwpc526HX6LxIzasb9SZ3hzgYRwiPrHajalHeDDFzlMC/KsnsHCLRJ+5BPhA
         6Ak0z8JTLrPpQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 29 Apr 2021 10:09:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@bernhard-seibold.de
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-STZjaWCsWN@https.bugzilla.kernel.org/>
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

--- Comment #73 from Bernhard Seibold (mail@bernhard-seibold.de) ---
(In reply to Hans de Goede from comment #72)
> (In reply to Bernhard Seibold from comment #71)
> > Created attachment 296529 [details]
> > Add support for access via Asus WMI to nct6775
>=20
> Nice, have you submitted this to kernel's hwmon subsystem maintainer for
> inclusion into the mainline kernel ?

No, I just finished writing this. I cannot test if it still works correctly=
 for
non-WMI cases, and I think using device address zero for WMI is probably a =
bit
hackish.

Please also note that this patch only adds access via WMI for i/o port 0x29=
5,
while superio access is still using the "traditional" method. There are how=
ever
also WMI methods for superio access, at least on my board, and it would
probably be safer to use those as well. However I would propose to first sp=
lit
the superio functionality into a separate driver. Comments in nct6775 seem =
to
imply that this was/is intended to be done at some point.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
