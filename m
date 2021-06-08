Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278CFC4743E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Jun 2021 15:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BD9461002
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Jun 2021 15:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhFHPfd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Jun 2021 11:35:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231165AbhFHPfd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Jun 2021 11:35:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 39B4861002
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Jun 2021 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623166420;
        bh=m/KriVLfz8tnMJfmvarbddqKPg1e4CdQER82ZRUqMZU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=m8tFMlYqWGPe7jZkMtPnTnbGu6TsCEiecpq/2ykr+ct6U8QkVlmQtxogo188M1yKI
         LjUy6ddypaQbX/aeDs7V3Ww0US9DrpqQgibXa3uGMXLzCzCKW2v3+C6/2F1FZG1Mom
         ad9rUaQ1adOkvNk8O98QXg0U00a0c1rGX8mppwhdDlNaiGY8ak0F4WTH3RFRJ7Mh+c
         ZVCGx9O//h1yz1UlQuAfwPpm85LwJpS1rX2nnQw+sLfmxg2Y6dGF9Q3k31wSm+SW2q
         pH0MFBPlB7jAQyuhsdDCzeRwa9rwXdxP+BXbxWSeMCvYpN8wlYAblZeAtEXsgVgqK3
         ehyYqJKfnuZqQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Tue, 08 Jun 2021 15:33:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211741-215701-cHoyGmjilg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

--- Comment #3 from Luya Tshimbalanga (luya@fedoraproject.org) ---
Latest kernel 5.12.9-300 disabled SW_TABLET_MODE on hp-wmi because it never
worked at all due possible missing driver. The current status showed:

# EVEMU 1.3
# Kernel: 5.12.9-300.fc34.x86_64
# DMI:
dmi:bvnAMI:bvrF.48:bd11/26/2020:br15.48:efr92.48:svnHP:pnHPENVYx360Converti=
ble15-cp0xxx:pvr:rvnHP:rn8497:rvr92.48:cvnHP:ct31:cvrChassisVersion:
# Input device name: "HP WMI hotkeys"
# Input device ID: bus 0x19 vendor 0000 product 0000 version 0000
# Supported events:
#   Event type 0 (EV_SYN)
#     Event code 0 (SYN_REPORT)
#     Event code 1 (SYN_CONFIG)
#     Event code 2 (SYN_MT_REPORT)
#     Event code 3 (SYN_DROPPED)
#     Event code 4 ((null))
#     Event code 5 ((null))
#     Event code 6 ((null))
#     Event code 7 ((null))
#     Event code 8 ((null))
#     Event code 9 ((null))
#     Event code 10 ((null))
#     Event code 11 ((null))
#     Event code 12 ((null))
#     Event code 13 ((null))
#     Event code 14 ((null))
#     Event code 15 (SYN_MAX)
#   Event type 1 (EV_KEY)
#     Event code 138 (KEY_HELP)
#     Event code 141 (KEY_SETUP)
#     Event code 148 (KEY_PROG1)
#     Event code 153 (KEY_ROTATE_DISPLAY)
#     Event code 224 (KEY_BRIGHTNESSDOWN)
#     Event code 225 (KEY_BRIGHTNESSUP)
#     Event code 226 (KEY_MEDIA)
#     Event code 240 (KEY_UNKNOWN)
#     Event code 358 (KEY_INFO)
#   Event type 4 (EV_MSC)
#     Event code 4 (MSC_SCAN)
#   Event type 5 (EV_SW)
#     Event code 5 (SW_DOCK)
#        State 0

The bug still remains as the keyboard still works even on tablet mode. Idea=
lly,
it should be disabled at that mode while the touchscreen remains active.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
