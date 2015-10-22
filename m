From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 10:28:21 +0200
Message-ID: <CABFtUbQi-x8DCwm1gSC6ifAZec-n==xh_dTM79PhQSEsxNJ9CA@mail.gmail.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
	<bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
	<20151021085724.GA87951@vmdeb7>
	<20151021091954.GD15219@pali>
	<20151021110059.GF15219@pali>
	<20151021111243.GB87951@vmdeb7>
	<20151022081725.GC2581@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:32880 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768AbbJVI2W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 04:28:22 -0400
Received: by qgeo38 with SMTP id o38so50185462qge.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 01:28:21 -0700 (PDT)
In-Reply-To: <20151022081725.GC2581@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

2015-10-22 10:17 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Oct 21, 2015 at 01:12:43PM +0200, Darren Hart wrote:
>> From what I can tell, the XPS 13 has a TOGGLE type rfkill button (Fn-PrtScrn):
>>
>> http://www.trustedreviews.com/dell-xps-13-2015-photos-11
>
> The reporter states his radio toggle is on F2, so it is not the above machine,
> probably this one:
>
> http://www.ibtimes.co.uk/dell-xps-13-review-ultrabook-341773
>
> In any case, his logs confirm we are seeing a TOGGLE type which is using the
> input mechanism.

According to the dmesg it's an XPS13 9333, which is the one I own.

> --
> Darren Hart
> Intel Open Source Technology Center
