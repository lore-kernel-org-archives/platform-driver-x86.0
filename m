Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B928EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 21:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A6AE61980
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 21:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhJEVCq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Oct 2021 17:02:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231322AbhJEVCq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Oct 2021 17:02:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3548A6138F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Oct 2021 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633467655;
        bh=ZgX8iCO96VJ4/iLO7A9tdpI0vpVZpxcviH7zpmme660=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qKhd80Fbix8vbgnITRU6UqKpoDCebEKzyLHEf5/l42ntk6YKCGvrLjsEbUWIRHn2r
         C9IRj004fW7xbQSfwWvT0m6SIt1XYxi1KI9ahau+MPBF79vNPr3QwozuMeEcgwSqKO
         r7zhabCi9n4gHBYNb6ZJHFa9PXpmPrqw7T1tAc9cpORDHH2caFhw+fNkl5e2LlWp9T
         fkzmxsyYpQjiM3LKorAQRSgHRvsBtlBT198jfBKDC93UkurlJbjNmdkgN9uvp1RBlV
         o3QQNiFRiiE+j81hZMq46hl3MxXW9kcBNrTkZcoS13mvljfbRRD+XSz1mYp/hS/oZB
         gMVl6A1bnRVSw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 05 Oct 2021 21:00:54 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Jm6AjrCsKc@https.bugzilla.kernel.org/>
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

--- Comment #135 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Eugene Shalygin from comment #134)
> Denis,=20
>=20
> thank you for pulling the new changes!
>=20
> Could you explain, please, why did you merge the asus-wmi-sensors and
> asus-wmi-ec-sensors drivers? As far as I understand, asus-wmi-sensors can
> fetch data from all available sensors, including those provided by EC, but
> the WMI methods it relies upon are removed from the new ASUS boards.
Both drivers have used same entry point and difference as I see that: old
boards return some list of sensors with names, new one always returns zero =
as
count of sensors and requires some hardcoded list of sensors. And list of o=
ld
and new boards is not intersected.=20

As for me, when we have 30% of similar code better have one driver for both
cases. Currently driver has 1126 lines.

(I have not calculated real size of shared code so it can be bigger or less=
.)

Do you like to be in MAINTAINERS list?

Also good news, no EC also will go in next round of updated patches.=20
https://github.com/electrified/asus-wmi-sensors/issues/78

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
