From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_menlow: reduce code duplication
Date: Mon, 23 May 2016 14:36:57 -0700
Message-ID: <20160523213657.GB2735@f23x64.localdomain>
References: <1459028427-4053-1-git-send-email-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49871 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969AbcEWVhA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 17:37:00 -0400
Content-Disposition: inline
In-Reply-To: <1459028427-4053-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sujith Thomas <sujith.thomas@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Mar 26, 2016 at 10:40:26PM +0100, Rasmus Villemoes wrote:
> aux0_show and aux1_show consists of almost identical code. Pull that
> into a common helper and make them thin wrappers. Similarly for
> _store.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

This one fell off my queue, apologies. Now queued.
-- 
Darren Hart
Intel Open Source Technology Center
