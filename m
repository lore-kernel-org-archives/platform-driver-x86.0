From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0841/1285] Replace numeric parameter like 0444 with macro
Date: Fri, 19 Aug 2016 13:02:32 -0700
Message-ID: <20160819200232.GE81374@f23x64.localdomain>
References: <20160802115136.6059-1-baolex.ni@intel.com>
 <95991cb563633df910245c1fa8d83169@mail.piie.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34945 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754140AbcHSUC7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2016 16:02:59 -0400
Content-Disposition: inline
In-Reply-To: <95991cb563633df910245c1fa8d83169@mail.piie.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Feuerer <peter@piie.net>
Cc: Baole Ni <baolex.ni@intel.com>, david.vrabel@citrix.com, jgross@suse.com, bhelgaas@google.com, m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.kozlowski@samsung.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com

On Thu, Aug 11, 2016 at 09:21:48PM +0000, Peter Feuerer wrote:
> 2. August 2016 14:29 Uhr, "Baole Ni" <baolex.ni@intel.com> schrieb:
> > I find that the developers often just specified the numeric value
> > when calling a macro which is defined with a parameter for access permission.
> > As we know, these numeric value for access permission have had the corresponding macro,
> > and that using macro can improve the robustness and readability of the code,
> > thus, I suggest replacing the numeric parameter with the macro.
> > 
> > Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> > Signed-off-by: Baole Ni <baolex.ni@intel.com>
> 
> Acked-by: Peter Feuerer <peter@piie.net>

Due to objections elsewhere in the platform drivers subsystem, I have rejected
these patches as a group, leaving it to the authors to make the argument for
inclusion if they disagree with the decision.

-- 
Darren Hart
Intel Open Source Technology Center
