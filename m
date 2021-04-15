Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED74CC433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE2C2613CF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhDOJ2Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 05:28:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:58750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230260AbhDOJ2Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 05:28:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E4068613B6
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618478873;
        bh=m1PpRyhfOgnIUlebMNVwM4znZSg6TlSYFCPBqZYyMZk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LUgl8ulC5AMsbMUYIjIqroBqhjgh3MiEAD/AylYIw2UgWum2z7/xaVisxsIZE0cA/
         w6zOH8si7XgGCNZtNSIcM6D6+WpaCPbfoMuKYeY/46DAH7rBpoLai/xJZblv40Rrgc
         ZaJpjBx1IrFqpHLrUVzs2nTgJErVmqu3QeMbNhmA63efl7fqCcFBivFTDkg2G+fkqj
         udDZBKkw9wqPPbtCw+eruKhufSKB7Tk6q/bzhhsUFfUxEy1vgZxblb8RAxp/AwZ1QT
         KSTHw/9uX0v07Z+UM5k+774OK93bcs6xDteci81vMppqlSocpdVUy0eLp8e4HK+iUX
         picvkZ48pp84Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 15 Apr 2021 09:27:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-eUAP6cuili@https.bugzilla.kernel.org/>
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

--- Comment #67 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Hans de Goede from comment #64)
>=20
> Matthew rightly advises against using "acpi_enforce_resources=3Dlax" beca=
use
> that opens races between the firmware and Linux which could result in
> writing to another superIO register then intended. This can definitely le=
ad
> to e.g. stopping the fans even though the CPU is running hot, which is not
> good but all modern CPUs have builtin overtemp protection, so at the worst
> the system will simply shutdown (1).=20
>=20

Multiple users use acpi_enforce_resources=3Dlax and I haven't seen a single
report that it's ever broken anything.

AFAIK no one has used this hack to control fans using PWM, so that might in=
deed
lead to unintended consequences.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
