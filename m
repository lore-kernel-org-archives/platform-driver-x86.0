From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 08/25] thinkpad_acpi: don't use [delayed_]work_pending()
Date: Fri, 28 Dec 2012 16:41:45 -0500
Message-ID: <20121228214145.GF3062@mtj.dyndns.org>
References: <1356141435-17340-1-git-send-email-tj@kernel.org>
 <1356141435-17340-9-git-send-email-tj@kernel.org>
 <20121222235504.GA12747@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:50013 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752630Ab2L1Vlt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Dec 2012 16:41:49 -0500
Content-Disposition: inline
In-Reply-To: <20121222235504.GA12747@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: linux-kernel@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sat, Dec 22, 2012 at 09:55:04PM -0200, Henrique de Moraes Holschuh wrote:
> On Fri, 21 Dec 2012, Tejun Heo wrote:
> > There's no need to test whether a (delayed) work item in pending
> > before queueing, flushing or cancelling it.  Most uses are unnecessary
> > and quite a few of them are buggy.
> > 
> > Remove unnecessary pending tests from thinkpad_acpi.  Only compile
> > tested.
> > 
> > Signed-off-by: Tejun Heo <tj@kernel.org>
> > Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> > Cc: ibm-acpi-devel@lists.sourceforge.net
> > Cc: platform-driver-x86@vger.kernel.org
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> 
> > ---
> > Please let me know how this patch should be routed.  I can take it
> > through the workqueue tree if necessary.
> 
> It will not clash with anything I know of, so feel free to route it
> through the workqueue tree.

Applied to wq/for-3.9-cleanups.  Thanks.

-- 
tejun
