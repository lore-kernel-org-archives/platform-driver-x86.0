From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: Re: [PATCH] apple-gmux: Add support for message box interface (as
 found in MBP10,1/Retina MacBook Pro)
Date: Mon, 13 Aug 2012 20:36:11 +0200
Message-ID: <5029491B.3020001@vmars.tuwien.ac.at>
References: <5028CC19.6070003@vmars.tuwien.ac.at> <20120813170908.GC24088@thinkpad-t410> <502940FD.4090202@vmars.tuwien.ac.at> <20120813181344.GA15931@kroah.com> <20120813182116.GE24088@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:52498 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938Ab2HMSgS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 14:36:18 -0400
In-Reply-To: <20120813182116.GE24088@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Andreas Heider <andreas@meetr.de>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/13/2012 08:21 PM, Seth Forshee wrote:
>> So with this patch you don't have to boot to os-x to change the
>> graphics card and it works properly?
No - although I only need to boot to OSX once and force integrated
GPU. The setting seems to remain persistent across reboots and power
cycles (probably stored somewhere as an EFI variable?).

Anyway, (like Seth and Matthew) I think the problem is i915 and not
the gmux device. It seems to me that if i915 has no output connected
during startup/module initialization it won't find one later on: e.g.
even though gmux is setup correctly I get a black screen and in my X log:
(WW) intel(0): No outputs definitely connected, trying again...


> 
> No, this one is only going to get you backlight control.
Actually, my patch only allows you to talk to the gmux device of
MBP10,1. Only with forcing the integrated GPU in OSX and with:
> [..] switching patch ([1], see patch 12), [..]
the MBP works well with the Intel GPU across reboots and suspends/resumes.
(With 'echo OFF > /sys/kernel/debug/vgaswitcheroo/switch' the discrete
GPU can be turned off and I get an estimate of 7 hours runtime on
lowest brightness settings)

Also in support of that the problem is with i915 is the fact that
actual runtime GPU switching works (2 times) if the MBP is booted with
the Intel GPU. See my post on the Ubuntu forums:
http://ubuntuforums.org/showpost.php?p=12167124&postcount=89

Bernhard

> 
> [1] http://people.canonical.com/~sforshee/apple-gmux-patches/
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlApSRsACgkQ6iVUjPs37JmWKQCePGdfscsbLOdSUp8TWbqUw48D
SFAAoLqE1ScnjFyhb/R2dNXxMrj59qQL
=+WH/
-----END PGP SIGNATURE-----
