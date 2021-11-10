Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996C8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:42:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E2C46128E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Nov 2021 22:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhKJWpG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Nov 2021 17:45:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:34370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233583AbhKJWpG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Nov 2021 17:45:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7345061381
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Nov 2021 22:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636584138;
        bh=/XbOcjiogHTd6DsShxsjityGIak0LdnmzLf1vR1CnCY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VYFNEKS34wnvJl9Rg5mBQJFQ9iH9c/VvqjJJT8xWnfiqnZOf12e0TiUNI3UkWq5DX
         NQRt40SbrwaXoZ4Xhi70biY2ra/hKNTEmZvzFfBLXz/juNMBfsbEHXW5LwsZB56bj1
         zNWOh98i0Sme+xcyGxfU6aWQB8/OE1AQ4Dhag/uxErzEPFevIZ3TVLeGyb+TbmruYv
         v5wKnOA5cqBF4BKj/VyMys+5xOBsVbULhsNR1IYDgujZjpoZ5yKWakKYHznaPCMmo/
         rJzfTk9Deg46Jt9repSitH+34rfsGd1+aNHIY0haokrOd4uCDkN0iNeWjGclB/+JDT
         u1Yc8XSF0og2A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 10 Nov 2021 22:42:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwp@redhat.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-3hdMla6GFX@https.bugzilla.kernel.org/>
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

--- Comment #164 from Joel Wir=C4=81mu (jwp@redhat.com) ---
Another board to add:
Product Name: PRIME B550M-A (WI-FI)
[  105.876155] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

On Thu, 11 Nov 2021 at 11:36, <bugzilla-daemon@bugzilla.kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204807
>
> Denis Pauk (pauk.denis@gmail.com) changed:
>
>            What    |Removed                     |Added
>
> -------------------------------------------------------------------------=
---
>  Attachment #299483|0                           |1
>         is obsolete|                            |
>
> --- Comment #163 from Denis Pauk (pauk.denis@gmail.com) ---
> Created attachment 299517
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D299517&action=3Dedit
> Rebased patch with all asus_* drivers and i2c 11.11.2021
>
> Patch rebased over
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/=
tag/?h=3Dhwmon-for-v5.16
> tag.
>
> Could someone also check i2c adapter? It should work for all boards with
> direct
> access to NCT67xx or with known acpi mutex name and available for:
>     "PRIME B450M-GAMING",
>     "PRIME X370-PRO",
>     "PRIME X399-A",
>     "PRIME X470-PRO",
>     "PRIME Z270-A",
>     "PRIME Z370-A",
>     "ROG CROSSHAIR VI HERO",
>     "ROG STRIX B350-F GAMING",
>     "ROG STRIX B450-F GAMING",
>     "ROG STRIX X399-E GAMING",
>     "ROG STRIX Z270-E",
>     "ROG STRIX Z370-E",
>     "ROG STRIX Z490-E GAMING",
>     "TUF B450 PLUS GAMING",
>
> As:
> ---
> cat /sys/bus/i2c/devices/i2c-8/name
> SMBus NCT67xx adapter at 0295
> ---
>
> i2c bus can be checked by:
> ---
> modprobe i2c-dev
> i2cdetect 8
> ---
>
> I2c adapter code is based on patch from OpenRGB repository.
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.
>
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
