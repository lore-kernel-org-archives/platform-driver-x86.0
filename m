Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0281FC6377A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 19:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4C7861248
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 19:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbhGUTSX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 15:18:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233168AbhGUTSX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 15:18:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EC9661208
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626897539;
        bh=OqAb6eDm9GB3ml/s+dUndXZcNU5NJmmpX+c2EcMH8as=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Wf5DLDGj8OQD9DJcp1eGMpSKh9Hmo0Jod+KA36NvWq/hfS7gYz+3Feny17LROUQjK
         fYjVJJ9NfakKsTyMMybqOZ6RTdHEhWko/O1worSzq17clJM4BbzL20dTec2iOdz4xk
         qEK8RqgPpCtY+vqbyN2Q6cGHMebbh7RO5HE5ND5hS3ITtH53rh5MfxA2uL+rtmh3O5
         0k4MKWQlEuec0Nob+hq4HYFurigmsAAbzj/smqTKwrkpISTGmtfiaNgf3K9u6SvKjI
         d+1OwAsId4I14yNEs2qagK8DQnq+ZT6cMkJ2mLT/paMI3Dt01Hu265fftim/SZcGyG
         ULMQDySHidNlA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 19:58:59 +0000
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
Message-ID: <bug-213579-215701-cGCEYUfhH4@https.bugzilla.kernel.org/>
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

--- Comment #32 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Riccardo Mori from comment #31)
> Created attachment 297989 [details]
> dmesg
>=20
> Unfortunately even after the hack it is still trying to use pin 57

Are you sure you boot the kernel with the patch?

The call graph is

  i2c_acpi_get_irq() ->
    acpi_dev_gpio_irq_get_by() ->
      ...
      acpi_populate_gpio_lookup() ->
        acpi_get_gpiod()

Ah, okay, the pin there is actually GPIO #, so perhaps changing pair to be=
=20

  if (pin =3D=3D 44)
    pin =3D 140

?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
