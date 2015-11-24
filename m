From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Tue, 24 Nov 2015 09:32:59 +0100
Message-ID: <20151124083259.GB29874@pali>
References: <5650BE8E.2080506@gmail.com>
 <201511212008.46761@pali>
 <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali>
 <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com>
 <20151123192943.GY7413@malice.jf.intel.com>
 <56539427.5090304@gmail.com>
 <5653E243.9010707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:32993 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751730AbbKXIdD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Nov 2015 03:33:03 -0500
Received: by wmec201 with SMTP id c201so196742077wme.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2015 00:33:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5653E243.9010707@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Borzenkov <arvidjaar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

On Tuesday 24 November 2015 07:06:27 Andrei Borzenkov wrote:
> I am not sure whether keyboard key should be treated as hard or soft =
(i.e. I
> do not know how to verify that radio is switched off without OS runni=
ng),
> but I still expect the same behavior in both cases.
>=20

rbtn is translated to rfkill only if type is HW slider switch, not
toggle key! And HW slider switch cannot be overwritten by SW, so it is
hard rfkill.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
