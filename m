From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 22:42:12 +0100
Message-ID: <20101007214212.GA2010@srcf.ucam.org>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com> <20101007111510.GA19624@srcf.ucam.org> <AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com> <20101007133529.GA21782@srcf.ucam.org> <AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com> <20101007205049.GB32726@srcf.ucam.org> <AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com> <20101007213027.GA18628@core.coreip.homeip.net> <20101007213754.GA1896@srcf.ucam.org> <AANLkTinL9UckjiQGmMJ_NENPp9XxFHRdvTje_V46LPQ+@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42528 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264Ab0JGVmX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 17:42:23 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTinL9UckjiQGmMJ_NENPp9XxFHRdvTje_V46LPQ+@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <superm1@ubuntu.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 07, 2010 at 04:41:12PM -0500, Mario Limonciello wrote:

> All Dell laptops are /supposed/ to adhere to the specification in
> question.  Unfortunately, not all machines are tested with Linux
> during their development and on the OS they ship with that
> functionality isn't always used in that specific way for rfkill.

I don't understand this. You know which code is broken - surely you're 
able to determine which products shipped with BIOSes derived from the 
broken code?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
