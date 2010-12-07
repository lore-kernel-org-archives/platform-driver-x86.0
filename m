From: Tim Gardner <tim.gardner@canonical.com>
Subject: Re: Sony Vaio wwan not powered by default
Date: Tue, 07 Dec 2010 08:55:04 -0700
Message-ID: <4CFE58D8.9030309@canonical.com>
References: <4CF41062.4090009@canonical.com> <20101204112112.GA3156@kamineko.org>
Reply-To: tim.gardner@canonical.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.tpi.com ([70.99.223.143]:1093 "EHLO mail.tpi.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753848Ab0LGPzI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Dec 2010 10:55:08 -0500
In-Reply-To: <20101204112112.GA3156@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

On 12/04/2010 04:21 AM, Mattia Dongili wrote:
> On Mon, Nov 29, 2010 at 01:43:14PM -0700, Tim Gardner wrote:
>> Ubuntu has been carrying the attached patch since 2.6.28. Shouldn't
>> it be upstream?
>
> Maybe, I replied to you asking more information 6 months ago when you
> first(?) submitted the patch.

Sorry - I may have just missed it. Besides, I can't even remember having 
written the patch to begin with, probably because it was April 2009.

> Also, this being a TZ specific issue the DMI entry seems a bit wide.
> Last, the correct way to fix this would probably be making the SPIC part
> of the driver also use the rfkill API.
>

Being basically lazy I think I'll just continue to carry this patch 
until someone hollers that its breaking something, or it conflicts with 
something you send upstream.

rtg
-- 
Tim Gardner tim.gardner@canonical.com
