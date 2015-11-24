From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Tue, 24 Nov 2015 08:52:16 +0000
Message-ID: <20151124085215.GA7046@srcf.ucam.org>
References: <201511212008.46761@pali>
 <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali>
 <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com>
 <20151123192943.GY7413@malice.jf.intel.com>
 <56539427.5090304@gmail.com>
 <5653E243.9010707@gmail.com>
 <5654248E.8030505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54373 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571AbbKXJRj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Nov 2015 04:17:39 -0500
Content-Disposition: inline
In-Reply-To: <5654248E.8030505@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Andrei Borzenkov <arvidjaar@gmail.com>, Darren Hart <dvhart@infradead.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org

On Tue, Nov 24, 2015 at 09:49:18AM +0100, Gabriele Mazzotta wrote:
>=20
> Pali, what should we do for the case Latitude/Precision + RBTN_TOGGLE=
?

Are there any systems which claim Windows 8 support via OSI and which=20
don't implement the rbtn interface? If not, just add an ACPI dependency=
=20
to dell-laptop and have it skip the rfkill code on Windows 8 and later=20
systems. I never trusted that code, but Dell insisted that it would=20
always wor on Latitudes and Precisions=E2=80=A6

--=20
Matthew Garrett | mjg59@srcf.ucam.org
