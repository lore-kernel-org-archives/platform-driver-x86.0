From: Jens Kapitza <j.kapitza@schwarze-allianz.de>
Subject: Medion  S4216 (BUG rfkill)
Date: Mon, 03 Dec 2012 10:27:34 +0100
Message-ID: <50BC7086.8060903@schwarze-allianz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.legal.de ([46.38.240.131]:53371 "EHLO mail.legal.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751546Ab2LCJhY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Dec 2012 04:37:24 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.legal.de (Postfix) with ESMTP id 5DB0C606089B
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Dec 2012 09:27:40 +0000 (UTC)
Received: from mail.legal.de ([127.0.0.1])
	by localhost (mail.legal.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BTBcs3rdzUH for <platform-driver-x86@vger.kernel.org>;
	Mon,  3 Dec 2012 09:27:34 +0000 (UTC)
Received: from [134.91.53.250] (unknown [134.91.53.250])
	by mail.legal.de (Postfix) with ESMTPSA id DFA2E6060667
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Dec 2012 09:27:34 +0000 (UTC)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hello,

after  linux-wireless list said i should move to acpi wmi list (cause my 
problem seems to be a interrupt problem from bios / uefi?)


This modules are loaded

wmi                    19070  1 mxm_wmi



Problem:

there are not all Fn-Keys working
and after suspend the bios do a hardkill for wlan-atenna

rfkill can't unblock it.

can anyone tell me how to debug it better.
(it's just the wlan which is not working as expected after resume from 
suspend)

jens@jens-S4216:~$ uname -a
Linux jens-S4216 3.6.7 #2 SMP Sat Nov 24 19:30:21 CET 2012 x86_64 x86_64 
x86_64 GNU/Linux


Can anyone help me to get further?


Thanks in advance, Jens Kapitza
