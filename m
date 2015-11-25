From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Wed, 25 Nov 2015 09:35:18 +0100
Message-ID: <20151125083518.GA11536@pali>
References: <5650BE8E.2080506@gmail.com>
 <201511212008.46761@pali>
 <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali>
 <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com>
 <20151123192943.GY7413@malice.jf.intel.com>
 <56539427.5090304@gmail.com>
 <565530D4.3080809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37657 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754720AbbKYIf2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Nov 2015 03:35:28 -0500
Received: by wmww144 with SMTP id w144so59025423wmw.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2015 00:35:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <565530D4.3080809@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Borzenkov <arvidjaar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

On Wednesday 25 November 2015 06:53:56 Andrei Borzenkov wrote:
> So the actual problem is to differentiate between categories A and D.=
 Is
> it possible to do based on ACPI name (DELRBTN vs DELLABCE) or may be =
on
> return value of CRBT? If not we really need black/white list here bas=
ed
> on DMI or something.
>=20

I do not trust ACPI device names and ACPI HIDs. Maybe that return value
of CRBT can be useful. From information from Alex we know that 0 and 1
types are toggle buttons and 2 and 3 are HW slider switch. Maybe there
is also difference between 0 and 1?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
