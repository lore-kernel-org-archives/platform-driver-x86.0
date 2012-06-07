From: Padfoot <padfoot@exemail.com.au>
Subject: RE: acer-wmi - accelerometer patch - kernel 3.3.7
Date: Thu, 07 Jun 2012 10:32:01 +1000
Message-ID: <4FCFF681.2030905@exemail.com.au>
Reply-To: padfoot@exemail.com.au
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from pecan.exetel.com.au ([220.233.0.17]:42574 "EHLO
	smtp.po.exetel.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753339Ab2FGAvP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jun 2012 20:51:15 -0400
Received: from 76.43.233.220.static.exetel.com.au ([220.233.43.76] helo=[10.1.1.2])
	by smtp.po.exetel.com.au with esmtp (Exim 4.71)
	(envelope-from <padfoot@exemail.com.au>)
	id 1ScQdu-0001jA-5F
	for platform-driver-x86@vger.kernel.org; Thu, 07 Jun 2012 10:32:02 +1000
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

Just some feedback.

I have just patched the acer-wmi module with the acer accelerometer 
patch found here: 
http://blog.gmane.org/gmane.linux.drivers.platform.x86.devel/3350

Using Arch Linux kernel 3.3.7 on an Acer Iconia Tab W501.

The patch appears to be working perfectly. I now have the accelerometer 
configured and functioning on /dev/input/js* and even the accelerometer 
lock switch is working.

Excellent work all.

Looking forward to this patch being merged into a future kernel.

Cheers.
Lachlan.
