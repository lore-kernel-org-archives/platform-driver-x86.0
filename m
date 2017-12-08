From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-laptop: Use bool type in struct quirk_entry for
 true/false fields
Date: Fri, 8 Dec 2017 13:41:44 -0800
Message-ID: <20171208214144.GB819@fury>
References: <1510438823-28161-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59386 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753192AbdLHVlq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 16:41:46 -0500
Content-Disposition: inline
In-Reply-To: <1510438823-28161-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 11, 2017 at 11:20:23PM +0100, Pali Rohár wrote:
> In struct quirk_entry some boolean fields used int, some u8 type. Change
> them all to bool type.
> 

Queued, thanks!

-- 
Darren Hart
VMware Open Source Technology Center
