Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D3EC432BE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Aug 2021 20:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D44D61057
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Aug 2021 20:47:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbhH3UsY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Aug 2021 16:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229708AbhH3UsY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Aug 2021 16:48:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5564B6103A
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Aug 2021 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630356450;
        bh=+rVAo37fKyJVrYJ/Qv2Ah09Ax8xCamDKmfsoErim//0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n1Ghzv7NdXTwJVd8WLX45DAWztFHyAdet+eBraRKL9wsAryLO3m1ddN3gcjEv1qhn
         fsInoTzpW1s6BzohPBUOGcxD4gzsWvgk1/DEgDr/UsAezVO/AjkyarpQ+uRonovT9C
         KXhMK7fGU9iZDc2JyvBBNsJjM/VZwcYI+7fx094CkiUCnCIswUkBdr/4CXX2kgLPc+
         s29IwrT3ig4Ufb5GqPMuWFdZnWMOVMbtJ3H2jmi68/kc64mbKfg99eZ3Ol5yDj/8Hr
         ukAhVEi4+OiXF5/DiFdGE2KYMIcYS86i/Jsro2Q5MWd18i2EOwEjcgeKnI74pLiiVs
         mfIR/T3yuOz5g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 30 Aug 2021 20:47:29 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-ZVRbA2Exau@https.bugzilla.kernel.org/>
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
                 CC|                            |pauk.denis@gmail.com

--- Comment #85 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 298539
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298539&action=3Dedit
POC: Add support for access via Asus WMI to nct6775 by board name detect

I have added only small list of board names(/sys/class/dmi/id/board_name),
could you add yours and check?

P.S.: I have not checked with real devices.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
