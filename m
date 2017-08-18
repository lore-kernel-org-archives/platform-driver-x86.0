From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages
 for normal users
Date: Fri, 18 Aug 2017 16:25:53 -0700
Message-ID: <20170818232553.GA13618@fury>
References: <1500609408-30745-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46469 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751566AbdHRXZz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 19:25:55 -0400
Content-Disposition: inline
In-Reply-To: <1500609408-30745-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net

On Thu, Jul 20, 2017 at 08:56:48PM -0700, Alex Hung wrote:
> Unsupported events is only useful for developers and does not meaningful
> for users. Using dev_dbg makes more sense and reduces noise in kernel
> messages.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Apologies for the delay Alex, both now queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center
