From: Mattia Dongili <malattia@linux.it>
Subject: Re: Commit 7751ab8e600f26e10c2ba12a92d48a4852a51da8
Date: Fri, 15 Apr 2011 07:42:11 +0900
Message-ID: <20110414224210.GA9459@kamineko.org>
References: <4D9B4094.4010609@absence.it>
 <20110412152009.GA32032@srcf.ucam.org>
 <4DA5D45A.9070901@absence.it>
 <20110413165344.GA739@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:51444 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754158Ab1DNWmN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Apr 2011 18:42:13 -0400
Received: by pwi15 with SMTP id 15so804388pwi.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Apr 2011 15:42:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20110413165344.GA739@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Marco Chiappero <marco@absence.it>, platform-driver-x86@vger.kernel.org, Javier Achirica <achirica@gmail.com>

On Wed, Apr 13, 2011 at 05:53:44PM +0100, Matthew Garrett wrote:
> On Wed, Apr 13, 2011 at 06:50:34PM +0200, Marco Chiappero wrote:
> 
> > I agree. The DSDT of any ALS equipped Vaio provides us 9 backlight
> > levels (that are LCD/model specific), so the first and the last ones
> > define our useful operating range, which is always different from
> > 0-255 (eg. 13-255 for the Vaio S, 52-255 for the Vaio F, 7-182 for
> > the Vaio Z, 7-213 for the Vaio TT and so on). However the code to
> > retrieve and use those lower and upper bounds is still lacking
> > upstream (I, Javier Achirica and many other people are testing a
...
> Can this code be merged within the next week? If not I agree that it'd 

yes, I'll try to get it ready over the weekend. The patch itself should
be relatively innocuous.

-- 
mattia
:wq!
