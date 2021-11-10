Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119F1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:36:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7C6161264
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbhKJWjg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Nov 2021 17:39:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:33570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233569AbhKJWjf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Nov 2021 17:39:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 92E356187A
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Nov 2021 22:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636583807;
        bh=DL1tnD2umRPKBlXChavgqPduEL7QVi5z5viCUhPK2b4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uyeu85ij81bT7ia9tsAFDMPE9udRhHBT6Sk6vq5FJnXUBHXiw1eZNoaZ4R/xmvVH1
         I/2Ww/LuCnIKQ40bPpAWKVNr0sfU2QEN1Qm6pW588R8TSPlzI9oACuSf5JuLWsfbO7
         mJFdovXzbvzArjZHxNjhPzwwJ3XUR+fD48WBXlzivJi6ikh/crJmG9OTCnUkShSM5U
         IrHZhhsvFmTm6CExesVxWsNj3Hi+4YK2svr24MQsIcRATh5W5urXtkmr7yuTz6rHZg
         TqZGXpoZzm0QYKN7bzGMBHBp3Y8iqfXUB6Wnde2sm7vTLccfHS6B6cALnoF8qjl3mp
         ZcKpfdpOsSu6Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 10 Nov 2021 22:36:44 +0000
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
Message-ID: <bug-204807-215701-mFRp0uV6sq@https.bugzilla.kernel.org/>
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
 Attachment #299483|0                           |1
        is obsolete|                            |

--- Comment #163 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299517
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299517&action=3Dedit
Rebased patch with all asus_* drivers and i2c 11.11.2021

Patch rebased over
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/ta=
g/?h=3Dhwmon-for-v5.16
tag.=20

Could someone also check i2c adapter? It should work for all boards with di=
rect
access to NCT67xx or with known acpi mutex name and available for:
    "PRIME B450M-GAMING",
    "PRIME X370-PRO",
    "PRIME X399-A",
    "PRIME X470-PRO",
    "PRIME Z270-A",
    "PRIME Z370-A",
    "ROG CROSSHAIR VI HERO",
    "ROG STRIX B350-F GAMING",
    "ROG STRIX B450-F GAMING",
    "ROG STRIX X399-E GAMING",
    "ROG STRIX Z270-E",
    "ROG STRIX Z370-E",
    "ROG STRIX Z490-E GAMING",
    "TUF B450 PLUS GAMING",

As:
---
cat /sys/bus/i2c/devices/i2c-8/name=20
SMBus NCT67xx adapter at 0295
---

i2c bus can be checked by:
---
modprobe i2c-dev
i2cdetect 8
---

I2c adapter code is based on patch from OpenRGB repository.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
