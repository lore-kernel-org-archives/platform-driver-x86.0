From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v2 00/16] samsung-laptop updates
Date: Thu, 15 Dec 2011 07:50:22 +0100
Message-ID: <CAHR064h=ooX4hj5Ycvw2=gSOYCcyw=W3Ffj6zh2TPUPfw--apw@mail.gmail.com>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
	<20111127042321.GH17802@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:46483 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932251Ab1LOGuZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Dec 2011 01:50:25 -0500
Received: by eaaj10 with SMTP id j10so1575808eaa.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2011 22:50:24 -0800 (PST)
In-Reply-To: <20111127042321.GH17802@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Sun, Nov 27, 2011 at 5:23 AM, Greg KH <greg@kroah.com> wrote:
> On Sat, Nov 26, 2011 at 10:59:57AM +0100, Corentin Chary wrote:
>> Hi Matthew, Greg
>>
>> I recently got a Samsung Series 9 from Intel, so I took some
>> time to add support for some features.
>>
>> In this series, I moved a lot of code, tried to follow more
>> closely the SABI interface, added some features, and did
>> some cleanups.
>>
>> Patches were tested on my laptop, N210 and N150. I'd greatly
>> appreciateany feedback from other models.
>>
>> I also propose myself as a maintainer for this driver, since
>> thislaptop is now my primary system.
>
> Very nice fixes, thanks for making the requested changes.
>
> I've now acked all of these patches, Matthew, please queue them up for
> the 3.3 kernel.
>
> greg k-h

Seems to be on Matthew's tree
(git://cavan.codon.org.uk/platform-drivers-x86.git).

Matthew, do you plan to moving back to kernel.org someday ? Or is this
a permanent tree ?

Thanks

-- 
Corentin Chary
http://xf.iksaif.net
