From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: Re: [PATCH V2 2/2] apple_gmux: Add support for newer hardware
Date: Tue, 14 Aug 2012 16:53:47 +0200
Message-ID: <502A667B.2060100@vmars.tuwien.ac.at>
References: <1344898369-4944-1-git-send-email-mjg@redhat.com> <1344898369-4944-2-git-send-email-mjg@redhat.com> <20120814004625.GB18992@thinkpad-t410> <502A5B40.9010303@vmars.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:52658 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905Ab2HNOx5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 14 Aug 2012 10:53:57 -0400
In-Reply-To: <502A5B40.9010303@vmars.tuwien.ac.at>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Only in relation to Seth's future apple-gmux patch series about
vgaswitcheroo and restoring the gmux device configuration across
suspend/resume [1]:
On resume the gmux registers 0x28 (DDC) and 0x10 (SWITCH_DISPLAY)
(i.e., the first two writes) are not restored (result: the screen
remains black after suspend/resume).

Of course, this does not happen with my patch proposal ;)
Unfortunately, I have not the time to sort this out in the next couple
of days -- on the other hand this is probably not a problem w.r.t.
this patch, but needs to be taken care of in Seth's patch series.

Bernhard

[1] http://people.canonical.com/~sforshee/apple-gmux-patches/


On 08/14/2012 04:05 PM, Bernhard Froemel wrote:
> Please reduce the delay in the gmux_index_wait_[ready|complete] 
> functions: 100ms is way too long. 1 ms is more than enough. I
> never experienced any problems with 100 us.
> 
> The version information can also be extracted in the new gmux
> device (see my initial patch proposal).
> 
> Bernhard
> 
> On 08/14/2012 02:46 AM, Seth Forshee wrote:
>> On Mon, Aug 13, 2012 at 06:52:49PM -0400, Matthew Garrett wrote:
>>> New gmux devices have a different method for accessing the 
>>> registers. Update the driver to cope. Incorporates feedback
>>> from Bernhard Froemel.
>>> 
>>> Signed-off-by: Matthew Garrett <mjg@redhat.com> Cc: Bernhard 
>>> Froemel <froemel@vmars.tuwien.ac.at> Cc: Seth Forshee 
>>> <seth.forshee@canonical.com>
> 
>> Acked-by: Seth Forshee <seth.forshee@canonical.com>
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAqZnsACgkQ6iVUjPs37JlYfwCcCH17qDbQO2xqhlOsqjliVWA/
bm0AnAyeh7pprGvS8qdTAvB0c3RYJsFc
=pQxQ
-----END PGP SIGNATURE-----
