From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony-laptop: fix SNC buffer calls when SN06 returns Integers
Date: Thu, 20 Dec 2012 07:08:03 +0900
Message-ID: <20121219220803.GA30941@kamineko.org>
References: <1355814524.19698.19.camel@rzhang1-mobl4>
 <20121218213958.GA28648@kamineko.org>
 <1355878834.2280.2.camel@rzhang1-mobl4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42410 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751725Ab2LSWIB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 Dec 2012 17:08:01 -0500
Content-Disposition: inline
In-Reply-To: <1355878834.2280.2.camel@rzhang1-mobl4>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wed, Dec 19, 2012 at 09:00:34AM +0800, Zhang Rui wrote:
> On Wed, 2012-12-19 at 06:39 +0900, Mattia Dongili wrote:
> > On Tue, Dec 18, 2012 at 03:08:44PM +0800, Zhang Rui wrote:
> > > Hi, Mattia,
> > 
> > Hi Rui!
> > 
> > > I generated a similar patch as yours but I still have one concern about the fix.
> > 
> > thanks for taking care of that.
> > 
> > > memcpy(buffer, (void *)&object->integer.value, len) may break the byte order but
> > > sony_nc_rfkill_setup() terminates if byte 0xff is checked.
> > > is this true? or am I thinking wrong?
> > 
> > You're correct, sony_nc_rfkill_setup() stops looking at the buffer as
> > soon as it hits 0xff but why do you think memcpy would break the byte
> > order?
> > 
> I'm not sure how SN06 works.
> say, you have supported codes 0x00, 0x10, and 0x20, what would SN06
> return?
> 0x001020FF00000000 or 0x00000000FF201000?

The return buffer is filled in sequentially and we go through it in the
same way in sony_nc_rfkill_setup(), it should be safe but here's an
example:

    Name (BUFF, Buffer (0x0410) {})                                                                              
    CreateDWordField (BUFF, Zero, BUFS)                                                                          
...

    Store (Zero, Local3)                                                                                 
    If (WLAP)                                                                                            
    {                                                                                                    
	Store (Zero, Index (BUFF, Local3))                                                               
	Add (Local3, One, Local3)                                                                        
    }                                                                                                    
													 
    If (BLTH)                                                                                            
    {                                                                                                    
	Store (0x10, Index (BUFF, Local3))                                                               
	Add (Local3, One, Local3)                                                                        
    }                                                                                                    
													 
    If (WNED)                                                                                            
    {                                                                                                    
	Store (0x20, Index (BUFF, Local3))                                                               
	Add (Local3, One, Local3)                                                                        
    }                                                                                                    

Then based on some odd consideration the method may return BUFF or BUFS
and that's where we have to take either integer.value or buffer.pointer.

Thanks!!
-- 
mattia
:wq!
