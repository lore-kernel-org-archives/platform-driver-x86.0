Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AD0C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jul 2022 10:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbiGDKMN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jul 2022 06:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiGDKMM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jul 2022 06:12:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972CFCE26
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 03:12:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4D9C5B80861
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05216C3411E
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656929529;
        bh=/8/1ZWRLKni7zyE4uikFGkpyX7lunyYpbUthpqu6McM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QVmbPAcmBpgsuJUz34o1lWAjVwK9joXyiievHSKruiVGvrThg0xizNUrVIXGBK2/1
         RIF2NeQjs5zVGfvN/SAFI+bCTefmqeSNP3XkXTXrTJ94tDlLYJqPaDHN8qW2zrDf6y
         vfo3VTMYL8A1QqbqdtagrTneUzBDGeWkp+ewd8oH/Q6+DUbPHbldhiEI0XLp9PAxUq
         +D1gRm1N91khlRViHnbdhmsXrKPggn9RX8UVcPfuoOkTqnoYwmDekIAu60peplmBRT
         u8NN6m13kA2X5CKLLA+HoV7wILUA3FbsuUVJC0x+c/+N7u5/iE+jL7Y4jvrtvNl4Cu
         mSHebByiQELlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E593CCC13B1; Mon,  4 Jul 2022 10:12:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 04 Jul 2022 10:12:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-214899-215701-9bNR2sLFgF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301181|0                           |1
        is obsolete|                            |

--- Comment #44 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 301329
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301329&action=3Dedit
[PATCH 1/2] ACPICA: Make address-space-handler install and _REG execution 2
separate steps

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
