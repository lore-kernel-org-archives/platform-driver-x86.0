Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E77C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 21:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbiBVVEL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 16:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbiBVVEK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 16:04:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02006C3C2D
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 13:03:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 940FE61703
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 21:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFA00C34114
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 21:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645563824;
        bh=SH+bFKWFzOMI5E095vp18Cw4ezZt6+yaAJT6naQWaDI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nrIoA75klTJxuj25xJuOpCENOlDvQ8Scik9xFi1h+VPQoEAOK6aYEvU4AmFPQQowa
         JYAwnPdGonG2A86rza2917BzTnMovO8xP35dkkePCsk/EL/X1w0VModS+ICaJp3Bdl
         ZO3wo5VLA2AECk0DNsqnzUyPd7mzBK4sF/l8O007sePa4QHtrrduWL7cnPwgDj5qJY
         /VEfM4Nsge+KvhVrlrefxnaJhtPfUxSXocfhO7xNWhCtd4nammIphwINACG+v4hjqS
         uv/K0I8aX1L3axQQ21yGWLi0j2Q1WIHwlpf6P7bgaEufZ59ju0ZZ5Bu/IX/N1McDnE
         wgqYFDtcC9+WQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E1010C05FD4; Tue, 22 Feb 2022 21:03:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 22 Feb 2022 21:03:41 +0000
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
Message-ID: <bug-204807-215701-5paKTUovUn@https.bugzilla.kernel.org/>
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
 Attachment #300417|0                           |1
        is obsolete|                            |

--- Comment #220 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300506
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300506&action=3Dedit
Asus WMI for nct6775 v5.16 base (2022.02.22)

Update code with up streamed Eugene Shalygin patches for asus_ec_sensors.

asus_wmi_ec_sensors is also updated to be in sync with asus_ec_sensors. Cou=
ld
some one check with "ROG STRIX X570-F GAMING"/"ROG STRIX X570-I GAMING".=20

Could someone with a such boards check?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
