Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097BFC636C9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 15:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFE8561244
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 15:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239629AbhGUPOY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 11:14:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238108AbhGUPOY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 11:14:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D33F560C3E
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626882900;
        bh=B7mnlZdpjObHUVVGp/lwJFFzESiy9cPUHfjqn9bjZIY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fx3OPs3s9hUYVXVezwcOSsRdfLEwMBkItWh/jFRyYLLVEYNt3BDdJNhI7xg+RjI/Z
         Pw1rj9Y/mq/YBF89iBj5cUAd+zi7rWmSRIz6mzWDXdyNvwzXHEn8d4E5WEhSg1jLM4
         Fty2GNigQtNaANIapDIj0muhI9nqRivRbp82HDKYKA8/s5AgVypOpgUqkEpqoTjV6B
         1iOjND7K+wgdwvjkVQdq/7Qc9Hd2jWCg7v1LeLe2NPBsXb6R4xWsVcpIePHfeyntwR
         JdRPdevrN2gjYTSzudxRTUuCfaTP8hnb9Ah0sNkfLQmN6rWAx2D24w/fx2FwZc4sIH
         DFgu0bSDsMLMA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 15:55:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-IWkt1bVjk5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #23 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Riccardo Mori from comment #22)

> This is the dmesg output with the latest kernel 5.14.0-rc2 with the commit
> cb8cc18508fb0cad74929ffd080bebafe91609e2 "pinctrl: tigerlake: Fix register
> offsets for TGL-H variant" reverted and CONFIG_DEBUG_PINCTRL=3Dy and
> CONFIG_DEBUG_GPIO=3Dy.
>=20
> The issue is still present

...which effectively confirms that this fix isn't a culprit and according to
our internal documentation has to be exist. In turn this more and more bend=
ing
towards the firmware issue. Thanks for testing, by the way!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
