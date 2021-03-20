Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ECBC433E2
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC4576196B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhCTP2b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:28:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:38690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229871AbhCTP2K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 11:28:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6128761971
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616254087;
        bh=KNbBD/Pdzt7JFISLH2qFJi+eH9+ZLgbd1ZDI78RCXAI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=e4+w1UsybF9/0HY07wLIayAwh8cboAo0ubUCTOVIC2nP6PdubU3Z3oGL3PlFXbHUS
         jbdpxa+8r+eA0b8qI/8MVd2RPgew1wTxrNdEl0AjK5pqkIIg7xnXARWE2VroiQdiyl
         v+70SZJXtje6g+/8lcBFEJKjc2//2tkeVbveE+DxgmrSFYBHLwcdaKczjzwhPLNqjt
         gKBvNodW+lIclcAR5MYxNSDLAJcmLhXcbSO1hja6Xjsdfkph8BqQJZTP/1Jt7ABWwH
         uu877xYKMrFId3hwOcMag0vTqlBpgnGyx3Z9/hj2/YgJExfTZ7/fa1oH2Z3GfZDKCY
         OVFSq4E5sPrsg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 15:28:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204807-215701-VUSrO7qj0V@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #42 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Matthew Garrett from comment #37)
> 97845ED0-4E6D-11DE-8A39-0800200C9A66. That has an ID of 0x4243, or BC - i=
e,
> it's not the GUID we're looking for. The next GUID, however,
> (466747a0-70ec-11de-8a39-0800200c9a66) has an identifier of 0x4344, or BD.
> So this is the GUID we're looking for. Unfortunately asus-wmi doesn't han=
dle
> this GUID, so new code will need to be written.
>=20
> I'm going to close this bug again because it's turned into a generic bug
> covering different motherboard vendors, and there's no one size fits all
> solution. For your case the correct way to handle it is for someone to wr=
ite
> a driver that uses the 466747a0-70ec-11de-8a39-0800200c9a66 interface to
> expose the sensor data. I'm afraid I don't have relevant hardware so can't
> do this myself, but please do open another bug for that.
>=20
> tl;dr - the kernel message you're seeing is correct. Avoiding it requires=
 a
> new driver to be written. If you *personally* feel safe in ignoring the
> risks, you can pass the acpi_enforce_resources=3Dlax option, but that can=
't be
> the default because it's unsafe in the general case, and so it isn't the
> solution to the wider problem.

That's the problem: we have _multiple_ motherboards with _multiple_ differe=
nt
chipsets from _different_ vendors=20

1) all having the same glitch
2) all requiring the same workaround
3) working just fine under Windows with no hacks

> My understanding is that asus_wmi/asus_nb_wmi do the same thing as nct6775
> and expose them to hwmon class as well.

And at the same time you're talking about asus_wmi which covers only _certa=
in_
ASUS motherboards, and no one in this discussion has shown it to work or
provide the same set of sensors.

And this driver has nothing to do with sensors,
linux/drivers/platform/x86/asus-wmi.c:

 * Asus PC WMI hotkey driver

This is not a driver which even tangentially deals with HW sensors found in
motherboards affected by this bug.

I don't know why you're trying to sweep this bug under the rug but I really
dislike it. The Linux kernel development has always followed common sense
principles and it contains a _huge_ number of workarounds just to enable HW
which doesn't work according to specs.

At the very least you could printk() this:

"Your motherboard might not exposing ACPI resources correctly, so you might=
 not
get access to your HW sensors. You could add "acpi_enforce_resources=3Dlax"=
 to
kernel boot parameters to enable monitoring at your own risk. Please refer =
to
https://bugzilla.kernel.org/show_bug.cgi?id=3D204807 for more information".

And this still paints Linux in a very bad light as users hardly care about =
if
ACPI is implemented according to the specifications or not: however what th=
ey
really care is whether their hardware works or being supported under Linux
regardless out of the box. Most Linux users don't even know `dmesg` exists,=
 so
they have no way of knowing how to fix the issue.

Lastly, this bug is not fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
