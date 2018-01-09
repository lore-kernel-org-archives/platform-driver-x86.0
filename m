From: David Herrmann <dh.herrmann@gmail.com>
Subject: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Tue, 9 Jan 2018 14:19:24 +0100
Message-ID: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:40005 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751796AbeAINT0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Jan 2018 08:19:26 -0500
Received: by mail-io0-f174.google.com with SMTP id v30so18509076iov.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jan 2018 05:19:26 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

Hi

The thinkpad_acpi driver constantly reports about unhandled events on
my ThinkPad X1 5gen. The logs look like this:

kernel: thinkpad_acpi: unknown possible thermal alarm or keyboard event received
kernel: thinkpad_acpi: unhandled HKEY event 0x60b1
kernel: thinkpad_acpi: please report the conditions when this event
happened to ibm-acpi-devel@...

kernel: thinkpad_acpi: unknown possible thermal alarm or keyboard event received
kernel: thinkpad_acpi: unhandled HKEY event 0x60b0
kernel: thinkpad_acpi: please report the conditions when this event
happened to ibm-acpi-devel@...

I have no clue what triggers them. However, the 0x60b1 event seems to
notify about some kind of action, and 0x60b0 seems to notify about its
end (like FAN-START, and FAN-STOP). The 0x60b0 follows 0x60b1 usually
in a timespan between 1s-10s.

The event occurs even when the laptop is not moved/touched, but only
performs random computations. The first time this occurs is usually
during user-space startup, which might just be the time the module is
loaded. So far, I did not see any other event occurring before/after
it, which might give any hints.

What is the recommended way to deal with that? I am having a hard-time
figuring out what triggers it, but at the same time it spams the
system-logs to a degree that after 1h of uptime, the vast majority of
the system log is cluttered with those messages.

I can provide a patch to ignore these events in the driver? Or does
anyone have access to Lenovo developers to ask for help?

Thanks
David
