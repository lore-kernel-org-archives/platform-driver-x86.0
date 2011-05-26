From: Alberto Mardegan <mardy@users.sourceforge.net>
Subject: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Thu, 26 May 2011 21:27:30 +0300
Message-ID: <4DDE9B92.3090504@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:39114 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753892Ab1EZS1e (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2011 14:27:34 -0400
Received: by eyx24 with SMTP id 24so387355eyx.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2011 11:27:33 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: "Javier S. Pedro" <maemo@javispedro.com>, Ike Panhc <ike.pan@canonical.com>

Hi all,
  I'd like to add support for the accelerometer sensor which is found in
the Lenovo Ideapad S10-3t.

I would use this code as a starting point (kudos to Javier):
http://gitorious.org/iaps/lsrot/blobs/master/lsrot.c
The code uses the WMI interfaces to get notified of coarse orientation
changes.
But how should these changes be reported to userspace? Should they go
through the input subsystem (I didn't find any suitable key codes to
report these events), or via the /sys filesystem? In the latter case, is
there a convention on naming and reporting data from devices of this kind?


Secondly, I'd like to add support for reading the accelerometer values,
as it's done here (again, kudos to Javier):
http://gitorious.org/iaps/iaps/blobs/master/iaps.c
I know that no one is happy of directly accessing the raw I/O ports, but
all my attempts of reading these values through the ACPI interfaces or
the EC fields have failed: the fields are always set to 0.
So, what I plan to do is to check the DMI information, and if the
machine is a S10-3t I would you the code linked above to read and report
the accelerometer values. Would that be acceptable?


And finally: should the changes above be made to the existing
ideapad-laptop.c file, or should they go to a separate file/module?

TIA,
  Alberto

-- 
http://blog.mardy.it <- geek in un lingua international!
