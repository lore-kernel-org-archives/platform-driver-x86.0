From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Subject: How to implement ACPI EC support?
Date: Wed, 31 Oct 2012 14:50:58 +0100
Message-ID: <50912CC2.2050902@profitbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:63536 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933628Ab2JaNu6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 31 Oct 2012 09:50:58 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so666684bkc.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Oct 2012 06:50:57 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org

Hi Henrique,

I've noticed the ACPI embedded controller (EC) support in the
"thinkpad_acpi" driver.

New Samsung laptops (NP530U3C, NP900X4B, NP900X3C, ...) also have an EC
which isn't supported by the generic ACPI driver. The lid, the battery
status and the power supply status are connected to it.

How did you implement the EC support in the thinkpad driver? Did you
have documentation or was it done by reverse engineering?

Could you have a look at the related kernel bugzilla bugs?:

https://bugzilla.kernel.org/show_bug.cgi?id=3D45461
https://bugzilla.kernel.org/show_bug.cgi?id=3D44161

Cheers,
Sebastian

--=20
Sebastian Riemer
Linux Kernel Developer - Storage

We are looking for (SENIOR) LINUX KERNEL DEVELOPERS!

ProfitBricks GmbH =95 Greifswalder Str. 207 =95 10405 Berlin, Germany
www.profitbricks.com =95 sebastian.riemer@profitbricks.com
