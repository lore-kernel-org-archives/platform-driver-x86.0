From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: Re: [PATCH V2 2/2] apple_gmux: Add support for newer hardware
Date: Tue, 14 Aug 2012 19:11:19 +0200
Message-ID: <502A86B7.8010402@vmars.tuwien.ac.at>
References: <1344898369-4944-1-git-send-email-mjg@redhat.com> <1344898369-4944-2-git-send-email-mjg@redhat.com> <20120814004625.GB18992@thinkpad-t410> <502A5B40.9010303@vmars.tuwien.ac.at> <502A667B.2060100@vmars.tuwien.ac.at> <20120814151543.GD18992@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:52666 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931Ab2HNRL2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 14 Aug 2012 13:11:28 -0400
In-Reply-To: <20120814151543.GD18992@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/14/2012 05:15 PM, Seth Forshee wrote:
> On Tue, Aug 14, 2012 at 04:53:47PM +0200, Bernhard Froemel wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Only in relation to Seth's future apple-gmux patch series about 
>> vgaswitcheroo and restoring the gmux device configuration across 
>> suspend/resume [1]: On resume the gmux registers 0x28 (DDC) and
>> 0x10 (SWITCH_DISPLAY) (i.e., the first two writes) are not
>> restored (result: the screen remains black after
>> suspend/resume).
>> 
>> Of course, this does not happen with my patch proposal ;) 
>> Unfortunately, I have not the time to sort this out in the next
>> couple of days -- on the other hand this is probably not a
>> problem w.r.t. this patch, but needs to be taken care of in
>> Seth's patch series.
> 
> The patch adding support for switcheroo *does* restore those
> registers on resume. Are you saying that isn't happening when you
> use it?
Yes, the 8bit writes don't seem to get all through with Matthew's
patch, but they do with mine.

Just tested manual switching (/sys/kernel/debug/vgaswitcheroo/switch,
from IGD to DIS) -> doesn't work either; even locks up my system:

> [  123.680062] hda-intel: spurious response 0x407381:0x0, last
> cmd=0x770883 [  123.680070] hda-intel: spurious response
> 0x9000094:0x0, last cmd=0x770883 [  123.680073] hda-intel: spurious
> response 0x185600f0:0x0, last cmd=0x770883 [  123.680076]
> hda-intel: spurious response 0x4:0x0, last cmd=0x770883 [
> 123.680079] hda-intel: spurious response 0xb0a0908:0x0, last
> cmd=0x770883 [  123.680082] hda-intel: spurious response
> 0x407381:0x0, last cmd=0x770883 [  123.680084] hda-intel: spurious
> response 0x9000094:0x0, last cmd=0x770883 [  123.680087] hda-intel:
> spurious response 0x185600f0:0x0, last cmd=0x770883

While comparing our patches, I discovered that mine isnt' a good
reference here, because in my ready and complete function variants I
didn't write/read the correct ioports (forgot about the offset; so
they were only slightly delaying execution). After I fixed that (and a
status-bit semantic mixup), the results appear similar :/
Need to play around further..

Bernhard
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAqhrcACgkQ6iVUjPs37JnhtwCePUp7sLQW+GhBFOkFbkjr6Yrh
VAsAoJ3TjtJu2gQpayFc6iP5nBQfdAPG
=ziXd
-----END PGP SIGNATURE-----
