Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0CEC46467
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Jan 2023 13:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjAJN1c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Jan 2023 08:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238441AbjAJN0p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Jan 2023 08:26:45 -0500
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC01D431B9
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jan 2023 05:26:40 -0800 (PST)
Date:   Tue, 10 Jan 2023 13:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1673357196; x=1673616396;
        bh=zJPgx18sfNNY+dVsPt8olfzwY0xnBc+qWD13vLdabeY=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=i2SQmUs/gL54b79i03NhhJzqfR6g9T/VycY917GtHoiFoo1SwbGcKbnJNxPQ5BQs8
         g04rQ190L9YYACUY6D1YLm5CVL3DJl6Z9x9HgfxgiPiuQ7imb0HNIw03zng6y81qrg
         k8BDpaXvN6wgBrOxE7CguxqNmjjZIGixChA59b0IgrWTSfiO5/+l17rld6dKkzxMFG
         /cHMX9jrilugNSsZuW5plbpGQCsFzQDxZA/Wg66rtsRLKlkb8GzczS3nhEy+8zIiJS
         jyU4M2NnwaP2cV1khNXPbqiQrfhcMT9U2noRchNpHkAtNW8eXm+Di4iMrttM2Alwi+
         /Ax6aagyouHiQ==
To:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ike.pan@canonical.com" <ike.pan@canonical.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>
From:   John Martens <john.martens4@proton.me>
Subject: New Lenovo Legion Fan, Temperature, Power Mode Driver
Message-ID: <cchW8yA1BnN-yMnXp0EY8oKubzPC721jNMylHVzSVuf5C0YAhC7gYkSjhxIpZMv7K9hMw4ezLbxGEtEd7Gs_bAIoDizRSQG2V3Ql5nl5G_0=@proton.me>
Feedback-ID: 65421997:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Kernel devs, Mr. Hans de Goede, Mr. Ike Panhc,

I am currently working on a driver for fan control, fan speed, temperature =
sensors, and power mode (platform profile) for Lenovo Legion Laptops. Switc=
hing iGPU/dGPU could also be possible. It is a port of the closed and open =
tools in Windows LenovoLegionToolkit, Vantage, LegionFanControl. I am testi=
ng it on different laptops with the help of a forum/chat and its working qu=
ite good.

There is a README (https://github.com/johnfanv2/LenovoLegionLinux) and code=
 (https://github.com/johnfanv2/LenovoLegionLinux/blob/main/kernel_module/le=
gion-laptop.c).

I would be interested to get your opinion.

Questions

Should this extend ideapad_laptop.c or a new file?
    - pro:
        - both access parts of the same hardware
    - con:
        - both files are already quite large
        - it only works on Lenovo Legion laptops that have this=20
          custom control firmware in the embedded controller (EC)
        - there is almost no reuse of code

Which method do you prefer writing to EC memory for older models? With iore=
map or outb?=20
    - To use ioremap one needs to get the start address. It is
      different on Intel vs AMD. It is the same as a OperationRegion
      in the ACPI tables, e.g. "OperationRegion (ERAX, SystemMemory, =20
      0xFE00D400, 0xFF)". However, I have found no kernel functions =20
      to get the address (here 0xFE00D400) of a  OperationRegion. =20
      One could also hardcode it for each model/firmware.
    - alternative (which I am currently using) is sending commands   =20
      to IO ports 0x4E/0x4F (Super IO controller).=20

Background

The laptops come with an embedded controller (EC) from ITE. These usually c=
ome with a 3 point fan curve in ROM, but also can be flashed with a small a=
dditional custom program. Lenovo implemented implemented a 10 point fan cur=
ve. The program is also shipped with each EFI update.

The fan curve can be edited by writing to some memory locations in the EC. =
These locations are

The driver works by:
- directly writing/reading embedded controller memory
    - older models (2020-2021): there are two possibilities
        - the EC memory is already memory mapped, so one can=20
          use ioremap
        - one can use outb/inb and write sequenc of commands to=20
          port 0x43, 0x4F (super IO ports)
        - ideapad_laptop.c writes to some parts of EC memory=20
          with ACPI methods VPCR, VPCW. However, these do not seem =20
          to work in the memory region with the fan curve.
    - newer models (2022): these provide ACPI/WMI methods =20
      setFanCurve/getFanCurve to write to these regions. However, I =20
      have implemented that and have no models for testing

The driver works for the models 2020-2022. The code layout is heavily inspi=
red by the ideapad_laptop driver.

Best regards,

John Martens

