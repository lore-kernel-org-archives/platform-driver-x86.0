From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Lenovo machines
Date: Fri, 16 Mar 2012 12:03:42 +0800
Message-ID: <4F62BB9E.3070508@canonical.com>
References: <1327546404.15260.18.camel@linux-s257.site> <1328258799-19665-1-git-send-email-ike.pan@canonical.com> <20120314215327.GA1510@burratino> <20120314220251.GB14166@kroah.com> <20120314221749.GF31686@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56468 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751Ab2CPEDw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 16 Mar 2012 00:03:52 -0400
In-Reply-To: <20120314221749.GF31686@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>, joeyli <jlee@suse.com>
Cc: Jonathan Nieder <jrnieder@gmail.com>, stable@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>, Andrey <andrey.k.p@gmail.com>

On 03/15/2012 06:17 AM, Jonathan Nieder wrote:
> Greg KH wrote:
>> On Wed, Mar 14, 2012 at 04:53:27PM -0500, Jonathan Nieder wrote:
> 
>>> Please consider applying 461e74377cfc (acer-wmi: No wifi rfkill on
>>> Lenovo machines, 2012-02-03) to the 3.2.y and 3.0.y trees.
>>
>> Now applied.
> 
> Thanks!  That was fast.
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Review the commit log of acer-wmi

For 3.2.y, this patch shall work fine.

But for 3.0.y, backport commit 1709adab is necessary or patch has no effect.

I will post the backport patch after.

Joey, can you review and ACK/NAK for this?
