From: Jens Kapitza <j.kapitza@schwarze-allianz.de>
Subject: mxm_wmi  and wmi (help)
Date: Tue, 19 Feb 2013 12:10:06 +0100
Message-ID: <51235D8E.3010302@schwarze-allianz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.legal.de ([46.38.240.131]:45079 "EHLO mail.legal.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932354Ab3BSLQn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Feb 2013 06:16:43 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.legal.de (Postfix) with ESMTP id 782076060558
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Feb 2013 11:10:12 +0000 (UTC)
Received: from mail.legal.de ([127.0.0.1])
	by localhost (mail.legal.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsZIvlQGEKvp for <platform-driver-x86@vger.kernel.org>;
	Tue, 19 Feb 2013 11:10:07 +0000 (UTC)
Received: from [134.91.77.98] (unknown [134.91.77.98])
	by mail.legal.de (Postfix) with ESMTPSA id 2160860604D7
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Feb 2013 11:10:07 +0000 (UTC)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi @all,

I'm using  Linux jens-S4216 3.7.8 #1 SMP Fri Feb 15 20:22:32 CET 2013 
x86_64 x86_64 x86_64 GNU/Linux

since 3.6.9 i've the same problem

after going to standby my wireless nic is in hardware block state.


can someone help me to solve my problem?

I don't know how to debug acpi calls (or spezial keys like Fn+?) the 
driver mxm_wmi make sound controll possible but ends up in an endless 
loop after pressing one key. (whole system freeze)

Thanks in advanced

Jens Kapitza
