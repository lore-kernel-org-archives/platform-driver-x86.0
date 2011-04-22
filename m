From: Corentin Chary <corentin.chary@gmail.com>
Subject: What's the state of "i915: Add native backlight controllogin register
 about" ?
Date: Fri, 22 Apr 2011 07:50:57 +0200
Message-ID: <BANLkTind6Bbq3=9S418QtcO59do_dOU+xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:54225 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751142Ab1DVFvA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Apr 2011 01:51:00 -0400
Received: by wwa36 with SMTP id 36so399060wwa.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Apr 2011 22:50:58 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>

Hi Matthew,
Recently I got a lot of complaint from people that wanted to use the
backlight to be as dim as on windows or their EeePC.
It seems that "setpci -s 00:02.0 f4.b=ff" do the trick, but I don't
really want to advertise this method.

I believe that https://patchwork.kernel.org/patch/480141/ (and the
rest the the series) would fix the issue in a more cleaner way.
I didn't found any re-send or new version., what's the current status
of this series ?

Thanks,
-- 
Corentin Chary
http://xf.iksaif.net
