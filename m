From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: Re: [PATCH] apple-gmux: Add support for message box interface (as
 found in MBP10,1/Retina MacBook Pro)
Date: Mon, 13 Aug 2012 20:59:41 +0200
Message-ID: <50294E9D.8050905@vmars.tuwien.ac.at>
References: <5028CC19.6070003@vmars.tuwien.ac.at> <20120813170908.GC24088@thinkpad-t410> <502940FD.4090202@vmars.tuwien.ac.at> <20120813181700.GD24088@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:52504 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752174Ab2HMS7u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 14:59:50 -0400
In-Reply-To: <20120813181700.GD24088@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Andreas Heider <andreas@meetr.de>, Greg KH <gregkh@linuxfoundation.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/13/2012 08:17 PM, Seth Forshee wrote:
> It was discussed briefly on irc.
> 
> http://irclogs.ubuntu.com/2012/08/09/%23ubuntu-kernel.txt
> 
Yes, it's very similar. Don't want to start any wars here ;) but:
>>> but I think his implementation looked cleaner
I only occasionally write kernel code, but can't there be any
concurrency issues during reads/writes of internal gmux registers (I
used a semaphore to prevent that)? Especially if vga_switcheroo also
taps in?

Aw.. maybe we should wait until Matthew actually posts his patch.
Seems like we invested both some work, pity that I didn't know of it.

Bernhard
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlApTp0ACgkQ6iVUjPs37Jne4gCgnCevVFS0pbZzeRp8I2IYPeFS
tIgAoMbaS09L6iQtIr+YzhmFwEg83fXa
=JJHD
-----END PGP SIGNATURE-----
