From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [dell-wmi] Dell Vostro 3360 extra multimedia keys don't work
Date: Tue, 15 Apr 2014 00:29:52 +0300
Message-ID: <1498861.9DHIbmNtA9@spock>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from natalenko.name ([78.47.77.148]:56189 "EHLO natalenko.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754354AbaDNVgY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Apr 2014 17:36:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>

Hello.

Got Dell Vostro 3360 with extra multimedia keys as shown here [1], but no luck 
to get them work.

While pressing keys "1" and/or "2" I get the following notice in dmesg:

===
dell_wmi: Unknown key e0f0 pressed
===

On pressing key "3" I get the following:

===
atkbd serio0: Unknown key pressed (translated set 2, code 0x60 on 
isa0060/serio0).
atkbd serio0: Use 'setkeycodes 60 <keycode>' to make it known.
===

Watching /proc/interrupts shows that this line:

===
9:      29836        223         96         48   IO-APIC-fasteoi   acpi
===

increments by 2 on pressing each key, and this line:

===
  1:     431013      24838       2688       2270   IO-APIC-edge      i8042
===

Also increments by 1 on pressing key "3".

Running evtest produces the following output [2] with to reaction on keys 
pressing.

acpidump output is also here [3].

Could this be fixed?

[1] 
http://beta.hstor.org/files/c3b/a26/628/c3ba26628409486f8b9ae16d97be7d21.jpg
[2] https://gist.github.com/10683923
[3] https://gist.github.com/10683992

-- 
Oleksandr post-factum Natalenko, MSc
pf-kernel community
https://natalenko.name/
