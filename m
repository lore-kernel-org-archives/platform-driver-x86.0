Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EDAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 22:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 157D160E9C
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 22:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhKAWg5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 18:36:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbhKAWg5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 18:36:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 921F360E9C
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Nov 2021 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635806063;
        bh=PfgOKc3H8+aBQS1W9lKXSHlUot/3LWfoz4kEnXYoeDA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Bi0pe520GgEDbrHEU+9V/9I8mPv9FQr8MwRcdsnlE5znkgnTJJ01FMDH2jFy0wDtT
         ZOllGRYVbGCY/Fj1HZZAc/4dSIVb+oeRlwZJH5eJHszkctwycEjTMiffN8VE2L8A1Z
         iRMPdoCf1o7ED5RJrfznqNY2HpyTDDAycU95l5C0X8h5N4Ntivq8aWOxTMeDFajjLf
         aLkPVMxgOPVMdqsi7I6klUT+Lt+rbYlk6vHjzMj2rt5NE+hJWWGjSjP8Rf7608UtCf
         wwMnhv+QgB3IKvu6XTk2vOO/iARCQLnpH1FIIGuf6g1Oh/inILwsCmqC0MrJkXHnwM
         zHJnHe1BJpEUg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Mon, 01 Nov 2021 22:34:23 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-0eWjuwEFPD@https.bugzilla.kernel.org/>
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

--- Comment #7 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
The ideapad-laptop code seems to log to dmesg on most unknown events, I ass=
ume
nothing shows up in dmesg?

I think based on your other experiments that it would be interesting to log=
 the
value of now in this function in ideapad-laptop.c:


static void ideapad_backlight_notify_brightness(struct ideapad_private *pri=
v)
{
        unsigned long now;

        /* if we control brightness via acpi video driver */
        if (!priv->blightdev)
                read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
        else
                backlight_force_update(priv->blightdev,
BACKLIGHT_UPDATE_HOTKEY);
}

Changing it to:

static void ideapad_backlight_notify_brightness(struct ideapad_private *pri=
v)
{
        unsigned long now;

        /* if we control brightness via acpi video driver */
        if (!priv->blightdev) {
                read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
                pr_info("EC's LCD backlight value is now: %ld\n", now);
        } else
                backlight_force_update(priv->blightdev,
BACKLIGHT_UPDATE_HOTKEY);
}


I suspect that we will see that value change (note this assumes you do not
specify an acpi_backlight=3D kernel cmdline option).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
