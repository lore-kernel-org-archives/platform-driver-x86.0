From: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: Dual-LVDS Acer Iconia laptop
Date: Tue, 06 Dec 2011 18:48:17 +0100
Message-ID: <4EDE5561.5050005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:56320 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796Ab1LFRsU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Dec 2011 12:48:20 -0500
Received: by eaak14 with SMTP id k14so5386021eaa.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Dec 2011 09:48:19 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com, mjg59@srcf.ucam.org, mathieu.magnaudet@enac.fr, baptiste@jonglez.org, platform-driver-x86@vger.kernel.org

Hi Guys,

I've seen on the list that some of you (as we were) have troubles with
the second screen on the iconia laptop.

In our lab, we managed to make it work by using two patches:
* http://web.archiveorange.com/archive/v/rNRcWX4nB2U5uRmbLm9h (LVDS are
digital as well), this solved the "xrandr disconnected" issue
* a small patch we are finalizing to call the right DMI function to
light up the second LCD.

So, as soon as we have clean this code, this bug will be solved.

Cheers,
Benjamin

PS: I'm sorry to start a new thread as I just registered myself on the
list and was not able to get the previous Message-ID.
