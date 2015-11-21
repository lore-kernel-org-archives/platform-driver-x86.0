From: Andrei Borzenkov <arvidjaar@gmail.com>
Subject: Regression with dell-rbtn: radio killed on resume after suspend to
 RAM
Date: Sat, 21 Nov 2015 21:57:18 +0300
Message-ID: <5650BE8E.2080506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:36139 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752293AbbKUS5V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 Nov 2015 13:57:21 -0500
Received: by lbblt2 with SMTP id lt2so78050580lbb.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2015 10:57:20 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

After installing 4.2 on Dell Latitude E5450 I found that wireless was 
disabled every second resume from suspend to RAM. Blacklisting dell-rbtn 
"fixed" it.

This is probably the same as discussed in this Arch forum and related 
bug report: https://bbs.archlinux.org/viewtopic.php?id=203404. I myself 
hit it on Ubuntu.

I am not familiar with other models, but E5450 does have DELLABCE and so 
is using dell-rbtn driver.

I am happy to test patches if need. Please let me know if formal bug 
report is required.

-andrei
