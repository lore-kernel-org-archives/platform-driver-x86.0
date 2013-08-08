From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony-laptop crash (Sony VPC SE 1V9E) for 3.8.0+
Date: Fri, 9 Aug 2013 07:17:42 +0900
Message-ID: <20130808221742.GA27435@kamineko.org>
References: <51FE2F39.4080504@gmail.com>
 <20130804221454.GB7707@kamineko.org>
 <51FEF199.7050800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:38480 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758182Ab3HHWRp convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Aug 2013 18:17:45 -0400
Content-Disposition: inline
In-Reply-To: <51FEF199.7050800@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco =?iso-8859-1?Q?Kr=FCger?= <krgsch@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

[Resending as I don't see this mail on the list nor on online archives]

Hi Marco.

On Mon, Aug 05, 2013 at 02:28:09AM +0200, Marco Kr=FCger wrote:
> Am 05.08.2013 00:14, schrieb Mattia Dongili:
=2E..
> >case 0x0143:
> >case 0x014b:
> >
> >Could you send your DSDT?
> My DSDT in raw/decompiled format.


You have two essentially very similar methods to control backlight
(screen, keyboard and ambient light sensor): F143 and F14B.
I should probably fix the code to handle one such situation but have yo=
u
by any chance checked if there is a BIOS update that fixes this mess?

=46or the record, only this bit seems different:

	If (LEqual (BUF1, 0x40))
	{
	    Store (0x40, P80H)
	    Store (BUF2, Local0)
-	    And (Local0, One, Local0)
+	    And (Local0, 0x03, Local0)
	    Store (Local0, ^^H_EC.KLPC)
	}

but we never call into this method with anything other than 0x1 or 0x0
in BUF2 so it won't make any difference at the moment which one we use.

Still it would be interesting to know what happens with 0x2 or 0x3. Do
you remember what states you could set in Windows for the keyboard
backlight?

Thanks
--=20
mattia
:wq!
