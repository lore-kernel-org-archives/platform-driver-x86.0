From: "Alexander E. Patrakov" <patrakov@gmail.com>
Subject: ACPI keys for Sony VAIO VPC-Z23A4R laptop
Date: Tue, 31 Jul 2012 20:38:10 +0200
Message-ID: <CAN_LGv17f+DHvPO0DOpuBp10Rf6W-FSFu2Juk9OA-8_+atfbhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:59200 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752368Ab2GaSiL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 Jul 2012 14:38:11 -0400
Received: by vbbff1 with SMTP id ff1so6094690vbb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Jul 2012 11:38:10 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Mattia Dongili <malattia@linux.it>

Hello.

The current sony-laptop driver supports some, but not all of the Sony
VAIO VPC-Z23A4R special keys. Please improve it, I am ready to test
patches!

So here is what the special keys produce on /proc/acpi/event (first
line = press, second line = release):

Fn-F1 (disable/enable touchpad):
sony/hotkey SNC 00000001 0000000c
sony/hotkey SNC 00000001 0000003b
no effect, no keycodes

Fn-F2, Fn-F3, fn-F4 (mute, volume up, volume down): produce nothing,
work as expected

Fn-F5 (brightness down):
sony/hotkey SNC 00000001 00000010
sony/hotkey SNC 00000001 0000003b
works as expected in GNOME 3.4

Fn-F6 (brightness up):
sony/hotkey SNC 00000001 00000011
sony/hotkey SNC 00000001 0000003b
works as expected in GNOME 3.4

Fn-F7 (display switch):
sony/hotkey SNC 00000001 00000012
sony/hotkey SNC 00000001 0000003b
works as expected

Fn-F8: unused, produces nothing

Fn-F9 (zoom out):
sony/hotkey SNC 00000001 00000014
sony/hotkey SNC 00000001 0000003b
no effect, no keycodes

Fn-F10 (zoom in):
sony/hotkey SNC 00000001 00000015
sony/hotkey SNC 00000001 0000003b
no effect, no keycodes

Fn-F11: unused, produces nothing

Fn-F12 (suspend):
sony/hotkey SNC 00000001 00000017
sony/hotkey SNC 00000001 0000003b
works as expected

ASSIST:
sony/hotkey SNC 00000001 00000028
sony/hotkey SNC 00000001 00000038
produces the Help keycode

WEB:
no output, produces the HomePage keycode

VAIO:
sony/hotkey SNC 00000001 00000049
sony/hotkey SNC 00000001 00000038
no effect, no keycodes

-- 
Alexander E. Patrakov
