From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCHv5] hp-wmi: limit hotkey enable
Date: Fri, 11 Sep 2015 08:55:36 -0700
Message-ID: <20150911155536.GA1888@vmdeb7>
References: <20150910030330.GE90062@vmdeb7>
 <1441986017-1680-1-git-send-email-kvans32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44837 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856AbbIKPzj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Sep 2015 11:55:39 -0400
Content-Disposition: inline
In-Reply-To: <1441986017-1680-1-git-send-email-kvans32@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle Evans <kvans32@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net

On Fri, Sep 11, 2015 at 10:40:17AM -0500, Kyle Evans wrote:
> Do not write initialize magic on systems that do not have
> feature query 0xb. Fixes Bug #82451.
> 
> Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
> for code clearity.
> 
> Add a new test function, hp_wmi_bios_2008_later() & simplify
> hp_wmi_bios_2009_later(), which fixes a bug in cases where
> an improper value is returned. Probably also fixes Bug #69131.
> 
> Add missing __init tag.
> 
> Signed-off-by: Kyle Evans <kvans32@gmail.com>

Thanks Kyle, pushed to "testing".

-- 
Darren Hart
Intel Open Source Technology Center
