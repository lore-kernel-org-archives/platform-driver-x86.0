From: John Dahlstrom <jodarom@SDF.ORG>
Subject: Re: [PATCH v3 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Fri, 19 Feb 2016 20:01:17 -0600 (CST)
Message-ID: <Pine.NEB.4.64.1602191935590.15324@faeroes.freeshell.org>
References: <Pine.NEB.4.64.1602180029370.7701@norge.freeshell.org>
 <20160219224312.GB23707@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx.sdf.org ([192.94.73.23]:58173 "EHLO sdf.lonestar.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1161296AbcBTCBw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 19 Feb 2016 21:01:52 -0500
In-Reply-To: <20160219224312.GB23707@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 19 Feb 2016, Darren Hart wrote:

> See stable_kernel_rules.txt for how to specify relevant versions. I'm curious
> why there is a gap from 3.18 to 4.1.
>
> What you probably meant was:
>
> Cc: <stable@vger.kernel.org> # 3.18.x
>
> If you are going to take this approach, you may wish to verify that this applies
> back to 3.18, otherwise you may need to specify dependencies (also described in
> the stable_kernel_rules).
>

Darren,

Thank you for your assistance.

The version gap in the earlier v3 comment reflected my earlier gap in 
verification. Today I stepped through the additional kernel versions to 
confirm the patch applies successfully to those versions, and have 
submitted the patch as v4.

Kernel version 3.18.27 already handles the 17" model of the ideapad Y700, 
so it would seem odd not to also handle the 15" model.

Kind regards,

John
