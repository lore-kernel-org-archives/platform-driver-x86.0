From: Marco Chiappero <marco@absence.it>
Subject: Re: Commit 7751ab8e600f26e10c2ba12a92d48a4852a51da8
Date: Wed, 13 Apr 2011 18:50:34 +0200
Message-ID: <4DA5D45A.9070901@absence.it>
References: <4D9B4094.4010609@absence.it> <20110412152009.GA32032@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:39368 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756155Ab1DMQui (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Apr 2011 12:50:38 -0400
In-Reply-To: <20110412152009.GA32032@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <achirica@gmail.com>, Mattia Dongili <malattia@linux.it>

Il 12/04/2011 17:20, Matthew Garrett ha scritto:

> Hmm. How low is useful? There's no real problem with shifting everything
> by an offset.

I agree. The DSDT of any ALS equipped Vaio provides us 9 backlight 
levels (that are LCD/model specific), so the first and the last ones 
define our useful operating range, which is always different from 0-255 
(eg. 13-255 for the Vaio S, 52-255 for the Vaio F, 7-182 for the Vaio Z, 
7-213 for the Vaio TT and so on). However the code to retrieve and use 
those lower and upper bounds is still lacking upstream (I, Javier 
Achirica and many other people are testing a heavily modified 
sony-laptop.c written by us which includes lots of features that we 
might include soon, but there is no patchset yet).
Moreover it is questionable whether to expose this "wire-range"/fine 
grain backlight device, which is intended to be used for an ambient 
light based regulation (that requires smooth transitions and sometimes 
minimal changes), while for normal backlight operations the 9 levels 
already mentioned should suffice.

Regards,
Marco Chiappero
