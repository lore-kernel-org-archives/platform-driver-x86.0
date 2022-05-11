Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E5EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 09:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbiEKJuf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 05:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbiEKJue (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 05:50:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAAB51308
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 02:50:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 46970B8216E
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 09:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F24F6C340ED
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652262631;
        bh=J02jIRMFhexYOzkBJGJ+Z9LGmOSZskXRIMLcEF4x9ec=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MVT1BLeuui7NEEvPMAkZsQXryYZtNrc2hxY1nA08WSUWarQREmzIUy7qo0dSnCivn
         jCfAkcXt498eKKFIeLfJL/Sdfgzzs49dN8shGs4VG9beNExQ+wbp1Q+tEhisS6ml9x
         3P27hhWfxviiAM/MRaEVGHf60TDjgL4j2kZtJsZI/SzziMj2pxVY7Liueg4+Tet6/W
         0bb/HCp6RJV+V7n3OgcXo9Tfojxduppbs6Ufd4xO9oy54ZiQhyzvOzevvqNZ7wv8PO
         Hx3ehJsT8F86rA111GrrwXlFkw2tzXlFIRG+aZlmzntp5ezdBdt6ZYafsvR5cW7wF6
         Sb3Co7FlBIBFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E1E59CAC6E2; Wed, 11 May 2022 09:50:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 11 May 2022 09:50:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sa@whiz.se
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-UHhp3IeCqt@https.bugzilla.kernel.org/>
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

Sven Arvidsson (sa@whiz.se) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sa@whiz.se

--- Comment #238 from Sven Arvidsson (sa@whiz.se) ---
Created attachment 300932
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300932&action=3Dedit
Z170M-PLUS dsdt dump

Hi,

Can the Asus Z170M-PLUS be supported by this effort too?

cat /sys/class/dmi/id/board_name
Z170M-PLUS

[May11 11:46] nct6775: Enabling hardware monitor logical device mappings.
[  +0.000028] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
[  +0.000004] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20211217/utaddress-204)
[  +0.000004] ACPI: OSL: Resource conflict; ACPI support missing from drive=
r?

dsdt dump is attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
