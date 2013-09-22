From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony-laptop crash (Sony VPC SE 1V9E) for 3.8.0+
Date: Sun, 22 Sep 2013 16:55:53 +0900
Message-ID: <20130922075553.GA11177@kamineko.org>
References: <51FE2F39.4080504@gmail.com>
 <20130804221454.GB7707@kamineko.org>
 <51FEF199.7050800@gmail.com>
 <20130808221742.GA27435@kamineko.org>
 <523E1206.8080001@gmail.com>
 <20130922031001.GA6901@kamineko.org>
 <523E9296.2000303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:41751 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752192Ab3IVHzq convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 22 Sep 2013 03:55:46 -0400
Content-Disposition: inline
In-Reply-To: <523E9296.2000303@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco =?iso-8859-1?Q?Kr=FCger?= <krgsch@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Sun, Sep 22, 2013 at 08:47:50AM +0200, Marco Kr=FCger wrote:
> The patch works as expected.
> ...
> [   49.590035] sony_laptop: Sony Notebook Control Driver v0.6
> [   49.590104] input: Sony Vaio Keys as /devices/LNXSYSTM:00/device:0=
0/PNP0A08:00/device:01/SNY5001:00/input/input8
> [   49.590162] input: Sony Vaio Jogdial as /devices/LNXSYSTM:00/devic=
e:00/PNP0A08:00/device:01/SNY5001:00/input/input9
> [   49.595169] sony_laptop: handle 0x014b: keyboard backlight setup
> already done for 0x0143
> [   49.595174] sony_laptop: couldn't set up keyboard backlight
> function (-16)
> [   49.595255] sony_laptop: brightness ignored, must be controlled
> by ACPI video driver
> ...
>=20
> Issues left:
> a)  The wrong gfx switch reading as mentioned in my last mail.

what kernel version are you using? 3.11 is supposed to have a fix for
that. is it still wrong after that?

> b) Different mapping for timeout settings:
> Modinfo gives me:
> "parm: kbd_backlight_timeout:set this to 0 to set the default 10
> seconds timeout, 1 for 30 seconds, 2 for 60 seconds and 3 to disable
> timeout (default: 0) (int)"
>=20
> My mapping is: 0 -> disabled, 1-> 10 seconds, 2-> 30 seconds, 3 ->
> 60 seconds

ha! I guess this is not particularly pressing, it's just the help text
that is incorrect, right?

--=20
mattia
:wq!
