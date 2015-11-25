From: Andrei Borzenkov <arvidjaar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Wed, 25 Nov 2015 11:34:18 +0300
Message-ID: <CAA91j0UeA5=Jxt97xjYiruOSvMs1sj1KmjA8G5shj=4c7e-Ezg@mail.gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34116 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753618AbbKYIeT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Nov 2015 03:34:19 -0500
Received: by obbbj7 with SMTP id bj7so33665148obb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2015 00:34:18 -0800 (PST)
In-Reply-To: <565530D4.3080809@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Wed, Nov 25, 2015 at 6:53 AM, Andrei Borzenkov <arvidjaar@gmail.com> wrote:
>
> This makes those notifications at wake up not spurious at all - they are
> actually pretty logical, and serve to make OS ascertain current status
> of radio kill switch. But I am pretty much confident that those events
> do NOT mean to be used as request to toggle kill switch state.
>

Pretty much what Alex said already :)

https://lkml.org/lkml/2014/12/24/113
