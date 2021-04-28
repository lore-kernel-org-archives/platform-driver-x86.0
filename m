Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1F7C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3EB761059
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhD1V5b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:57:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:60206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhD1V5a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:57:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6DA826135B
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Apr 2021 21:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619647005;
        bh=DZTz4AQ/BA8iiikVhjIfZN2TeKZKxLb1x4BBKHQYL/s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Efl9vr9Xyrl5VCo3f343cAtYEVGWABoBkVxgK6PHRoooDtdgk7FCTcQBJbfuipBaa
         uxqsYdKkJnl1j3BwJ1D4rhKkRQOpM3xN7WQugE5Q86hHLh5QnwuclWGsQHuh3xQ1Ft
         fqDwph1SNWgxw9kDsGFKy8MNde6pGAXNZVYzAg8+ggc0y79MhCWoOKLScdC3sCo3Uv
         YeO/CWh1bHoAN/sS4ivQSZRCLvY6jTHML5N6Q8snCoqpHQFoJxch+d1jRr/FJD/KFh
         C/XxZZxGpq8YIwFHT5iz6Hh3n6IB5xECkeO10rUlVptV6DEsvCfg2+UU7EwhGNErsl
         U503rhXPKumMQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 28 Apr 2021 21:56:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-grKI64jZ03@https.bugzilla.kernel.org/>
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

--- Comment #72 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Bernhard Seibold from comment #71)
> Created attachment 296529 [details]
> Add support for access via Asus WMI to nct6775

Nice, have you submitted this to kernel's hwmon subsystem maintainer for
inclusion into the mainline kernel ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
