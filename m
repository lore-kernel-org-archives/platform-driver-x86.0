From: =?ISO-8859-1?Q?Richard_Sch=FCtz?= <r.schtz@t-online.de>
Subject: Re: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Sat, 28 May 2011 14:03:20 +0200
Message-ID: <4DE0E488.8040108@t-online.de>
References: <4DDE9B92.3090504@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout08.t-online.de ([194.25.134.20]:44978 "EHLO
	mailout08.t-online.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753006Ab1E1MUA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 May 2011 08:20:00 -0400
In-Reply-To: <4DDE9B92.3090504@users.sourceforge.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alberto Mardegan <mardy@users.sourceforge.net>
Cc: platform-driver-x86@vger.kernel.org, "Javier S. Pedro" <maemo@javispedro.com>, Ike Panhc <ike.pan@canonical.com>

On 05/26/11 20:27, Alberto Mardegan wrote:
> Secondly, I'd like to add support for reading the accelerometer value=
s,
> as it's done here (again, kudos to Javier):
> http://gitorious.org/iaps/iaps/blobs/master/iaps.c
> I know that no one is happy of directly accessing the raw I/O ports, =
but
> all my attempts of reading these values through the ACPI interfaces o=
r
> the EC fields have failed: the fields are always set to 0.
> So, what I plan to do is to check the DMI information, and if the
> machine is a S10-3t I would you the code linked above to read and rep=
ort
> the accelerometer values. Would that be acceptable?

I'm wondering if the accelerometer driver is also compatible with the=20
ThinkPad SL laptops. It is said that their firmwares are quite similar=20
to the IdeaPad ones. As they have quasi nothing in common with the=20
normal ThinkPad series there's no support for them in=20
thinkpad-acpi/hdaps/tp_smapi.

I compiled the iaps module and loaded it successfully on my ThinkPad SL=
=2E=20
There is also data passed by the driver to the input subsystem, when I=20
move the laptop. Is there a way to validate this data?

--=20
Regards,
Richard Sch=FCtz
