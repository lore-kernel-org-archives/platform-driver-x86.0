Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349CFC636C9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 17:51:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 125D460FED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 17:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhGURKp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 13:10:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:54926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhGURKp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 13:10:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B3B7960FED
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 17:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626889881;
        bh=a70YTLtqm8hU68jnSwTim6E+ipVOClDgENh0OZEpMg4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o4ApTrQy8Vn73NQzbZNf2cmYqmkGQQItukHjOXYUb8F9oflIISgw+BZwzxyc1yQDM
         npMtweAVyryYDXQM/Fqkkex7bRpf1E5LrvsDKOhTF0tG6lwW0fu73uRIf+g0qG6vYv
         tTF97PNCp4WS1yQiw9sxMAs0gQCthcDpQb90lc/T8fln4gJ9YBiY3QCYmRRY2WF/eK
         TlEo4LMij8CGB7oGsAkrOsxwDuJV3q1/ToL1la3yVFQHA9DNG+lX65egQNpmjeiA9K
         gH/U2JA5Zyyc/Vl2g+9c1P8vt1IU/pfhskZJ96tWZVVpxy5EUx9vCPVexBfDgp4wJD
         Ut5rfHc1Jrw0g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 17:51:21 +0000
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
Message-ID: <bug-213579-215701-VS8mrEhMbu@https.bugzilla.kernel.org/>
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

--- Comment #29 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to wse from comment #28)
> I found a schematic for the Clevo NH5xHP
>=20
> According to that the touchpad is connected with 3 wires to the EC and wi=
th
> 3 wires to the CPU (and to vcc and gnd ofc):
>=20
> TP_CLK -> GPF4/PS2CLK2/5VT (EC)
> TP_DATA -> GPF5/PS2DAT2/5VT (EC)
> TP_I2C_CLK -> BD21 -> GPP_C17/I2C0_SCL
> TP_I2C_DAT -> BC22 -> GPP_C16/I2C0_SDA
> LID_SW# -> GPB1/LID_SW# (EC)
> TP_ATTN# -> BC48 -> GPP_R12/CLKOUT_48
>=20
> Looking at
> https://elixir.bootlin.com/linux/v5.13/source/drivers/pinctrl/intel/pinct=
rl-
> tigerlake.c the CPU pins are:
> PINCTRL_PIN(37, "CLKOUT_48"),
> PINCTRL_PIN(121, "I2C0_SDA"),
> PINCTRL_PIN(122, "I2C0_SCL"),
>=20
> I hope this information helps.

Assuming that ATTN# pin is the one that has to be used as IRQ (anybody to l=
ook
into TouchPad datasheet?) and the schematic is correct, the pin should be 37
and not 57 (seems like a typo in the BIOS code, typographically 3 and 5 are
close enough).

To test this theory (and it sounds plausible because pin is in GPIO mode and
with out ACPI flag set) one can try to hack the kernel here [1] by doing
something like this:

  /* HACK! HACK! HACK! */
  if (pin =3D=3D 57)
    pin =3D 37;

[1]:
https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib-acpi.c#=
L127

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
