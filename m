From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Failed IRQ assignment for INT0002 on Braswell
Date: Tue, 21 Nov 2017 23:35:28 +0100
Message-ID: <1902393.IdeYHqtVB8@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vulcan.natalenko.name ([104.207.131.136]:35628 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751345AbdKUWfb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 17:35:31 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi, Hans.

v4.13 kernel introduced new fancy warning in the dmesg:

===
kernel: acpi INT0002:00: Device [GPED] is in always present list
kernel: genirq: Flags mismatch irq 9. 00010084 (INT0002) vs. 00002080 (acpi)
kernel: INT0002 Virtual GPIO INT0002:00: Error requesting IRQ 9: -16
kernel: INT0002 Virtual GPIO: probe of INT0002:00 failed with error -16
===

Looking at git log, I've found that this driver was indeed introduced in v4.13 
by the following commit:

===
commit 63dada87f7ef7d4a536765c816fbbe7c4b9f3c85
Author: Hans de Goede <hdegoede@redhat.com>
Date:   Mon Jun 12 22:55:46 2017 +0200
         
    platform/x86: Add driver for ACPI INT0002 Virtual GPIO device
===

I've checked DSDT disassembly for this device, and here is relevant snippet 
[1]. The only thing I currently understand there is that IRQ 9 is hard coded 
(line 64), but I'm not sure where those flags come from.

The hardware in J3710 CPU on ASRock J3710-ITX motherboard.

Next, I've found that you also faced this warning and posted some RFC patch 
[2], but unfortunately I do not see what that discussion ended up with.

It is not that I really need GPIO on this board, but it would be nice to get 
rid of this warning. Could you please point me to a possible fix or a way for 
further investigation?

Thanks.

Regards,
  Oleksandr

[1] https://gist.github.com/2c69d6e4eb4b5c256601847a9c6aec45
[2] https://patchwork.kernel.org/patch/9671783/
