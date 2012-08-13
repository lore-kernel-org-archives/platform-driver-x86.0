From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: Re: [PATCH] apple-gmux: Add support for message box interface (as
 found in MBP10,1/Retina MacBook Pro)
Date: Mon, 13 Aug 2012 20:01:33 +0200
Message-ID: <502940FD.4090202@vmars.tuwien.ac.at>
References: <5028CC19.6070003@vmars.tuwien.ac.at> <20120813170908.GC24088@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:52493 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751946Ab2HMSCD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 14:02:03 -0400
In-Reply-To: <20120813170908.GC24088@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Andreas Heider <andreas@meetr.de>, Greg KH <gregkh@linuxfoundation.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/13/2012 07:09 PM, Seth Forshee wrote:
> Matthew also made some progress with this last week, at least
> enough to get the backlight working. From what I remember of
> looking at his changes these look fairly similar, but I think his
> implementation looked cleaner and possibly more complete.
Aw.. pity; then I wasted ~8h :/ .. but I had fun anyway.  Is there
another (patch) thread where this is already discussed?

>> I see that there is a lot going on concerning and related to the 
>> apple-gmux currently: https://lkml.org/lkml/2012/7/9/715 
>> https://lkml.org/lkml/2012/8/3/300
> 
> I'm slowly making progress on the graphics switching stuff. I've
> got patches for vga_switcheroo and apple-gmux that make the muxing
> itself work fine, the problems now all revolve around making the
> graphics drivers deal with difficult behavior from Apple machines.
Looking forward to it, although the essential stuff (for Intel GPU
operation only) already works well for me.
In case you need something tested you can always CC me!

Bernhard
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlApQP0ACgkQ6iVUjPs37Jm7WQCghCtWUtyrD0huaLRMvDIH2CHY
3D8AnRS2YScrV2tCFJM8Ls9g1zNrueoi
=QAPV
-----END PGP SIGNATURE-----
