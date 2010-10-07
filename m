From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 22:49:27 +0100
Message-ID: <20101007214927.GA2292@srcf.ucam.org>
References: <AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com> <20101007133529.GA21782@srcf.ucam.org> <AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com> <20101007205049.GB32726@srcf.ucam.org> <AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com> <20101007213027.GA18628@core.coreip.homeip.net> <20101007213754.GA1896@srcf.ucam.org> <AANLkTinL9UckjiQGmMJ_NENPp9XxFHRdvTje_V46LPQ+@mail.gmail.com> <20101007214212.GA2010@srcf.ucam.org> <AANLkTimh649Lhj-sBYzViq_G-2Bva0U-TPCMGfSdK=QE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57248 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354Ab0JGVtg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 17:49:36 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimh649Lhj-sBYzViq_G-2Bva0U-TPCMGfSdK=QE@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <superm1@ubuntu.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 07, 2010 at 04:45:22PM -0500, Mario Limonciello wrote:
> Matthew:
> 
> On Thu, Oct 7, 2010 at 16:42, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> > I don't understand this. You know which code is broken - surely you're
> > able to determine which products shipped with BIOSes derived from the
> > broken code?
> 
> Not all product's BIOS are developed in-house.  The ones that are, yes
> it quite possible to identify.  Matter of fact, this issue tends to
> not exist on the in-house developed BIOS codebase.

Ok, so let's approach this differently. What is it that results in this 
issue not affecting Windows?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
